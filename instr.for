C **********************************************************************
C *                                                                    *
C * INSTR - IS STRING Y$ CONTAINED IN STRING X$, BEGINNING AT POSITION *
C *         I. Y$ IS NEEDLE (N$), X$ IS HAYSTACK (H$)                  *
C *                                                                    *
C * FROM MBASIC.                                                       *
C *                                                                    *
C **********************************************************************
C
      FUNCTION INSTR(I,X$,Y$)
      INTEGER INSTR
      INTEGER I
      REAL X$,Y$
C
      REAL N$
      INTEGER IN$(2),N$OFF,N$LEN
      REAL H$
      INTEGER IH$(2),H$OFF,H$LEN
      INTEGER J,K,L,P,Q,C1,C2
      INTEGER STRMAX,STRUSE
      BYTE STRDAT(1)
      COMMON /STRSTO/STRMAX,STRUSE,STRDAT
      EQUIVALENCE (N$,IN$(1)),(IN$(1),N$OFF),(IN$(2),N$LEN)
      EQUIVALENCE (H$,IH$(1)),(IH$(1),H$OFF),(IH$(2),H$LEN)
C
      N$ = Y$
      H$ = X$
      INSTR = I
      IF (N$LEN .LE. 0) GO TO 2
      INSTR = 0
      IF (H$LEN .LE. 0) GO TO 2
      IF (I .GT. H$LEN) GO TO 2
      DO 1 J=I,H$LEN
        P = H$OFF + J - 1
        DO 3 K=1,N$LEN
          IF (J + K - 1 .GT. H$LEN) GO TO 1
          Q = N$OFF + K - 1
          L = P + K - 1
          IF (STRDAT(L) .NE. STRDAT(Q)) GO TO 1
    3   CONTINUE
        INSTR = J
        GO TO 2
    1 CONTINUE
    2 RETURN
      END
