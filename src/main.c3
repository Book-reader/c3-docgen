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
import closures;

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
	closures::init()!!;
	defer closures::deinit();
	Allocator alloc = tmem;

	TSParser* parser = parser::new_with_language(tsc3::language())!!;
	defer parser::delete(parser);

	Module* modules = module_create(alloc, null, {});

	if (args.len < 2)
	{
		log::error("Usage: %s <files/folders to read C3 files from>", args[0]);
		return 1;
	}

	@pool()
	{
		List {Path} files;
		files.tinit();

		foreach (arg : args[1..])
		{
			Path? path = path::new(tmem, arg);
			if (catch err = path)
			{
				log::error("Path '%s' is invalid", arg);
				return 1;
			}
			if (path::is_file(path))
			{
				if (@catch(path.extension()) || (path.extension()!! != ".c3" && path.extension()!! != ".c3i"))
				{
					log::error("File '%s' is not a c3 file", arg);
					return 1;
				}
				files.push(path);
			}
			else
			{
				bool? res = path::traverse(path, closure::new(fn bool?(List {Path}* files, Path path, bool is_dir, any)
				{
					if (is_dir) return false;
					if (@catch(path.extension()) || (path.extension()!! != "c3" && path.extension()!! != "c3i")) return false;
					files.push(path::new(tmem, path.str_view())!!);
					return false;
				}, &files), null);
				if (catch err = res)
				{
					log::error("Error while traversing path: %s", err);
					return 1;
				}
			}
		}

		foreach (file : files)
		{
			String? file_data = (String)file::load(tmem, file.path_string);
			if (catch err = file_data)
			{
				log::error("Unable to read file '%s': %s", file, err);
				return 1;
			}
			get_modules(alloc, modules, parser, file_data, file.basename()[:^file.extension().len + 1]!!);
		}
	};

	// TODO: first Module.resolve_imports, then Module.resolve_import_aliases
	modules.@iter_all_children(; Module* mod)
	{
		foreach (i, &sec : mod.sections) @pool()
		{
			log::debug("Checking imports of module %s section %s", mod.get_path_string(tmem), i);
			// TODO: maybe this could be its own method on Module?
			assert(!sec.resolved_imports);
			List {String[]} imports = sec.unresolved_imports;
			sec.unresolved_imports = {};
			sec.imports = {};
			sec.imports.init(alloc, imports.len());
			foreach IM: (im : imports)
			{
				ModuleImport mod_path = {.mod = modules};
				foreach (path : im)
				{
					if (path[0] == '@')
					{
						switch (path)
						{
							case "@norecurse":
								mod_path.norecurse = true;
							case "@public":
								mod_path.public = true;
							default:
								log::warn("Ignoring unknown import attribute %s", path);
						}
					}
					else if (try m = mod_path.mod.children[path])
					{
						mod_path.mod = m;
					}
					else
					{
						log::warn("Module has unknown import `%s`, ignoring", string::join(tmem, im, "::"));
						continue IM;
					}
				}
				log::debug("Found import %s {.norecurse = %s, .public = %s}", string::join(tmem, im, "::"), mod_path.norecurse, mod_path.public);
				sec.imports.push(mod_path);
			}
			sec.resolved_imports = true;
		};
	};
	modules.@iter_all_children(; Module* mod)
	{
		foreach (i, &sec : mod.sections) @pool()
		{
			log::debug("Checking import aliases of module %s section %s", mod.get_path_string(tmem), i);
			assert(sec.resolved_imports && !sec.resolved_import_aliases);
			List {String[]} aliases = sec.unresoled_import_aliases;
			sec.unresoled_import_aliases = {};
			sec.import_aliases = {};
			sec.import_aliases.init(alloc, aliases.len());
			foreach IM: (al : aliases)
			{
				ModuleAlias mod_path = {.mod = modules, .name = al[^1]};
				foreach (path : al[:^1])
				{
					if (try m = mod_path.mod.children[path])
					{
						mod_path.mod = m;
					}
					else
					{
						log::warn("Module has unknown import alias `%s`, ignoring", string::join(tmem, al[:^1], "::"));
						continue IM;
					}
				}
				log::debug("Found import alias '%s = %s'", mod_path.name, string::join(tmem, al[:^1], "::"));
				sec.import_aliases.push(mod_path);
			}
			sec.resolved_import_aliases = true;
		};
	};

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
					};
				}
			}
			$endforeach
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
	if (self.highlights.len == 0) return self.data;
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
	if (self.highlights.len == 0) return self.data;
	return self.data[self.highlights[0].start..self.highlights[^1].end_exclusive()];
}

fn bool HighlightedTextSlice.equals(&self, HighlightedTextSlice other) @operator(==) => self.get_string() == other.get_string();

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
	fn void print_extra_data(HtmlBuilder* b);
	// fn Module* get_parent();
	// fn String get_file_path(Allocator alloc, Module* mod);
	// fn ModuleView get_own_view();
	// fn String[] get_attributes() @optional;

	// fn List {Contract} get_doc_contracts();
	// fn String get_doc_comment(Allocator alloc);

	// fn DataId get_id(); // TODO: maybe add a uid to each new instance of a DocGenData? might be helpful for method resolution, think about it more later.
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
			b.@precode(`class="code-block"`)
			{
				b.text("%s", self.get_highlighted());
			};
			b.text("%s", self.get_description());
			self.print_extra_data(b);
		};
	}.copy(alloc);
}

fn void DocGenData.print_view(&self, Allocator alloc, HtmlBuilder* b, ModuleView module_overview)
{

}

struct DocGenDataDefault (DocGenData)
{
	Module* parent_module;
	HighlightedTextSlice name;
	DocComment doc_comment;
	HighlightedText text;
	List {HighlightedTextSlice} attributes;
}

fn String DocGenDataDefault.get_name(&self) @dynamic => self.name.get_string();
fn HighlightedText DocGenDataDefault.get_highlighted(&self) @dynamic => self.text;
// fn bool DocGenDataDefault.is_hidden_from(&self, ModuleView view) @dynamic => unreachable("Override is_hidden_from per-impl");
fn bool DocGenDataDefault.is_private(&self) @dynamic => self.attributes.contains({"@private", {}});
fn bool DocGenDataDefault.is_hidden(&self) @dynamic => self.attributes.contains({"@local", {}});
// fn ModuleView DocGenDataDefault.get_own_view(&self) @dynamic => unreachable("Override get_own_view per-impl");
fn String DocGenDataDefault.get_short_description(&self, Allocator alloc) @dynamic => self.doc_comment.get_short_description(alloc);
fn DocComment DocGenDataDefault.get_description(&self) @dynamic => self.doc_comment;
fn bool DocGenDataDefault.in_overview(&self) @dynamic => true;
fn DocGenDataType DocGenDataDefault.get_data_type(&self) @dynamic => unreachable("Override get_data_type per-impl");
fn void DocGenDataDefault.print_extra_data(&self, HtmlBuilder* b) @dynamic => unreachable("Override print_extra_data per-impl");
// fn Module* DocGenDataDefault.get_parent(&self) @dynamic => self.parent_module;

// TODO: store most data (name, type, val, attributes) as a slice into the HighlightedText
struct Global // (DocGenData)
{
	inline DocGenDataDefault data;
	// I store the whole type including generic params etc in here, and then can parse it again later
	Maybe {String} type;
}

fn DocGenDataType Global.get_data_type(&self) @dynamic => GLOBAL;
fn void Global.print_extra_data(&self, HtmlBuilder* b) @dynamic {}


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
fn bool Func.in_overview(&self) @dynamic => self.method_of.has_value ? false : true;
fn DocGenDataType Func.get_data_type(&self) @dynamic => FUNCTION; // TODO: if method_of.has_value maybe return METHOD?
fn void Func.print_extra_data(&self, HtmlBuilder* b) @dynamic
{
	b.h(2, "Parameters"); // I would list each parameter with the contents of `@param name : ...` above
}

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
fn void Struct.print_extra_data(&self, HtmlBuilder* b) @dynamic
{
	// TODO: maybe have the members in the struct definition be a collapsable section?
	b.h(2, "Members");
	b.h(2, "Methods");

	// TODO: there is a better way to do this.
/*	self.parent_module.get_root().@iter_all_children(; Module* mod)
	{
		if (mod.unresolved_methods.has_key(self.get_name()))
		{
			List {Func*} methods = mod.unresolved_methods[self.get_name()]!!;
			mod.unresolved_methods.remove(self.get_name());
			foreach (method : methods)
			{
				b.h(3, method.get_name());
				b.@precode(`class="code-block"`)
				{
					b.text("%s", method.get_highlighted());
				};
				b.text("%s", method.get_description());
				method.print_extra_data(b);
			}
		}
	};*/
}

struct Enum // (DocGenData)
{
	inline DocGenDataDefault data;
	Maybe {HighlightedTextSlice} spec;
	List {HighlightedTextSlice} values;
	List {HighlightedTextSlice} interfaces;
}
fn DocGenDataType Enum.get_data_type(&self) @dynamic => TYPE;
fn void Enum.print_extra_data(&self, HtmlBuilder* b) @dynamic
{
	b.h(2, "Values & Associated values");
	b.h(2, "Methods");
}

struct BitStruct // (DocGenData)
{
	inline DocGenDataDefault data;
	HighlightedTextSlice type;
	List {HighlightedTextSlice} members;
	List {HighlightedTextSlice} interfaces;
}
fn DocGenDataType BitStruct.get_data_type(&self) @dynamic => TYPE;
fn void BitStruct.print_extra_data(&self, HtmlBuilder* b) @dynamic
{
	b.h(2, "Parent Type");
	b.h(2, "Members");
	b.h(2, "Methods");
}

struct TypeAlias
{
	inline DocGenDataDefault data;
	HighlightedTextSlice aliased_module;
	// This also contains any generic params like in `alias IntList = List {int}`
	HighlightedTextSlice aliased_name;
}

struct ModuleSection
{
	InterfaceList {DocGenData} data;
	DocComment doc_comment;
	HighlightedText text;
	List {HighlightedTextSlice} attributes;
	bool resolved_imports;
	union
	{
		List {String[]} unresolved_imports;
		List {ModuleImport} imports;
	}
	bool resolved_import_aliases;
	union
	{
		List {String[]} unresoled_import_aliases;
		List {ModuleAlias} import_aliases;
	}
}

fn void ModuleSection.init(&self, Allocator alloc)
{
	self.data.init(alloc);
	self.attributes.init(alloc);
	self.unresolved_imports.init(alloc);
	self.unresoled_import_aliases.init(alloc);
}

fn bool ModuleSection.is_private(&self) => self.attributes.contains({"@private", {}});
fn bool ModuleSection.is_hidden(&self) => self.attributes.contains({"@local", {}});

struct ModuleImport
{
	Module* mod;
	bitstruct : char
	{
		bool norecurse;
		bool public;
	}
}

struct ModuleAlias
{
	String name;
	Module* mod;
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
		n += fmt.print(desc);
		n += fmt.print("<br/>");
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

macro Module.@iter_all_children(&self; @body(Module* mod)) => @pool()
{
	List {Module*} stack;
	stack.init(tmem);
	stack.push(self);
	while (stack.len() != 0) @pool()
	{
		Module* n = stack.pop()!!;
		@body(n);
		n.@iter_children(; Module* mod)
		{
			stack.push(mod);
		};
	};
}

macro Module.@iter_children(&self; @body(Module* mod)) => @pool()
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
	foreach (c : children) @body(c.value);

}

fn Module* Module.get_root(&self)
{
	Module* mod = self;
	while (mod.parent != null) mod = mod.parent;
	return mod;
}

fn String gen_module_overview(Allocator alloc, Module* mod, ModuleView module_overview) => @pool()
{
	return html::@html(tmem, string::tformat("%s overview", mod.get_path_string(tmem)), path_to_css(tmem, mod), path_to_js(tmem, mod); HtmlBuilder* b)
	{
		b.@div(`class="main"`)
		{
			gen_module_title(mod, b);
			if (mod.children.len() != 0)
			{
				b.h(2, "Submodules");
				b.@div(`class="submodule-list"`)
				{
					// TODO: sort iter_children by name
					mod.@iter_children(; Module* child)
					{
						log::debug("%s", child.path);
						b.url(child.path, get_relative_path_to(tmem, mod, child, INDEX_FILE), `target="_parent"`);
					};
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
			if (mod.parent == null)
			{
				b.h(1, "Packages Overview");
			}
			else
			{
				b.@h(3)
				{
					b.url("Packages Overview", get_relative_path_to(tmem, mod, mod.get_root(), INDEX_FILE), `target="_parent"`);
				};
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
			}
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
		if (!sec.is_hidden()) foreach (member : sec.data) if (!member.is_hidden()) if (!in_overview || member.in_overview())
		{
			DocGenDataType data_type = member.get_data_type();
			String member_name = member.get_name();
			// TODO: support @public members in @private module sections
			ModuleData* dat = member.is_private() || sec.is_private() ? &view.private : &view.public;
			if (!(*dat)[data_type].is_initialized()) (*dat).get_ref(data_type).init(alloc);
			if (!(*dat)[data_type].has_key(member_name))
			{
				dat.get_ref(data_type).set(member_name, *(List){}.init(alloc));
			}
			dat.get_ref(data_type).get_ref(member_name)!!.push({member, sec});
		}
	}
	return view;
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
