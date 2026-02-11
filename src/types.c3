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
	if (!self.name.has_value && !self.parent.has_value) return "index.md".copy(alloc);
	DString str;
	str.tinit();

	foreach (i, path : self.get_full_path(tmem))
	{
		if (i != 0) str.append(".");
		str.appendf("%s", path);
	}
	str.append(".md");

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
struct ModuleSection (Printable)
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

fn usz? ModuleSection.to_format(&self, Formatter* fmt) @dynamic => io::struct_to_format(*self, fmt, false);

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
	HighlightedText text;
	GenericParamType type;
}

fn GenericParam new_generic_param(String text, GenericParamType type)
{
	return {{0, text, {{0, text.len, type == CONST ? CONSTANT : TYPE}}}, type};
}

enum GenericParamType : char { CONST, TYPE }


/*
 Global definitions
*/
// alias Strings = List {String};
struct Global
{
	HighlightedText text; // The full declaration including value
	/*HighlightedToken*/ String name;
	Maybe {HighlightedText} type;
	Maybe {String[]} attributes;
	Maybe {DocComment} doc_comment;
	// TODO: `Type` would be a struct that handles all possible cases of type name directly with/without module path, `$typeof`/`$typefrom`, and generic types
	//  I'd use this to have jump to definition for types that support it
	// Maybe {Type} type;
}

fn Global new_global
(
	HighlightedText text,
	/*HighlightedToken*/ String name,
	Maybe {HighlightedText} type,
	Maybe {String[]} attributes,
	Maybe {DocComment} doc_comment,
)
{
	return {text, name, type, attributes, doc_comment};
}


/*
 Function definitions
*/
struct Function
{
	HighlightedText text; // The full declaration, including body (TODO: maybe don't copy the entire body)
	String name;
	bool is_macro;
	Maybe {HighlightedText} method_type;
	Maybe {HighlightedText} return_type;
	Maybe {String[]} attributes;
	Maybe {DocComment} doc_comment;
	Maybe {FunctionParam[]} parameters;
	Maybe {MacroTrailingParams} trailing_parameters;
	// TODO: add generic parameters when I update to support new generics
}

fn Function new_function
(
	HighlightedText text,
	String name,
	bool is_macro,
	Maybe {HighlightedText} method_type,
	Maybe {HighlightedText} return_type,
	Maybe {String[]} attributes,
	Maybe {DocComment} doc_comment,
	Maybe {FunctionParam[]} parameters,
	Maybe {MacroTrailingParams} trailing_parameters,
)
{
	return {text, name, is_macro, method_type, return_type, attributes, doc_comment, parameters, trailing_parameters};
}


/*
 FunctionParam definitions
*/
struct FunctionParam
{
	HighlightedText text; // A slice into the parent Function's HighlightedText
	FunctionParamType param_type;
	String name;
	Maybe {HighlightedText} type;
	Maybe {HighlightedText} default_value;
}

enum FunctionParamType : char
{
	REGULAR,
	CONST,
	EXPRESSION,
	TYPE,
}

fn FunctionParam new_function_param
(
	HighlightedText text,
	FunctionParamType param_type,
	String name,
	Maybe {HighlightedText} type,
	Maybe {HighlightedText} default_value,
)
{
	return {text, param_type, name, type, default_value};
}


/*
 DocComment definitions
*/
struct DocComment
{
	HighlightedText text;
	Maybe {String} comment;
	Maybe {DocCommentContract[]} contracts;
}

fn DocComment new_doc_comment(HighlightedText text, Maybe {String} comment, Maybe {DocCommentContract[]} contracts)
{
	return {text, comment, contracts};
}


/*
 DocCommentContract definitions
*/
struct DocCommentContract
{
	DocCommentContractType type;
	String name; // eg `@require`
	Maybe {HighlightedText} expression; // eg x == 1
	Maybe {String} message;
}

fn DocCommentContract new_doc_comment_contract(DocCommentContractType type, String name, Maybe {HighlightedText} expression, Maybe {String} message)
{
	return {type, name, expression, message};
}


/*
 DocCommentContractType definitions
*/
enum DocCommentContractType : char
{
	ENSURE,
	REQUIRE,
	RETURN,
	RETURN_FAULT,
	PARAM,
	PURE,
	DEPRECATED,
	CUSTOM,
}


/*
 Struct definitions
*/
// TODO
/*struct Struct
{
	HashMap {String, HighlightedText} members; // TODO: struct members can also have doc comments
}*/


/*
 Unimplemented definitions
*/
typedef Struct = void*;
typedef Enum = void*;
typedef BitStruct = void*;
typedef TypeAlias = void*;
typedef ValueAlias = void*;
typedef Import = void*;
typedef ImportAlias = void*;
typedef MacroTrailingParams = void*;

/*
 Highlighting definitions
*/
struct HighlightedToken
{
	usz start;
	uint len; // The 4294967296 character token:
	HighlightedTokenType type;
}
enum HighlightedTokenType : char { DEFAULT, NUMBER_LITERAL, STRING_LITERAL, BOOLEAN, KEYWORD, TYPE, CONSTANT, COMMENT, BUILTIN }

fn usz? HighlightedToken.to_string(&self, Formatter* fmt, String data)
{
	// fmt.printf(`<span class="DataType_%s DataType">%s</span>`, highlight.type, self.data[highlight.start:highlight.len]);
	// abort("Unimplemented: %s", $$FUNC);
	Ansi ansi;
	switch (self.type)
	{
		case BOOLEAN:
			ansi = RED;
		case CONSTANT:
			ansi = MAGENTA;
		default:
			ansi = RESET;
	}
	return fmt.printf("%s%s%s", ansi, self.get_text(data), Ansi.RESET);
}
fn String HighlightedToken.get_text(&self, String data) => data[self.start:self.len];
fn usz HighlightedToken.end_inclusive(&self) => self.start + self.len;
fn usz HighlightedToken.end_exclusive(&self) => self.end_inclusive() - 1;


struct HighlightedText (Printable)
{
	usz offset; // The offset into the string that the data starts, mainly for sliced highlighted text
	String data; // This is the main string data that the HighlightedTokens index into
	HighlightedToken[] highlighted;
}

fn usz? HighlightedText.to_format(&self, Formatter* fmt) @dynamic => self.to_format_internal(fmt, true);

macro usz? HighlightedText.to_format_internal(&self, Formatter* fmt, bool $print_before_and_after)
{
	usz? n;

	foreach (i, highlight : self.highlighted)
	{
		// TODO: why did the old version have this?
		// if (highlight.type == END) break;
		if ($print_before_and_after && i == 0 && highlight.start > self.offset)
		{
			n += fmt.printf(self.data[self.offset..highlight.start]);
		}
		else if (i != 0 && self.highlighted[i - 1].end_exclusive() < highlight.start)
		{
			// Print the text between the current token and now
			n += fmt.printf(self.data[self.highlighted[i - 1].start + self.highlighted[i - 1].len:highlight.start - self.highlighted[i - 1].end_inclusive()]);
		}
		n += highlight.to_string(fmt, self.data);
	}
	if (self.highlighted.len == 0)
	{
		n += fmt.printf(self.data[self.offset..]);
	}
	else if ($print_before_and_after/* && self.highlighted[^1].type != END*/)
	{
		n += fmt.printf(self.data[self.highlighted[^1].end_inclusive()..]);
	}
	return n;
}

<*
	Returns a slice of the highlighted text, owned by the parent highlighted text
	The slice *MUST* be on the boundaries of a HighlightedToken, it can't be partway through a token
	@ensure found_start : "The start byte must align with the start of a HighlightedToken"
	@ensure found_end : "The end byte must align with the end of a HighlightedToken"
*>
fn HighlightedText HighlightedText.slice_bytes(&self, usz start_byte, usz byte_len)
{
	bool found_start, found_end;
	usz start_idx, end_idx;
	foreach (i, tok : self.highlighted)
	{
		if (tok.start == start_byte)
		{
			found_start = true;
			start_idx = i;
		}
		if (tok.end_inclusive() == start_byte + byte_len)
		{
			found_end = true;
			end_idx = i;
			break;
		}
	}
	return {start_byte, self.data[:start_byte+byte_len], self.highlighted[start_idx..end_idx]};
}

/*
 DocGenType declarations
*/
struct DocGenType
{
	DocGenTypeKind type;
	HighlightedText text;
	// TODO
/*	union
	{
		HighlightedToken builtin;
		struct plain
		{
			HighlightedToken name;
			List {}
		}
		struct generic
		{
			HighlightedToken base;
			List {}
		}
		HighlightedText typeof;
	}*/
}

fn DocGenType new_docgen_type(Allocator alloc, )
{
	unreachable();
}

enum DocGenTypeKind : char
{
	BUILTIN, // Things like `int`
	PLAIN, // Things like `String` and `IntList`
	GENERIC, // Things like `List {int}`
	TYPEOF // Things like `$typeof(1)` and `$typefrom($my_typeid)`
}
