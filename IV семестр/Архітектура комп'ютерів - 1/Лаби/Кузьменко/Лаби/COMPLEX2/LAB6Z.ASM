link l1: ct
link l2: rdm
link l3:rdd
link ewh:16
link m:z,14,13,12,11,z,z,z,z,z,z,z
link ra:z,2,1,0

link rb:z,7,6,5
\------------commands------------\
dw 0:0001100001010000%         \ mult
dw 1:1000000000100010%         \ plus (2 adr)
dw 2:0010000000001110%         \ cond jump
dw 3:0010100000001111%
dw 4:0000010000000000%
\----------const M----------------\
dw 1110%: 3
dw 1111%: 0
dw 50h:2
dw 51h:1
dw 52h:4
\------------------ZP----------------\
accept dev[1]:i, 32h, 34h, 3, 16
accept dev[2]:o, 0b2h, 0b4h, 3, 16
accept dev_buf[1]: 0001h
\------accepting registers---------\
accept r0:0000h
accept r1:0
accept r2:1
accept r3:0100h
accept r4:1000h
accept r5:0000h
accept r6:0000h

accept r14:0        \Yh,Rh
accept r15:1      \Yl,Rl
accept r7:0         \counter
\------------program begin---------\
org 10h
NEXT {add nil,r7,z; OEY; EWL;}
{R; CJP RDM, CP; ADD R8, BUS_D, Z;}       \reading of command
{ADD NIL, R8, Z; CJP NO, doubleAdr;}      \N
\one adr
       {XOR R9, R9, R9;}                  \ TA
       {ADD R9, R9, 0400h;}
       {AND NIL, R9, R8; CJP not ZO, end;}

       {XOR R9, R9, R9;}                  \ r12 <- M
       {ADD R9, R9, 03FFh;}
       {AND NIL, R9, R8; OEY; EWL;}
       {R; CJP RDM, CP; ADD R12, BUS_D, Z;}

       {ADD nil,r8,z;oey;JMAP;}
doubleAdr{xor R9,R9,R9;}                     \TA
       {and R9,R8,0318h;LOAD RM, FLAGS;}
       {cjp not RM_Z, end;}

       {or nil,r8,z;oey;LOAD RA;LOAD RB;}


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
       {and nil, r15, r9; cjp NOT ZO, end;}
       {or r7, r12, z;}
       {cjp nz, next;}
\-----------unconditional jump------\
org 001010000000%
       {or r7, r12, z;}
       { cjp nz, next;}
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
end {}
