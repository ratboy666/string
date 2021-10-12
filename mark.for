C **********************************************************************
C *                                                                    *
C * MARK - RETURN STORAGE MARK FOR RELEASE                             *
C *                                                                    *
C * PARAMETER IS A DUMMY -- IT IS NOT USED.                            *
C *                                                                    *
C * MARK WORKS WITH RELEASE. IT RETURNS A 'MARK' IN STRING STORAGE.    *
C * TEMPORARY STRINGS CAN THEN BE ALLOCATED WITH FUNCTION TEMP$. WHEN  *
C * THE TEMPORARY STRINGS ARE TO BE RELEASED, THE RELEAS SUBROUTINE IS *
C * USED TO RELEASE ALL TEMPORARY STORAGE BACK TO THE MARK. THE STRING *
C * ROUTINES DO NOT IMPLEMENT DYNAMIC STORAGE, BUT THE MARK/RELEASE    *
C * STRATEGY WORKS VERY WELL, AND PROVIDES PERFORMANCE.                *
C *                                                                    *
C *   M = MARK(0)                                                      *
C *   S1$ = TEMP$(80)                                                  *
C *   S2$ = TEMP$(80)                                                  *
C *   CALL RELEAS(M)                                                   *
C *                                                                    *
C * ALLOCATES TWO TEMPORARY STRINGS OF 80 CHARACTERS EACH, AND THEN    *
C * RELEASES THE STORAGE.                                              *
C *                                                                    *
C **********************************************************************
C
      INTEGER FUNCTION MARK(DUMMY)
      INTEGER DUMMY
C
      INCLUDE STRING.INC
C
      MARK = STRMAX
      RETURN
      END

