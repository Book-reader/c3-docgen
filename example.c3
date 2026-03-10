module std::core::foo;

struct Foo { int x; }

module some::other;

fn void Foo.func_a(&self) {}

/*module my::test;

struct Foo {int a;}

fn void Foo.func_a(&self) {}

module my::test::submodule;

fn void Foo.func_b(&self) {}

module my;

fn void Foo.func_c(&self) {}

module my::other;

struct Foo {int b;}

module my::other::submodule;

fn void Foo.func_d(&self) {}

module unrelated;
import my::test;

fn void Foo.func_e(&self) {}

module unrelated;
import my::other;

fn void Foo.func_f(&self) {}*/
