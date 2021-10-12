C
C **********************************************************************
C *                                                                    *
C * STRING.INC                                                         *
C *                                                                    *
C * INCLUDE FILE FOR COMMON. USE AS A TEMPLATE FOR APPLICATIONS.       *
C *                                                                    *
C **********************************************************************
C
      EXTERNAL STRSTO, STROFF, STRLEN, NEW$, TEMP$, MARK, RELEAS, STRCMP
      EXTERNAL STRPUT, STRGET, STRCPY, STRPRI, LEFT$, MID$, RIGHT$, STR$
      EXTERNAL CMDLN$, BLANK, TRIM$, INPUT$, MKSTR$, CHARAT, CHAR, ICHAR
      EXTERNAL $PUSH, $POP, $DADSP, $SPHL, VARPTR, UPPER, LOWER, ISNUM
      EXTERNAL RDCARD, AVAIL, STRCLR, ISALFA
C
      INTEGER STROFF, STRLEN, MARK, STRCMP, CHARAT, ICHAR, $POP, $DADSP
      INTEGER VARPTR, UPPER, LOWER, RDCARD, AVAIL
      BYTE CHAR
      REAL NEW$, TEMP$, LEFT$, MID$, RIGHT$, STR$, CMDLN$, TRIM$, INPUT$
      REAL MKSTR$
      LOGICAL ISNUM, ISALFA
C
      REAL EMPTY$
      INTEGER NOCHAR
      BYTE STRBUF(132)
C
      INTEGER STRMAX, STRUSE
      BYTE STRDAT(1)
C
      COMMON /STRCON/ EMPTY$, NOCHAR, STRBUF
      COMMON /STRSTO/ STRMAX, STRUSE, STRDAT
C

