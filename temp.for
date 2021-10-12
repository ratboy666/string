C **********************************************************************
C *                                                                    *
C * TEMP$ - ALLOCATE TEMPORARY STRING OF SIZE N                        *
C *                                                                    *
C * ALLOCATES A TEMPORARY STRING OF SIZE N. THE STRING IS SET TO       *
C * LENGTH 0. SEE MARK AND RELEAS FOR DETAILS ON STORAGE MANAGEMENT.   *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION TEMP$(N)
      INTEGER N
C
      REAL S$
      INTEGER IS$(2), S$OFF, S$LEN
C
      INCLUDE STRING.INC
C
      EQUIVALENCE (S$, IS$(1)), (IS$(1), S$OFF), (IS$(2), S$LEN)
C
      S$OFF = STRMAX - N
      S$LEN = 0
      STRMAX = S$OFF
      IF (S$OFF .LE. STRUSE) STOP TSPACE
      TEMP$ = S$
      RETURN
      END

