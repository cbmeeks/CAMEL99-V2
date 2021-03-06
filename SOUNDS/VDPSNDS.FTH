\ VDP sound list examples

HEX
VCREATE MUNCHMAN
       VBYTE 08,85,2A,90,A6,08,B0,CC,1F,12
       VBYTE 08,85,2A,90,A4,1C,B0,C9,0A,12
/VEND

VCREATE PACMAN
       VBYTE 06,86,0D,97,AC,1A,B7,08
       VBYTE 02,8F,08,02
       VBYTE 02,AB,23,05
       VBYTE 02,86,0D,04
       VBYTE 01,BF,03
       VBYTE 02,8E,0B,08
       VBYTE 02,8A,0A,02
       VBYTE 03,AC,1A,B7,08
/VEND

VCREATE NOKIA
       VBYTE 01,9F,20
       VBYTE 03,90,85,05,09
       VBYTE 02,8F,05,09
       VBYTE 02,87,09,12
       VBYTE 02,87,08,12
       VBYTE 02,85,06,09
       VBYTE 02,81,07,09
       VBYTE 02,8E,0B,12
       VBYTE 02,8A,0A,12
       VBYTE 02,81,07,09
       VBYTE 02,8F,07,09
       VBYTE 02,8A,0C,12
       VBYTE 02,8A,0A,12
       VBYTE 02,8F,07,24
       VBYTE 01,9F,00,
/VEND

\ sound lists from Parsec source code
VCREATE SHPSND
       VBYTE 4,DF,FF,93,63,1
       VBYTE 4,80,3F,AE,3E,60
/VEND

VCREATE EXPLODE
       VBYTE 7,9F,BF,DF,E7,F0,C0,07,5
       VBYTE 1,F1,6
       VBYTE 1,F2,7
       VBYTE 1,F3,8
       VBYTE 1,F4,9
       VBYTE 1,F5,10
       VBYTE 1,F6,11
       VBYTE 1,F7,12
       VBYTE 1,F8,13
       VBYTE 1,F9,14
       VBYTE 1,FA,15
       VBYTE 1,FB,16
       VBYTE 1,FC,17
       VBYTE 1,FD,18
       VBYTE 1,FE,30
       VBYTE 1,FF,0
/VEND

VCREATE FIRE
       VBYTE 4,9A,BF,DF,FF,1
       VBYTE 3,80,0A,98,1
       VBYTE 3,80,0C,96,1
       VBYTE 3,80,10,94,1
       VBYTE 3,80,14,92,1
       VBYTE 3,80,18,90,1
       VBYTE 3,80,1C,92,1
       VBYTE 3,80,20,94,1
       VBYTE 3,80,28,96,1
       VBYTE 3,80,30,98,1
       VBYTE 3,80,38,9A,1
       VBYTE 3,80,3E,9C,1
       VBYTE 1,9F,0
/VEND

VCREATE FIRE2
       VBYTE 4,90,BF,DF,FF,1
       VBYTE 3,80,0A,98,1
       VBYTE 3,80,0C,96,1
       VBYTE 3,80,10,94,1
       VBYTE 3,80,14,92,1
       VBYTE 3,80,18,90,1
       VBYTE 3,80,1C,92,1
       VBYTE 3,80,20,94,1
       VBYTE 3,80,28,96,1
       VBYTE 3,80,30,98,1
       VBYTE 3,80,38,9A,1
       VBYTE 3,80,3E,9C,1
       VBYTE 1,9F,0
/VEND

VCREATE CHIME
       VBYTE 10,8B,01,A4,02,C5,01,FF,9C,BE,DE,5
       VBYTE 4,A4,02,9E,BC,7
       VBYTE 3,A7,04,BC,5
       VBYTE 3,A4,02,BC,7
       VBYTE 8,8B,01,A4,02,C5,01,9C,BE,5
       VBYTE 4,A4,02,9E,BC,7
       VBYTE 3,A7,04,BC,5
       VBYTE 3,A4,02,BC,7
       VBYTE 8,8B,01,A4,02,C5,01,9C,BE,5
       VBYTE 4,A4,02,9E,BC,7
       VBYTE 3,A7,04,BC,5
       VBYTE 3,A4,02,BC,7
/VEND

VCREATE SW1SND
       VBYTE 4,99,B9,DF,FF,1
       VBYTE 4,80,20,A2,20,10
       VBYTE 4,80,21,A2,21,8
       VBYTE 4,80,22,A2,22,6
       VBYTE 4,80,23,A2,23,4
       VBYTE 4,80,24,A2,24,2
/VEND

VCREATE SW2SND
       VBYTE 4,96,FB,DF,FF,1
       VBYTE 2,80,30,3
       VBYTE 2,80,31,3
       VBYTE 2,80,32,3
       VBYTE 2,80,33,3
       VBYTE 2,80,34,3
       VBYTE 2,80,35,3
       VBYTE 2,80,36,3
       VBYTE 2,80,37,3
       VBYTE 2,80,38,3
       VBYTE 2,80,39,3
       VBYTE 2,80,3A,3
       VBYTE 2,80,38,3
       VBYTE 2,80,3C,3
       VBYTE 2,80,3D,3
       VBYTE 2,80,3E,3
       VBYTE 2,80,3F,3
/VEND

VCREATE SND123
       VBYTE 4,98,B8,DF,FF,1
       VBYTE 4,80,03,A0,11,1
       VBYTE 4,80,05,A0,0F,1
       VBYTE 4,80,07,A0,0D,1
       VBYTE 4,80,09,A0,0B,1
       VBYTE 4,80,0B,A0,09,1
       VBYTE 4,80,0D,A0,07,1
       VBYTE 4,80,0F,A0,05,1
       VBYTE 4,80,11,A0,03,1
/VEND


VCREATE SND4
       VBYTE 4,98,BF,DF,FF,1
       VBYTE 2,80,07,1
       VBYTE 2,80,06,1
       VBYTE 2,80,05,1
       VBYTE 2,80,04,1
       VBYTE 2,80,05,1
       VBYTE 2,80,06,1
       VBYTE 2,80,05,1
       VBYTE 2,80,04,1
       VBYTE 2,80,03,1
       VBYTE 2,80,02,1
       VBYTE 2,80,01,1
       VBYTE 1,9F,0
/VEND

VCREATE FUEL
       VBYTE 6,BF,DF,FF,80,38,93,6
       VBYTE 2,80,36,6
       VBYTE 2,80,34,6
       VBYTE 2,80,32,6
       VBYTE 3,80,30,95,6
       VBYTE 2,80,2E,6
       VBYTE 2,80,2C,6
       VBYTE 2,80,2A,6
       VBYTE 2,80,28,6
       VBYTE 2,80,27,6
       VBYTE 2,80,26,6
       VBYTE 2,80,25,6
       VBYTE 2,80,24,6
       VBYTE 2,80,23,5
       VBYTE 2,80,22,5
       VBYTE 3,80,21,97,4
       VBYTE 2,80,20,4
       VBYTE 2,80,1F,4
       VBYTE 2,80,1E,3
       VBYTE 2,80,1D,3
       VBYTE 2,80,1C,3
       VBYTE 2,80,1B,3
       VBYTE 2,80,1A,3
       VBYTE 2,80,19,3
       VBYTE 2,80,18,3
       VBYTE 2,80,17,3
       VBYTE 2,80,16,3
       VBYTE 2,80,15,3
       VBYTE 2,80,14,3
       VBYTE 2,80,13,3
       VBYTE 2,80,12,3
       VBYTE 2,80,11,3
       VBYTE 2,80,10,3
/VEND


: QALL   MUNCHMAN >SNDQ  PACMAN >SNDQ
         SHPSND >SNDQ
         FIRE     >SNDQ  FIRE2  >SNDQ  EXPLODE >SNDQ
         CHIME    >SNDQ  SW1SND >SNDQ
         SW2SND   >SNDQ  SND123 >SNDQ  
         SND4     >SNDQ  FUEL   >SNDQ  
         EXPLODE >SNDQ 
         NOKIA >SNDQ ;

