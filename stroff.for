C **********************************************************************
C *                                                                    *
C * STROFF - STRING OFFSET                                             *
C *                                                                    *
C * RETURNS OFFSET (1 BASED) OF STRING IN STRDAT                       *
C *                                                                    *
C **********************************************************************
C
      FUNCTION STROFF(S$)
      INTEGER STROFF
      REAL S$
C
      REAL D$
      INTEGER ID$(2),D$OFF,D$LEN
      EQUIVALENCE (D$,ID$(1)),(ID$(1),D$OFF),(ID$(2),D$LEN)
C 
      D$ = S$
      STROFF = D$OFF
      RETURN
      END
