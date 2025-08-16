module docgen;
import std::collections::list;
import std::collections::pair;
import std::io;

import ts;
import tree_sitter_c3;
alias tsc3 = module tree_sitter_c3;

macro list_with(Allocator alloc, ...)
{
	List {$typeof($vaarg[0])} l;
	l.init(alloc);
	$for var $i = 0; $i < $vacount; $i++:
		l.push($vaarg[$i]);
	$endfor
	return l;
}

alias GlobalAbomination = List {Pair {Global*, ModuleSection*}};
alias FuncAbomination = List {Pair {Func*, ModuleSection*}};

fn Module* get_modules(Allocator alloc, Module* root, TSParser* parser, String data, String file_name)
{
	TSTree* parse_tree = parser::parse_string(parser, null, data);
	defer ts::tree_delete(parse_tree);
	TSNode root_node = ts::tree_root_node(parse_tree);

	io::printfn("Parsing file '%s'", file_name);

	TSTreeCursor cursor = cursor::new(root_node);
	defer cursor::delete(&cursor);

	TSQueryCursor* query_cursor = query_cursor::new();
	defer query_cursor::delete(query_cursor);

	// TODO: make these global/static so I don't keep recreating & destroying them for every file I parse
	TSQuery* module_query = query::new(tsc3::language(), `(module_declaration path: (path_ident (module_resolution (ident) @path)* (ident) @path) (generic_param_list [(const_ident) @param.const (type_ident) @param.type _]*)? (attributes (attribute) @attr)?)`)!!;
	defer query::delete(module_query);

	TSQuery* global_query = query::new(tsc3::language(), `(global_declaration "extern"? @extern (_ "tlocal"? @tlocal type: (_)? @type name: (_) @name (attributes (attribute)* @attr)? right: (_)? @value) @decl_type)`)!!;
	defer query::delete(global_query);

	TSQuery* func_query = query::new(tsc3::language(), `(_ (_ return_type: (_)? @return method_type: (_)? @type name: (_) @name) ([(func_param_list (param type: (_)? @param.type name: (_) @param.name)*) (macro_param_list (param type: (_)? @param.type name: (_) @param.name)* (trailing_block_param)? @trailing) @macro]) (attributes (attribute)* @attr)?)`)!!;
	defer query::delete(func_query);

	assert (cursor::current_node(&cursor).type() == "source_file");
	assert(ts::tree_cursor_goto_first_child(&cursor));

	DocComment comment;
	Module* current_mod = root;
	do
	{
		TSNode node = cursor::current_node(&cursor);
		// io::printfn("a: %s", node.type());
		TSTreeCursor pos = cursor::copy(&cursor);
		defer cursor::delete(&pos);
		switch MAIN: (node.type())
		{
			case "module_declaration":
				query_cursor::@exec(query_cursor, module_query, node; TSQueryMatch* match)
				{
					current_mod = root;
					// io::printfn("matched on %s", match.capture_count);
					ModuleSection sec;
					sec.init(alloc);
					foreach (i, capture : match.captures[:match.capture_count])
					{
						uint len;
						String text = capture.get_text(data);

						switch (String match_name = ts::query_capture_name_for_id(module_query, capture.index, &len).str_view())
						{
							case "path":
								current_mod = current_mod.children.@get_or_set(text, module_create(alloc, current_mod, text.copy(alloc)));
							case "param.const":
								io::printfn("found generic const '%s'", text);
								if (!current_mod.generics_done) current_mod.generic_params.push({.type = CONST, .val = text.copy(alloc)});
							case "param.type":
								io::printfn("found generic type '%s'", text);
								if (!current_mod.generics_done) current_mod.generic_params.push({.type = TYPE, .val = text.copy(alloc)});
							case "attr":
								io::printfn("found module attrs '%s'", text);
								sec.attributes.push(text.copy(alloc));
							default:
								unreachable("unexpexted '%s'", match_name);
						}
					}
					sec.doc_comment = comment;
					io::printfn("generic params: %s", current_mod.generic_params);
					// Before I would duplicate generic params if I encountered the same generic module multiple times (eg std::collections::map)
					current_mod.generics_done = true;
					// if (sec.attributes.len() != 0) abort("%s", sec.attributes);
					current_mod.sections.push(sec);
					comment = {};
				};
			case "global_declaration":
				// Handle files without module declarations/with code before a module declaration
				if (current_mod == root)
				{
					current_mod = current_mod.children.@get_or_set(file_name, module_create(alloc, current_mod, file_name.copy(alloc)));
					ModuleSection m;
					m.init(alloc);
					current_mod.sections.push(m);
				}
				assert(current_mod.sections.len() != 0);

				query_cursor::@exec(query_cursor, global_query, node; TSQueryMatch* match)
				{
					Global glob = global(alloc);
					foreach (i, capture : match.captures[:match.capture_count])
					{
						uint len;
						String text = capture.get_text(data);

						switch (String match_name = ts::query_capture_name_for_id(global_query, capture.index, &len).str_view())
						{
							case "decl_type":
								// TODO: handle consts & extern functions
								// io::printfn("TODO: got decl of type '%s'", capture.node.type());
								switch (String type = capture.node.type())
								{
									case "declaration":
										break;
									case "const_declaration":
									case "function_declaration": // TODO: handle as regular function
										glob.const_ = true;
									default:
										unreachable("unexpected global type '%s'", type);
								}
							case "name":
								glob.name = text.copy(alloc);
							case "value":
								glob.val = text.copy(alloc);
							case "attr":
								glob.attributes.push(text.copy(alloc));
							case "type":
								glob.type = text.copy(alloc);
							case "tlocal":
								glob.tlocal_ = true;
							case "extern":
								glob.extern_ = true;
							default:
								unreachable("unexpexted '%s'", match_name);
						}
					}
					glob.doc_comment = comment;
					current_mod.sections[^1].globals.push(glob);
					comment = {};
				};
			case "macro_declaration":
			case "func_definition":
				// Handle files without module declarations/with code before a module declaration
				if (current_mod == root)
				{
					current_mod = current_mod.children.@get_or_set(file_name, module_create(alloc, current_mod, file_name.copy(alloc)));
					ModuleSection m;
					m.init(alloc);
					current_mod.sections.push(m);
				}
				assert(current_mod.sections.len() != 0);

				query_cursor::@exec(query_cursor, func_query, node; TSQueryMatch* match)
				{
					Func func = function(alloc);
					Param p;
					foreach (i, capture : match.captures[:match.capture_count])
					{
						uint len;
						String text = capture.get_text(data);

						switch (String match_name = ts::query_capture_name_for_id(func_query, capture.index, &len).str_view())
						{
							case "return":
								func.return_type.set(text.copy(alloc));
							case "name":
								func.name = text.copy(alloc);
							case "macro":
								func.macro_ = true;
							// these both rely on tree-sitter being ordered and the type always appearing before the name if it exists.
							case "param.name":
								p.name = text.copy(alloc);
								switch (String name = capture.node.type())
								{
									case "ident":
										p.kind = REGULAR;
									case "ct_ident":
										p.kind = CT;
									case "hash_ident":
										p.kind = EXPR;
									default:
										unreachable("unexpected param '%s'", name);
								}
								func.params.push(p);
								p = {};
							case "param.type":
								p.type = text.copy(alloc);
								p.typed = true;
							case "type":
								func.method_of.set(text.copy(alloc));
							case "attr":
								func.attributes.push(text.copy(alloc));
							case "trailing":
								func.trailing.set(text.copy(alloc));
							default:
								unreachable("unexpexted '%s'", match_name);
						}
					}
					func.doc_comment = comment;
					current_mod.sections[^1].functions.push(func);
					comment = {};
				};
			case "doc_comment":
				TSTreeCursor cc = cursor::copy(&cursor);
				defer cursor::delete(&cc);

				comment = {};
				comment.contracts.init(alloc);
				comment.description.init(alloc);
				Contract contract;

				cursor::goto_first_child(&cc)!!;
				if (catch cursor::goto_next_sibling(&cc)) break;
				assert(cc.node().type() == "doc_comment_text" || cc.node().type() == "doc_comment_contract");

				if (cc.node().type() == "doc_comment_text")
				{
					String starting_chars;
					foreach (line : cc.node().get_text(data).tsplit("\n"))
					{
						if (starting_chars.ptr == null && line.trim() != "" && line.len != line.trim_left().len)
						{
							starting_chars = line[:line.len - line.trim_left().len];
						}
						String line_trim = starting_chars.ptr == null || line.len < starting_chars.len || line[:starting_chars.len] != starting_chars ? line : line[starting_chars.len..];
						comment.description.push(line_trim.copy(alloc));
					}
					if (catch cursor::goto_next_sibling(&cc)) break;
				}

				while (try cursor::goto_next_sibling(&cc) && cc.node().type() != "*>")
				{
					if (contract.name.ptr)
					{
						comment.contracts.push(contract);
						contract = {};
					}

					assert(cc.node().type() == "doc_comment_contract");
					cursor::goto_first_child(&cc)!!;
					defer cursor::goto_parent(&cc)!!;

					assert(cursor::current_field_name(&cc)!! == "name");
					contract.name = cc.node().get_text(data).copy(alloc);
					switch (contract.name)
					{
						case "@ensure": contract.type = ENSURE;
						case "@require": contract.type = REQUIRE;
						case "@return": contract.type = RETURN;
						case "@param": contract.type = PARAM;
						case "@pure": contract.type = PURE;
						default: contract.type = CUSTOM;
					}
				}

				if (contract.name.ptr)
				{
					comment.contracts.push(contract);
					contract = {};
				}
			default:
				comment = {};
		}
		cursor::reset_to(&cursor, &pos);
		// I can't believe this is an actual bug lol
		if (@catch(cursor::goto_next_sibling(&cursor))) break;
	} while (true);
	return root;
}

// What this would do is take in the token, iterate over all its children, and build a string of the content with comments and extra spacing removed
// Not needed yet though
// fn String re_stringify(Allocator alloc, TSNode node)

macro Module* module_create(Allocator alloc, Module* parent, String path)
{
	Module* new = allocator::new(alloc, Module);
	new.parent = parent;
	new.path = path;
	new.sections.init(alloc);
	new.children.init(alloc);
	new.generic_params.init(alloc, 0);
	return new;
}

macro Global global(Allocator alloc)
{
	Global g;
	g.attributes.init(alloc);
	return g;
}

macro Func function(Allocator alloc)
{
	Func f;
	f.attributes.init(alloc);
	f.params.init(alloc);
	return f;
}

/*macro ModuleSection module_section_create(Allocator alloc, String... attributes)
{
	ModuleSection new;
	new.init(alloc);
	new.attributes.add_array(attributes);
	return new;
}*/


