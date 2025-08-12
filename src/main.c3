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
// TODO: make a btree map or some sort of sorted map

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

	uint error_offset;
	TSQuery* module_query = query::new(tsc3::language(), "(module_declaration . path: (path_ident . (module_resolution (ident) @module.parent)* . (ident) @module.name)) @module", &error_offset)!!;
	defer query::delete(module_query);

	TSQueryCursor* cursor = query_cursor::new();
	defer query_cursor::delete(cursor);
	query_cursor::@exec(cursor, module_query, root_node; TSQueryMatch* match)
	{
		Module* current_mod = mod;
		io::printfn("matched on %s", match.capture_count);
		foreach (i, capture : match.captures[:match.capture_count])
		{
			uint len;
			String text = capture.get_text(data);

			io::printfn("%s: matched '%s'", i, text);
			switch (String match_name = ts::query_capture_name_for_id(module_query, capture.index, &len).str_view())
			{
				case "module":
					// TODO: handle module attributes
					break;
				case "module.parent":
					if (!current_mod.children.is_initialized()) current_mod.children.init(alloc);
					current_mod = current_mod.children.@get_or_set(text, allocator::new(alloc, Module, {current_mod, text.copy(alloc), {}}));
				case "module.name":
					if (!current_mod.children.is_initialized()) current_mod.children.init(alloc);
					current_mod = current_mod.children.@get_or_set(text, allocator::new(alloc, Module, {current_mod, text.copy(alloc), {}}));
				default:
					unreachable("unexpexted '%s'", match_name);
			}
		}
	};
	return mod;
}

