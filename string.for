C **********************************************************************
C *                                                                    *
C * STRING                                                             *
C *                                                                    *
C * USES A TECHNIQUE DESCRIBED BY DAVID R HANSON, 'A SIMPLE TECHNIQUE  *
C * FOR REPRESENTING STRINGS IN FORTRAN IV', COMMUNICATIONS OF THE     *
C * ACM, NOVEMBER 1974                                                 *
C *                                                                    *
C **********************************************************************
C
C NOTES
C
C  1 WE DON'T COMPACT STRING STORAGE, BUT WE USE THE UPPER PART FOR
C    TEMPORARY STRINGS. TEMP$(N) RETURNS A SUCH A TEMPORARY, NEW$(N)
C    RETURNS A PERMANENT STRING FROM THE BOTTOM. THE STRING STORAGE IS
C    DEFINED IN COMMON STRSTO.
C
C  2 IF WE DON'T DO GARBAGE COLLECTION, WE CAN SHARE PARTS OF STRINGS.
C    THIS MEANS THAT LEFT, RIGHT, MID DO NOT HAVE TO COPY DATA, AND ARE
C    THEN TRIVIAL AND VERY FAST. MARK AND RELEASE WORK LIKE A STACK.
C
C  3 SETTING STRUSE TO 1 WILL CLEAR ALL PERMANENT STRING STORAGE.
C    SETTING STRMAX TO THE UPPER LIMIT OF STRDAT WILL CLEAR ALL
C    TEMPORARY STRING STORAGE. JUST BE CAREFUL ABOUT DANGLING STRINGS
C    THAT STILL REFERENCE THE STRDAT AREA.
C
C  4 FOR L80, THE LARGEST COMMON DEFINITION MUST BE FIRST -- THIS IS IN
C    STRSTO. (PLINK-II CAN HELP ALLEVIATE THIS)
C
C  5 CHARAT (RETURN CHARACTER AT) RETURNS INTEGER: EITHER -128..127.
C    IF IT IS ASKED TO RETURN A CHARACTER NOT IN THE STRING (OUT OF
C    RANGE) IT RETURNS NOCHAR. NOCHAR IS DEFINED TO BE 257, WHICH IS
C    OUT OF EITHER -128..127 OR 0...255. SOME FORTRAN IMPLEMENTATIONS
C    MAY RETURN INTEGER*1 OR BYTE AS 0..255, AND WE ATTEMPT TO
C    ACCOMODATE THAT.
C
C  6 WITH MICROSOFT F80, IT IS NOT POSSIBLE TO USE PARAMETERS DIRECTLY
C    IN THE EQUIVALENCE STATEMENT. F80 DOES NOT BELIEVE THAT A
C    PARAMETER IS A VARIABLE. SO, WE COPY TO VARIABLES AS NEEDED.
C    OTHER COMPILERS MAY HAVE THE SAME BEHAVIOUR.
C
C  7 A STRING IS TWO INTEGERS PACKED INTO A REAL. THIS WORKS FOR F80
C    AND IBM 1130 FORTRAN. TWO INTEGERS MAY BE PACKED INTO EITHER A
C    COMPLEX OR A DOUBLE PRECISION ON OTHER MACHINES (AS DESCRIBED BY
C    HANSON). NEITHER F80 NOR IBM 1130 IMPLEMENT COMPLEX. WITH IBM 1130
C    FORTRAN, USE *ONE WORD INTEGER.
C
C  8 UNDERLYING STRING STORAGE IS DECLARED BYTE WITH F80. OTHER SYSTEMS
C    MAY NEED INTEGER*1 OR OTHER CODE. THIS WOULD BE RELATED TO HOW
C    HOLLERITH IS PASSED AS A PARAMETER. IT IS POSSIBLE TO USE INTEGER
C    AS THE UNDERLYING STORAGE. NOTE THAT THIS AFFECTS STRDAT INDEXING
C    BUT THE EFFECTS ARE ISOLATED TO THIS MODULE. LENGTH IS STILL IN
C    CHARACTERS (BYTES).
C
C  9 EDIT 4096 IN STRSTO TO THE NUMBER OF BYTES OF STRING STORAGE
C    NEEDED.
C
C 10 WE DO NOT HAVE A 'PUTAT' SUBROUTINE THAT IS LIKE CHARAT()
C    FUNCTION WE MAY WANT TO VIEW STRINGS AS IMMUTABLE. NOTE THAT
C    STRCAT SHOULD PROBABLY RETURN A NEW STRING, INSTEAD OF MODIFING
C    THE DST$ STRING. NOTE THAT STRCAT WILL NOT INVALIDATE LEFT$, MID$
C    OR RIGHT$ RESULT STRINGS.
C
      PROGRAM STRING
C
      EXTERNAL STRSTO,STROFF,STRLEN,NEW$,TEMP$,MARK,RELEAS,STRCMP
      EXTERNAL STRPUT,SETGET,STRCPY,STRPRI,LEFT$,MID$,RIGHT$
      INTEGER STROFF,STRLEN,MARK,STRCMP
      REAL NEW$,TEMP$,LEFT$,MID$,RIGHT$
C
      REAL S$,T$,U$,V$
      INTEGER I,J,M
C
      REAL EMPTY$
      INTEGER NOCHAR
      COMMON /STRCON/EMPTY$,NOCHAR
C
C CREATE A NEW STRING, MAXIMUM OF 80 CHARACTERS. SET STRING TO
C 'HELLO, WORLD', WHICH IS 12 CHARACTERS IN LENGTH.
C 
      S$ = NEW$(80)
      CALL STRPUT(S$,'HELLO, WORLD',12)
C
      T$ = NEW$(1024)
C
C DISPLAY OFFSET AND LENGTH OF S$
C
      I = STROFF(S$)
      J = STRLEN(S$)
      WRITE (1,300) I,J
  300 FORMAT(1X,'I ',I6,' J ',I6)
C
C SAME FOR T$
C
      I = STROFF(T$)
      J = STRLEN(T$)
      WRITE (1,300) I,J
C
      CALL STRCPY(T$,S$)
      CALL STRPRI(S$)
      CALL STRPRI(T$)
C
      V$ = LEFT$(S$,5)
      CALL STRPRI(V$)
      V$ = MID$(S$,5,2)
      CALL STRPRI(V$)
C
      M = MARK(0)
      WRITE (1,301) M
  301 FORMAT (1X,'M ',I6)
      U$ = TEMP$(20)
      I = STROFF(U$)
      J = STRLEN(U$)
      WRITE (1,300) I,J
      CALL RELEAS(M)
C
      V$ = RIGHT$(S$,2)
      J = STRLEN(V$)
      CALL STRPRI(V$)
      WRITE (1,302) J
  302 FORMAT (1X,'LEN ',I6)
C
      CALL STRPUT(S$,'PART 1 ',7)
      CALL STRPUT(T$,'PART 2 ',7)
      CALL STRCAT(S$,T$)
      CALL STRPRI(S$)
C
      WRITE (1,303)
  303 FORMAT (1X,'STRING COMPARE')
      CALL STRPUT(S$,'A',1)
      CALL STRPUT(T$,'A',1)
      J = STRCMP(S$,T$)
      WRITE (1,304) J
  304 FORMAT (1X,'A/A ',I6)
      CALL STRPUT(T$,'B',1)
      J = STRCMP(S$,T$)
      WRITE (1,305) J
  305 FORMAT (1X,'A/B ',I6)
      CALL STRPUT(S$,'B',1)
      CALL STRPUT(T$,'A',1)
      J = STRCMP(S$,T$)
      WRITE (1,306) J
  306 FORMAT (1X,'B/A ',I6)
      CALL STRPRI(EMPTY$)
C
C FORCE SSPACE ERROR, BY ATTEMPTING TO CREATE A STRING THAT
C IS JUST TOO BIG.
C
      U$ = NEW$(5000)
      END
                                                                                                                               