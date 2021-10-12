C **********************************************************************
C *                                                                    *
C * STRCMP - STRING COMPARE                                            *
C *                                                                    *
C * COMPARE STRINGS S1$ AND S2$. RETURN POSITIVE IF S1$ IS LARGER,     *
C * ZERO IF EQUAL, NEGATIVE IF S2$ LARGER. COMPARE BY COMPARING EACH   *
C * CHARACTER. VIEWS EACH CHARACTER AS VALUE 0..255. SINCE ASCII IS    *
C * USED, 65 IS UPPERCASE A, 97 IS LOWER CASE A. ASCII ONLY DEFINES    *
C * CHARACTERS 0 TO 127. THE RANGE 128 TO 255 IS NOT DEFINED. IF THE   *
C * CHARACTER SET IS UTF-8, ALL VALUES ARE SIGNIFICANT (AND FOR BINARY *
C * DATA).                                                             *
C *                                                                    *
C **********************************************************************
C
      INTEGER FUNCTION STRCMP(S1$, S2$)
      REAL S1$, S2$
C
      INTEGER I, J, C1, C2
      REAL A$
      INTEGER IA$(2), A$OFF, A$LEN
      REAL B$
      INTEGER IB$(2), B$OFF, B$LEN
C
      INCLUDE STRING.INC
C
      EQUIVALENCE (A$, IA$(1)), (IA$(1), A$OFF), (IA$(2), A$LEN)
      EQUIVALENCE (B$, IB$(1)), (IB$(1), B$OFF), (IB$(2), B$LEN)
C
      A$ = S1$
      B$ = S2$
C WE CANNOT SIMPLY DO S1$ .EQ. S2$, NAN DO NOT EQUAL EACH OTHER.
C IF BOTH STRINGS REFER TO THE SAME STORAGE AND LENGTH, THEY ARE
C EQUAL
      STRCMP = 0
      IF (A$LEN .EQ. B$LEN .AND. A$OFF .EQ. B$OFF) RETURN
C IF BOTH STRINGS ARE EMPTY, THEY ARE EQUAL
      IF (A$LEN .EQ. 0 .AND. B$LEN .EQ. 0) RETURN
      STRCMP = 1
      DO 1 I = 1, A$LEN
C STRINGS HAVE BEEN EQUAL FROM 1..I, IF I EXCEEDS S2$ LENGTH, S1$ IS
C LARGER
        IF (I .GT. B$LEN) RETURN
        J = A$OFF + I - 1
        C1 = ICHAR(STRDAT(J))
        J = B$OFF + I - 1
        C2 = ICHAR(STRDAT(J))
        J = C1 - C2
        IF (J .EQ. 0) GO TO 1
C C1 - C2 NOT ZERO MEANS THE STRINGS ARE NOT EQUAL, C1 - C2 GIVES
C US THE ANSWER
        STRCMP = J
        RETURN
    1 CONTINUE
      STRCMP = 0
C STRINGS ARE EQUAL IF WE HAVE COMPARED ALL CHARACTERS
      IF (A$LEN .EQ. B$LEN) RETURN
C WE RAN OUT OF CHARACTERS IN S1$, SO S2$ IS LARGER.
      STRCMP = -1
      RETURN
      END

