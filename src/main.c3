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
 main({"hello", "world"});
 ```
 but you really shouldn't because it gets called automatically from the commandline anyway
 @param [in] args : "The args passed to the program on the commandline"
 @return "The exit code (0 for success, anything else for error)"
*>
fn int main(String[] args)
{
	io::printfn("Hello, World!: %s", args);
	return 0;
}

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
