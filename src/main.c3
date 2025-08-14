module docgen;
import std::io;
import std::collections::map;
import std::collections::list;
import std::collections::pair;
import std::collections::maybe;
import std::sort;
import std::math;

import ts;
import tree_sitter_c3;
alias tsc3 = module tree_sitter_c3;

fn int main(String[] args)
{
	/*TrackingAllocator alloc1;
	alloc1.init(tmem);
	defer alloc1.print_report();*/
	Allocator alloc = tmem;

	TSParser* parser = parser::new_with_language(tsc3::language())!!;
	defer parser::delete(parser);

	Module* modules = module_create(alloc, null, {});

	foreach (str : args[1..]) @pool()
	{
		String file_data = (String)file::load(tmem, str)!!;

		Path str_path = path::new(alloc, str)!!;
		get_modules(alloc, modules, parser, file_data, str_path.basename()[:^str_path.extension().len + 1]!!);
	};


	String root_folder = "./docs";
	io::printfn("%s", modules);
	modules.@iter_all_children(; Module* mod)
	{
		@pool()
		{
			String mod_folder = mod.get_folder_path(tmem, root_folder);
			String mod_file = mod.get_file_name(tmem);
			io::printfn("%s :: %s :: %s", mod_folder, mod_file, mod.get_depth());
			// abort();
			Path mod_folder_path = path::new(tmem, mod_folder)!!;
			if (!path::exists(mod_folder_path))
			{
				path::mkdir(mod_folder_path, true)!!;
			}
			File out = file::open(mod_folder.tconcat(mod_file), "wb")!!;
			defer (void)out.close();
			io::fprintf(&out, "%s", mod)!!;
/*			foreach (section : mod.sections)
			{
				io::fprintf(&out, "### `module %s%s %s`\n", path_string, mod.generic_params, section.attributes)!!;
			}*/
		};
	};

	return 0;
}

struct Module (Printable)
{
	Module* parent; // eg pointer to "std"
	String path; // eg "collections"
	HashMap {String, Module*} children; // eg: {"list", "map", "pair"}
	List {GenericParam} generic_params;
	bool generics_done;
	List {ModuleSection} sections;
	// List {ModuleData} data; // the moduledata contains a list of conditionals/attributes as well as all things that fall under that module section
		// it also has these:
			// List {Type} types;
			// List {Function} funcs;
			// List {Global} globals;
}

enum GenericParamType : char {CONST, TYPE}
struct GenericParam (Printable)
{
	String val;
	GenericParamType type;
}

fn String GenericParam.to_constant_string(&self) @dynamic => self.val;

enum ValType
{
	LITERAL,
	CONST,
	TYPE,
}
/*struct TypeDef
{
	union
	{
		struct alias_ {}
		struct enum_ {}
		struct struct_ {}
	}
}*/
struct Global
{
	String name;
	// I store the whole type including generic params etc in here, and then can parse it again later
	String type;
	String val;
	bitstruct : char
	{
		bool tlocal_;
		bool const_;
		bool extern_;
	}
	List {String} attributes;
}

struct Func
{
	String name;
	Maybe {String} return_type;
	Maybe {String} method_of;
	Maybe {String} trailing;
	bool macro_;
	List {String} attributes;
	List {Param} params;
}

enum ParamType {REGULAR, CT, EXPR, VAARG/*, MACRO_VAARG probably not needed since I distinguish macros in Func*/}
struct Param
{
	ParamType kind;
	bool typed;
	String name;
	String type;
}

struct ModuleSection
{
	List {String} attributes;
	List {Global} globals;
	List {Func} functions;
}

fn void ModuleSection.init(&self, Allocator alloc)
{
	self.globals.init(alloc);
	self.functions.init(alloc);
	self.attributes.init(alloc);
}

fn String Module.get_path_string(&self, Allocator alloc) => @pool()
{
	DString res;
	res.init(tmem);
	res.append(self.path);
	Module* parent = self.parent;
	while (parent != null && parent.path.ptr != null)
	{
		res.insert_at(0, string::tformat("%s::", parent.path));
		parent = parent.parent;
	}
	return res.copy_str(alloc);
}

fn String Module.get_folder_path(&self, Allocator alloc, String prefix) => @pool()
{
	DString res;
	res.init(tmem);
	Module* parent = self.parent;
	while (parent != null && parent.path.ptr != null)
	{
		res.insert_at(0, string::tformat("%s/", parent.path));
		parent = parent.parent;
	}
	res.insert_at(0, string::tformat("%s/", prefix[^1] == '/' ? prefix[..^2] : prefix));
	return res.copy_str(alloc);
}

fn usz Module.get_depth(&self)
{
	usz depth = 0;
	Module* parent = self;
	while (parent != null && parent.path.ptr != null)
	{
		depth ++;
		parent = parent.parent;
	}
	return depth;
}

<*
 This assumes that both modules share the same root module
*>
fn String Module.get_folder_path_relative_to(&self, Allocator alloc, Module* other) => @pool()
{
	DString result;
	result.tinit();
	result.append("./");

	List {String} to_climb;
	to_climb.tinit();

	Module* self_cursor = self;
	while (self_cursor.get_depth() > other.get_depth())
	{
		result.append("../");
		self_cursor = self_cursor.parent;
	}

	Module* other_cursor = other;
	while (other_cursor.get_depth() > self.get_depth())
	{
		other_cursor = other_cursor.parent;
		to_climb.push(other_cursor.path);
	}

	while (self_cursor != other_cursor)
	{
		self_cursor = self_cursor.parent;
		other_cursor = other_cursor.parent;
		if (other_cursor.path.ptr) to_climb.push(other_cursor.path);
	}

	io::printfn("climbing: %s", to_climb);
	foreach (i, mod : to_climb)
	{
		result.appendf("%s/", mod);
	}

	return result.copy_str(alloc);
}

fn String Module.get_relative_path_to(&self, Allocator alloc, Module* other) => @pool()
{
	return self.get_folder_path_relative_to(tmem, other).tconcat(other.get_file_name(tmem)).copy(alloc);
}

fn String Module.get_file_name(&self, Allocator alloc) => self.path.concat(alloc, ".md");

macro Module.@iter_all_children(&self; @body(Module* mod)) => @pool()
{
	List {Module*} stack;
	stack.init(tmem);
	stack.push(self);
	while (stack.len() != 0) @pool()
	{
		Module* n = stack.pop()!!;
		if (n.path.ptr != null) @body(n);
		if (n.children.len() != 0)
		{

			Entry {String, Module*}*[] children = mem::temp_array(Entry {String, Module*}*, n.children.len());
			usz i;
			foreach (Entry {String, Module*}* e : n.children.table) while (e != null)
			{
				children[i++] = e;
				e = e.next;
			}

			sort::insertionsort(children, fn int(Entry {String, Module*}* a, Entry {String, Module*}* b) => stringcmp(a.key, b.key));
			// Idk why it's sorting it in reverse, it's the same sorting function as I used before. either I'm iterating it wrong this time or it was always backwards and I was iterating incorrectly the first time
			foreach_r (c : children) stack.push(c.value);
		}
	};
}

macro Module.@iter_children(&self; @body(Module* mod))
{
	if (self.children.len() == 0) return;
	Entry {String, Module*}*[] children = mem::temp_array(Entry {String, Module*}*, self.children.len());
	usz i;
	foreach (Entry {String, Module*}* e : self.children.table) while (e != null)
	{
		children[i++] = e;
		e = e.next;
	}

	sort::insertionsort(children, fn int(Entry {String, Module*}* a, Entry {String, Module*}* b) => stringcmp(a.key, b.key));
	foreach_r (c : children) @body(c.value);

}

fn usz? Module.to_format(&self, Formatter* fmt) @dynamic => @pool()
{
	usz? n;

	// the titlebar (TODO)
	n += fmt.printf("## `Overview` [Globals](./globals.md) [Types](./types.md) [Functions](./functions.md)\n");

	// the module name heading
	n += fmt.printf("# ");
	if (self.parent != null && self.parent.path.ptr != null) @pool()
	{
		Module* parent = self.parent;
		DString buf;
		buf.tinit();

	 	while (parent != null && parent.path.ptr != null) @pool()
		{
			buf.insert_at(0, string::tformat("[%s](%s)%s", parent.path, self.get_relative_path_to(tmem, parent), parent.parent == null ? "" : "::"));
			parent = parent.parent;
		};
		n += fmt.printf("%s", buf.str_view());
	};
	n += fmt.printf("`%s", self.path);
	if (self.generic_params.len() > 0)
	{
		n += fmt.printf(" {");
		foreach (i, param : self.generic_params)
		{
			n += fmt.printf("%s%s", param, i == self.generic_params.len() - 1 ? "" : ", ");
		}
		n += fmt.printf("}");
	}
	n += fmt.printf("`\n");

	// the submodules
	if (self.children.len() != 0)
	{
		n += fmt.printf("## Submodules\n");
		self.@iter_children(; Module* child)
		{
			@pool()
			{
				n += fmt.printf("[%s](%s)\n", child.path, self.get_relative_path_to(tmem, child));
			};
		};
	}

	// collect & print all the globals in all module sections (except @local)
	HashMap {String, GlobalAbomination} globals;
	globals.init(tmem);
	HashMap {String, GlobalAbomination} private_globals;
	private_globals.init(tmem);
	foreach (&sec : self.sections)
	{
		foreach (&glob : sec.globals) if (!glob.attributes.contains("@local"))
		{
			if (!glob.attributes.contains("@private"))
			{
				GlobalAbomination a = globals.@get_or_set(glob.name, *(GlobalAbomination){}.init(tmem));
				a.push({glob, sec});
				globals[glob.name] = a;
			}
			else
			{
				GlobalAbomination a = private_globals.@get_or_set(glob.name, *(GlobalAbomination){}.init(tmem));
				a.push({glob, sec});
				private_globals[glob.name] = a;
			}
		}
	}
	if (globals.len() > 0)
	{
		n += fmt.printf("## Globals\n");
		n += fmt.printf("|Name|Description|\n");
		n += fmt.printf("|----|-----------|\n");
		foreach (glob_ : globals.iter())
		{
			Global* glob = glob_.value[0].first;
			n += fmt.printf("|[%s](#todo)|%s|\n", glob.name, "TODO");
		}
	}

	// same for functions (excluding methods). I could maybe make a macro to do this, maybe once I start doing types as well
	HashMap {String, FuncAbomination} funcs;
	funcs.init(tmem);
	HashMap {String, FuncAbomination} private_funcs;
	private_funcs.init(tmem);
	foreach (&sec : self.sections)
	{
		foreach (&func : sec.functions) if (!func.attributes.contains("@local") && !func.method_of.has_value)
		{
			if (!func.attributes.contains("@private"))
			{
				FuncAbomination a = funcs.@get_or_set(func.name, *(FuncAbomination){}.init(tmem));
				a.push({func, sec});
				funcs[func.name] = a;
			}
			else
			{
				FuncAbomination a = private_funcs.@get_or_set(func.name, *(FuncAbomination){}.init(tmem));
				a.push({func, sec});
				private_funcs[func.name] = a;
			}
		}
	}
	if (funcs.len() > 0)
	{
		n += fmt.printf("## Functions\n");
		n += fmt.printf("|Name|Description|\n");
		n += fmt.printf("|----|-----------|\n");
		foreach (func_ : funcs.iter()) @pool()
		{
			Func* func = func_.value[0].first;
			n += fmt.printf("|[%s%s](#todo)|%s|\n", func.attributes.contains("@builtin") ? "" : self.path.tconcat("::"), func.name, "TODO");
		};
	}

	// now print all the private things
	if (private_funcs.len() > 0 || private_globals.len() > 0)
	{
		n += fmt.printf("## Private\n");

		if (private_globals.len() > 0)
		{
			n += fmt.printf("### Globals\n");
			n += fmt.printf("|Name|Description|\n");
			n += fmt.printf("|----|-----------|\n");
			foreach (glob_ : private_globals.iter())
			{
				Global* glob = glob_.value[0].first;
				n += fmt.printf("|[%s](#todo)|%s|\n", glob.name, "TODO");
			}
		}

		if (private_funcs.len() > 0)
		{
			n += fmt.printf("### Functions\n");
			n += fmt.printf("|Name|Description|\n");
			n += fmt.printf("|----|-----------|\n");
			foreach (func_ : private_funcs.iter()) @pool()
			{
				Func* func = func_.value[0].first;
				n += fmt.printf("|[%s%s](#todo)|%s|\n", func.attributes.contains("@builtin") ? "" : self.path.tconcat("::"), func.name, "TODO");
			};
		}
	}
	return n;
}

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

	Module* current_mod = root;
	do
	{
		TSNode node = cursor::current_node(&cursor);
		// io::printfn("a: %s", node.type());
		TSTreeCursor pos = cursor::copy(&cursor);
		defer cursor::delete(&pos);
		switch (node.type())
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
					io::printfn("generic params: %s", current_mod.generic_params);
					// Before I would duplicate generic params if I encountered the same generic module multiple times (eg std::collections::map)
					current_mod.generics_done = true;
					// if (sec.attributes.len() != 0) abort("%s", sec.attributes);
					current_mod.sections.push(sec);
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
					current_mod.sections[^1].globals.push(glob);
				};
			case "func_definition":
			case "macro_declaration":
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
					current_mod.sections[^1].functions.push(func);
				};
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

fn int stringcmp(String a, String b)
{
	int res;
	foreach (i, c : a[:math::min(a.len, b.len)])
	{
		if (c > b[i])
		{
			return 1;
		}
		else if (c < b[i])
		{
			return -1;
		}
	}
	return compare_to(a.len, b.len);
}

module ts::cursor;

faultdef NONE_REMAINING, NO_NAME;

fn TSTreeCursor new(TSNode node) => ts::tree_cursor_new(node); 
fn void delete(TSTreeCursor* self) => ts::tree_cursor_delete(self);
fn void reset(TSTreeCursor* self, TSNode node) => ts::tree_cursor_reset(self, node);
fn void reset_to(TSTreeCursor* dst, TSTreeCursor* src) => ts::tree_cursor_reset_to(dst, src);
fn TSNode current_node(TSTreeCursor* self) => ts::tree_cursor_current_node(self);
fn String? current_field_name(TSTreeCursor* self) => (ts::tree_cursor_current_field_name(self) ?: NO_NAME?).str_view();
fn TSFieldId current_field_id(TSTreeCursor* self) => ts::tree_cursor_current_field_id(self);
fn void? goto_parent(TSTreeCursor* self) => ts::tree_cursor_goto_parent(self) ? ret_void() : NONE_REMAINING?;
fn void? goto_next_sibling(TSTreeCursor* self) => ts::tree_cursor_goto_next_sibling(self) ? ret_void() : NONE_REMAINING?;
fn void? goto_previous_sibling(TSTreeCursor* self) => ts::tree_cursor_goto_previous_sibling(self) ? ret_void() : NONE_REMAINING?;
fn void? goto_first_child(TSTreeCursor* self) => ts::tree_cursor_goto_first_child(self) ? ret_void() : NONE_REMAINING?;
fn void? goto_last_child(TSTreeCursor* self) => ts::tree_cursor_goto_last_child(self) ? ret_void() : NONE_REMAINING?;
fn void goto_descendant(TSTreeCursor* self, uint goal_descendant_index) => ts::tree_cursor_goto_descendant(self, goal_descendant_index);
fn uint current_descendant_index(TSTreeCursor* self) => ts::tree_cursor_current_descendant_index(self);
fn uint current_depth(TSTreeCursor* self) => ts::tree_cursor_current_depth(self);
fn long goto_first_child_for_byte(TSTreeCursor* self, uint goal_byte) => ts::tree_cursor_goto_first_child_for_byte(self, goal_byte);
fn long goto_first_child_for_point(TSTreeCursor* self, TSPoint goal_point) => ts::tree_cursor_goto_first_child_for_point(self, goal_point);
fn TSTreeCursor copy(TSTreeCursor* cursor) => ts::tree_cursor_copy(cursor);

fn TSNode TSTreeCursor.node(&self) => current_node(self);

macro void ret_void() @private {}

