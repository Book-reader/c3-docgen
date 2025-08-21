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
			foreach (view : ModuleView.values) if (view.in_title)
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

interface DocGenData
{
	fn String get_name();
	fn String get_overview_name(Module* mod, Allocator alloc) @optional;
	fn HighlightedText get_highlighted();
	fn bool is_private();
	fn bool is_hidden_from(ModuleView view);
	// fn bool has_attribute(String attr);
	fn String get_short_description(Allocator alloc);
	fn DocComment get_description();
	fn ModuleView get_own_view();
	// fn String[] get_attributes() @optional;

	// fn List {Contract} get_doc_contracts();
	// fn String get_doc_comment(Allocator alloc);
}

// TODO: store most data (name, type, val, attributes) as a slice into the HighlightedText
struct Global (DocGenData)
{
	HighlightedTextSlice name;
	// I store the whole type including generic params etc in here, and then can parse it again later
	Maybe {String} type;
	List {String} attributes;
	DocComment doc_comment;
	HighlightedText text;
}

fn String Global.get_name(&self) @dynamic => self.name.get_string();
fn HighlightedText Global.get_highlighted(&self) @dynamic => self.text;
fn bool Global.is_hidden_from(&self, ModuleView view) @dynamic => (view != OVERVIEW && view != GLOBALS) || self.attributes.contains("@local");
fn bool Global.is_private(&self) @dynamic => self.attributes.contains("@private");
fn ModuleView Global.get_own_view(&self) @dynamic => GLOBALS;
// I could probably make this into a method of DocGenData instead if I added a `fn DocComment get_doc_comment()` to it
fn String Global.get_short_description(&self, Allocator alloc) @dynamic
{
	if (self.doc_comment.description.len() != 0)
	{
		String str = self.doc_comment.description[0];
		if (self.doc_comment.description.len() > 1) str = str.concat(alloc, "...");
		return str;
	}
	return "";
}
// Same here
fn DocComment Global.get_description(&self) @dynamic => self.doc_comment;

struct Func (DocGenData)
{
	HighlightedTextSlice name;
	Maybe {String} return_type;
	Maybe {String} method_of;
	Maybe {String} trailing;
	bool macro_;
	List {String} attributes;
	List {Param} params;
	DocComment doc_comment;
	HighlightedText text;
}
fn String Func.get_name(&self) @dynamic => self.name.get_string();
fn String Func.get_overview_name(&self, Module* mod, Allocator alloc) @dynamic => mod.path.tconcat("::").tconcat(self.name.get_string()).copy(alloc);
fn HighlightedText Func.get_highlighted(&self) @dynamic => self.text;
fn bool Func.is_private(&self) @dynamic => self.attributes.contains("@private");
fn bool Func.is_hidden_from(&self, ModuleView view) @dynamic => self.attributes.contains("@local") || (view != OVERVIEW && view != FUNCTIONS && view != TYPE) || (view != TYPE && self.method_of.has_value);

fn String Func.get_short_description(&self, Allocator alloc) @dynamic
{
	if (self.doc_comment.description.len() != 0)
	{
		String str = self.doc_comment.description[0];
		if (self.doc_comment.description.len() > 1) str = str.concat(alloc, "...");
		return str;
	}
	return "";
}
fn DocComment Func.get_description(&self) @dynamic => self.doc_comment;
fn ModuleView Func.get_own_view(&self) @dynamic => self.method_of.has_value ? TYPE : FUNCTIONS;

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

struct Struct (DocGenData)
{
	HighlightedTextSlice name;
	List {/*StructMember*/HighlightedTextSlice} members;
	List {HighlightedTextSlice} interfaces;
	List {String} attributes;
	HighlightedText text;
	DocComment doc_comment;
}

fn String Struct.get_name(&self) @dynamic => self.name.get_string();
fn HighlightedText Struct.get_highlighted(&self) @dynamic => self.text;
fn bool Struct.is_private(&self) @dynamic => self.attributes.contains("@private");
fn bool Struct.is_hidden_from(&self, ModuleView view) @dynamic => self.attributes.contains("@local") || (view != TYPES && view != OVERVIEW);
fn String Struct.get_short_description(&self, Allocator alloc) @dynamic
{
	if (self.doc_comment.description.len() != 0)
	{
		String str = self.doc_comment.description[0];
		if (self.doc_comment.description.len() > 1) str = str.concat(alloc, "...");
		return str;
	}
	return "";
}
fn DocComment Struct.get_description(&self) @dynamic => self.doc_comment;
fn ModuleView Struct.get_own_view(&self) @dynamic => TYPES;

struct ModuleSection
{
	inline ModuleSectionData data;
	DocComment doc_comment;
	HighlightedText text;
	List {String} attributes;
}

struct ModuleSectionData
{
	List {Global} globals;
	List {Func} functions;
	List {Struct} structs;
}

fn void ModuleSection.init(&self, Allocator alloc)
{
	self.globals.init(alloc);
	self.functions.init(alloc);
	self.structs.init(alloc);
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
	foreach (desc : self.description) n += fmt.printf(desc);
	return n;
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
enum ModuleView : (String path, String name, ModuleViewFunc func, bool in_title)
{
	OVERVIEW = { "index.html", "Overview", &Module.get_overview, true },
	GLOBALS = { "globals.html", "Globals", &Module.get_globals, true },
	TYPES = { "types.html", "Types", &Module.get_types, true },
	FUNCTIONS = { "functions.html", "Functions", &Module.get_functions, true },
	TYPE = { "type.%s.html", "Type", fn (a, b) {return {};}, false },
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


		Abomination a = filter_and_collect_data(tmem, self, OVERVIEW);
		if (a[0].len() > 0)
		{
			foreach (section : a[0].iter())
			{
				// First public values
				b.h(2, section.key);
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
				b.h(3, section.key);
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

alias Abomination = HashMap {String, HashMap {String, List {Pair {DocGenData, ModuleSection*}}}}[2];

fn Abomination filter_and_collect_data(Allocator alloc, Module* mod, ModuleView view)
{
	Abomination a;
	a[0].init(alloc);
	a[1].init(alloc);
	foreach (&sec : mod.sections)
	{
		$foreach $member : ModuleSectionData.membersof:
		{
			$typefrom($member.typeid) m = $member.get(sec.data);
			foreach (&member : m)
			{
				String section_name = member.get_own_view().name;
				String member_name = member.get_name();
				if (!member.is_hidden_from(view))
				{
					if (!member.is_private())
					{
						if (!a[0].has_key(section_name))
						{
							a[0][section_name] = {};
							a[0][section_name]!!.init(alloc);
						}
						if (!a[0][section_name]!!.has_key(member_name))
						{
							a[0].get_ref(section_name)!!.set(member_name, {});
							a[0].get_ref(section_name)!!.get_ref(member_name)!!.init(alloc);
							// a[section_name]!![0][member_name] = {};
							// a[section_name]!![0][member_name]!!.init(alloc);
						}
						// a[section_name]!![0][member_name]!!.push({member, sec});
						a[0].get_ref(section_name)!!.get_ref(member_name)!!.push({member, sec});
					}
					else
					{
						if (!a[1].has_key(section_name))
						{
							a[1][section_name] = {};
							a[1][section_name]!!.init(alloc);
						}
						if (!a[1][section_name]!!.has_key(member_name))
						{
							// a[section_name]!![1][member_name] = {};
							// a[section_name]!![1][member_name]!!.init(alloc);
							a[1].get_ref(section_name)!!.set(member_name, {});
							a[1].get_ref(section_name)!!.get_ref(member_name)!!.init(alloc);
						}
						// a[section_name]!![1][member_name]!!.push({member, sec});
						a[1].get_ref(section_name)!!.get_ref(member_name)!!.push({member, sec});
					}
				}
			}
		}
		$endforeach
	}
	return a;
}

fn String Module.get_globals(&self, Allocator alloc) => @pool()
{
	return html::@html(alloc, "Module Globals", self.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
		self.gen_header(b, GLOBALS);
		self.gen_module_title(b);

		Abomination a = filter_and_collect_data(tmem, self, GLOBALS);
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
fn String Module.get_types(&self, Allocator alloc)
{
	return html::@html(alloc, "Module Types", self.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
		self.gen_header(b, TYPES);
		self.gen_module_title(b);

		Abomination a = filter_and_collect_data(tmem, self, TYPES);
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
fn String Module.get_functions(&self, Allocator alloc)
{
	return html::@html(alloc, "Module Functions", self.get_path_to_root(tmem).tconcat("style.css"), GLOBAL_HTML_STYLES; HtmlBuilder* b)
	{
		self.gen_header(b, FUNCTIONS);
		self.gen_module_title(b);

		Abomination a = filter_and_collect_data(tmem, self, FUNCTIONS);
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
