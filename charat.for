C **********************************************************************
C *                                                                    *
C * CHARAT - CHARACTER AT                                              *
C *                                                                    *
C * GETS A SINGLE CHARACTER FROM STRING S$. RETURNS NOCHAR INDEX I IS  *
C * NOT IN THE STRING. RETURNS -128..128, OR 257                       *
C *                                                                    *
C **********************************************************************
C
      FUNCTION CHARAT(S$,I)
      INTEGER CHARAT
      REAL S$
      INTEGER I
C
      INTEGER J
      REAL D$
      INTEGER ID$(2),D$OFF,D$LEN
      REAL EMPTY$
      INTEGER NOCHAR
      INTEGER STRMAX,STRUSE
      BYTE STRDAT(1)
      COMMON /STRCON/EMPTY$,NOCHAR
      COMMON /STRSTO/STRMAX,STRUSE,STRDAT
      EQUIVALENCE (D$,ID$(1)),(ID$(1),D$OFF),(ID$(2),D$LEN)
C
      D$ = S$
      CHARAT = NOCHAR
      IF (D$LEN .LE. 0) GO TO 1
      IF (I .LE. 0) GO TO 1
      IF (I .GT. D$LEN) GO TO 1
      J = D$OFF + I - 1
      CHARAT = STRDAT(J)
    1 RETURN
      END
