C **********************************************************************
C *                                                                    *
C * STRPUT - PUTS BYTES INTO STRING                                    *
C *                                                                    *
C * PUT N BYTES FROM BYTE ARRAY D INTO STRING S$. STRING S$ MUST BE    *
C * LARGE ENOUGH TO ACCOMODATE N BYTES OF DATA (SEE NEW$ AND TEMP$).   *
C *                                                                    *
C * THIS CAN BE USED TO SET A LITERAL INTO A STRING:                   *
C *                                                                    *
C *   S$ = NEW$(12)                                                    *
C *   CALL STRPUT(S$,'HELLO, WORLD',12)                                *
C *                                                                    *
C **********************************************************************
C
      SUBROUTINE STRPUT(S$, D, N)
      REAL S$
      INTEGER N
      BYTE D(N)
C
      INTEGER I, J
      REAL D$
      INTEGER ID$(2), D$OFF, D$LEN
C
      INCLUDE STRING.INC
C
      EQUIVALENCE (D$, ID$(1)), (ID$(1), D$OFF), (ID$(2), D$LEN)
C
      D$ = S$
      D$LEN = N
      IF (N .LE. 0) GO TO 2
      DO 1 I = 1, N
        J = D$OFF + I - 1
        STRDAT(J) = D(I)
    1 CONTINUE
    2 S$ = D$
      RETURN
      END

