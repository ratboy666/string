C **********************************************************************
C *                                                                    *
C * MID$ - RETURN M CHARACTERS BEGINNING WITH OFFSET N OF STRING S$    *
C *                                                                    *
C * FROM MBASIC. RETURN MIDDLE CHARACTERS OF THE STRING. FOR           *
C * EXAMPLE:                                                           *
C *                                                                    *
C *   S$ = NEW$(12)                                                    *
C *   CALL STRPUT(S$,'HELLO, WORLD',12)                                *
C *   T$ = MID$(S$,5,2)                                                *
C *                                                                    *
C * T$ NOW HAS 'O,'                                                    *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION MID$(S$, N, M)
      REAL S$
      INTEGER N, M
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
      IF (N .GE. D$LEN) GO TO 1
      IF (M .LE. 0) GO TO 1
      IF (D$LEN .LE. 0) GO TO 1
      R$OFF = R$OFF + N - 1
      R$LEN = M
      IF (N + M - 1 .LE. D$LEN) GO TO 1
      R$LEN = D$LEN - N + 1
    1 MID$ = R$
      RETURN
      END

