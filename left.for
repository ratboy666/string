C **********************************************************************
C *                                                                    *
C * LEFT$ - RETURN LEFTMOST N CHARACTERS OF STRING S$                  *
C *                                                                    *
C * FROM MBASIC. RETURN LEFTMOST CHARACTERS OF THE STRING. FOR         *
C * EXAMPLE:                                                           *
C *                                                                    *
C *   S$ = NEW$(12)                                                    *
C *   CALL STRPUT(S$,'HELLO, WORLD',12)                                *
C *   T$ = LEFT$(S$,2)                                                 *
C *                                                                    *
C * T$ NOW HAS 'HE'                                                    *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION LEFT$(S$, N)
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
      R$ = S$
      R$LEN = 0
      IF (N .LE. 0) GO TO 1
      R$LEN = D$LEN
      IF (N .GE. D$LEN) GO TO 1
      R$LEN = N
    1 LEFT$ = R$
      RETURN
      END

