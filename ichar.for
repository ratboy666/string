C **********************************************************************
C *                                                                    *
C * ICHAR - CHAR TO INTEGER                                            *
C *                                                                    *
C **********************************************************************
C
      INTEGER FUNCTION ICHAR(C)
      BYTE C
C
      ICHAR = C
      ICHAR = ICHAR .AND. X'FF'
      RETURN
      END

