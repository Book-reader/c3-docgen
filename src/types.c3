module docgen;
import std::io;
import std::sort;
import std::collections::maybe;
import std::collections::map;
import std::collections::list;


alias GenericParams = List {GenericParam};


/*
 Module definitions
*/
struct Module (Printable)
{
	Maybe {Module*} parent; // the root module has no parent
	Maybe {String} name; // the root module has no name
	HashMap {String, Module*} children;
	Maybe {GenericParams} generic_params;
	List {ModuleSection} sections;
	Allocator alloc;
}

fn Module* new_module(Allocator alloc, Maybe {Module*} parent, Maybe {String} name, Maybe {GenericParams} generic_params)
{
	Module* new = allocator::new(alloc, Module);
	new.alloc = alloc;
	new.parent = parent;
	new.name = name;
	new.children.init(new.alloc);
	new.generic_params = generic_params;
	new.sections.init(new.alloc);
	return new;
}

fn usz? Module.to_format(&self, Formatter* fmt) @dynamic
{
	usz? n = fmt.printf("{ parent: ");
	n += self.parent.has_value ? fmt.printf("[%p]", self.parent.get()!!) : fmt.printf("%s", self.parent); // To prevent infinite recursion from children printing parents
	n += fmt.printf(", name: %s, children: %s, generic_params: %s, sections: %s, alloc: %s }", self.name, self.children, self.generic_params, self.sections, self.alloc);
	return n;
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

fn String Module.get_overview_file_name(&self, Allocator alloc) => @pool()
{
	DString str;
	str.tinit();

	foreach (i, path : self.get_full_path(tmem))
	{
		if (i != 0) str.append(".");
		str.appendf("%s", path);
	}
	str.append(".html");

	return str.copy_str(alloc);
}

fn Module* Module.get_root_module(&self)
{
	Module* root = self;
	while (root.parent.has_value) root = root.parent.get()!!;
	return root;
}

fn String[] Module.get_full_path(&self, Allocator alloc) => @pool()
{
	List {String} full_path;
	full_path.tinit();
	Module* current = self;
	while (try name = current.name.get() && current.parent.has_value)
	{
		full_path.push(name.copy(alloc));
		current = current.parent.get()!!;
	}
	full_path.reverse();
	return full_path.to_array(alloc);
}

/*
 ModuleSection definitions
*/
struct ModuleSection
{
	HashMap {String, Struct} structs;
	HashMap {String, BitStruct} bit_structs;
	HashMap {String, Enum} enums;
	HashMap {String, Function} functions;
	HashMap {String, TypeAlias} type_aliases;
	HashMap {String, ValueAlias} value_aliases;
	HashMap {String, Global} globals;

	HashMap {String, ImportAlias} import_aliases;
	List {Import} imports;
	Maybe {DocComment} doc_comment;
}

fn ModuleSection new_module_section(Allocator alloc, Maybe {DocComment} doc_comment)
{
	ModuleSection new;
	new.doc_comment = doc_comment;
/*	new.structs.init(alloc);
	new.enums.init(alloc);
	new.functions.init(alloc);*/
	$foreach $member : ModuleSection.membersof:
	{
		$echo $member.nameof;
		var val @safeinfer = &$member.get(new);
		$if $defined(val.init) &&& $defined(val.init(alloc)):
			val.init(alloc);
		$endif
	}
	$endforeach
	return new;
}

/*fn void ModuleSection.init(&self, Allocator alloc)
{
	$foreach $member : ModuleSection.membersof:
	{
		var val @safeinfer = &$member.get(*self);
		$if $defined(val.init) &&& $defined(val.init(alloc)):
			val.init(alloc);
		$endif
	}
	$endforeach
}*/


/*
 GenericParam definitions
*/
struct GenericParam
{
	GenericParamType type;
	HighlightedToken data;
}

fn GenericParam new_generic_param(String data, GenericParamType type)
{
	return {type, {data, type == CONST ? CONSTANT : TYPE}};
}

enum GenericParamType : char { CONST, TYPE }

/*
 Unimplemented definitions
*/
typedef DocComment = void*;
typedef Struct = void*;
typedef Enum = void*;
typedef Function = void*;
typedef BitStruct = void*;
typedef TypeAlias = void*;
typedef ValueAlias = void*;
typedef Global = void*;
typedef Import = void*;
typedef ImportAlias = void*;

/*
 Highlighting definitions
*/
struct HighlightedToken
{
	String data;
	HighlightedTokenType type;
}
enum HighlightedTokenType : char { DEFAULT, NUMBER_LITERAL, STRING_LITERAL, KEYWORD, TYPE, CONSTANT, COMMENT }

alias HighlightedText = HighlightedToken[];
alias HighlightedTextBuilder = List {HighlightedToken};
