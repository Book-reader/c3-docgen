# c3-docgen
a pretty bad doc generator for C3 I threw together in a couple of hours to fix the outdated stdlib reference

usage:
```console
$ c3c run -- <output file> <list of input files (eg: ~/git/c3c/lib/std/**.c3)>
```

`
So, for organization I'm thinking we need a lot of views:
A view for a given module. Collect different @if variants and merge names. Contains types + constants + functions (no methods). Contains links to sub modules and a backref to the parent module. Includes private ones, placed separately further down.
A view for a given type. Collect different @if variants. Contains fields + methods. Private methods are collected separately further down.
An index view of ALL public types for jumping to any view.
An index view of all entries in (1) for easy jumping in the page of (1)
An index view of ALL public functions using their short path prefix.
So if I click on "std::collections" then I could directly navigate to a sub module (from 1) or to a place in that page (from 4)

IF I click on a type then I have (3) to jump to some other type.
We need 2 index views for this I suppose
But not necessarily

also list type methods defined in other modules, but maybe show they came from a different module in some way
`
