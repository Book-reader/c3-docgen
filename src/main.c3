module docgen;
import std::io;
import std::collections::map;
import std::collections::enummap;
import std::collections::list;
import std::collections::pair;
import std::collections::maybe;
import std::collections::interfacelist;
import std::sort;
import std::math;

import ts;
import tree_sitter_c3;
alias tsc3 = module tree_sitter_c3;

import html;

const INDEX_FILE = "index.html";
const OVERVIEW_FILE = "overview.html";
const SIDEBAR_FILE = "sidebar.html";

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
			ModuleView module_overview = collect_module_data(tmem, mod);
			{
				File index = file::open(mod_folder.tconcat(INDEX_FILE), "wb")!!;
				defer (void)index.close();
				io::fprintf(&index, "%s", gen_view(tmem, mod, module_overview))!!;


				File overview = file::open(mod_folder.tconcat(OVERVIEW_FILE), "wb")!!;
				defer (void)overview.close();
				io::fprintf(&overview, "%s", gen_module_overview(tmem, mod, module_overview))!!;

				File sidebar = file::open(mod_folder.tconcat(SIDEBAR_FILE), "wb")!!;
				defer (void)sidebar.close();
				io::fprintf(&sidebar, "%s", gen_module_sidebar(tmem, mod, module_overview))!!;
			}

			$foreach $member : ModuleView.membersof:
			{
				ModuleData view = $member.get(module_overview);
				foreach (i, &section : view.values)
				{
					foreach (val : section.iter()) @pool()
					{
						DocGenData dat = val.value[0].data;
						File f = file::open(mod_folder.tconcat(dat.get_file_name(tmem)), "wb")!!;
						defer (void)f.close();
						io::fprintf(&f, "%s", gen_view(tmem, mod, module_overview, dat))!!;

						File f1 = file::open(mod_folder.tconcat(dat.get_data_file_name(tmem)), "wb")!!;
						defer (void)f1.close();
						io::fprintf(&f1, "%s", dat.get_view(tmem, mod, module_overview))!!;
						// b.url(&dat.get_overview_name ? dat.get_overview_name(mod, tmem) : dat.get_name(), dat.get_file_path(tmem, mod)/*string::tformat("%s#%s", mod.get_relative_path_to(tmem, mod, dat.get_own_view()), val.key)*/);
						// b.td(dat.get_short_description(tmem));
					};
				}
			}
			$endforeach
			/*foreach (view : ModuleView.values) if (view.in_title)
			{
				
				// String mod_file = mod.get_file_path(tmem, root_folder, TYPES);
				// abort();
				File out = file::open(mod_folder.tconcat(view.path), "wb")!!;
				defer (void)out.close();
				io::fprintf(&out, "%s", view.func(mod, alloc))!!;
			}*/
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

enum DataType : char {DEFAULT, KEYWORD, BUILTIN_TYPE, TYPE, CONST, IDENT, NUMBER, STRING, ATTR, COMMENT, PATH, FUNCTION, END /*nice hack to tell when to stop printing text*/}
struct HighlightData
{
	DataType type;
	usz start;
	usz len;
}

fn String HighlightData.get_text(&self, String data) => data[self.start:self.len];
fn usz HighlightData.end_inclusive(&self) => self.start + self.len;
fn usz HighlightData.end_exclusive(&self) => self.end_inclusive() - 1;

struct HighlightedText (Printable)
{
	String data;
	HighlightData[] highlights;
}

fn usz? HighlightedText.to_format(&self, Formatter* fmt) @dynamic
{
	return self.to_format_internal(fmt, true);
}

macro usz? HighlightedText.to_format_internal(&self, Formatter* fmt, bool $print_before_and_after)
{
	usz? n;

	foreach (i, highlight : self.highlights)
	{
		if (highlight.type == END) break;
		// if (i > 0) io::printfn("curr: \"%s\"; start: %s; len: %s; prev.start: %s; prev.len: %s", self.data[highlight.start:highlight.len], highlight.start, highlight.len, self.highlights[i - 1].start, self.highlights[i - 1].len);
		// never write code at 1:30 am
		if ($print_before_and_after && i == 0)
		{
			n += fmt.printf(self.data[:highlight.start]);
		}
		else if (i != 0)
		{
			n += fmt.printf(self.data[self.highlights[i - 1].start + self.highlights[i - 1].len:highlight.start - self.highlights[i - 1].end_inclusive()]);
		}
		n += fmt.printf(`<span class="DataType_%s DataType">%s</span>`, highlight.type, self.data[highlight.start:highlight.len]);
	}
	if (self.highlights.len == 0)
	{
		n += fmt.printf(self.data);
	}
	else if ($print_before_and_after && self.highlights[^1].type != END)
	{
		n += fmt.printf(self.data[self.highlights[^1].end_inclusive()..]);
	}
	return n;
}
fn String HighlightedText.get_string(&self)
{
	usz len = self.data.len;
	foreach (i, h : self.highlights)
	{
		if (h.type == END) break;
		len = h.end_exclusive();
	}
	return self.data[:len];
}

fn HighlightedTextSlice HighlightedText.slice(&self, usz start_highlight_idx, usz end_highlight_idx)
{
	return {self.data, self.highlights[start_highlight_idx..end_highlight_idx]};
}

fn HighlightedTextSlice? HighlightedText.slice_matching(&self, String to_find)
{
	usz? start_idx = NOT_FOUND?;
	usz? end_idx = NOT_FOUND?;
	foreach (i, highlight : self.highlights)
	{
		if (self.data[highlight.start..].len < to_find.len) break;
		if (to_find.len >= highlight.len && to_find[:highlight.len] == highlight.get_text(self.data))foreach (j, highlight1 : self.highlights[i..])
		{
			if (highlight1.type == END) break;
			if (self.data[highlight.start..highlight1.end_exclusive()].len < to_find.len) continue;
			if (self.data[highlight.start..highlight1.end_exclusive()] == to_find)
			{
				return self.slice(i, i + j);
			}
		}
	}
	return NOT_FOUND?;
}

typedef HighlightedTextSlice = inline HighlightedText;
fn usz? HighlightedTextSlice.to_format(&self, Formatter* fmt) @dynamic
{
	return self.to_format_internal(fmt, false);
}
fn String HighlightedTextSlice.get_string(&self)
{
	return self.data[self.highlights[0].start..self.highlights[^1].end_exclusive()];
}

enum DocGenDataType : char (String section_name, String file_format)
{
	TYPE = { "Types", "type.%s.html" },
	FUNCTION = { "Functions", "fn.%s.html" },
	GLOBAL = { "Globals", "global.%s.html" },
}
interface DocGenData
{
	fn String get_name();
	fn String get_overview_name(Module* mod, Allocator alloc) @optional;
	fn HighlightedText get_highlighted();
	fn bool is_private();
	fn bool is_hidden();
	// fn bool is_hidden_from(ModuleView view);
	// fn bool has_attribute(String attr);
	fn String get_short_description(Allocator alloc);
	fn DocComment get_description();

	fn bool in_overview();
	fn DocGenDataType get_data_type();
	// fn String get_file_path(Allocator alloc, Module* mod);
	// fn ModuleView get_own_view();
	// fn String[] get_attributes() @optional;

	// fn List {Contract} get_doc_contracts();
	// fn String get_doc_comment(Allocator alloc);
}

fn String DocGenData.get_file_path(&self, Allocator alloc, Module* mod) => @pool()
{
	return mod.get_path_to_root(tmem).tconcat(mod.get_folder_path(tmem, "")[1..]).tconcat(self.get_file_name(tmem)).copy(alloc);
}

fn String DocGenData.get_data_file_path(&self, Allocator alloc, Module* mod) => @pool()
{
	return mod.get_path_to_root(tmem).tconcat(mod.get_folder_path(tmem, "")[1..]).tconcat(self.get_data_file_name(tmem)).copy(alloc);
}

fn String DocGenData.get_file_name(&self, Allocator alloc) => @pool()
{
	return string::format(alloc, self.get_data_type().file_format, self.get_name());
}

fn String DocGenData.get_data_file_name(&self, Allocator alloc) => @pool()
{
	return "_".concat(alloc, self.get_file_name(tmem));
}

fn String path_to_css(Allocator alloc, Module* mod) => @pool()
{
	return mod.get_path_to_root(tmem).concat(alloc, "style.css");
}

fn String path_to_js(Allocator alloc, Module* mod) => @pool()
{
	return mod.get_path_to_root(tmem).concat(alloc, "main.js");
}

fn String DocGenData.get_view(&self, Allocator alloc, Module* mod, ModuleView module_overview) => @pool()
{
	return html::@html(tmem, string::tformat("%s overview", mod.get_path_string(tmem)), path_to_css(tmem, mod), path_to_js(tmem, mod); HtmlBuilder* b)
	{
		b.@div(`class="main"`)
		{
			gen_module_title(mod, b);
			b.h(1, self.get_name());
		};
	}.copy(alloc);
}

struct DocGenDataDefault (DocGenData)
{
	HighlightedTextSlice name;
	DocComment doc_comment;
	HighlightedText text;
	List {String} attributes;
}

fn String DocGenDataDefault.get_name(&self) @dynamic => self.name.get_string();
fn HighlightedText DocGenDataDefault.get_highlighted(&self) @dynamic => self.text;
// fn bool DocGenDataDefault.is_hidden_from(&self, ModuleView view) @dynamic => unreachable("Override is_hidden_from per-impl");
fn bool DocGenDataDefault.is_private(&self) @dynamic => self.attributes.contains("@private");
fn bool DocGenDataDefault.is_hidden(&self) @dynamic => self.attributes.contains("@local");
// fn ModuleView DocGenDataDefault.get_own_view(&self) @dynamic => unreachable("Override get_own_view per-impl");
fn String DocGenDataDefault.get_short_description(&self, Allocator alloc) @dynamic => self.doc_comment.get_short_description(alloc);
fn DocComment DocGenDataDefault.get_description(&self) @dynamic => self.doc_comment;
fn bool DocGenDataDefault.in_overview(&self) @dynamic => true;
fn DocGenDataType DocGenDataDefault.get_data_type(&self) @dynamic => unreachable("Override get_data_type per-impl");

// TODO: store most data (name, type, val, attributes) as a slice into the HighlightedText
struct Global // (DocGenData)
{
	inline DocGenDataDefault data;
	// I store the whole type including generic params etc in here, and then can parse it again later
	Maybe {String} type;
}

fn DocGenDataType Global.get_data_type(&self) @dynamic => GLOBAL;

struct Func // (DocGenData)
{
	inline DocGenDataDefault data;
	Maybe {String} return_type;
	Maybe {String} method_of;
	Maybe {String} trailing;
	bool macro_;
	List {Param} params;
}
fn String Func.get_overview_name(&self, Module* mod, Allocator alloc) @dynamic => mod.path.tconcat("::").tconcat(self.name.get_string()).copy(alloc);
// fn bool Func.is_hidden_from(&self, ModuleView view) @dynamic => self.attributes.contains("@local") || (view != OVERVIEW && view != FUNCTIONS && view != TYPE) || (view != TYPE && self.method_of.has_value);
// fn ModuleView Func.get_own_view(&self) @dynamic => self.method_of.has_value ? TYPE : FUNCTIONS;
fn bool Func.in_overview(&self) @dynamic => self.method_of.has_value ? false : true;
fn DocGenDataType Func.get_data_type(&self) @dynamic => FUNCTION; // TODO: if method_of.has_value maybe return METHOD?

enum ParamType {REGULAR, CT, EXPR, VAARG/*, MACRO_VAARG probably not needed since I distinguish macros in Func*/}
struct Param
{
	ParamType kind;
	bool typed;
	String name;
	String type;
}

struct StructMember
{
	HighlightedTextSlice name;
	HighlightedTextSlice type;
}

struct Struct // (DocGenData)
{
	inline DocGenDataDefault data;
	List {/*StructMember*/HighlightedTextSlice} members;
	List {HighlightedTextSlice} interfaces;
}
fn DocGenDataType Struct.get_data_type(&self) @dynamic => TYPE;

// fn bool Struct.is_hidden_from(&self, ModuleView view) @dynamic => self.attributes.contains("@local") || (view != TYPES && view != OVERVIEW);
// fn ModuleView Struct.get_own_view(&self) @dynamic => TYPES;

struct Enum // (DocGenData)
{
	inline DocGenDataDefault data;
	Maybe {HighlightedTextSlice} spec;
	List {HighlightedTextSlice} values;
	List {HighlightedTextSlice} interfaces;
}
fn DocGenDataType Enum.get_data_type(&self) @dynamic => TYPE;

// fn bool Enum.is_hidden_from(&self, ModuleView view) @dynamic => self.attributes.contains("@local") || (view != TYPES && view != OVERVIEW);
// fn ModuleView Enum.get_own_view(&self) @dynamic => TYPES;

struct BitStruct // (DocGenData)
{
	inline DocGenDataDefault data;
	HighlightedTextSlice type;
	List {HighlightedTextSlice} members;
	List {HighlightedTextSlice} interfaces;
}
fn DocGenDataType BitStruct.get_data_type(&self) @dynamic => TYPE;

// fn bool BitStruct.is_hidden_from(&self, ModuleView view) @dynamic => self.attributes.contains("@local") || (view != TYPES && view != OVERVIEW);
// fn ModuleView BitStruct.get_own_view(&self) @dynamic => TYPES;

struct ModuleSection
{
	InterfaceList {DocGenData} data;
	DocComment doc_comment;
	HighlightedText text;
	List {String} attributes;
}

fn void ModuleSection.init(&self, Allocator alloc)
{
	self.data.init(alloc);
	self.attributes.init(alloc);
}

struct DocComment
{
	List {String} description;
	List {Contract} contracts;
}
fn usz? DocComment.to_format(&self, Formatter* fmt) @dynamic
{
	usz? n;
	foreach (desc : self.description)
	{
		n += fmt.printf(desc);
		n += fmt.printf("<br/>");
	}
	return n;
}
fn String DocComment.get_short_description(&self, Allocator alloc)
{
	if (self.description.len() != 0)
	{
		String str = self.description[0];
		if (self.description.len() > 1) str = str.tconcat("...");
		return str.copy(alloc);
	}
	return "";
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

/*alias ModuleViewFunc = fn String(Module*, Allocator);
enum ModuleView : char (String format, String name, ModuleViewFunc func, bool in_title)
{
	OVERVIEW = { "index.html", "Overview", &Module.get_overview, true },
	GLOBALS = { "globals.html", "Globals", &Module.get_globals, true },
	TYPES = { "types.html", "Types", &Module.get_types, true },
	FUNCTIONS = { "functions.html", "Functions", &Module.get_functions, true },
	TYPE = { "type.%s.html", "Type", null, false },
}
fn uint ModuleView.hash(self) => self.ordinal.hash();*/


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

fn String get_relative_path_to(Allocator alloc, Module* src, Module* dst, String dst_file) => @pool()
{
	return src.get_path_to_root(tmem).tconcat(dst.get_folder_path(tmem, "")[1..]).tconcat(dst_file).copy(alloc);
}
// TODO: get_relative_path_to(DocGenData other)
/*fn String Module.get_relative_path_to(&self, Allocator alloc, Module* other, ModuleView view) => @pool()
{
	return self.get_path_to_root(tmem).tconcat(other.get_folder_path(tmem, "")[1..]).tconcat(view.path).copy(alloc);
}*/

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

fn String gen_module_overview(Allocator alloc, Module* mod, ModuleView module_overview) => @pool()
{
	return html::@html(tmem, string::tformat("%s overview", mod.get_path_string(tmem)), path_to_css(tmem, mod), path_to_js(tmem, mod); HtmlBuilder* b)
	{
		// gen_sidebar(mod, module_overview, b);
		// include_sidebar(b);

		b.@div(`class="main"`)
		{
			gen_module_title(mod, b);
			if (mod.children.len() != 0)
			{
				b.h(2, "Submodules");
				mod.@iter_children(; Module* child)
				{
					io::printfn("%s", child.path);
					b.url(child.path, get_relative_path_to(tmem, mod, child, INDEX_FILE), `target="_parent"`);
					b.spc();
				};
			}


			$foreach $member : ModuleView.membersof:
			{
				String view_name = $member.nameof.snake_to_pascal_copy(tmem); // Public or Private
				ModuleData view = $member.get(module_overview);
				foreach (&section : view.values) if (section.len() > 0)
				{
					b.h(2, view_name);
					break;
				}

				foreach (i, &section : view.values) if (section.len() > 0)// @pool()
				{
					// TODO: copy what I do for the sidebar where all public are h2 with private header is h2 and private categories are h3
					b.h(2, DocGenDataType.from_ordinal(i).section_name);
					b.@table({"Name", "Description"})
					{
						foreach (val : section.iter()) @pool()
						{
							b.@tr()
							{
								DocGenData dat = val.value[0].data;
								b.@td()
								{
									// TODO: extract out the onClick thing into a function or something
									b.url(&dat.get_overview_name ? dat.get_overview_name(mod, tmem) : dat.get_name(), dat.get_file_path(tmem, mod), string::tformat(`onclick="linkAction(event, '%s')"`, dat.get_data_file_path(tmem, mod)));
								};
								b.td(dat.get_short_description(tmem));
							};
						};
					};
				}
			}
			$endforeach
		};
	}.copy(alloc);
}

macro String gen_view(Allocator alloc, Module* mod, ModuleView module_overview, doc_gen_data = EMPTY_MACRO_SLOT) => @pool()
{
	return html::@html(tmem, string::tformat("%s overview", mod.get_path_string(tmem)), path_to_css(tmem, mod), path_to_js(tmem, mod); HtmlBuilder* b)
	{
		b.iframe(@sprintf(`class="sidebar-frame" src="./%s" scrolling="no"`, SIDEBAR_FILE));
		$if @is_valid_macro_slot(doc_gen_data):
			b.iframe(string::tformat(`class="main-frame" id="main-frame" name="main_frame" src="./%s"`, doc_gen_data.get_data_file_name(tmem)));
		$else
			b.iframe(string::tformat(`class="main-frame" id="main-frame" name="main_frame" src="./%s"`, get_relative_path_to(tmem, mod, mod, OVERVIEW_FILE)));
		$endif
	}.copy(alloc);
}

fn String gen_module_sidebar(Allocator alloc, Module* mod, ModuleView module_overview) => @pool()
{
	return html::@html(tmem, string::tformat("%s overview", mod.get_path_string(tmem)), path_to_css(tmem, mod), path_to_js(tmem, mod); HtmlBuilder* b)
	{
		b.@div(`class="sidebar"`)
		{
			b.@h(1)
			{
				b.text("Module");
				b.br();
				b.url(string::tformat("%s", mod.path), get_relative_path_to(tmem, mod, mod, INDEX_FILE), string::tformat(`target="main_frame" onclick="linkAction(event, '%s')"`, get_relative_path_to(tmem, mod, mod, OVERVIEW_FILE)));
			};
			$foreach $member : ModuleView.membersof:
			{
				String view_name = $member.nameof.snake_to_pascal_copy(tmem); // Public or Private
				ModuleData view = $member.get(module_overview);
				usz h = 1;
				if (view_name != "Public")
				{
					foreach (&section : view.values) if (section.len() > 0)
					{
						b.h(1, view_name);
						h = 2;
						break;
					}
				}

				foreach (i, &section : view.values) if (section.len() > 0)// @pool()
				{
					b.h(h, DocGenDataType.from_ordinal(i).section_name);
					b.@table({})
					{
						foreach (val : section.iter()) @pool()
						{
							b.@tr()
							{
								DocGenData dat = val.value[0].data;
								b.@td()
								{
									b.url(dat.get_name(), dat.get_file_path(tmem, mod), string::tformat(`target="main_frame" onclick="linkAction(event, '%s')"`, dat.get_data_file_path(tmem, mod)));
								};
							};
						};
					};
				}
			}
			$endforeach
			// b.text("%s", get_module_overview(tmem, mod));
		};
	}.copy(alloc);
}

fn void gen_module_title(Module* mod, HtmlBuilder* b) => @pool()
{
	b.@div(`class="module_path"`)
	{
		b.@h(1)
		{
			if (mod.parent != null && mod.parent.path.ptr != null) @pool()
			{
				List {Module*} parents;
				parents.tinit();

				Module* parent = mod.parent;
				while (parent != null && parent.path.ptr != null) @pool()
				{
					parents.push(parent);
					parent = parent.parent;
				};

				foreach_r (parent1 : parents)
				{
					b.url(parent1.path, get_relative_path_to(tmem, mod, parent1, INDEX_FILE), `target="_parent"`);
					b.text("::");
				}
			};
			b.@span(`style="font-family: 'monospace'"`)
			{
				b.text(mod.path);
				if (mod.generic_params.len() > 0)
				{
					b.text(" {");
					foreach (i, param : mod.generic_params)
					{
						b.text("%s%s", param, i == mod.generic_params.len() - 1 ? "" : ", ");
					}
					b.text("}");
				}
			};
		};
	};
}

/*fn void Module.gen_header(&self, HtmlBuilder* b, ModuleView view) => @pool()
{
	b.@h(2, `class="header"`)
	{
		$foreach $member : ModuleView.values:
			$if $member.in_title:
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
			$endif
		$endforeach
	};
}*/

// this is too close to Game.run for my liking, should probably change to `fn void gen_module_title(Module* mod, HtmlBuilder* b)`
/*fn void Module.gen_module_title(&self, HtmlBuilder* b) => @pool()
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
}*/

// const String GLOBAL_HTML_STYLES = `style = "font-family:'0xProto Nerd Font'"`;

/*fn String Module.get_overview(&self, Allocator alloc) => @pool()
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


		Abomination a = filter_and_collect_data(tmem, self, OVERVIEW);
		if (a[0].len() > 0)
		{
			foreach (section : a[0].iter())
			{
				// First public values
				b.h(2, section.key.name);
				b.@table({"Name", "Description"})
				{
					foreach (val : section.value.iter()) @pool()
					{
						b.@tr()
						{
							DocGenData dat = val.value[0].first;
							b.@td()
							{
								b.url(&dat.get_overview_name ? dat.get_overview_name(self, tmem) : dat.get_name(), string::tformat("%s#%s", self.get_relative_path_to(tmem, self, dat.get_own_view()), val.key));
							};
							b.td(dat.get_short_description(tmem));
						};
					};
				};
			}
		}
		if (a[1].len() > 0)
		{
			b.h(2, "Private");
			foreach (section : a[1].iter())
			{
				// Then private values
				b.h(3, section.key.name);
				b.@table({"Name", "Description"})
				{
					foreach (val : section.value.iter()) @pool()
					{
						b.@tr()
						{
							DocGenData dat = val.value[0].first;
							b.@td()
							{
								b.url(&dat.get_overview_name ? dat.get_overview_name(self, tmem) : dat.get_name(), string::tformat("%s#%s", self.get_relative_path_to(tmem, self, dat.get_own_view()), val.key));
							};
							b.td(dat.get_short_description(tmem));
						};
					};
				};
			}
		}
	};
}
*/

alias ModuleData = EnumMap {DocGenDataType, ModuleMembers};
alias ModuleMembers = HashMap {String, List {ModuleMemberView}};
struct ModuleMemberView
{
	DocGenData data;
	ModuleSection* section;
}
struct ModuleView
{
	ModuleData public;
	ModuleData private;
}
fn ModuleView collect_module_data(Allocator alloc, Module* mod, bool in_overview = false)
{
	ModuleView view;
	foreach (&sec : mod.sections)
	{
		foreach (member : sec.data) if (!member.is_hidden()) if (!in_overview || member.in_overview())
		{
			DocGenDataType data_type = member.get_data_type();
			String member_name = member.get_name();
			ModuleData* dat = member.is_private() ? &view.private : &view.public;
			if (!(*dat)[data_type].is_initialized()) (*dat).get_ref(data_type).init(alloc);
			if (!(*dat)[data_type].has_key(member_name))
			{
				dat.get_ref(data_type).set(member_name, *List {ModuleMemberView}.init(&&{}, alloc));
			}
			dat.get_ref(data_type).get_ref(member_name)!!.push({member, sec});
		}
	}
	return view;
}
/*
fn String Module.get_globals(&self, Allocator alloc) => gen_module_view(self, alloc, GLOBALS);
fn String Module.get_types(&self, Allocator alloc) => gen_module_view(self, alloc, TYPES);
fn String Module.get_functions(&self, Allocator alloc) => gen_module_view(self, alloc, FUNCTIONS);
fn String gen_module_view(Module* self, Allocator alloc, ModuleView view) => @pool()
{
	return html::@html(alloc, string::tformat("Module %s", view.name), self.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
		self.gen_header(b, view);
		self.gen_module_title(b);

		Abomination a = filter_and_collect_data(tmem, self, view);
		String[2] visibility = {"Public", "Private"};
		foreach (i, c : a)
		{
			if (c.len() == 0) continue;
			b.h(1, visibility[i]);
			foreach (section : c.iter()) foreach (name : section.value.iter())
			{
				b.h(2, name.key, string::tformat(`id="%s"`, name.key));
				foreach (val : name.value) @pool()
				{
					b.text("%s", val.first.get_description());
					b.@precode()
					{
						b.text("%s", val.first.get_highlighted());
					};
				};
			}
		}
	};
}

fn String gen_view_for(Module* mod, Allocator alloc, DocGenData data)
{
	return html::@html(alloc, string::tformat("%s", data.get_name()), mod.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
	
	};
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

const GLOBAL_JS =
`
function linkAction(event, newHref)
{
	event.preventDefault();
	let main_frame = window.parent.document.getElementById('main-frame');
	main_frame.src = newHref;
	window.parent.history.pushState(null, '', event.target.href);
}
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
