module docgen;
import std::io;

struct Example @private // this should be skipped
{
	int x;
}

<*
 Used to do something
*>
struct Example1 (Printable, InStream) @public
{
	int x, y;
	String z @tag("a", {1, 2, "3"});
}

<*
 Initialises the Example1 to a specified x and y
 @param x : "the x"
 @param y : "the y"
 @require x < y : "Some arbitrary limitation to mess with you"
 @pure
 @custom "Hello"
*>
fn void Example1.init(&self, int x, int y)@public@deprecated // Just to keep me on my toes
{
	self.x = x;
	self.y = y;
}

<*
 an interface implementation
*>
fn usz? Example1.read(&self, char[] buf) @dynamic
{
	buf[0] = '0';
	return 1;
}

fn char? Example1.read_byte(&self) @dynamic
{
	return '0';
}

<*
 I could probably parse this by parsing balanced parenthesis (and the same for skipping regular function/struct bodies as well)
*>
macro this_will_be_hard_to_parse(a, x = fn int(int x) => x) => x(a);

const FOO = 123;

alias Bar = int;
typedef StringBut_better = int[];

<*
 The main function of the program
 Usage:
 ```c3
 main({"executable_name", "path/to/c3/file.c3"});
 ```
 but you really shouldn't because it gets called automatically from the commandline anyway
 @param [in] args : "The args passed to the program on the commandline"
 @return "The exit code (0 for success, anything else for error)"
*>
fn int main(String[] args)
{
	String file_data = (String)file::load(tmem, args[1])!!;

	//List {String} extracted_decls = extract_decls(file_data);
	print_decls(file_data, io::stdout())!!;
	return 0;
}

fn void? print_decls(String data, OutStream out)
{
	// io::fprintf(output, data)!;
	for (usz i = 0; i < data.len; i++) @pool()
	{
		switch
		{
			case i + 2 < data.len && data[i] == '/' && data[i + 1] == '/':
				skip_line_comment(&i, data);
			case i + 2 < data.len && data[i] == '/' && data[i + 1] == '*':
				skip_comment(&i, data);
			case i + 2 < data.len && data[i] == '<' && data[i + 1] == '*':
				skip_doc_comment(&i, data);
			case data[i] == '`':
				skip_string(&i, data, '`');
			case data[i] == '\'':
				skip_string(&i, data, '\'');
			case data[i] == '"':
				skip_string(&i, data, '"');
			case data[i] == '{':
				skip_block(&i, data, '{', '}');
			default:
				if (try idx = data[i..].index_of("module") && idx == 0)
				{
					String mod = data[i:data[i..].index_of(";") ?? 0];
					io::fprintf(out, "### `%s`\n", mod["module".len..].trim())!;
					i += mod.len - 1;
				}
				else if (try idx = data[i..].index_of("struct") && idx == 0)
				{
					String struc = data[i:data[i..].index_of("{") ?? 0];
					io::fprintf(out, "```c3\n%s\n```\n", struc.trim())!;
					i += struc.len - 1;
				}
				else if (try idx = data[i..].index_of("fn") && idx == 0)
				{
					usz start_idx = i;
					while (i < data.len && data[i] != '(') i++;
					skip_block(&i, data, '(', ')');
					while (i < data.len)
					{
						// io::printfn("a: %s", data[i:30]);
						if (i < data.len && data[i] == '@')
						{
							i++;
							while (i < data.len && data[i].is_alpha()) i++;
							if (i < data.len && data[i] == '(') skip_block(&i, data, '(', ')');
							// io::printfn("a");
						}
						else if (i < data.len && data[i].is_space())
						{
							i++;
						}
						else
						{
							break;
						}
					}
					i--;
					String func = data[start_idx..i];//.index_of()
					// io::printfn("got this func:\n%s", func);
					// abort();
					io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("typedef") && idx == 0)
				{
					String type = data[i:data[i..].index_of(";") ?? 0];
					io::fprintf(out, "```c3\n%s\n```\n", type.trim())!;
					i += type.len - 1;
				}
		}
	};
}

fn void skip_line_comment(usz* i, String data)
{
	*i += 1;
	while (*i < data.len && data[*i] != '\n') *i += 1;
}
fn void skip_comment(usz* i, String data)
{
	*i += 1;
	for (usz count = 1; count != 0 && *i < data.len; *i += 1)
	{
		if (data[*i] == '/' && *i + 2 < data.len && data[*i + 1] == '*')
		{
			count ++;
			*i += 1;
		}
		if (data[*i] == '*' && *i + 2 < data.len && data[*i + 1] == '/')
		{
			count --;
			*i += 1;
		}
	}
}
fn void skip_doc_comment(usz* i, String data)
{
	*i += 1;
	for (usz count = 1; count != 0 && *i < data.len; *i += 1)
	{
		if (data[*i] == '<' && *i + 2 < data.len && data[*i + 1] == '*')
		{
			count ++;
			*i += 1;
		}
		if (data[*i] == '*' && *i + 2 < data.len && data[*i + 1] == '>')
		{
			count --;
			*i += 1;
		}
	}

}
fn void skip_string(usz* i, String data, char string_char)
{
	for (*i += 1; *i < data.len && data[*i] != string_char; *i += 1)
	{
		if (data[*i] == '\\')
		{
			*i += 1;
			continue;
		}
	}
}
fn void skip_block(usz* i, String data, char block_start, char block_end)
{
	*i += 1;
	for (usz count = 1; count != 0 && *i < data.len; *i += 1)
	{
		switch
		{
			case *i + 2 < data.len && data[*i] == '/' && data[*i + 1] == '/':
				skip_line_comment(i, data);
			case *i + 2 < data.len && data[*i] == '/' && data[*i + 1] == '*':
				skip_comment(i, data);
			case *i + 2 < data.len && data[*i] == '<' && data[*i + 1] == '*':
				skip_doc_comment(i, data);
			case data[*i] == '`':
				skip_string(i, data, '`');
			case data[*i] == '\'':
				skip_string(i, data, '\'');
			case data[*i] == '"':
				skip_string(i, data, '"');
			case data[*i] == block_start:
				count ++;
			case data[*i] == block_end:
				count --;
		}
	}
}

/*fn List {String} extract_decls(Allocator alloc, String file_data)
{

}*/

/*struct Module
{
	String module_name;
	List {String}
}*/

// it should skip all things marked as @test
// it should skip everything in a module marked as @private or @local unless the item is marked @public

// what I want the output to look like:
/*
# docgen
## Types
### Example1
Used to do something
```c3
struct Example1 @public
{
	int x, y;
}
```

#### Methods (actually this probably isn't easily possible because you can extend structs later)


## Functions

## Constants
*/


// Initially I should just replicate what the current ref card looks like & then add more features later.
// v1 goal:
/*
### `docgen`
```c3
struct Example @private
```
```c3
struct Example1 (Printable, InStream) @public
```
```c3
fn void Example1.init(&self, int x, int y)@public@deprecated
```
```c3
fn usz? Example1.read(&self, char[] buf) @dynamic
```
```c3
fn char? Example1.read_byte(&self) @dynamic
```
```c3
macro this_will_be_hard_to_parse(a, x = fn int(int x) => x)
```
```c3
const FOO = 123;
```
```c3
alias Bar = int;
```
```c3
typedef StringBut_better = int[];
```
```c3
fn int main(String[] args)
```
*/

// v2 goal
// the same but including doc comments (possibly verbatim) like this:
/*
The main function of the program
Usage:
```c3
main({"hello", "world"});
```
but you really shouldn't because it gets called automatically from the commandline anyway
```c3
@param [in] args : "The args passed to the program on the commandline"
@return "The exit code (0 for success, anything else for error)"
```
```c3
fn int main(String[] args)
```
*/
const A = 1;

const TEST =
`
int x = 1;
wef {{   wddwd
`;
