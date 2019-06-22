link l1: ct
link l2: rdm
link ewh:16
link m:z,14,13,12,11,z,z,z,z,z,z,z
link ra:z,2,1,0

link rb:z,7,6,5
\------------commands------------\
dw 0:0001000000000000%         \ cond jump
dw 1:0001100001010000%         \ mult
dw 2:1000110000100010%         \ plus (2 adr)
dw 3:0000100000000000%         \ uncond jump
\----------const M----------------\
dw 50h:500
dw 51h:1
dw 52h:500
\------accepting registers---------\
accept r0:0000h
accept r1:0001h
accept r2:0010h
accept r3:0100h
accept r4:1000h
accept r5:0000h
accept r6:0000h

accept r14:0        \Yh,Rh
accept r15:0100010100001000%      \Yl,Rl
accept r7:0         \counter
\------------program begin---------\
org 10h
NEXT {ADD NIL, R7, Z; OEY; EWL;}
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
\----------codition jump-----------\
org 000100000000%
       {xor r9, r9, r9;}
       {add r9, r9, 0000000001000000%;}
       {and nil, r15, r9; cjp NOT ZO, RETURN;}
       {xor r9, r9, r9;}
       {add r9, r9, 0000000000001111%;}
       {and nil, r9, r8; OEY; JMAP;}
\-----------unconditional jump------\
org 000010000000%
       {xor r9,r9,r9;}
       {add nil, r9, 000100000000%;OEY; JMAP;}
end {}
