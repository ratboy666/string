C **********************************************************************
C *                                                                    *
C * CMDLN$ - RETURN COMMAND LINE AS TEMPORARY STRING                   *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION CMDLN$(DUMMY)
      INTEGER DUMMY
C
      INTEGER I, N
      REAL S$
C
      INCLUDE STRING.INC
C
      N = PEEK(128)
      S$ = TEMP$(N)
      IF (N .EQ. 0) GO TO 2
      DO 1 I = 1, N
        STRBUF(I) = PEEK(128 + I)
    1 CONTINUE
      CALL STRPUT(S$, STRBUF, N)
    2 CMDLN$ = S$
      RETURN
      END

