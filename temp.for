C **********************************************************************
C *                                                                    *
C * TEMP$ - ALLOCATE TEMPORARY STRING OF SIZE N                        *
C *                                                                    *
C * ALLOCATES A TEMPORARY STRING OF SIZE N. THE STRING IS SET TO       *
C * LENGTH 0. SEE MARK AND RELEAS FOR DETAILS ON STORAGE MANAGEMENT.   *
C *                                                                    *
C **********************************************************************
C
      FUNCTION TEMP$(N)
      REAL TEMP$
      INTEGER N
C
      REAL S$
      INTEGER IS$(2),S$OFF,S$LEN
      INTEGER STRMAX,STRUSE
      BYTE STRDAT(1)
      COMMON /STRSTO/STRMAX,STRUSE,STRDAT
      EQUIVALENCE (S$,IS$(1)),(IS$(1),S$OFF),(IS$(2),S$LEN)
C
      S$OFF = STRMAX - N
      S$LEN = 0
      STRMAX = S$OFF
      IF (S$OFF .LE. STRUSE) STOP TSPACE
      TEMP$ = S$
      RETURN
      END
