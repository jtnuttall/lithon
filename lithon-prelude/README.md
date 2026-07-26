# lithon-prelude

Custom prelude for Lithon, encapsulating the library's preferences and
idioms.

Built on a specific subset of universum with substitutions for a few pieces
(e.g., Witherable, lens + generic-lens, Witch).

I conventionally use a style of predeclaring errors, declaring `Display`, then
declaring `From` if appropriate. This is pretty much lifted from Rust.

This shared package also provides some custom effectful effects for the project.
As of writing: Blammo logging, monotonic-clock tracing, ANSI terminal pretty-printing,
and pkg-config/C dep discovery.

Internal to lithon, no plans to publish to Hackage. Licensed under BSD-3-Clause;
you may reuse anything here you find useful, but you should vendor if you're going
to do that.
