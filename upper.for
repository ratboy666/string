C **********************************************************************
C *                                                                    *
C * UPPER - CONVERT C TO UPPER-CASE, IF IT IS LOWER-CASE               *
C *                                                                    *
C **********************************************************************
C
      INTEGER FUNCTION UPPER(C)
      INTEGER C
C
      UPPER = C
      IF (C .GE. 97 .AND. C .LE. 122) UPPER = UPPER - 97 + 65
      RETURN
      END

