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
	Allocator alloc = tmem;

	TSParser* parser = parser::new_with_language(tsc3::language())!!;
	defer parser::delete(parser);

	Module* modules = module_create(alloc, null, {});

	foreach (str : args[1..]) @pool()
	{
		String file_data = (String)file::load(tmem, str)!!;

		get_modules(alloc, modules, parser, file_data, str);
		foreach (mod : modules.children.value_iter())
		{
			// io::printfn("%s", mod);
		}
	};

	return 0;
}

struct Module (Printable)
{
	Module* parent; // eg pointer to "std"
	String path; // eg "collections"
	HashMap {String, Module*} children; // eg: {"list", "map", "pair"}
	List {GenericParam} generic_params;
	List {ModuleSection} sections;
	// List {ModuleData} data; // the moduledata contains a list of conditionals/attributes as well as all things that fall under that module section
		// it also has these:
			// List {Type} types;
			// List {Function} funcs;
			// List {Global} globals;
}

enum GenericParamType : char {CONST, TYPE}
struct GenericParam
{
	String val;
	GenericParamType type;
}
enum ValType
{
	LITERAL,
	CONST,
	TYPE,
}
struct Global
{
	String name;
	// I store the whole type including generic params etc in here, and then parse it again later
	String type;
	String val;
}

struct ModuleSection
{
	List {String} attributes;
	List {Global} globals;
}

fn void ModuleSection.init(&self, Allocator alloc)
{
	self.globals.init(alloc);
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


usz depth = 0;
fn usz? Module.to_format(&self, Formatter* fmt) @dynamic => @pool()
{
	usz? n;
	n += fmt.printf("%s", /*self.get_path_string(tmem)*/self.path);
	if (self.generic_params.len() > 0)
	{
		n += fmt.printf("{");
		foreach (i, param : self.generic_params)
		{
			n += fmt.printf("%s%s", param.val, i + 1 == self.generic_params.len() ? "" : ", ");
		}
		n += fmt.printf("}");
	}
	foreach (j, section : self.sections) foreach (i, global : section.globals)
	{
		n += fmt.printf("\n");
		depth ++;
		for (usz k = 0; k < depth - 1; k++) n += fmt.printf("┃");
		n += fmt.printf("%s%s", i == section.globals.len() - 1 ? "┗" : "┣", global.name.len > 128 ? global.name[:128 - 3].tconcat("...").treplace("\n", " ") : global.name);
		depth --;
	}
	if (self.children.len() != 0) foreach (i, child : self.children.value_iter())
	{
		n += fmt.printf("\n");
		depth ++;
		for (usz j = 0; j < depth - 1; j++) n += fmt.printf("┃");
		n += fmt.printf("%s%s", i == self.children.len() - 1 ? "┗" : "┣", /*self.children*/child);
		depth --;
	}
	return n;
}

fn Module* get_modules(Allocator alloc, Module* mod, TSParser* parser, String data, String file_name)
{
	TSTree* parse_tree = parser::parse_string(parser, null, data);
	defer ts::tree_delete(parse_tree);
	TSNode root_node = ts::tree_root_node(parse_tree);

	io::printfn("Parsing file '%s'", file_name);

	TSTreeCursor cursor = cursor::new(root_node);
	defer cursor::delete(&cursor);

	TSQueryCursor* query_cursor = query_cursor::new();
	defer query_cursor::delete(query_cursor);

	assert (cursor::current_node(&cursor).type() == "source_file");
	assert(ts::tree_cursor_goto_first_child(&cursor));

	Module* current_mod = mod;
	do
	{
		TSNode node = cursor::current_node(&cursor);
		// io::printfn("a: %s", node.type());
		TSTreeCursor pos = cursor::copy(&cursor);
		defer cursor::delete(&pos);
		switch (node.type())
		{
			case "module_declaration":
				current_mod = mod;

				// node.get_text(data);
				cursor::goto_first_child(&cursor)!!;
				assert(cursor.node().type() == "module");
				cursor::goto_next_sibling(&cursor)!!;
				assert(cursor::current_field_name(&cursor)!! == "path");
				cursor::goto_first_child(&cursor)!!;
				assert(cursor.node().type() == "ident" || cursor.node().type() == "module_resolution");

				while (cursor.node().type() == "module_resolution")
				{
					cursor::goto_first_child(&cursor)!!;

					current_mod = current_mod.children.@get_or_set(cursor.node().get_text(data), module_create(alloc, current_mod, cursor.node().get_text(data).copy(alloc)));

					cursor::goto_parent(&cursor)!!;
					cursor::goto_next_sibling(&cursor)!!;
				}

				current_mod = current_mod.children.@get_or_set(cursor.node().get_text(data), module_create(alloc, current_mod, cursor.node().get_text(data).copy(alloc)));

				cursor::goto_parent(&cursor)!!;
				// TODO: handle generics and attributes
				while OUTER: (try cursor::goto_next_sibling(&cursor))
				{
					// TODO: have some function that goes to first child/next sibling/parent and skips all comments so I don't have to deal with them manually
					switch (String type = cursor.node().type())
					{
						case "generic_param_list":
							// io::printfn("got generic param list: '%s'", cursor.node().get_text(data));
							cursor::goto_first_child(&cursor)!!;
							while (try cursor::goto_next_sibling(&cursor))
							{
								switch (String param = cursor.node().type())
								{
									case "{":
									case "}":
									case ",":
										break;
									case "type_ident":
										current_mod.generic_params.push({cursor.node().get_text(data).copy(alloc), TYPE});
									case "const_ident":
										current_mod.generic_params.push({cursor.node().get_text(data).copy(alloc), CONST});
									default:
										unreachable("unexpected module parameter '%s'", param);
								}
							}
						case "attributes":
							io::printfn("got attributes: '%s'", cursor.node().get_text(data));
						case ";":
							break OUTER;
						case "block_comment":
						case "line_comment":
							break;
						default:
							unreachable("unexpected type '%s'", type);
					}
				}
				current_mod.sections.push(module_section_create(alloc));

			case "global_declaration":
				if (current_mod == mod)
				{
					current_mod = current_mod.children.@get_or_set(file_name, module_create(alloc, current_mod, file_name.copy(alloc)));
					current_mod.sections.push(module_section_create(alloc));
				}
				if (try cursor::goto_first_child(&cursor))
				{
					// TODO: it may be safer to treat these seperately in the context of parsing here instead of merging with general functions
					if (cursor.node().type() == "extern" && @ok(cursor::goto_next_sibling(&cursor)) && cursor.node().type() == "func_declaration") nextcase "func_definition";
					cursor::goto_parent(&cursor)!!;
				}

				Global glob;
				glob.val = cursor.node().get_text(data).copy(alloc);
				cursor::goto_first_child(&cursor)!!;

				if (cursor.node().type() == "extern") cursor::goto_next_sibling(&cursor)!!;
				assert(cursor.node().type() == "declaration" || cursor.node().type() == "const_declaration");
				cursor::goto_first_child(&cursor)!!;
				if (cursor.node().type() == "const" || cursor.node().type() == "tlocal") cursor::goto_next_sibling(&cursor)!!;

				if (cursor::current_field_name(&cursor)!! == "type")
				{
					glob.type = cursor.node().get_text(data).copy(alloc);
					cursor::goto_next_sibling(&cursor)!!;
/*					cursor::goto_first_child(&cursor)!!;
					switch (String type = cursor.node().type())
					{
						case "path_type_ident":
						case "base_type_name":
							glob.type.name = cursor.node().get_text(data).copy(alloc);
						case "generic_type_ident":
							cursor::goto_first_child(&cursor)!!;
							glob.type.name = cursor.node().get_text(data).copy(alloc);
							cursor::goto_next_sibling(&cursor)!!;
							assert(cursor.node().type() == "generic_arg_list");
							glob.type.generic_params.init(alloc);
							cursor::goto_first_child(&cursor)!!;
							do
							{
								glob.
								if (!@ok(cursor::goto_next_sibling(&cursor))) break;
							} while (true);
							
						default:
							unreachable("unexpected type '%s'", type);
					}
					// glob.type = 
					io::printfn("%s", cursor.node().get_text(data));*/
				}
				//assert(cursor::current_field_name(&cursor)!! == "name");
				// if (cursor::current_field_name(&cursor)!! == "name")

				current_mod.sections[^1].globals.push(glob);
			case "func_definition":
				// io::printfn("func declaration not implemented");
				// abort("uno");
		}
		cursor::reset_to(&cursor, &pos);
		// I can't believe this is an actual bug lol
		if (@catch(cursor::goto_next_sibling(&cursor))) break;
	} while (true);
	return mod;
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

macro ModuleSection module_section_create(Allocator alloc, String... attributes)
{
	ModuleSection new;
	new.init(alloc);
	new.attributes.add_array(attributes);
	return new;
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

