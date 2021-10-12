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
      SUBROUTINE STRPRI(LUN, S$)
      INTEGER LUN
      REAL S$
C
      INTEGER I, J
C
      INCLUDE STRING.INC
C
      J = STRLEN(S$)
      IF (J .LE. 0) GO TO 1
      IF (J .GT. 132) J = 132
      CALL STRGET(S$, STRBUF, J)
      WRITE (LUN, 300) (STRBUF(I), I = 1, J)
  300 FORMAT (1X, 132A1)
      RETURN
    1 WRITE (LUN, 301)
  301 FORMAT (1X)
      RETURN
      END

