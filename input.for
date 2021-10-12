C **********************************************************************
C *                                                                    *
C * INPUT$ - RETURN STRING FROM KEYBOARD                               *
C *                                                                    *
C * PROMPT WITH STRING P$, THEN ACCEPT INPUT (UP TO 127 CHARACTERS)    *
C * RETURN INPUT AS TEMPORARY STRING.                                  *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION INPUT$(P$)
      REAL P$
C
      INTEGER I, N
      REAL S$
C
      INCLUDE STRING.INC
C
      N = STRLEN(P$)
      IF (N .LE. 0) GO TO 2
      DO 1 I = 1, N
        CALL CONOUT(CHARAT(P$, I))
    1 CONTINUE
    2 STRBUF(1) = 127
      STRBUF(2) = 0
      CALL CONRBF(STRBUF)
      N = STRBUF(2)
      S$ = TEMP$(N)
      CALL STRPUT(S$, STRBUF(3), N)
      INPUT$ = S$
      RETURN
      END

