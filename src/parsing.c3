module docgen;
import std::collections::list;
import std::collections::pair;
import std::io;

import ts;
import tree_sitter_c3;
alias tsc3 = module tree_sitter_c3;

import const_map;

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

fn Module* get_modules(Allocator alloc, Module* root, TSParser* parser, String data, String file_name) => @pool()
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
	// TODO: use more anchors with wildcards so it doesn't match things multiple times and doesn't get tripped by comments in odd places
	TSQuery* module_query = query::new(tsc3::language(), `(module_declaration path: (path_ident (module_resolution (ident) @path)* (ident) @path) (generic_param_list [(const_ident) @param.const (type_ident) @param.type _]*)? (attributes (attribute) @attr)?)`)!!;
	defer query::delete(module_query);

	TSQuery* global_query = query::new(tsc3::language(), `(global_declaration (_ type: (_)? @type name: (_) @name (attributes (attribute)* @attr)? right: (_)? @value) @decl_type)`)!!;
	defer query::delete(global_query);

	// TODO: this may break if there are comments inside certain parts of the function definition (eg `fn void something() @Attr1 /*comment*/ @Attr2)`)
	TSQuery* func_query = query::new(tsc3::language(), `(_ (_ return_type: (_)? @return method_type: (_)? @type name: (_) @name) ([(func_param_list (param type: (_)? @param.type name: (_) @param.name)*) (macro_param_list (param type: (_)? @param.type name: (_) @param.name)* (trailing_block_param)? @trailing) @macro]) (attributes (attribute)* @attr)?)`)!!;
	defer query::delete(func_query);

	TSQuery* struct_query = query::new(tsc3::language(), `(struct_declaration name: (type_ident) @name . (_)* (interface_impl_list (_)+ @interface)? (attributes [(attribute) @attr (_)]+)? body: (struct_body . [(struct_member_declaration) @member (_)]+) . )`)!!;
	defer query::delete(struct_query);

	TSQuery* enum_query = query::new(tsc3::language(), `(enum_declaration name: (type_ident) @name (interface_impl_list [(path_type_ident) @interface (_) ","]+)? (enum_spec)? @spec (attributes [(attribute) @attr (_)]+)? body: (enum_body [ (enum_constant) @value (_) "," ]+) )`)!!;
	defer query::delete(enum_query);

	assert (cursor::current_node(&cursor).type() == "source_file");
	assert(ts::tree_cursor_goto_first_child(&cursor));

	// TODO: do something like 'if (try goto_parent && try goto_prev_sibling && sibling == doc_comment) extract_doc_comment' instead of what I currently do so I can get comments in things like struct members as well
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
						String text = substitiute_with_table(tmem, capture.get_text(data));

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
					sec.text = collect_data(alloc, node, data);
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

				Global glob = create_global(alloc);
				glob.text = collect_data(alloc, node, data);
				query_cursor::@exec(query_cursor, global_query, node; TSQueryMatch* match)
				{
					foreach (capture : match.captures[:match.capture_count])
					{
						uint len;
						String text = substitiute_with_table(tmem, capture.get_text(data));

						switch (String match_name = ts::query_capture_name_for_id(global_query, capture.index, &len).str_view())
						{
							case "decl_type":
								// TODO: handle extern functions
								switch (String type = capture.node.type())
								{
									case "declaration":
										break;
									case "const_declaration":
									case "function_declaration": // TODO: handle as regular function
										break;
									default:
										unreachable("unexpected global type '%s'", type);
								}
							case "name":
								// TODO: there's probably something I can do with the match start byte - node start byte to make .slice_matching O(1) or O(n) instead of O(n^2)
								glob.name = glob.text.slice_matching(text)!!;
							case "value":
								// glob.val = text.copy(alloc);
								break;
							case "attr":
								glob.attributes.push(text.copy(alloc));
							case "type":
								glob.type.set(text.copy(alloc));
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

				Func func = create_function(alloc);
				func.text = collect_data(alloc, node, data);
				query_cursor::@exec(query_cursor, func_query, node; TSQueryMatch* match)
				{
					Param p;
					foreach (capture : match.captures[:match.capture_count])
					{
						uint len;
						String text = substitiute_with_table(tmem, capture.get_text(data));

						switch (String match_name = ts::query_capture_name_for_id(func_query, capture.index, &len).str_view())
						{
							case "return":
								func.return_type.set(text.copy(alloc));
							case "name":
								func.name = func.text.slice_matching(text)!!;
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
					Splitter splitter  = substitiute_with_table(tmem, cc.node().get_text(data)).tokenize_all("\n");
					while (try line = splitter.next())
					{
						if (starting_chars.ptr == null && line.trim() != "" && line.len != line.trim_left().len)
						{
							starting_chars = line[:line.len - line.trim_left().len];
						}
						String line_trim = starting_chars.ptr == null || line.len < starting_chars.len || line[:starting_chars.len] != starting_chars ? line : line[starting_chars.len..];
						comment.description.push(line_trim.copy(alloc));
					}
					if (comment.description.len() > 0 && comment.description[^1] == "") comment.description.pop()!!;
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
			// NOTE: also handles unions
			case "struct_declaration":
				// Handle files without module declarations/with code before a module declaration
				if (current_mod == root)
				{
					current_mod = current_mod.children.@get_or_set(file_name, module_create(alloc, current_mod, file_name.copy(alloc)));
					ModuleSection m;
					m.init(alloc);
					current_mod.sections.push(m);
				}
				assert(current_mod.sections.len() != 0);

				Struct struc = create_struct(alloc);
				struc.text = collect_data(alloc, node, data);
				io::printfn("struct: %p", struc.text.data.ptr);
				query_cursor::@exec_captures(query_cursor, struct_query, node; TSQueryCapture capture, String name)
				{
					String text = substitiute_with_table(tmem, capture.get_text(data));
					switch (name)
					{
						case "name":
							struc.name = struc.text.slice_matching(text)!!;
						case "attr":
							struc.attributes.push(text.copy(alloc));
						case "member":
							struc.members.push(struc.text.slice_matching(text))!!;
						case "interface":
							struc.interfaces.push(struc.text.slice_matching(text)!!);
						default:
							unreachable("unexpected '%s'", name);
					}
				};
				struc.doc_comment = comment;
				current_mod.sections[^1].structs.push(struc);
				comment = {};
			case "enum_declaration":
				// Handle files without module declarations/with code before a module declaration
				if (current_mod == root)
				{
					current_mod = current_mod.children.@get_or_set(file_name, module_create(alloc, current_mod, file_name.copy(alloc)));
					ModuleSection m;
					m.init(alloc);
					current_mod.sections.push(m);
				}
				assert(current_mod.sections.len() != 0);

				Enum enum_ = create_enum(alloc);
				enum_.text = collect_data(alloc, node, data);
				io::printfn("enum_t: %p", enum_.text.data.ptr);
				query_cursor::@exec_captures(query_cursor, enum_query, node; TSQueryCapture capture, String name)
				{
					String text = substitiute_with_table(tmem, capture.get_text(data));
					switch (name)
					{
						case "name":
							enum_.name = enum_.text.slice_matching(text)!!;
						case "attr":
							enum_.attributes.push(text.copy(alloc));
						case "interface":
							enum_.interfaces.push(enum_.text.slice_matching(text)!!);
						case "spec":
							enum_.spec.set(enum_.text.slice_matching(text)!!);
						case "value":
							enum_.values.push(enum_.text.slice_matching(text)!!);
						default:
							unreachable("unexpected '%s'", name);
					}
				};
				enum_.doc_comment = comment;
				current_mod.sections[^1].enums.push(enum_);
			default:
				comment = {};
		}
		cursor::reset_to(&cursor, &pos);
	} while (@ok(cursor::goto_next_sibling(&cursor)));
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

macro Global create_global(Allocator alloc)
{
	Global g;
	g.attributes.init(alloc);
	return g;
}

macro Func create_function(Allocator alloc)
{
	Func f;
	f.attributes.init(alloc);
	f.params.init(alloc);
	return f;
}

macro Struct create_struct(Allocator alloc)
{
	Struct s;
	s.attributes.init(alloc);
	s.members.init(alloc);
	s.interfaces.init(alloc);
	return s;
}

macro Enum create_enum(Allocator alloc)
{
	Enum e;
	e.attributes.init(alloc);
	e.values.init(alloc);
	e.interfaces.init(alloc);
	return e;
}

macro HighlightedText collect_data(Allocator alloc, TSNode node, String data) => @pool()
{
	List {HighlightData} collected_data;
	// collected_data.init(alloc);
	collected_data.tinit();
	// io::printfn("-------------------------");

	TSTreeCursor cursor = cursor::new(node);
	defer cursor::delete(&cursor);

	usz offset = 0; // so I can properly handle replacing `<` and `>` with `&lt` and `&gt`
	collect_data_rec(alloc, &collected_data, &cursor, data, node.start_byte(), &offset);

	// io::printfn("collected %s", collected_data);
	// abort();
	String text = node.get_text(data)/*.copy(tmem)*/;
	return {substitiute_with_table(alloc, text), collected_data.to_array(alloc)};
}

fn void collect_data_rec(Allocator alloc, List {HighlightData}* collected_data, TSTreeCursor* cursor, String data, usz start_idx, usz* offset)
{
	do
	{
		TSTreeCursor bak = cursor::copy(cursor);
		defer cursor::delete(&bak);

		if (cursor::current_node(cursor).type() != "module_resolution" && cursor::current_node(cursor).type() != "block_comment" && cursor::current_node(cursor).type() != "doc_comment"/* && cursor::current_field_name(cursor) ?? "" != "function"*/ && @ok(cursor::goto_first_child(&bak)))
		{
			if (cursor::current_node(cursor).type() == "macro_func_body")
			{
				collected_data.push({END, 0, 0});
				return;
			}
			collect_data_rec(alloc, collected_data, &bak, data, start_idx, offset);
		}
		else
		{
			// io::printfn("%s", cursor::current_node(cursor).get_text(data));
			TSNode n = cursor::current_node(cursor);
			String text = n.get_text(data);
			DataType type;
			switch (String node_type = n.type())
				{
				case "ct_ident":
				case "at_ident":
				case "hash_ident":
				case "ident": type = IDENT;
				case "const_ident": type = CONST;
				case "type_ident": type = TYPE;
				// TODO: this doesn't catch the `uint` in `const BITS = uint.sizeof * 8;`
				case "base_type_name": type = BUILTIN_TYPE;
				case "line_comment":
				case "block_comment":
				case "doc_comment": type = COMMENT;
				case "module_resolution": type = PATH;
				case "string_literal":
				case "raw_string_literal": type = STRING;
				case "integer_literal": type = NUMBER;
				default:
					if (node_type == "(" && collected_data.len() > 0 && (*collected_data)[^1].type == IDENT) (*collected_data)[^1].type = FUNCTION;
					// io::printfn("a: %s", node_type);
					if (array::contains(KEYWORDS, node_type)) { type = KEYWORD; }
					else if (array::contains(BUILTIN_TYPES, node_type)) { type = BUILTIN_TYPE; }
					// type = DEFAULT;
			}
			HighlightData dat = {type, n.start_byte() - start_idx + *offset, n.end_byte() - n.start_byte()};
			foreach (c : text)
			{
				if (try entry = REPLACE_TABLE.get(c))
				{
					// io::printfn("before: %s:%s:%s, after: %s:%s:%s", n.type(), dat.start, dat.len, entry, dat.start, entry.len);
					*offset += entry.len - 1;
					dat.len += entry.len - 1;
				}
			}
			collected_data.push(dat);
		}
	} while (@ok(cursor::goto_next_sibling(cursor)));

}

const String[*] KEYWORDS = {"alias", "assert", "asm", "attrdef", "bitstruct", "break", "case", "catch", "const", "continue", "default", "defer", "do", "else", "enum", "extern", "false", "faultdef", "for", "foreach", "foreach_r", "fn", "tlocal", "if", "inline", "import", "macro", "module", "nextcase", "null", "interface", "return", "static", "struct", "switch", "true", "try", "typedef", "union", "var", "while", "$alignof", "$assert", "$assignable", "$case", "$default", "$defined", "$echo", "$else", "$embed", "$endfor", "$endforeach", "$endif", "$endswitch", "$eval", "$evaltype", "$error", "$exec", "$extnameof", "$feature", "$for", "$foreach", "$if", "$include", "$is_const", "$nameof", "$offsetof", "$qnameof", "$sizeof", "$stringify", "$switch", "$typefrom", "$typeof", "$vacount", "$vatype", "$vaconst", "$vaarg", "$vaexpr", "$vasplat"};
// I shouldn't need this, but do for some reason
const String[*] BUILTIN_TYPES = { "void", "bool", "char", "double", "float", "float16", "bfloat", "int128", "ichar", "int", "iptr", "isz", "long", "short", "uint128", "uint", "ulong", "uptr", "ushort", "usz", "float128", "any", "fault", "typeid"};
// is this overkill? maybe, but I wanted an excuse to use it
const REPLACE_TABLE = const_map::@new_equal{char, String}(
	{'<', "&lt;"},
	{'>', "&gt;"},
	{'&', "&amp;"},
	{'"', "&quot;"},
	{'\'', "&apos;"},
	{'%', "%%"},
);

macro substitiute_with_table(Allocator alloc, String text) => @pool()
{
	List {String} replaced;
	replaced.tinit();
	usz start_i = 0;
	foreach (i, c : text)
	{
		if (try val = REPLACE_TABLE.get(c))
		{
			replaced.push(text[start_i:i - start_i]);
			replaced.push(val);
			start_i = i + 1;
		}
	}
	replaced.push(text[start_i..]);
	DString d;
	d.tinit();
	foreach (str : replaced) d.append(str);

	return d.copy_str(alloc);
}


/*macro ModuleSection module_section_create(Allocator alloc, String... attributes)
{
	ModuleSection new;
	new.init(alloc);
	new.attributes.add_array(attributes);
	return new;
}*/

module ts::query_cursor;

macro void @exec_captures(TSQueryCursor* cursor, TSQuery* query, TSNode node; @body(TSQueryCapture capture, String capture_name)) {
	ts::query_cursor_exec(cursor, query, node);
	for (TSQueryMatch match, uint idx; ts::query_cursor_next_capture(cursor, &match, &idx);)
	{
		uint len;
		@body(match.captures[idx], (String)ts::query_capture_name_for_id(query, match.captures[idx].index, &len)[:len]);
	}
}

