C **********************************************************************
C *                                                                    *
C * TRIM$ - RETURN TRIMMED STRING                                      *
C *                                                                    *
C * TRIM$ RETURNS THE STRING WITH TRIMMED SPACES FROM LEFT OR RIGHT.   *
C * IF N = 1 TRIM LEFT, 2 TRIM RIGHT, 3 TRIM BOTH.                     *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION TRIM$(T$, N)
      REAL T$
      INTEGER N
C
      INTEGER I, C
      REAL S$
      INTEGER IS$(2), S$OFF, S$LEN
C
      INCLUDE STRING.INC
C
      EQUIVALENCE (S$, IS$(1)), (IS$(1), S$OFF), (IS$(2), S$LEN)
C
      S$ = T$
C TRIM RIGHT
      IF ((N .AND. 2) .EQ. 0) GO TO 2
    1 IF (S$LEN .LE. 0) GO TO 2
      I = S$OFF + S$LEN - 1
      C = ICHAR(STRDAT(I))
      IF (C .GT. 32) GO TO 2
      S$LEN = S$LEN - 1
      GO TO 1 
C TRIM LEFT
    2 IF ((N .AND. 1) .EQ. 0) GO TO 4
    3 IF (S$LEN .LE. 0) GO TO 4
      I = S$OFF
      C = ICHAR(STRDAT(I))
      IF (C .GT. 32) GO TO 4
      S$LEN = S$LEN - 1
      S$OFF = S$OFF + 1
      GO TO 3
    4 TRIM$ = S$
      RETURN
      END

