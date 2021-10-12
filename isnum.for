C **********************************************************************
C *                                                                    *
C * ISNUM - RETURN .TRUE. IF NUMERIC                                   *
C *                                                                    *
C **********************************************************************
C
      LOGICAL FUNCTION ISNUM(C)
      INTEGER C
C
      ISNUM = .FALSE.
      IF (C .GE. 48 .AND. C .LE. 57) ISNUM = .TRUE.
      RETURN
      END

