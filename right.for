C **********************************************************************
C *                                                                    *
C * RIGHT$ - RETURN RIGHTMOST N CHARACTERS OF STRING S$                *
C *                                                                    *
C * FROM MBASIC. RETURN RIGHTMOST CHARACTERS OF THE STRING. FOR        *
C * EXAMPLE:                                                           *
C *                                                                    *
C *   S$ = NEW$(12)                                                    *
C *   CALL STRPUT(S$,'HELLO, WORLD',12)                                *
C *   T$ = RIGHT$(S$,2)                                                *
C *                                                                    *
C * T$ NOW HAS 'LD'                                                    *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION RIGHT$(S$, N)
      REAL S$
      INTEGER N
C
      REAL D$
      INTEGER ID$(2), D$OFF, D$LEN
      REAL R$
      INTEGER IR$(2), R$OFF, R$LEN
C
      EQUIVALENCE (D$, ID$(1)), (ID$(1), D$OFF), (ID$(2), D$LEN)
      EQUIVALENCE (R$, IR$(1)), (IR$(1), R$OFF), (IR$(2), R$LEN)
C
      D$ = S$
C SET RETURN TO 0 CHARACTERS JUST AFTER STRING
      R$OFF = R$OFF + R$LEN
      R$LEN = 0
      IF (D$LEN .LE. 0) GO TO 1
      IF (N .LE. 0) GO TO 1
C SET RETURN TO WHOLE STRING
      R$ = S$
      IF (N .GT. D$LEN) GO TO 1
C SET RETURN TO OFFSET BY -N
      R$OFF = D$OFF + D$LEN - N
      R$LEN = N
    1 RIGHT$ = R$
      RETURN
      END

