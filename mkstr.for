C **********************************************************************
C *                                                                    *
C * MKSTR$ - MAKE STRING FROM OFFSET, LENGTH                           *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION MKSTR$(OFF, LEN)
      INTEGER OFF, LEN
C
      REAL S$
      INTEGER IS$(2), S$OFF, S$LEN
C
      EQUIVALENCE (S$, IS$(1)), (IS$(1), S$OFF), (IS$(2), S$LEN)
C
      S$OFF = OFF
      S$LEN = LEN
      MKSTR$ = S$
      RETURN
      END

