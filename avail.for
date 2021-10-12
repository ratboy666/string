C **********************************************************************
C *                                                                    *
C * AVAIL - MEMORY AVAILABLE FOR ALLOCATION                            *
C *                                                                    *
C **********************************************************************
C
      INTEGER FUNCTION AVAIL(DUMMY)
      INTEGER DUMMY
C
      INCLUDE STRING.INC
C
      AVAIL = STRMAX - STRUSE + 1
      RETURN
      END

