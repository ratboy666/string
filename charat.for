C **********************************************************************
C *                                                                    *
C * CHARAT - CHARACTER AT                                              *
C *                                                                    *
C * GETS A SINGLE CHARACTER FROM STRING S$. RETURNS NOCHAR IF INDEX I  *
C * IS NOT IN THE STRING. RETURNS 0..255M, OR 257                      *
C *                                                                    *
C **********************************************************************
C
      INTEGER FUNCTION CHARAT(S$, I)
      REAL S$
      INTEGER I
C
      INTEGER J
      REAL D$
      INTEGER ID$(2), D$OFF, D$LEN
C
      INCLUDE STRING.INC
C
      EQUIVALENCE (D$, ID$(1)), (ID$(1), D$OFF), (ID$(2), D$LEN)
C
      D$ = S$
      CHARAT = NOCHAR
      IF (D$LEN .LE. 0) GO TO 1
      IF (I .LE. 0) GO TO 1
      IF (I .GT. D$LEN) GO TO 1
      J = D$OFF + I - 1
      CHARAT = ICHAR(STRDAT(J))
    1 RETURN
      END

