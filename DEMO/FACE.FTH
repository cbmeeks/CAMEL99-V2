\ Exploring Forth programming from a BASIC perspective
\ adding READ and RESTORE to Forth for demonstration

\ NOTE: * SOME OF THE WORDS DEFINED HERE ARE IN THE GRAFIX
\         FILE. THE ARE DEFINED HERE FOR EDUCATIONAL PURPOSES

\ a ladies face. data source: http://briantw.com/ti-99/4a/LIST.TXT

\ BASIC stores this data as text bytes which must be converted
\ at run time. (slow)
\ Here they will be store the data as integers in memory cells
\ In Forth we must declare a name before we can use it so DATA is first

\ DATA simply returns the base address of all these numbers

INCLUDE DSK1.GRAFIX
INCLUDE DSK1.VDPTYPE
INCLUDE DSK1.CHARSET
INCLUDE DSK1.ELAPSE   \ for speed evaluation

HEX
CREATE DATA  ( -- addr)
\         char pattern               char pattern
\ [ --------8 bytes--------]  [---------8 bytes----------]
  FFFF , FFFF , FFFF , FFFF ,  FFFF , FFFF , FFFE , FFFF ,
  FAED , FEF7 , BEEA , F4B5 ,  AA02 , 80F8 , D68A , 2401 ,
  A9B6 , AAAD , 3695 , 564B ,  BFD5 , BBA9 , D1A2 , D069 ,
  FFB5 , FF6F , FD5F , BB5F ,  FFDB , 7EEB , BEEB , 5DF6 ,
  FFFF , FEFB , FDEB , FAD5 ,  FBEE , BBDD , 6AF6 , AD75 ,
  D5A2 , 54A2 , A9A4 , 1249 ,  B64A , AA12 , 4825 , 8822 ,
  A5AA , 5791 , 4A28 , 9425 ,  A0DA , 68A8 , CA9A , 6CB6 ,
  6D97 , 5E13 , 2A05 , 0A05 ,  DBED , B6FB , EDBD , F73E ,
  FAA9 , F5BB , EAB5 , D6F3 ,  ADF5 , 565A , D5B5 , D66A ,
  204A , 8054 , 5148 , A488 ,  0094 , 2196 , 2902 , 9044 ,
  920A , A449 , 0229 , 0293 ,  DAAA , B76B , AD57 , FFBF ,
  000A , 2004 , 81C8 , C5A2 ,  D72F , B517 , 4513 , 4205 ,
  59EA , A9D1 , 7888 , 8880 ,  AD35 , 5A2B , 955A , 2DB6 ,
  3244 , 9045 , 75A8 , 9281 ,  1082 , 100A , F45A , 4AB6 ,
  0AA5 , 15A7 , 2A8B , 9585 ,  FBF2 , FB1E , A955 , 02A9 ,
  AAAA , ADAB , 552D , AA2C ,  A289 , 4249 , 9241 , A8D2 ,
  8882 , 8A85 , 8642 , 4342 ,  9AAA , AD1A , D7AC , 5A8A ,
  BECB , 7FAF , FFBD , DEB5 ,  FDFE , C4EE , B4D5 , 9049 ,
  65A2 , AAA9 , 542A , 4A2A ,  AAD5 , B4D2 , AAB9 , 5CAB ,
  562B , AB95 , 562B , AA57 ,  A550 , AAD1 , A8D4 , E258 ,
  4345 , 52A1 , A1A0 , A1B0 ,  154D , 880D , 448E , 0282 ,
  5AB7 , 542A , 5154 , AAD5 ,  0450 , 8940 , 2280 , 2501 ,
  2A55 , 2D55 , 2B8A , 5005 ,  AD0A , 2D55 , 5AA5 , 965B ,
  2AD5 , 5B6D , AAB5 , EA77 ,  EAE8 , 6AB4 , D59A , EA5A ,
  1141 , 7151 , ECEE , FBEF ,  0201 , 02A1 , A0C0 , 70AA ,
  AAD5 , B65B , 160D , 0200 ,  9421 , 3AC4 , 5A20 , 5A44 ,
  2A15 , A556 , 955D , AB15 ,  D554 , 6192 , 146A , 55AE ,
  AA7B , ADB5 , EBB7 , DAAB ,  ED75 , BEED , 7EFE , FFED ,
  B3FD , B7DD , F7AE , FBF8 ,  F0AC , FAF6 , FDB6 , DEAE ,
  8001 , A448 , A012 , 80A0 ,  DA6A , 6D2B , AD1F , 5F3A ,
  AAAB , 5555 , AD75 , DBFE ,  DA68 , 2150 , 4A51 , 56EB ,
  4FAB , 2F97 , 6E5F , FDBF ,  FFB6 , DBEF , B3DB , EDBB ,

\ ==============================================================
\ Forth does not have READ DATA RESTORE
\ But we can create words to work similarly to BASIC
\ The math is easy.  DATA+0 will give us the address of the 1st record
\                    DATA+8 gives us the address of the 2nd record etc...

DECIMAL

  VARIABLE P               \ holds the index of the DATA record to read

\ Instead of reading all the bytes into a string, we will just return the 
\ address of the data we want to use to the stack.

( some complicated languages call this "a pointer' but it's just a )
( memory address)

: READ ( -- addr )         \ returns the address of next 8 bytes of data
          P @ DATA +       \ fetch value of P, add to base address of data
          8 P +! ;         \ advance 'p' by 8, ie to the next pattern record

\ *****************************************************************
\ *NOTICE* READ has no protection. You could read past the end.
\          If you want protection in Forth you make it yourself.
\ *****************************************************************

: RESTORE ( -- ) P OFF ;   \ just reset the data pointer variable to zero

\ ==============================================================

\   == FORTH VERSION      == BASIC VERSION ===
DECIMAL
: READ-DATA
     104 40 DO             \ 110 FOR I=40 TO 103
        READ               \ 120 READ A$
       ( addr) I CHARDEF   \ 130 CALL CHAR(A,A$)( Forth loop index is 'I')
     LOOP  ;               \ 140 NEXT I

\ Even though Forth reads this data 20 times faster than BASIC
\ we would NEVER load VDP memory with a DO LOOP when we have VWRITE.
\ VWRITE is written in assembler. We can transfer all the DATA
\ at once to VDP "pattern descriptor table" called ]PDT 2X faster

                     \ source   dest.   byte-cnt
: NEW-PATTERNS  ( -- )  DATA   40 ]PDT   64 8*   VWRITE ;  \ 4.7x FASTER!

\ this is a very BASIC way to write to the screen
: SHOW-FACE
     8 0 DO                \ 150 FOR J=0 TO 7
       8 0 DO              \ 160 FOR I=0 TO 7
                           \ 170 CALL HCHAR(J+8,I+12,40+J*8+I)
            I 12 +   J 8 +   40 J 8* + I +  1 HCHAR
       LOOP                \ 180 NEXT I
     LOOP ;                \ 190 NEXT J


\ We made our own very fast "DISPLAY-AT"
\ called VDPTYPE


\ Here is the Forth way to DRAW the face without loops. 20x FASTER
: FAST-FACE  ( -- )
         S" ()*+,-./"  0  8 VDPTYPE
         S" 01234567"  0  9 VDPTYPE
         S" 89:;<=>?"  0 10 VDPTYPE
         S" @ABCDEFG"  0 11 VDPTYPE
         S" HIJKLMNO"  0 12 VDPTYPE
         S" PQRSTUVW"  0 13 VDPTYPE
         S" XYZ[\]^_"  0 14 VDPTYPE
         S" `abcdefg"  0 15 VDPTYPE ;

\ add BREAK to Forth that restores graphics like BASIC. 
\ ?TERMINAL tests for FCTN 4
: *BREAK*   ?TERMINAL IF  CR ." *BREAK*"  CHARSET  8 SCREEN  ABORT  THEN ;

: FACES
      17 3 DO              \ 200 FOR I=3 TO 16
          PAGE             \ added so you can see FAST-FACE write to screen
          I SCREEN         \ 210 CALL SCREEN(I)
          500 MS
          SHOW-FACE        \ this is the slow method
          FAST-FACE        \ This is the fast way
          500 MS           \ 220 CALL SOUND(2000,44733,0)
                           ( sound used for delay in BASIC)
          *BREAK*          \ Forth has no automatic BREAK key
      LOOP  ;              \ 230 NEXT I

\ *CAMEL99 Forth has 'MS' which delays, so we don't need CALL SOUND

: RUN
     GRAPHICS              \ we have to change to 32 col graphics mode
     S" VDPTYPE  | DO/LOOP HCHAR" 1 7 VDPTYPE
     1500 MS
     BEGIN
       RESTORE             \ we need RESTORE if we run more than once
       READ-DATA
\       NEW-PATTERNS       \ faster method to set characters
       FACES
       ?TERMINAL
     UNTIL
     8 SCREEN         \ restore default stuff
     4 19 2 1 COLORS
     CHARSET ;

\ Test these with ELAPSE T1    ELAPSE T2
DECIMAL
: T1    100 0 DO  RESTORE READ-DATA  LOOP   CHARSET ;

: T2    100 0 DO  NEW-PATTERNS LOOP   CHARSET ;
