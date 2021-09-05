C **********************************************************************
C *                                                                    *
C * STRPRI - PRINT STRING                                              *
C *                                                                    *
C * PRINT S$ FOR A MAXIMUM OF 132 CHARACTERS. IT IS PRINTED ON A LINE  *
C * BY ITSELF. USES STRGET AND STRLEN FUNCTIONS, YOU MAY JUST WANT TO  *
C * USE STRPRI AS AN EXAMPLE.                                          *
C *                                                                    *
C **********************************************************************
C
      SUBROUTINE STRPRI(S$)
      REAL S$
C
      EXTERNAL STRGET,STRLEN
      INTEGER STRLEN
C
      INTEGER I,J
      REAL EMPTY$
      INTEGER NOCHAR
      BYTE STRBUF(132)
      COMMON /STRCON/EMPTY$,NOCHAR,STRBUF
C
      J = STRLEN(S$)
      IF (J .EQ. 0) GO TO 1
      CALL STRGET(S$,STRBUF,132)
      WRITE (1,300) (STRBUF(I),I=1,J)
  300 FORMAT(1X,132A1)
      RETURN
    1 WRITE (1,301)
  301 FORMAT(1X)
      RETURN
      END
