C **********************************************************************
C *                                                                    *
C * LOWER - CONVERT C TO LOWER-CASE, IF IT IS UPPER-CASE               *
C *                                                                    *
C **********************************************************************
C
      INTEGER FUNCTION LOWER(C)
      INTEGER C
C
      LOWER = C
      IF (C .GE. 65 .AND. C .LE. 90) LOWER = LOWER - 65 + 97
      RETURN
      END

