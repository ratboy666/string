C **********************************************************************
C *                                                                    *
C * RELEAS - RELEASE ALL TEMPORAY STORAGE TO MARK M                    *
C *                                                                    *
C * RELEASE ALL TEMPORARIES ALLOCATED WITH TEMP$ TO LAST MARK. SEE     *
C * MARK FUNCTION FOR MORE DETAILS.                                    *
C *                                                                    *
C **********************************************************************
C
      SUBROUTINE RELEAS(M)
      INTEGER M
C
      INTEGER STRMAX,STRUSE
      BYTE STRDAT(1)
      COMMON /STRSTO/STRMAX,STRUSE,STRDAT
C
      STRMAX = M
      RETURN
      END
