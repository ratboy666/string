# string
A simple string handling library for Microsoft FORTRAN-80.

I have published APU.REL to provide AM9511 functions for FORTRAN-80, but BASIC was easier to use. Mainly because of
the poor string handling in F80. This library seeks to rectify this, in a small way. It should be possible to move
(at a source level) code in between MBASIC and F80 without too much re-thinking. STRLIB.REL uses MBASIC as its
inspiration.

See string.txt for function details. Full source is provided -- everything is written in F80. A copy of FORLIB.REL
that I used is also included.
