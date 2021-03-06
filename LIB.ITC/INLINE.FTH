\ inline.fth  a simple speedup for ITC FORTH July 2017  B Fox
\ **not portable Forth code**  Uses TMS9900/CAMEL99 CARNAL Knowledge

\ INCLUDE DSK1.CODE.F   \ now part of the KERNEL

HEX
\ CFA of a code word contains the address of the next cell
: ?CODE ( cfa -- ) DUP @ 2- - ABORT" Not code word" ;

\ scan MACHINE code looking for the NEXT, routine.
\ abort if NEXT is not found after 256 bytes. This is an arbitrary size
\ but most Forth code words are much smaller than 256 bytes.
: TONEXT ( adr --  adr2 )
           0                \ flag that falls thru if we don't succeed
           SWAP
         ( ADR) 80         \ max length of code word is $80 CELLS
           BOUNDS
           DO
             I @  045A  =   \ test each CELL for CAMEL99 NEXT (B *R10)
             IF   DROP I LEAVE
             THEN
           2 +LOOP
           DUP 0= ABORT" no NEXT" ;

\ create code words using primitives
: INLINE[   ( <TEXT>)
            BEGIN
              BL PARSE-WORD PAD PLACE
              PAD CHAR+ C@ [CHAR] ] <>
            WHILE
              PAD FIND 0= ABORT" INLINE err"
              DUP ?CODE
              >BODY DUP TONEXT OVER  -     \ calc. start and len. of code
              HERE OVER ALLOT SWAP CMOVE   \ transcribe the code to HERE
           REPEAT ;

\ ===================================

\ EXAMPLES
\ CODE ^2      INLINE[  DUP *  ] NEXT, ENDCODE
\ CODE DUPC@   INLINE[  DUP C@ ] NEXT, ENDCODE
\ CODE DUP>R   INLINE[  DUP >R ] NEXT, ENDCODE
\ CODE X@      X @,              NEXT, ENDCODE


