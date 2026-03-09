module docgen;
import std::io;
import std::collections::map;
import std::collections::enummap;
import std::collections::list;
import std::collections::pair;
import std::collections::maybe;
import std::collections::interfacelist;
import std::collections::triple;
import std::sort;
import std::math;

import ts;
import tree_sitter_c3;
alias tsc3 = module tree_sitter_c3;

import html;

const INDEX_FILE = "index.html";
const OVERVIEW_FILE = "overview.html";
const SIDEBAR_FILE = "sidebar.html";

// TODO: break this awful mess into multiple files. one dedicated to only the output formatting and one for the struct definitions
fn int main(String[] args)
{
	$if env::COMPILER_SAFE_MODE:
		log::set_priority_for_category(log::default_category, VERBOSE);
	$else
		log::set_priority_for_category(log::default_category, INFO);
	$endif
	Allocator alloc = tmem;


	TSParser* parser = parser::new_with_language(tsc3::language())!!;
	defer parser::delete(parser);

	Module* root_module = new_module(alloc, parent: maybe::EMPTY, name: maybe::EMPTY, generic_params: maybe::EMPTY);

	if (args.len < 2)
	{
		log::error("Usage: %s <files/folders to read C3 files from>", args[0]);
		return 1;
	}
	if (catch parse_all_files(alloc, parser, root_module, args[1..])) return 1;

	io::printn(*root_module);

	String root_folder = "docs/";
/*	root_module.@iter_all_children(; Module* mod)
	{
		@pool()
		{
			String file_name = root_folder.tconcat(mod.get_overview_file_name(tmem));
			File? index_file = file::open(file_name, "wb");
			if (catch err = index_file)
			{
				log::error("Unable to open file '%s': %s", file_name, err);
			}
			// io::fprintf(&index_file, "%s\n", mod.format_overview(tmem))!!;
			defer (void)index_file.close();
		};
	};*/
/*
	modules.resolve(alloc, modules);

	// TODO: empty root folder to remove old docs before outputting new docs
	// TODO: always include stdlib in docs generated so I can always resolve stdlib imports
	// TODO: unzip .c3l files to get implementations in libraries
	String root_folder = "./docs";
	log::debug("%s", modules);

	@pool()
	{
		File css = file::open(root_folder.tconcat("/style.css"), "wb")!!;
		defer (void)css.close();
		io::fprintf(&css, "%s", GLOBAL_CSS)!!;

		File js = file::open(root_folder.tconcat("/main.js"), "wb")!!;
		defer (void)js.close();
		io::fprintf(&js, "%s", GLOBAL_JS)!!;
	};

	modules.@iter_all_children(; Module* mod)
	{
		@pool()
		{
			String mod_folder = mod.get_folder_path(tmem, root_folder);
			Path mod_folder_path = path::new(tmem, mod_folder)!!;
			if (!path::exists(mod_folder_path))
			{
				path::mkdir(mod_folder_path, true)!!;
			}


			File index = file::open(mod_folder.tconcat(INDEX_FILE), "wb")!!;
			defer (void)index.close();
			foreach (sec : mod.sections) foreach (val : sec.global_namespace.iter())
			{
				io::fprintf(&index, "<p>%s<p>", val.key)!!;
			}
		};
	};*/

	return 0;
}

fn void? parse_all_files(Allocator alloc, TSParser* parser, Module* root_module, String[] paths)
{
	@pool()
	{
		List {Path} files;
		files.tinit();

		foreach (path_name : paths)
		{
			Path? path = path::new(tmem, path_name);
			if (catch err = path)
			{
				log::error("Path '%s' is invalid", path_name);
				return err~;
			}
			if (path::is_file(path))
			{
				if (@catch(path.extension()) || (path.extension()!! != "c3" && path.extension()!! != "c3i"))
				{
					log::error("File '%s' is not a c3 file", path_name);
					return io::INVALID_FORMAT~;
				}
				files.push(path);
			}
			else
			{
				bool? res = path::traverse(path, fn (path, is_dir, files)
				{
					if (is_dir) return false;
					if (@catch(path.extension()) || (path.extension()!! != "c3" && path.extension()!! != "c3i")) return false;
					((List {Path}*)files.ptr).push(path::new(tmem, path.str_view())!!);
					return false;
				}, &files);
				if (catch err = res)
				{
					log::error("Error while traversing path: %s", err);
					return err~;
				}
			}
		}

		foreach (file : files) @pool()
		{
			String? file_data = (String)file::load(tmem, file.path_string);
			if (catch err = file_data)
			{
				log::error("Unable to read file '%s': %s", file, err);
				return err~;
			}
			parse_file(alloc, root_module, parser, file_data, file.basename()[:^file.extension().len + 1]!!);
		};
	};
}

fn int stringcmp(String a, String b)
{
	int res;
	foreach (i, c : a[:min(a.len, b.len)])
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


const GLOBAL_CSS =
`
html {
	font-family:"0xProto Nerd Font";
}

.sidebar {
	height: 100%;
	width: 15em;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	overflow-x: hidden;
	background-color: #dfdfdf;
	padding-left: 0.5em;
	border: none;
}

.main {
	/*margin-left: 15em;
	padding: 0px 10px;*/
	height: 100%;
	width: 100% - 15em;
}

.sidebar-frame {
	height: 100%;
	width: 15em;
	position: fixed;
	top: 0;
	left: 0;
	border: none;
}

.main-frame {
	height: 100%;
	width: calc(100% - 15em);
	position: fixed;
	top: 0;
	left: 15em;
	border: none;
}

.submodule-list {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
}

.submodule-list * {
	padding: 0em 1em 0em 0em;
}

.code-block {
	background-color: #efefef;
	/*width: auto;*/
	max-width: max-content;
}

.DataType_KEYWORD {
	color: red;
}

.DataType_TYPE {
	color: purple;
}

.DataType_CONST {
	color: purple;
}

.DataType_COMMENT {
	color: grey;
}

.DataType_BUILTIN_TYPE {
	color: #848400;
}

.DataType_NUMBER {
	color: purple;
}

.DataType_STRING {
	color: lightgreen;
}

.DataType_PATH {
	color: #004400;
}

.DataType_FUNCTION {
	color: green;
}

.DataType {
	display: inline-block;
}
`;

// TODO: split this into different javascript files for the view page and the sidebar+data files. I could probably have one shared for sidebar+data & one more specific to that view if needed.
// the view page doesn't need the linkAction and the the sidebar+data pages don't need the event listener
const GLOBAL_JS =
`
// not needed in the view page.
function linkAction(event, newHref)
{
	event.preventDefault();
	let main_frame = window.top.document.getElementById('main-frame');
	window.top.history.pushState(newHref, event.target.href, event.target.href);
	main_frame.contentWindow.location.replace(newHref);
}

window.onload = () =>
{
	if (window === window.top)
	{
		const MAIN_FRAME = document.getElementById('main-frame');
		const ORIG_SRC = MAIN_FRAME.src;
		window.onpopstate = (e) =>
		{
			if (e.state != null)
			{
				MAIN_FRAME.contentWindow.location.replace(e.state);
			}
			else
			{
				MAIN_FRAME.contentWindow.location.replace(ORIG_SRC);
			}
		};
	}
};
`;

module std::core::array;

macro @contains($array, $member)
{
	$foreach $m : $array:
		$if $m == $member:
			return true;
		$endif
	$endforeach
	return false;
}

macro @index_of($array, $member)
{
	bool $found;
	$foreach $i, $m : $array:
		$if $m == $member:
			$found = true;
			return $i;
		$endif
	$endforeach
	$if !$found:
		$error @sprintf("Unable to find member %s", $member);
	$endif
}


module ts::cursor;

faultdef NONE_REMAINING, NO_NAME;

fn TSTreeCursor new(TSNode node) => ts::tree_cursor_new(node); 
fn void delete(TSTreeCursor* self) => ts::tree_cursor_delete(self);
fn void reset(TSTreeCursor* self, TSNode node) => ts::tree_cursor_reset(self, node);
fn void reset_to(TSTreeCursor* dst, TSTreeCursor* src) => ts::tree_cursor_reset_to(dst, src);
fn TSNode current_node(TSTreeCursor* self) => ts::tree_cursor_current_node(self);
fn String? current_field_name(TSTreeCursor* self) => (ts::tree_cursor_current_field_name(self) ?: NO_NAME~).str_view();
fn TSFieldId current_field_id(TSTreeCursor* self) => ts::tree_cursor_current_field_id(self);
fn void? goto_parent(TSTreeCursor* self) => ts::tree_cursor_goto_parent(self) ? ret_void() : NONE_REMAINING~;
fn void? goto_next_sibling(TSTreeCursor* self) => ts::tree_cursor_goto_next_sibling(self) ? ret_void() : NONE_REMAINING~;
fn void? goto_previous_sibling(TSTreeCursor* self) => ts::tree_cursor_goto_previous_sibling(self) ? ret_void() : NONE_REMAINING~;
fn void? goto_first_child(TSTreeCursor* self) => ts::tree_cursor_goto_first_child(self) ? ret_void() : NONE_REMAINING~;
fn void? goto_last_child(TSTreeCursor* self) => ts::tree_cursor_goto_last_child(self) ? ret_void() : NONE_REMAINING~;
fn void goto_descendant(TSTreeCursor* self, uint goal_descendant_index) => ts::tree_cursor_goto_descendant(self, goal_descendant_index);
fn uint current_descendant_index(TSTreeCursor* self) => ts::tree_cursor_current_descendant_index(self);
fn uint current_depth(TSTreeCursor* self) => ts::tree_cursor_current_depth(self);
fn long goto_first_child_for_byte(TSTreeCursor* self, uint goal_byte) => ts::tree_cursor_goto_first_child_for_byte(self, goal_byte);
fn long goto_first_child_for_point(TSTreeCursor* self, TSPoint goal_point) => ts::tree_cursor_goto_first_child_for_point(self, goal_point);
fn TSTreeCursor copy(TSTreeCursor* cursor) => ts::tree_cursor_copy(cursor);

fn TSNode TSTreeCursor.node(&self) => current_node(self);

macro void ret_void() @private {}

module std::collections::list;

fn Type? List.get_try(&self, usz idx)
{
	if (idx < self.size) return self.entries[idx];
	return NOT_FOUND~;
}
