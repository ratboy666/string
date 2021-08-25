C **********************************************************************
C *                                                                    *
C * STRCPY - COPY STRING                                               *
C *                                                                    *
C * COPY SRC$ TO DST$. DST$ MUST BE LARGE ENOUGH TO ACCOMODATE SRC$.   *
C *                                                                    *
C **********************************************************************
C
      SUBROUTINE STRCPY(DST$,SRC$)
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
      S$LEN = 0
      DST$ = S$
      IF (T$LEN .LE. 0) RETURN
      DO 1 I = 1,T$LEN
          J = S$OFF + I - 1
          K = T$OFF + I - 1
          STRDAT(J) = STRDAT(K)
    1 CONTINUE
      S$LEN = T$LEN
      DST$ = S$
      RETURN
      END
