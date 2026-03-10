module docgen;
import std::io;
import std::collections::map;
import std::collections::list;
import std::collections::maybe;

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

// alias GlobalAbomination = List {Pair {Global*, ModuleSection*}};
// alias FuncAbomination = List {Pair {Func*, ModuleSection*}};

// The highlights query from https://github.com/c3lang/tree-sitter-c3/blob/main/queries/highlights.scm
// This *must* be updated alongside libtree-sitter-c3.a since it relies on the output of the specific version of the c3 tree-sitter
// TODO: maybe move it into tree_sitter_c3.c3l?
const HIGHLIGHTS_QUERY = $embed("../resources/highlights.scm");

TSQuery* module_query;
TSQuery* global_query;
TSQuery* func_query;
TSQuery* struct_query;
TSQuery* enum_query;
TSQuery* bitstruct_query;
TSQuery* import_query;
TSQuery* alias_query;
TSQuery* highlight_query;
TSQuery* error_query;

fn void init_module_queries() @init
{
	io::printfn("Initializing module queries");
	// TODO: use more anchors with wildcards & lists so it doesn't match things multiple times and doesn't get tripped by comments in odd places
	module_query = query::new(tsc3::language(), `(module_declaration path: (path_ident (module_resolution (ident) @path)* (ident) @path) (generic_param_list [(const_ident) @param.const (type_ident) @param.type _]*)? (attributes (attribute) @attr)?)`)!!;
	global_query = query::new(tsc3::language(), `(global_declaration (_ type: (_)? @type name: (_) @name (attributes (attribute)* @attr)? right: (_)? @value) @decl_type)`)!!;
	// TODO: this may break if there are comments inside certain parts of the function definition (eg `fn void something() @Attr1 /*comment*/ @Attr2)`)
	func_query = query::new(tsc3::language(), `(_ (_ return_type: (_)? @return method_type: (_)? @type name: (_) @name) ([(func_param_list (param type: (_)? @param.type name: (_) @param.name)*) (macro_param_list (param type: (_)? @param.type name: (_) @param.name)* (trailing_block_param)? @trailing) @macro]) (attributes (attribute)* @attr)?)`)!!;
	struct_query = query::new(tsc3::language(), `(struct_declaration name: (type_ident) @name . (_)* (interface_impl_list (_)+ @interface)? (attributes [(attribute) @attr (_)]+)? body: (struct_body . [(struct_member_declaration) @member (_)]+) . )`)!!;
	enum_query = query::new(tsc3::language(), `(enum_declaration name: (type_ident) @name (interface_impl_list [(path_type_ident) @interface (_) ","]+)? (enum_spec)? @spec (attributes [(attribute) @attr (_)]+)? body: (enum_body [ (enum_constant) @value (_) "," ]+) )`)!!;
	bitstruct_query = query::new(tsc3::language(), `(bitstruct_declaration name: (type_ident) @name (interface_impl_list [(path_type_ident) @interface (_) ","]+)? (type)? @type (attributes [(attribute) @attr (_)]+)? body: (bitstruct_body [ (bitstruct_member_declaration) @member (_) ]+) )`)!!;
	import_query = query::new(tsc3::language(), `[ (ident) @mod (at_ident) @attr "," @modend ";" @modend ]`)!!;
	alias_query = query::new(tsc3::language(), `[ ( (type_ident) @new_typename (type (path_type_ident (module_resolution (ident) @orig_module)* (type_ident) @orig_name))) ( (ident) @new_modulename "module" (path_ident ((module_resolution (ident) @orig_module)* (ident) @orig_name))) ]`)!!;
	highlight_query = query::new(tsc3::language(), HIGHLIGHTS_QUERY)!!;
	error_query = query::new(tsc3::language(), `(ERROR) @error`)!!;
}

fn void deinit_module_queries() @finalizer
{
	io::printfn("Destroying module queries");
	query::delete(module_query);
	query::delete(global_query);
	query::delete(func_query);
	query::delete(struct_query);
	query::delete(enum_query);
	query::delete(bitstruct_query);
	query::delete(import_query);
	query::delete(alias_query);
}

fn void parse_file(Allocator alloc, Module* root_module, TSParser* parser, String file_data, String file_name) => @pool()
{
	TSTree* parse_tree = parser::parse_string(parser, null, file_data);
	defer ts::tree_delete(parse_tree);
	TSNode root_node = ts::tree_root_node(parse_tree);

	log::info("Parsing file '%s'", file_name);
	// init_module_queries();
	// defer deinit_module_queries();
	assert(module_query != null
			&& global_query != null
			&& func_query != null
			&& struct_query != null
			&& enum_query != null
			&& bitstruct_query != null
			&& import_query != null
			&& alias_query != null
			&& highlight_query != null
			&& error_query != null);

	TSTreeCursor cursor = cursor::new(root_node);
	defer cursor::delete(&cursor);

	TSQueryCursor* query_cursor = query_cursor::new();
	defer query_cursor::delete(query_cursor);

	assert (cursor::current_node(&cursor).type() == "source_file");
	if (catch cursor::goto_first_child(&cursor)) return;

	query_cursor::@exec_captures(query_cursor, error_query, root_node; TSQueryCapture capture, String name)
	{
		log::error("Suntax error found in C3 file, make sure to use a version of the C3 tree-sitter parser compatible with your C3 source code");
		log::error("Syntax error start:\n%s%s%s", Ansi.RED, capture.node.get_text(file_data), Ansi.RESET);
		abort(); // TODO: return error from this function
	};

	// TODO: do something like 'if (try goto_parent && try goto_prev_sibling && sibling == doc_comment) extract_doc_comment' instead of what I currently do so I can get comments in things like struct members as well
	DocComment comment;
	Module* current_mod = root_module;
	do
	{
		TSNode current_node = cursor::current_node(&cursor);
		// io::printfn("a: %s", node.type());
		// TSTreeCursor pos_backup = cursor::copy(&cursor);
		// defer cursor::delete(&pos_backup);
		// TODO: error when encountering the ERROR node
		switch MAIN: (current_node.type())
		{
			case "module_declaration":
				parse_module_declaration(alloc, root_module, &current_mod, &cursor, file_data, &comment);
			case "global_declaration":
				parse_global_declaration(alloc, root_module, &current_mod, query_cursor, current_node, file_name, file_data, &comment);

			case "macro_declaration":
			case "func_definition":
				parse_function_declaration(alloc, root_module, &current_mod, query_cursor, current_node, file_name, file_data, &comment);

			case "doc_comment":
				parse_doc_comment(alloc, &cursor, query_cursor, current_node, file_data, &comment);

			// NOTE: also handles unions
			case "struct_declaration":
				parse_struct_declaration(alloc, root_module, &current_mod, query_cursor, current_node, file_name, file_data, &comment);
/*			case "enum_declaration":
				// Handle files without module declarations/with code before a module declaration
				if (current_mod == root)
				{
					current_mod = current_mod.children.@get_or_set(file_name, module_create(alloc, current_mod, file_name.copy(alloc)));
					ModuleSection m;
					m.init(alloc);
					current_mod.sections.push(m);
				}
				assert(current_mod.sections.len() != 0);

				Enum enum_ = create_enum(alloc, current_mod);
				enum_.text = collect_data(alloc, node, data);
				query_cursor::@exec_captures(query_cursor, enum_query, node; TSQueryCapture capture, String name)
				{
					String text = substitiute_with_table(tmem, capture.get_text(data));
					switch (name)
					{
						case "name":
							enum_.name = text.copy(alloc);
						case "attr":
							enum_.attributes.push(enum_.text.slice_matching(text)!!);
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
				current_mod.sections[^1].global_namespace[enum_.name] = allocator::clone(alloc, enum_);
				comment = {};
			case "bitstruct_declaration":
				// Handle files without module declarations/with code before a module declaration
				if (current_mod == root)
				{
					current_mod = current_mod.children.@get_or_set(file_name, module_create(alloc, current_mod, file_name.copy(alloc)));
					ModuleSection m;
					m.init(alloc);
					current_mod.sections.push(m);
				}
				assert(current_mod.sections.len() != 0);

				BitStruct bitstruc = create_bitstruct(alloc, current_mod);
				bitstruc.text = collect_data(alloc, node, data);
				query_cursor::@exec_captures(query_cursor, bitstruct_query, node; TSQueryCapture capture, String name)
				{
					String text = substitiute_with_table(tmem, capture.get_text(data));
					switch (name)
					{
						case "name":
							bitstruc.name = text.copy(alloc);
						case "attr":
							bitstruc.attributes.push(bitstruc.text.slice_matching(text)!!);
						case "interface":
							bitstruc.interfaces.push(bitstruc.text.slice_matching(text)!!);
						case "type":
							bitstruc.type = bitstruc.text.slice_matching(text)!!;
						case "member":
							bitstruc.members.push(bitstruc.text.slice_matching(text)!!);
						default:
							unreachable("unexpected '%s'", name);
					}
				};
				bitstruc.doc_comment = comment;
				current_mod.sections[^1].global_namespace[bitstruc.name] = allocator::clone(alloc, bitstruc);
				comment = {};*/
			case "import_declaration":
				parse_import_declaration(alloc, root_module, &current_mod, query_cursor, current_node, file_name, file_data, &comment);
			case "alias_declaration":
				parse_alias_declaration(alloc, root_module, &current_mod, query_cursor, current_node, file_name, file_data, &comment);
			default:
				comment = {};
		}
		// cursor::reset_to(&cursor, &pos);
	} while (@ok(cursor::goto_next_sibling(&cursor)));
}

<*
 Automatically creates a module from the current file name if there is no module declaration at the top of the file
*>
// TODO: replace invalid character names in the file name with underscores and convert to lowercase
fn void handle_implicit_module_decl(Allocator alloc, Module* root_module, Module** current_mod, String file_name)
{
	if (*current_mod == root_module)
	{
		*current_mod = (*current_mod).children.@get_or_set(file_name, new_module(alloc, parent: maybe::value(root_module), name: maybe::value(file_name.copy(alloc)), generic_params: maybe::EMPTY));
		(*current_mod).sections.push(new_module_section(alloc, doc_comment: maybe::EMPTY));
	}
	assert((*current_mod).sections.len() != 0);
}

<*
 Takes a tree-sitter node and returns a new HighlightedText with the highlighted version of the data
*>
fn HighlightedText highlight_node_text(Allocator alloc, TSQueryCursor* query_cursor, TSNode node, String file_data) => @pool()
{
	HighlightedText text;
	text.data = node.get_text(file_data).copy(alloc);
	List {HighlightedToken} tokens;
	tokens.tinit();

	usz start_idx = node.start_byte();
	query_cursor::@exec_captures(query_cursor, highlight_query, node; TSQueryCapture capture, String name)
	{
		HighlightedTokenType type;
		assert(capture.end_byte() - capture.start_byte() < uint.max); // Just to make sure lol
		defer tokens.push({capture.start_byte() - start_idx, (uint)(capture.end_byte() - capture.start_byte()), type});
		switch (name)
		{
			case "constant":
				type = CONSTANT;
			case "boolean":
				type = BOOLEAN;
			case "constant.builtin":
				type = BUILTIN;
			case "variable":
			case "variable.member":
			case "variable.parameter":
			case "keyword":
			case "keyword.directive":
			case "keyword.debug":
			case "keyword.function":
			case "keyword.function":
			case "keyword.return":
			case "keyword.import":
			case "keyword.type":
			case "keyword.conditional":
			case "keyword.repeat":
			case "keyword.modifier":
			case "operator":
			case "keyword.conditional.ternary":
			case "number":
			case "number.float":
			case "character":
			case "number":
			case "string":
			case "string.escape":
			case "constant.builtin":
			case "variable.builtin":
			case "label":
			case "module":
			case "attribute":
			case "type":
			case "type.builtin":
			case "function":
			case "function.method":
			case "function.call":
			case "function.method.call":
			case "function.builtin":
			case "variable.builtin":
			case "comment":
			case "comment.documentation":
			case "spell":
			case "attribute":
			case "variable.parameter":
			case "comment.documentation":
				nextcase;
				// io::printfn("got '%s': '%s'", name, capture.get_text(file_data));
			case "punctuation.bracket":
			case "punctuation.delimiter":
				type = DEFAULT;
			default:
				unreachable("unexpected '%s'", name);
		}
	};
	text.highlighted = tokens.to_array(alloc);
	return text;
}

<*
 Parses a module declaration such as `module std::collections::list {Type}`
 and creates the corresponding module section in the module tree
*>
// TODO: replace all `unreachable(...)` and `!!` with an error log and return a fault
fn void parse_module_declaration(Allocator alloc, Module* root_module, Module** current_mod, TSTreeCursor* cursor, String file_data, DocComment* comment)
{
	TSTreeCursor pos = cursor::copy(cursor);
	defer cursor::delete(&pos);
	cursor::goto_first_child(&pos) ?? unreachable(`module declaration had no children (should *NEVER* happen)`);
	*current_mod = root_module;
	// Find the module path
	while (true)
	{
		String? field_name = cursor::current_field_name(&pos);
		if (try field_name && field_name == "path") break;
		cursor::goto_next_sibling(&pos) ?? unreachable(`module declaration without "path" field (did the C3 tree-sitter change something?)`);
	}
	cursor::goto_first_child(&pos) ?? unreachable("module declaration path was empty");

	// Navigate to the module, creating any submodules as necessary
	do
	{
		TSNode mod_path_node = cursor::current_node(&pos);
		switch (String name = mod_path_node.type())
		{
			case "module_resolution":
				cursor::goto_first_child(&pos) ?? unreachable("Module resolution had no children");
				while (true)
				{
					mod_path_node = cursor::current_node(&pos);
					if (mod_path_node.type() == "ident") break;
					cursor::goto_next_sibling(&pos) ?? unreachable("module resolution had no 'ident'");
				}
				cursor::goto_parent(&pos)!!;
				nextcase;
			case "ident":
				String mod_path = mod_path_node.get_text(file_data);
				io::printfn("mod path: %s", mod_path);
				*current_mod = (*current_mod).children.@get_or_set(mod_path, new_module(alloc, parent: maybe::value(*current_mod), name: maybe::value(mod_path.copy(alloc)), generic_params: maybe::EMPTY));
			case "::":
			case "block_comment":
			case "doc_comment":
			case "line_comment":
				break;
			default:
				unreachable("Unexpected node type '%s' in module path", name);
		}
	} while (@ok(cursor::goto_next_sibling(&pos)));

	// Add generic params to the module if they exist
	cursor::goto_parent(&pos)!!;
	while (@ok(cursor::goto_next_sibling(&pos)))
	{
		if (cursor::current_node(&pos).type() == "generic_param_list")
		{
			break;
		}
	}
	if (cursor::current_node(&pos).type() == "generic_param_list" &&
		!(*current_mod).generic_params.has_value /* We don't want to add extra params to a module that already has generic params */)
	{
		cursor::goto_first_child(&pos) ?? unreachable("Generic param list had no children");
		GenericParams params;
		params.init(alloc);

		do
		{
			TSNode generic_param_node = cursor::current_node(&pos);
			switch (String name = generic_param_node.type())
			{
				case "const_ident":
					params.push(new_generic_param(generic_param_node.get_text(file_data).copy(alloc), CONST));
				case "type_ident":
					params.push(new_generic_param(generic_param_node.get_text(file_data).copy(alloc), TYPE));
				case "{":
				case "}":
				case ",":
				case "block_comment":
				case "doc_comment":
				case "line_comment":
					break;
				default:
					unreachable("Unexpected node type '%s' in generic parameter list", name);
			}
		} while (@ok(cursor::goto_next_sibling(&pos)));

		(*current_mod).generic_params = maybe::value(params);
		// TODO: also add these generic params into the namespace so that they can be jumped to like normal but point to the module definition instead of a specific type definition
	}

	// Add a new module section to the module
	(*current_mod).sections.push(new_module_section(alloc, doc_comment: maybe::value(*comment)));
	*comment = {};
}

<*
 Parses a global declaration such as `int x = 1` and adds it to the current module
 section.
*>
fn void parse_global_declaration(Allocator alloc, Module* root_module, Module** current_mod, TSQueryCursor* query_cursor, TSNode current_node, String file_name, String file_data, DocComment* comment)
{
	// Handle files without module declarations/with code before a module declaration
	handle_implicit_module_decl(alloc, root_module, current_mod, file_name);

	HighlightedText global_text = highlight_node_text(alloc, query_cursor, current_node, file_data);
	String global_name;
	Maybe {HighlightedText} global_type;
	List {String} global_attributes;
	global_attributes.tinit();
	query_cursor::@exec_captures(query_cursor, global_query, current_node; TSQueryCapture capture, String capture_name)
	{
		uint len;
		String text = capture.get_text(file_data);

		// TODO: this can probably be replaced with `capture_name`?
		switch (String match_name = ts::query_capture_name_for_id(global_query, capture.index, &len).str_view())
		{
			case "decl_type":
				// TODO: handle extern functions, possibly by dispatching to the parse_function_declaration function
				switch (String type = capture.node.type())
				{
					case "declaration":
						break;
					case "const_declaration":
					case "func_declaration": // TODO: handle as regular function
						break;
					default:
						unreachable("unexpected global type '%s'", type);
				}
			case "name":
				global_name = text.copy(alloc);
			case "value":
				// TODO
				// glob.val = text.copy(alloc);
				break;
			case "attr":
				// TODO
				// global_attributes.push(glob.text.slice_matching(text)!!);
				break;
			case "type":
				global_type = maybe::value(global_text.slice_bytes(...capture_text_range(current_node, capture)));
			default:
				unreachable("unexpected '%s'", match_name);
		}
	};
	// TODO
	// glob.doc_comment = *comment;
	Maybe {String[]} global_attributes_slice = global_attributes.len() == 0 ? maybe::EMPTY : maybe::value(global_attributes.to_array(alloc));
	(*current_mod).sections[^1].globals[global_name] = new_global(
														text: global_text,
														name: global_name,
														type: global_type,
														attributes: global_attributes_slice,
														doc_comment: maybe::EMPTY, // TODO
													);

	log::info("Got global with type %s", (*current_mod).sections[^1].globals[global_name]!!.type);
	*comment = {};
}

<*

*>
fn void parse_function_declaration(Allocator alloc, Module* root_module, Module** current_mod, TSQueryCursor* query_cursor, TSNode current_node, String file_name, String file_data, DocComment* comment)
{
	// Handle files without module declarations/with code before a module declaration
	handle_implicit_module_decl(alloc, root_module, current_mod, file_name);

	HighlightedText function_text = highlight_node_text(alloc, query_cursor, current_node, file_data);
	String function_name;
	bool function_is_macro;
	Maybe {HighlightedText} function_method_type;
	Maybe {HighlightedText} function_return_type;
	List {String} function_attributes;
	function_attributes.tinit();
	List {FunctionParam} function_parameters;
	function_parameters.tinit();

	// FunctionParamType function_param_param_type;
	// HighlightedText function_param_text;
	// String function_param_name;
	// Maybe {HighlightedText} function_param_type;

	query_cursor::@exec_captures(query_cursor, func_query, current_node; TSQueryCapture capture, String capture_name)
	{
		String text = capture.get_text(file_data);

		switch (capture_name) // (String match_name = ts::query_capture_name_for_id(func_query, capture.index, &len).str_view())
		{
			case "return":
				function_return_type = maybe::value(function_text.slice_bytes(...capture_text_range(current_node, capture)));
			case "name":
				function_name = text.copy(alloc);
			case "macro":
				function_is_macro = true;
			// these both rely on tree-sitter being ordered and the type always appearing before the name if it exists.
			// TODO: include the function param default value
			// TODO: move function parameter parsing to a separate function & query so I can better handle things like `macro foo($Type)`
			//       so I would do `case "param": function_parameters.push(parse_function_param(capture))` or something
			/*case "param.name":
				function_param_name = text.copy(alloc);
				switch (String name = capture.node().type())
				{
					case "ident":
						p.kind = REGULAR;
					case "ct_ident":
						p.kind = CONST;
					case "hash_ident":
						p.kind = EXPRESSION;
					default:
						unreachable("unexpected param '%s'", name);
				}
				/*p.name = text.copy(alloc);
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
				p = {};*/
				break;
			case "param.type":
				function_param.type = text.copy(alloc);
				//p.type = text.copy(alloc);
				//p.typed = true;
				break;*/
			case "param.name":
			case "param.type":
				break; // See above

			case "type":
				function_method_type = maybe::value(function_text.slice_bytes(...capture_text_range(current_node, capture)));
				//func.method_of.set(text.copy(alloc));
				break;
			case "attr":
				//func.attributes.push(func.text.slice_matching(text)!!);
				break;
			case "trailing":
				//func.trailing.set(text.copy(alloc));
				break;
			default:
				unreachable("unexpected '%s'", capture_name);
		}
	};
	// func.doc_comment = comment;
	(*current_mod).sections[^1].functions[function_name] = new_function(
															text: function_text,
															name: function_name,
															is_macro: function_is_macro,
															method_type: function_method_type,
															return_type: function_return_type,
															attributes: function_attributes.len() ? maybe::value(function_attributes.to_array(alloc)) : maybe::EMPTY,
															doc_comment: maybe::EMPTY, // TODO
															parameters: function_parameters.len() ? maybe::value(function_parameters.to_array(alloc)) : maybe::EMPTY,
															trailing_parameters: maybe::EMPTY, // TODO
														);
	*comment = {};
}

<*

*>
fn void parse_doc_comment(Allocator alloc, TSTreeCursor* cursor, TSQueryCursor* query_cursor, TSNode current_node, String file_data, DocComment* comment)
{
	TSTreeCursor cc = cursor::copy(cursor);
	defer cursor::delete(&cc);

	HighlightedText doc_comment_text = highlight_node_text(alloc, query_cursor, current_node, file_data);
	DString doc_comment_comment;
	doc_comment_comment.tinit();
	List {DocCommentContract} doc_comment_contracts;
	doc_comment_contracts.tinit();

	cursor::goto_first_child(&cc)!!;
	if (catch cursor::goto_next_sibling(&cc)) return;
	assert(cc.node().type() == "doc_comment_text" || cc.node().type() == "doc_comment_contract");

	if (cc.node().type() == "doc_comment_text")
	{
		String starting_chars;
		Splitter splitter  = cc.node().get_text(file_data).tokenize_all("\n");
		while (try line = splitter.next())
		{
			if (starting_chars.ptr == null && line.trim() != "" && line.len != line.trim_left().len)
			{
				starting_chars = line[:line.len - line.trim_left().len];
			}
			String line_trim = starting_chars.ptr == null || line.len < starting_chars.len || line[:starting_chars.len] != starting_chars ? line : line[starting_chars.len..];
			doc_comment_comment.append(line_trim.copy(alloc));
		}
		// if (comment.description.len() > 0 && comment.description[^1] == "") comment.description.pop()!!;
		if (catch cursor::goto_next_sibling(&cc)) return;
	}

	// TODO: this seems like it needs to be a do-while instead? it might cut off the first contract
	while (try cursor::goto_next_sibling(&cc) && cc.node().type() != "*>")
	{
		DocCommentContractType doc_comment_contract_type;
		String doc_comment_contract_name;

		assert(cc.node().type() == "doc_comment_contract");
		cursor::goto_first_child(&cc)!!;
		defer cursor::goto_parent(&cc)!!;

		assert(cursor::current_field_name(&cc)!! == "name");
		doc_comment_contract_name = cc.node().get_text(file_data).copy(alloc);
		switch (doc_comment_contract_name)
		{
			case "@ensure": doc_comment_contract_type = ENSURE;
			case "@require": doc_comment_contract_type = REQUIRE;
			case "@return": doc_comment_contract_type = RETURN;
			case "@param": doc_comment_contract_type = PARAM;
			case "@pure": doc_comment_contract_type = PURE;
			case "@deprecated": doc_comment_contract_type = DEPRECATED;
			default: doc_comment_contract_type = CUSTOM;
		}

		doc_comment_contracts.push(new_doc_comment_contract(
									type: doc_comment_contract_type,
									name: doc_comment_contract_name,
									expression: maybe::EMPTY, // TODO
									message: maybe::EMPTY, // TODO
								));
	}

	*comment = new_doc_comment(
					text: doc_comment_text,
					comment: doc_comment_comment.len() ? maybe::value(doc_comment_comment.copy_str(alloc)) : maybe::EMPTY,
					contracts: doc_comment_contracts.len() ? maybe::value(doc_comment_contracts.to_array(alloc)) : maybe::EMPTY,
				);
}

<*
 Also handles unions
*>
fn void parse_struct_declaration(Allocator alloc, Module* root_module, Module** current_mod, TSQueryCursor* query_cursor, TSNode current_node, String file_name, String file_data, DocComment* comment)
{
	// Handle files without module declarations/with code before a module declaration
	handle_implicit_module_decl(alloc, root_module, current_mod, file_name);


	HighlightedText struct_text = highlight_node_text(alloc, query_cursor, current_node, file_data);
	String struct_name;
	bool struct_is_union; // TODO
	HashMap {String, HighlightedText} struct_members;
	Maybe {HighlightedText} struct_type;
	List {String} struct_attributes;
	List {String} struct_interfaces;
	struct_members.init(alloc);
	struct_attributes.tinit();
	struct_interfaces.tinit();

	// Struct struc = create_struct(alloc, current_mod);
	// struc.text = collect_data(alloc, node, data);
	query_cursor::@exec_captures(query_cursor, struct_query, current_node; TSQueryCapture capture, String name)
	{
		String text = capture.get_text(file_data);
		switch (name)
		{
			case "name":
				struct_name = text.copy(alloc);
			case "attr":
				// struct_attributes.push(struct_text.slice_matching(text)!!);
				break;
			case "member":
				// TODO
				// struct_members.set(text, struct_text.slice_matching(text))!!;
				break;
			case "interface":
				// struct_interfaces.push(struct_text.slice_matching(text)!!);
				break;
			default:
				unreachable("unexpected '%s'", name);
		}
	};
	(*current_mod).sections[^1].structs[struct_name] = new_struct(
													text: struct_text,
													name: struct_name,
													is_union: struct_is_union,
													members: struct_members,
													attributes: maybe::EMPTY, // TODO
													interfaces: maybe::EMPTY, // TODO
													doc_comment: maybe::EMPTY, // TODO
												);
	*comment = {};
}

<*
 
*>
fn void parse_import_declaration(Allocator alloc, Module* root_module, Module** current_mod, TSQueryCursor* query_cursor, TSNode current_node, String file_name, String file_data, DocComment* comment)
{
	// Handle files without module declarations/with code before a module declaration
	handle_implicit_module_decl(alloc, root_module, current_mod, file_name);

	List {String} mod_path;
	mod_path.tinit(5);
	query_cursor::@exec_captures(query_cursor, import_query, current_node; TSQueryCapture capture, String name)
	{
		String text = capture.get_text(file_data);
		switch (name)
		{
			case "attr":
			case "mod":
				mod_path.push(text.copy(alloc));
			case "modend":
				(*current_mod).sections[^1].unresolved_imports.push(mod_path.to_array(alloc));
				log::debug("AAAAAA: got import '%s'", mod_path);
				mod_path.clear();
			default:
				unreachable("unexpected '%s'", name);

		}
	};
	*comment = {};

}

<*

*>
fn void parse_alias_declaration(Allocator alloc, Module* root_module, Module** current_mod, TSQueryCursor* query_cursor, TSNode current_node, String file_name, String file_data, DocComment* comment)
{
	// Handle files without module declarations/with code before a module declaration
	handle_implicit_module_decl(alloc, root_module, current_mod, file_name);

	List {String} orig_path;
	orig_path.tinit();
	String orig_name;
	String new_name;
	bool is_module;
	// TODO: have a way to store that `test::Type` is from module test & should be looked up there. ig that a type alias could add a new `TypeAlias` DocGenData that then gets resolved later
	query_cursor::@exec_captures(query_cursor, alias_query, current_node; TSQueryCapture capture, String name)
	{
		String text = capture.get_text(file_data);
		switch (name)
		{
			case "new_modulename":
				new_name = text;
				is_module = true;
			case "new_typename":
				new_name = text.copy(alloc);
			case "orig_module":
				orig_path.push(text.copy(alloc));
			case "orig_name":
				orig_name = text.copy(alloc);
			default:
				unreachable("unexpected '%s'", name);
		}
	};
	if (is_module)
	{
		orig_path.push(orig_name);
		(*current_mod).sections[^1].unresolved_import_aliases.set(new_name, orig_path.to_array(alloc));
	}
	else
	{
		log::warn("Type aliasing is not supported yet, ignoring");
		// TypeAlias al = create_typealias(alloc, orig_path, orig_name, new_name);
		// // TODO: how should I show module aliases? Maybe I shouldn't show them at all since they are only used for internal renaming.
		// al.text = collect_data(alloc, node, data);
		// current_mod.sections[^1].data.push(al);
	}
	*comment = {};
}


<*
 @return "The byte offset of the capture from the current node and the length of the current node"
*>
fn usz[2] capture_text_range(TSNode current_node, TSQueryCapture capture)
{
	return {capture.start_byte() - current_node.start_byte(), capture.end_byte() - capture.start_byte()};
}

/*
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

macro Global create_global(Allocator alloc, Module* parent_module)
{
	Global g;
	g.parent_module = parent_module;
	g.attributes.init(alloc);
	return g;
}

macro Func create_function(Allocator alloc, Module* parent_module)
{
	Func f;
	f.parent_module = parent_module;
	f.attributes.init(alloc);
	f.params.init(alloc);
	return f;
}

macro Struct create_struct(Allocator alloc, Module* parent_module)
{
	Struct s;
	s.parent_module = parent_module;
	s.attributes.init(alloc);
	s.members.init(alloc);
	s.interfaces.init(alloc);
	return s;
}

macro Enum create_enum(Allocator alloc, Module* parent_module)
{
	Enum e;
	e.parent_module = parent_module;
	e.attributes.init(alloc);
	e.values.init(alloc);
	e.interfaces.init(alloc);
	return e;
}

macro BitStruct create_bitstruct(Allocator alloc, Module* parent_module)
{
	BitStruct b;
	b.parent_module = parent_module;
	b.attributes.init(alloc);
	b.members.init(alloc);
	b.interfaces.init(alloc);
	return b;
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
);

// TODO: I am doing this in completely the wrong place, I should be doing text replacement when I'm printing the text into the file
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
*/
module ts::query_cursor;

macro void @exec_captures(TSQueryCursor* cursor, TSQuery* query, TSNode node; @body(TSQueryCapture capture, String capture_name)) {
	ts::query_cursor_exec(cursor, query, node);
	for (TSQueryMatch match, uint idx; ts::query_cursor_next_capture(cursor, &match, &idx);)
	{
		uint len;
		@body(match.captures[idx], (String)ts::query_capture_name_for_id(query, match.captures[idx].index, &len)[:len]);
	}
}

