C **********************************************************************
C *                                                                    *
C * TRIM$ - RETURN TRIMMED STRING                                      *
C *                                                                    *
C * TRIM$ RETURNS THE STRING WITH TRIMMED SPACES FROM LEFT OR RIGHT.   *
C * IF N = 1 TRIM LEFT, 2 TRIM RIGHT, 3 TRIM BOTH.                     *
C *                                                                    *
C **********************************************************************
C
      FUNCTION TRIM$(T$,N)
      REAL TRIM$
      REAL T$
      INTEGER N
C
      INTEGER I,C
      REAL S$
      INTEGER IS$(2),S$OFF,S$LEN
      INTEGER STRMAX,STRUSE
      BYTE STRDAT(1)
      COMMON /STRSTO/STRMAX,STRUSE,STRDAT
      EQUIVALENCE (S$,IS$(1)),(IS$(1),S$OFF),(IS$(2),S$LEN)
C
      S$ = T$
C TRIM RIGHT
      IF ((N .AND. 2) .EQ. 0) GO TO 2
    1 IF (S$LEN .LE. 0) GO TO 2
      I = S$OFF + S$LEN - 1
      C = STRDAT(I)
      IF (C .LT. 0) C = C + 128
      IF (C .GT. 32) GO TO 2
      S$LEN = S$LEN - 1
      GO TO 1 
C TRIM LEFT
    2 IF ((N .AND. 1) .EQ. 0) GO TO 4
    3 IF (S$LEN .LE. 0) GO TO 4
      I = S$OFF
      C = STRDAT(I)
      IF (C .LT. 0) C = C + 128
      IF (C .GT. 32) GO TO 4
      S$LEN = S$LEN - 1
      S$OFF = S$OFF + 1
      GO TO 3
    4 TRIM$ = S$
      RETURN
      END
