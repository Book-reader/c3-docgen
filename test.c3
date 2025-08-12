module test;

fn void foo(int s)
{
	s;
}

module test @private;

int a;

module test::submodule;

fn int bar() => 1;

fn int Foo.bar(&self) => 1;


module test1;


int b;


module foo1;

fn int x() => 314159;
