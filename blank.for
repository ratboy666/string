C **********************************************************************
C *                                                                    *
C * BLANK - FILL BUFFER WITH SPACES                                    *
C *                                                                    *
C **********************************************************************
C
      SUBROUTINE BLANK(BUF,N)
      INTEGER N
      BYTE BUF(N)
C
      INTEGER I
C
      IF (N .LE. 0) RETURN
      DO 1 I=1,N
        BUF(I) = ' '
    1 CONTINUE
      RETURN
      END
