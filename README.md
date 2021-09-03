# string
A simple string handling library for Microsoft FORTRAN-80.

I have published APU.REL to provide AM9511 functions for FORTRAN-80, but BASIC was easier to use. Mainly because of
the poor string handling in F80. This library seeks to rectify this, in a small way. It should be possible to move
(at a source level) code in between MBASIC and F80 without too much re-thinking. STRLIB.REL uses MBASIC as its
inspiration.

See string.txt for function details. Full source is provided -- everything is written in F80 (except CONOUT and
CONBFR -- very simple wrappers for BDOS functions 2 and 10). The copy of FORLIB.REL that I used is also included.
Note that this FORLIB.REL contains a CONOUT routine (for the Apple I think). Results in multiple define warning
during link that can be safely ignored (same issue as APU.REL).

Fixed STRPRI (string print) to accomodate zero-length string (Aug 30, 2021).

Added INSTR (in string) is string in another string (Sep 1, 2021).

Added STR$, TRIM$, MKSTR$, INPUT$, BLANK, CONOUT, CONRBF, common STRBUF (Sep 3, 2021).
.
I wrote a bit of code with STR$('/STRING/') to define temporary string constants. Worked quite well. Added two
assembler functions CONOUT and CONBFR to interface with BDOS. INPUT$ to get prompted input that can come
from a SUB file with XSUB. Added BLANK routine to allow easier use of ENCODE/DECODE. Publish MKSTR$ as
inverse of STROFF and STRLEN. Functions that I will use are now complete. Requests are welcome.
