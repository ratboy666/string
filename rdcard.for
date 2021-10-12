C **********************************************************************
C *                                                                    *
C * RDCARD - READ CARD, ON EOF RETURN -1                               *
C *                                                                    *
C * READS 80 COLUMN IMAGE INTO CARD FROM DEVICE LUN. IF THE PREVIOUS   *
C * RECORD HAD A NEWLINE THAT WAS NOT READ, CONSUMES THAT (READS 81    *
C * CHARACTERS AND THE TERMINATING CR).                                *
C *                                                                    *
C * WE READ 132 CHARACTERS INSTEAD OF 80... OTHERWISE ONLY EVERY       *
C * OTHER LINE IS DELIVERED. VERY STRANGE. BUT THIS WORKS.             *
C *                                                                    *
C **********************************************************************
C
      INTEGER FUNCTION RDCARD(LUN, CARD)
      BYTE CARD(80)
C
      INCLUDE STRING.INC
C
      CALL BLANK(STRBUF, 132)
      READ (LUN, 301, END = 2) STRBUF
  301 FORMAT (132A1)
      J = 1
      IF (STRBUF(1) .EQ. 10) J = 2
      DO 1 I = 1,80
        CARD(I) = STRBUF(J)
        J = J + 1
    1 CONTINUE
      RDCARD = 0
      RETURN
    2 RDCARD = -1
      RETURN
      END

