C **********************************************************************
C *                                                                    *
C * STRGET - GET BYTES FROM STRING                                     *
C *                                                                    *
C * GET N BYTES FROM STRING S$ TO ARRAY D. TAKES THE SMALLER OF N OR   *
C * STRLEN(S$). THIS IS USED TO ACCESS THE ACTUAL CHARACTERS IN THE    *
C * STRING (SEE CHARAT).                                               *
C *                                                                    *
C **********************************************************************
C
      SUBROUTINE STRGET(S$, D, N)
      REAL S$
      INTEGER N
      BYTE D(N)
C
      INTEGER I, J, L
      REAL D$
      INTEGER ID$(2), D$OFF, D$LEN
C
      INCLUDE STRING.INC
C
      EQUIVALENCE (D$, ID$(1)), (ID$(1), D$OFF), (ID$(2), D$LEN)
C
      D$ = S$
      L = D$LEN
      IF (D$LEN .LE. 0) RETURN
      IF (N .LE. 0) RETURN
      IF (N .LE. L) L = N
      DO 1 I = 1, L
        J = D$OFF + I - 1
        D(I) = STRDAT(J)
    1 CONTINUE
      RETURN
      END

