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

import html;

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

	@pool()
	{
		File css = file::open(root_folder.tconcat("/style.css"), "wb")!!;
		defer (void)css.close();
		io::fprintf(&css, "%s", GLOBAL_CSS)!!;
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
			foreach (view : ModuleView.values)
			{
				
				// String mod_file = mod.get_file_path(tmem, root_folder, TYPES);
				// abort();
				File out = file::open(mod_folder.tconcat(view.path), "wb")!!;
				defer (void)out.close();
				io::fprintf(&out, "%s", view.func(mod, alloc))!!;
			}
		};
	};

	return 0;
}

struct Module // (Printable)
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

interface DocGenData
{
	fn String get_name(Allocator alloc);
	fn String get_preview(Allocator alloc);
	fn HighlightedText get_highlighted();
	fn bool is_private();
	fn bool is_hidden();

	fn List {Contract} get_doc_contracts();
	fn String get_doc_comment(Allocator alloc);
}

struct Global // (DocGenData)
{
	String name;
	// I store the whole type including generic params etc in here, and then can parse it again later
	Maybe {String} type;
	String val;
	bitstruct : char
	{
		bool tlocal_;
		bool const_;
		bool extern_;
	}
	List {String} attributes;
	DocComment doc_comment;
	HighlightedText text;
}

enum DataType : char {DEFAULT, KEYWORD, BUILTIN_TYPE, TYPE, CONST, IDENT, NUMBER, STRING, ATTR, COMMENT, PATH, FUNCTION, END /*nice hack to tell when to stop printing text*/}
struct HighlightData
{
	DataType type;
	usz start;
	usz len;
}

struct HighlightedText (Printable)
{
	String data;
	HighlightData[] highlights;
}

fn usz? HighlightedText.to_format(&self, Formatter* fmt) @dynamic
{
	usz? n;

	foreach (i, highlight : self.highlights)
	{
		if (highlight.type == END) break;
		// if (i > 0) io::printfn("curr: \"%s\"; start: %s; len: %s; prev.start: %s; prev.len: %s", self.data[highlight.start:highlight.len], highlight.start, highlight.len, self.highlights[i - 1].start, self.highlights[i - 1].len);
		// never write code at 1:30 am
		n += fmt.printf(i == 0 ? self.data[:highlight.start] : self.data[self.highlights[i - 1].start + self.highlights[i - 1].len:highlight.start - (self.highlights[i - 1].start + self.highlights[i - 1].len)]);
		n += fmt.printf(`<span class="DataType_%s DataType">%s</span>`, highlight.type, self.data[highlight.start:highlight.len]);
	}
	if (self.highlights.len == 0)
	{
		n += fmt.printf(self.data);
	}
	else if (self.highlights[^1].type != END)
	{
		n += fmt.printf(self.data[self.highlights[^1].start + self.highlights[^1].len..]);
	}
	return n;
}


fn String Global.get_name(&self, Allocator alloc) @dynamic => self.name;
fn String Global.get_preview(&self, Allocator alloc) @dynamic => @pool()
{
	DString d;
	d.tinit();
	if (self.const_) d.append("const ");
	if (self.tlocal_) d.append("tlocal ");
	if (self.extern_) d.appendf("extern ");
	if (self.type.has_value) d.appendf("%s ", self.type.get()!!);
	return d.copy_str(alloc);
}

struct Func // (DocGenData)
{
	String name;
	Maybe {String} return_type;
	Maybe {String} method_of;
	Maybe {String} trailing;
	bool macro_;
	List {String} attributes;
	List {Param} params;
	DocComment doc_comment;
	HighlightedText text;
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
	DocComment doc_comment;
	HighlightedText text;
}

fn void ModuleSection.init(&self, Allocator alloc)
{
	self.globals.init(alloc);
	self.functions.init(alloc);
	self.attributes.init(alloc);
}

struct DocComment
{
	List {String} description;
	List {Contract} contracts;
}

enum ContractType {CUSTOM, ENSURE, REQUIRE, RETURN, RETURN_FAULT, PARAM, PURE}
struct Contract
{
	ContractType type;
	String name;
	Maybe {String} mutability;
	Maybe {String} expr;
	List {String} desc;
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
	Module* parent = self;
	while (parent != null && parent.path.ptr != null)
	{
		res.insert_at(0, string::tformat("%s/", parent.path));
		parent = parent.parent;
	}
	res.insert_at(0, string::tformat("%s/", prefix.len > 0 && prefix[^1] == '/' ? prefix[..^2] : prefix));
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

alias ModuleViewFunc = fn String(Module*, Allocator);
enum ModuleView : (String path, String name, ModuleViewFunc func)
{
	OVERVIEW = { "index.html", "Overview", &Module.get_overview },
	GLOBALS = { "globals.html", "Globals", &Module.get_globals },
	TYPES = { "types.html", "Types", &Module.get_types },
	FUNCTIONS = { "functions.html", "Functions", &Module.get_functions },
}

fn String Module.get_path_to_root(&self, Allocator alloc) => @pool()
{
	DString result;
	result.tinit();

	Module* self_cursor = self.parent;
	while (self_cursor != null)
	{
		result.append("../");
		self_cursor = self_cursor.parent;
	}
	return result.copy_str(alloc);
}

fn String Module.get_relative_path_to(&self, Allocator alloc, Module* other, ModuleView view) => @pool()
{
	return self.get_path_to_root(tmem).tconcat(other.get_folder_path(tmem, "")[1..]).tconcat(view.path).copy(alloc);
}

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

fn void Module.gen_header(&self, HtmlBuilder* b, ModuleView view) => @pool()
{
	b.@h(2, `class="header"`)
	{
		$foreach $member : ModuleView.values:
			if ($member == view)
			{
				b.@span(`class="selected"`)
				{
					b.text($member.name);
				};
			}
			else
			{
				b.url($member.name, self.get_relative_path_to(tmem, self, $member));
			}
			b.spc();
		$endforeach
	};
}

// this is too close to Game.run for my liking, should probably change to `fn void gen_module_title(Module* mod, HtmlBuilder* b)`
fn void Module.gen_module_title(&self, HtmlBuilder* b) => @pool()
{
	b.@div(`class="module_path"`)
	{
		b.@h(1)
		{
			if (self.parent != null && self.parent.path.ptr != null) @pool()
			{
				List {Module*} parents;
				parents.tinit();

				Module* parent = self.parent;
			 	while (parent != null && parent.path.ptr != null) @pool()
				{
					parents.push(parent);
					parent = parent.parent;
				};

				foreach_r (parent1 : parents)
				{
					b.url(parent1.path, self.get_relative_path_to(tmem, parent1, OVERVIEW));
					b.text("::");
				}
			};
			b.@span(`style="font-family: 'monospace'"`)
			{
				b.text(self.path);
				if (self.generic_params.len() > 0)
				{
					b.text(" {");
					foreach (i, param : self.generic_params)
					{
						b.text("%s%s", param, i == self.generic_params.len() - 1 ? "" : ", ");
					}
					b.text("}");
				}
			};
		};
	};
}

const String GLOBAL_HTML_STYLES = `style = "font-family:'0xProto Nerd Font'"`;

fn String Module.get_overview(&self, Allocator alloc) => @pool()
{
	return html::@html(alloc, "Module Overview", self.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
		self.gen_header(b, OVERVIEW);
		self.gen_module_title(b);
		if (self.children.len() != 0)
		{
			b.h(2, "Submodules");
			self.@iter_children(; Module* child)
			{
				io::printfn("%s", child.path);
				b.url(child.path, self.get_relative_path_to(tmem, child, OVERVIEW));
				b.spc();
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
			b.h(2, "Globals");
			b.@table({"Name", "Description"})
			{
				foreach (glob_ : globals.iter()) @pool()
				{
					b.@tr()
					{
						Global* glob = glob_.value[0].first;
						b.@td()
						{
							b.url(glob.name, string::tformat("%s#%s", self.get_relative_path_to(tmem, self, GLOBALS), glob_.key));
						};
						b.@td()
						{
							foreach (desc : glob.doc_comment.description) b.text(desc);
						};
					};
				};
			};
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
			b.h(2, "Functions");
			b.@table({"Name", "Description"})
			{
				foreach (func_ : funcs.iter()) @pool()
				{
					b.@tr()
					{
						Func* func = func_.value[0].first;
						b.@td()
						{
							b.url(func.attributes.contains("@builtin") ? func.name : self.path.tconcat("::").tconcat(func.name), string::tformat("%s#%s", self.get_relative_path_to(tmem, self, FUNCTIONS), func_.key));
						};
						b.@td()
						{
							foreach (desc : func.doc_comment.description) b.text(desc);
						};
					};
				};
			};
		}

		// now print all the private things
		if (private_funcs.len() > 0 || private_globals.len() > 0)
		{
			b.h(2, "Private");

			if (private_globals.len() > 0)
			{
				b.h(3, "Globals");
				b.@table({"Name", "Description"})
				{
					foreach (glob_ : private_globals.iter())
					{
						b.@tr()
						{
							Global* glob = glob_.value[0].first;
							b.@td()
							{
								b.url(glob.name, "#todo");
							};
							b.td("TODO");
						};
					}
				};
			}

			if (private_funcs.len() > 0)
			{
				b.h(3, "Functions");
				b.@table({"Name", "Description"})
				{
					foreach (func_ : private_funcs.iter()) @pool()
					{
						b.@tr()
						{
							Func* func = func_.value[0].first;
							b.@td()
							{
								b.url(func.attributes.contains("@builtin") ? func.name : self.path.tconcat("::").tconcat(func.name), "#todo");
							};
							b.td("TODO");
						};
					};
				};
			}
		}
	};
}

fn String Module.get_globals(&self, Allocator alloc)
{
	return html::@html(alloc, "Module Overview", self.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
		self.gen_header(b, GLOBALS);
		self.gen_module_title(b);

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
			b.h(1, "Public");
			foreach (glob_ : globals.iter()) @pool()
			{
				b.h(2, glob_.key, string::tformat(`id="%s"`, glob_.key));
				foreach (glob : glob_.value)
				{
					b.@pre()
					{
						b.@code()
						{
								b.text("%s", glob.first.text);
							// b.text("%s", glob.first.data);
						};
					};
				}
			};
		}
	};
}
fn String Module.get_types(&self, Allocator alloc)
{
	return html::@html(alloc, "Module Overview", self.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
		self.gen_header(b, TYPES);
		self.gen_module_title(b);
	};
}
fn String Module.get_functions(&self, Allocator alloc)
{
	return html::@html(alloc, "Module Overview", self.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
		self.gen_header(b, FUNCTIONS);
		self.gen_module_title(b);

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
/*		if (funcs.len() > 0)
		{
			b.h(1, "Functions");
			b.@table({"Name", "Description"})
			{
				foreach (func_ : funcs.iter()) @pool()
				{
					b.@tr()
					{
						Func* func = func_.value[0].first;
						b.@td()
						{
							b.url(func.attributes.contains("@builtin") ? func.name : self.path.tconcat("::").tconcat(func.name), string::tformat("%s#%s", self.get_relative_path_to(tmem, self, GLOBALS), func_.key));
						};
						b.td("TODO");
					};
				};
			};
		}*/
		if (funcs.len() > 0)
		{
			b.h(1, "Public");
			foreach (func_ : funcs.iter()) @pool()
			{
				b.h(2, func_.key, string::tformat(`id="%s"`, func_.key));
				foreach (func : func_.value)
				{
					b.@pre()
					{
						b.@code()
						{
							b.text("%s", func.first.text);
						};
					};
				}
			};
		}

	};
}

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


const GLOBAL_CSS =
`
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

pre {
	background-color: #efefef;
}
`;

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

module std::collections::list {Type};

fn Type? List.get_try(&self, usz idx)
{
	if (idx < self.size) return self.entries[idx];
	return NOT_FOUND?;
}
