# string
A simple string handling library for Microsoft FORTRAN-80.

I have published APU.REL to provide AM9511 functions for FORTRAN-80, but BASIC was easier to use. Mainly because of
the poor string handling in F80. This library seeks to rectify this, in a small way. It should be possible to move
(at a source level) code in between MBASIC and F80 without too much re-thinking. STRLIB.REL uses MBASIC as its
inspiration.

See string.txt for function details. Full source is provided -- everything is written in F80. A copy of FORLIB.REL
that I used is also included.

Fixed STRPRI (string print) to accomodate zero-length string (Aug 30, 2021).
Added INSTR (in string) is string in another string (Sep 1, 2021).

The MBASIC functions that are not included - MID$ assignment, number to string (MKI$ etc). OCT$, HEX$
but these are not that important (for me) -- can be easily provided as "user level functions". The biggest issue
I have is: MBASIC "IF S$ = "STRING" THEN ..." gets translated into

  M = MARK(0)
  
  T$ = TEMP$(5)
  
  CALL STRPUT(T$,'STRING',5)
  
  IRES = STRCMP(S$,T$)
  
  CALL RELEAS(M)
  
  IF (IRES .EQ. 0) THEN ...

  1 - we could combine TEMP$ and STRPUT, as a function
  
  2 - express 'STRING' as '/STRING/' avoiding the explicit count

  M = MARK(0)
  
  IRES = STRCMP(S$, STR$('/STRING/'))
  
  CALL RELEAS(M)

I am contemplating adding this STR$() function. I need to write code that uses it.
