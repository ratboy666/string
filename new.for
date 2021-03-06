C **********************************************************************
C *                                                                    *
C * NEW$ - ALLOCATE PERMANENT STRING OF SIZE N                         *
C *                                                                    *
C * NEW$ ALLOCATES A NEW STRING OF SIZE N. UNLIKE STRINGS ALLOCATED    *
C * WITH TEMP$, STORAGE CANNOT BE RECLAIMED. NEW$ AND TEMP$ STRING     *
C * SHARE THE SAME STORAGE SPACE. THE STRING RETURNED IS OF LENGTH 0.  *
C *                                                                    *
C **********************************************************************
C
      REAL FUNCTION NEW$(N)
      INTEGER N
C
      INTEGER I
      REAL S$
      INTEGER IS$(2), S$OFF, S$LEN
C
      INCLUDE STRING.INC
C
      EQUIVALENCE (S$, IS$(1)), (IS$(1), S$OFF), (IS$(2), S$LEN)
C
      I = STRUSE
      STRUSE = STRUSE + N
      IF (STRUSE .GT. STRMAX) STOP SSPACE
      S$OFF = I
      S$LEN = 0
      NEW$ = S$ 
      RETURN
      END

