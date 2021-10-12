C **********************************************************************
C *                                                                    *
C * STR$ - TEMPORARY STRING                                            *
C *                                                                    *
C * RETURN STRING WITH VALUE IN TEMPORARY SPACE. STRING IS DELIMITED.  *
C * AND  IS USED FOR CONTROL (^^=^). EG. '/^M^J*/'                   *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION STR$(D)
      BYTE D(1)
C
      INTEGER I, N
      BYTE C, B
      REAL S$
C
      INCLUDE STRING.INC
C
      C = D(1)
      N = 0
      DO 2 I = 2, 132
        B = D(I)
        IF (B .EQ. C) GO TO 3
        IF (B .NE. 94) GO TO 1
        I = I + 1
        B = D(I)
        IF (B .EQ. 94) GO TO 1
        B = B - 64
    1   N = N + 1
        STRBUF(N) = B
    2 CONTINUE
    3 S$ = TEMP$(N)
      CALL STRPUT(S$, STRBUF, N)
      STR$ = S$
      RETURN
      END

