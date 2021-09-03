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
      INTEGER STRMAX,STRUSE
      BYTE STRDAT(4096)
      INTEGER N1,N2,NOCHAR
      BYTE STRBUF(132)
      COMMON /STRSTO/STRMAX,STRUSE,STRDAT
      COMMON /STRCON/N1,N2,NOCHAR,STRBUF
      DATA STRMAX,STRUSE/4096,1/
      DATA N1,N2,NOCHAR/0,0,257/
      END
