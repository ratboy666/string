C **********************************************************************
C *                                                                    *
C * STRCAT - CONCATENATE STRINGS                                       *
C *                                                                    *
C * CONCATENATE SRC$ TO THE END OF DST$. DST$ MUST BE LONG ENOUGH TO   *
C * ACCOMDATE THE RESULT AS THIS IS NOT RANGE CHECKED.                 *
C *                                                                    *
C **********************************************************************
C
      SUBROUTINE STRCAT(DST$,SRC$)
      REAL DST$,SRC$
C
      INTEGER I,J,K
      REAL S$
      INTEGER IS$(2),S$OFF,S$LEN
      REAL T$
      INTEGER IT$(2),T$OFF,T$LEN
      INTEGER STRMAX,STRUSE
      BYTE STRDAT(1)
      COMMON /STRSTO/STRMAX,STRUSE,STRDAT
      EQUIVALENCE (S$,IS$(1)),(IS$(1),S$OFF),(IS$(2),S$LEN)
      EQUIVALENCE (T$,IT$(1)),(IT$(1),T$OFF),(IT$(2),T$LEN)
C
      S$ = DST$
      T$ = SRC$
      IF (T$LEN .LE. 0) RETURN
      DO 1 I=1,T$LEN
        J = S$OFF + S$LEN + I - 1
        K = T$OFF + I - 1
        STRDAT(J) = STRDAT(K)
    1 CONTINUE
      S$LEN = S$LEN + T$LEN
      DST$ = S$
      RETURN
      END
