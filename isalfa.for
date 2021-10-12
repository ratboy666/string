C **********************************************************************
C *                                                                    *
C * ISALFA - RETURN .TRUE. IF ALPHABETIC                               *
C *                                                                    *
C **********************************************************************
C
      LOGICAL FUNCTION ISALFA(C)
      INTEGER C
C
      ISALFA = .FALSE.
      IF (C .GE. 97 .AND. C .LE. 122) ISALFA = .TRUE.
      IF (C .GE. 65 .AND. C .LE. 90) ISALFA = .TRUE.
      RETURN
      END

