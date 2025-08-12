module docgen;
import std::io;
import std::collections::map;
import std::collections::list;
import std::collections::pair;
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

	Module* modules = allocator::new(alloc, Module);
	foreach (str : args[1..]) @pool()
	{
		String file_data = (String)file::load(tmem, str)!!;

		get_modules(alloc, modules, parser, file_data, str);
		foreach (mod : modules.children.value_iter())
		{
			io::printfn("%s", mod);
		}
	};

	return 0;
}

struct Module (Printable)
{
	Module* parent; // eg pointer to "std"
	String path; // eg "collections"
	HashMap {String, Module*} children; // eg: {"list", "map", "pair"}

	// List {ModuleData} data; // the moduledata contains a list of conditionals/attributes as well as all things that fall under that module section
		// it also has these:
			//	List {Type} types;
			//	List {Function} funcs;
			//	List {Global} globals;
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

/*struct Type
{

}*/

fn Module* get_modules(Allocator alloc, Module* mod, TSParser* parser, String data, String file_name)
{
	TSTree* parse_tree = parser::parse_string(parser, null, data);
	defer ts::tree_delete(parse_tree);
	TSNode root_node = ts::tree_root_node(parse_tree);

	io::printfn("aa: '%s'", root_node.type());

	TSTreeCursor cursor = cursor::new(root_node);
	defer cursor::delete(&cursor);

	assert (cursor::current_node(&cursor).type() == "source_file");
	assert(ts::tree_cursor_goto_first_child(&cursor));

	do
	{
		TSNode node = cursor::current_node(&cursor);
		// io::printfn("a: %s", node.type());
		if (node.type() == "module_declaration")
		{
			Module* current_mod = mod;

			TSTreeCursor pos = cursor::copy(&cursor); // so I can restore position later
			defer cursor::delete(&pos);
			// node.get_text(data);
			cursor::goto_first_child(&cursor)!!;
			assert(cursor::current_node(&cursor).type() == "module");
			cursor::goto_next_sibling(&cursor)!!;
			assert(cursor::current_field_name(&cursor)!! == "path");
			cursor::goto_first_child(&cursor)!!;
			assert(cursor::current_node(&cursor).type() == "ident" || cursor::current_node(&cursor).type() == "module_resolution");

			while (cursor::current_node(&cursor).type() == "module_resolution")
			{
				cursor::goto_first_child(&cursor)!!;
				TSNode mod_path = cursor::current_node(&cursor);

				if (!current_mod.children.is_initialized()) current_mod.children.init(alloc);
				current_mod = current_mod.children.@get_or_set(mod_path.get_text(data), allocator::new(alloc, Module, {current_mod, mod_path.get_text(data).copy(alloc), {}}));

				cursor::goto_parent(&cursor)!!;
				cursor::goto_next_sibling(&cursor)!!;
				mod_path = cursor::current_node(&cursor);
			}

			if (!current_mod.children.is_initialized()) current_mod.children.init(alloc);
			current_mod = current_mod.children.@get_or_set(cursor::current_node(&cursor).get_text(data), allocator::new(alloc, Module, {current_mod, cursor::current_node(&cursor).get_text(data).copy(alloc), {}}));

			cursor::reset_to(&cursor, &pos);
		}
		// I can't believe this is an actual bug lol
		if (@catch(cursor::goto_next_sibling(&cursor))) break;
	} while (true);
	return mod;
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

macro void ret_void() @private {}
