C **********************************************************************
C *                                                                    *
C * INPUT$ - RETURN STRING FROM KEYBOARD                               *
C *                                                                    *
C * PROMPT WITH STRING P$, THEN ACCEPT INPUT (UP TO 127 CHARACTERS)    *
C * RETURN INPUT AS TEMPORARY STRING.                                  *
C *                                                                    *
C **********************************************************************
C
      FUNCTION INPUT$(P$)
      REAL INPUT$
      REAL P$
C
      EXTERNAL CONOUT,CONRBF,STRLEN,CHARAT,STRPUT,TEMP$
      INTEGER STRLEN,CHARAT
      REAL TEMP$
C
      INTEGER I,N
      REAL S$
      REAL EMPTY$
      INTEGER NOCHAR
      BYTE STRBUF(132)
      COMMON /STRCON/EMPTY$,NOCHAR,STRBUF
C
      N = STRLEN(P$)
      IF (N .LE. 0) GO TO 1
      DO 2 I=1,N
        CALL CONOUT(CHARAT(P$,I))
    2 CONTINUE
    1 STRBUF(1) = 127
      STRBUF(2) = 0
      CALL CONRBF(STRBUF)
      N = STRBUF(2)
      S$ = TEMP$(N)
      CALL STRPUT(S$,STRBUF(3),N)
      INPUT$ = S$
      RETURN
      END
