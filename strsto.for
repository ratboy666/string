C **********************************************************************
C *                                                                    *
C * STRSTO - STRING STORAGE                                            *
C *                                                                    *
C * STRINGS ARE ALLOCATED IN ARRAY STRDAT (STRING DATA) STRMAX IS THE  *
C * UPPER LIMIT, STRUSE (STRING USED) IS THE NEXT ALLOCATION.          *
C *                                                                    *
C * ALSO DEFINES NOCHAR (NO CHARACTER) AND EMPTY$ (N1,N2), WHICH IS A  *
C * STRING OF LENGTH 0.                                                *
C *                                                                    *
C **********************************************************************
C
      BLOCK DATA STRSTO
C
      INTEGER STRMAX, STRUSE
      BYTE STRDAT(4096)
C
      INTEGER EMPTY$(2), E$OFF, E$LEN
      INTEGER NOCHAR
      BYTE STRBUF(132)
C
      COMMON /STRSTO/ STRMAX, STRUSE, STRDAT
      COMMON /STRCON/ EMPTY$, NOCHAR, STRBUF
C
      EQUIVALENCE (EMPTY$(1), E$OFF), (EMPTY$(2), E$LEN)
C
      DATA STRMAX, STRUSE /4096, 1/
      DATA E$OFF, E$LEN, NOCHAR /0, 0, 257/
      END

