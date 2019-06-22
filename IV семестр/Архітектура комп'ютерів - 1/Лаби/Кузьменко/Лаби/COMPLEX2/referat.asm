link l1: ct
link l2: rdm
link l3:rdd
link ewh:16
link m:z,14,13,12,11,z,z,z,z,z,z,z
link ra:z,2,1,0

link rb:z,7,6,5
\------------commands------------\
dw 0:0011000000110010%         \ read from ZP1
dw 1:0111100000000000%         \ r15 -> r0
dw 2:0011000001000010%         \ read from ZP2
dw 3:0111100000100000%         \ r15 -> r1
dw 4:1000000000100000%         \ r1 = r1 + r0
dw 5:0100100000000001%         \ r1 -> r15
dw 6:0011100010110010%         \ ZP3 = ZP1 + ZP2
dw 7:0000111111111111%
\----------const M----------------\
dw 50h:500
dw 51h:1
dw 52h:4
\------------------ZP----------------\
accept dev[1]:i, 32h, 34h, 3, 16
accept dev[2]:i, 42h, 44h, 3, 16
accept dev[3]:o, 0b2h, 0b4h, 3, 16
accept dev_buf[1]: 1
accept dev_buf[2]: 2
\------accepting registers---------\
accept r0:0
accept r1:0
accept r2:0
accept r3:0
accept r4:0
accept r5:0
accept r6:0

accept r14:0        \Yh,Rh
accept r15:0      \Yl,Rl
accept r7:0         \counter
\------------program begin---------\
org 10h
NEXT {ADD NIL, R7, Z; OEY; EWL;}
{R; CJP RDM, CP; ADD R8, BUS_D, Z;}       \reading of command
{ADD NIL, R8, Z; CJP NO, doubleAdr;}      \N
\one adr
       {XOR R9, R9, R9;}                  \ TA
       {ADD R9, R9, 0200h;}
       {AND NIL, R9, R8;load rm, flags;}
       { CJP not RM_Z, end;}

       {XOR R9, R9, R9;}                  \ r12 <- M
       {ADD R9, R9, 03FFh;}
       {AND NIL, R9, R8; OEY; EWL;}
       {R; CJP RDM, CP; ADD R12, BUS_D, Z;}

       {ADD nil,r8,z;oey;JMAP;}
doubleAdr{xor R9,R9,R9;}                     \TA
       {and R9,R8,0318h;LOAD RM, FLAGS;}
       {cjp not RM_Z, end;}

       {or nil,r8,z;oey;LOAD RA;LOAD RB;}

       {xor R9,R9,R9;}              \mComand
       {and R9,R8,7C00h;LOAD RM,FLAGS;}    \?
       {cjp not RM_Z,end;}

       {add nil,r8,z;oey;JMAP;}

RETURN{ADD R7,R7,z,nz; cjp nz, NEXT;} \ R7 := R7+1
\-----------begin mult-----------\
org 000110000000%
       {xor r9,r9,r9;}
       {xor r10,r10,r10;}
       {or r14,z,r15;}
       {xor r15,r15,r15;}
       {load rm,z;}
       {or r11,z,r12;}
       {xor r11,r11,r14;load rn,flags;}
       {or r11,z,8000h;}
       {and nil,r12,r11;load rm,flags;cjp rm_z,plus_x;}
       {sub r12,z,r12,nz;}
plus_x {and nil,r14,r11;load rm,flags;cjp rm_z,plus_y;}
       {SUB R14,z,R14,nz;}
plus_y {or srl,r14,r14,z;}            \shift
       {or sr.9,r15,r15,z;}
begin  {or sll,r12,r12,z;load rm,flags;CJP NOT RM_N, notadd;}
       {add r10,r10,r15,z;LOAD RM,FLAGS;}
       {add r9,r9,r14,RM_C;}
notadd {or srl,r14,r14,z;}
       {or sr.9,r15,r15,z;}
       {or nil,r12,r12;load rm, flags;}
       {cjp not RM_Z, begin;}
       {cjp not RN_N, endMul;}
       {ADD r9,r9,r11,z;}
endMul {or r14,z,r9;}
       {or r15,z,r10;cjp nz,RETURN;}
\----------add operation-----------\
org 000000000000%
       {add RB,RB,RA,z;cjp nz, RETURN;}
\----------condition jump-----------\
org 001000000000%
       {xor r9, r9, r9;}
       {add r9, r9, 0000000001000000%;}
       {and nil, r15, r9; cjp NOT ZO, RETURN;}
       {xor r9, r9, r9;}
       {add r9, r9, 0000000000001111%;}
       {and nil, r9, r8; OEY; JMAP;}
\-----------unconditional jump------\
org 001010000000%
       {xor r9,r9,r9;}
       {add nil, r9, 000100000000%;OEY; JMAP;}
\---------------input---------------------\
org 001100000000%
input {AND R9, R8, 03FFh;}
{or nil, r9, z; oey; ewl; push;}
{i; cjp rdd, cp; or r12, bus_d, z;}
{and nil, r12, 0080h; loop not zo;}
{add r9, r9, 0002h, z;}
{or r9, r9, z; oey; ewl;}
{i; cjp rdd, cp; or r15, bus_d, z;}
{cjp nz, RETURN;}
\----------------output-------------------\
org 001110000000%
output {AND R9, R8, 03FFh;}
{or nil, r9, z; oey; ewl; push;}
{i; cjp rdd, cp; or r12, bus_d, z;}
{and nil, r12, 0080h; loop not zo;}
{add r9, r9, 0002h, z;}
{or r9, r9, z; oey; ewl;}
{or nil, r15, z; oey; o; cjp rdd, cp;}
{cjp nz, RETURN;}
\--------------r15 <- RA ----------\
org 010010000000%
{or nil, r8, z;oey;load RA;}
{or r15, ra,z; }
{cjp nz, return;}
\--------------r15 -> RB ----------\
org 011110000000%
{or nil, r8, z; oey; load rb;}
{or rb, r15, z;}
{cjp nz, return;}
end {}
