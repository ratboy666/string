C **********************************************************************
C *                                                                    *
C * STR$ - TEMPORARY STRING                                            *
C *                                                                    *
C * RETURN STRING WITH VALUE IN TEMPORARY SPACE                        *
C *                                                                    *
C **********************************************************************
C
      FUNCTION STR$(D)
      REAL STR$
      BYTE D(80)
C
      EXTERNAL TEMP$,STRPUT
      REAL TEMP$
C
      INTEGER I,N
      BYTE C
      REAL S$
      REAL EMPTY$
      INTEGER NOCHAR
      BYTE STRBUF(132)
      COMMON /STRCON/EMPTY$,NOCHAR,STRBUF
C
      C = D(1)
      DO 1 I=2,132
        IF (C .EQ. D(I)) GO TO 2
        STRBUF(I-1) = D(I)
    1 CONTINUE
    2 N = I - 2
      S$ = TEMP$(N)
      CALL STRPUT(S$,STRBUF,N)
      STR$ = S$
      RETURN
      END
