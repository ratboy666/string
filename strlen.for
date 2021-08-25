C **********************************************************************
C *                                                                    *
C * STRLEN - STRING LENGTH                                             *
C *                                                                    *
C * RETURN LENGTH OF STRING S$                                         *
C *                                                                    *
C **********************************************************************
C
      FUNCTION STRLEN(S$)
      INTEGER STRLEN
      REAL S$
C
      REAL D$
      INTEGER ID$(2),D$OFF,D$LEN
      EQUIVALENCE (D$,ID$(1)),(ID$(1),D$OFF),(ID$(2),D$LEN)
C
      D$ = S$
      STRLEN = D$LEN
      RETURN
      END
