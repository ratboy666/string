C **********************************************************************
C *                                                                    *
C * CMDLN$ - RETURN COMMAND LINE AS TEMPORARY STRING                   *
C *                                                                    *
C **********************************************************************
C
      FUNCTION CMDLN$(DUMMY)
      REAL CMDLN$
      INTEGER DUMMY
C
      EXTERNAL TEMP$,STRPUT
      REAL TEMP$
C
      INTEGER I,N
      REAL S$
      REAL EMPTY$
      INTEGER NOCHAR
      BYTE STRBUF(132)
      COMMON /STRCON/EMPTY$,NOCHAR,STRBUF
C
      N = PEEK(128)
      S$ = TEMP$(N)
      IF (N .EQ. 0) GO TO 2
      DO 1 I=1,N
        STRBUF(I) = PEEK(128+I)
    1 CONTINUE
      CALL STRPUT(S$,STRBUF,N)
    2 CMDLN$ = S$
      RETURN
      END
