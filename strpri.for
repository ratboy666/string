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
      BYTE BUF(132)
C
      J = STRLEN(S$)
      CALL STRGET(S$,BUF,132)
      WRITE (1,300) (BUF(I),I=1,J)
  300 FORMAT(1X,132A1)
      RETURN
      END
