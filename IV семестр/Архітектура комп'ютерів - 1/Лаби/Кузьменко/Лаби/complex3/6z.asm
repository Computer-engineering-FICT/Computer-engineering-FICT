Link l3: ct
link l2:rdm
link ewh:16
link ra:Z,2,1,0
link rb:Z,7,6,5

accept r7:0h
accept r11:0h
accept r9:0h

accept r2:1h
accept r1:0h
accept r15:1h

dw 1h:0000100000000111%
dw 2h:1000010000100010%
dw 3h:0001000000000000%
dw 4h:0001100000000000%
dw 5h:8000h

dw 7h:2h

beg {ADD R7, R7, Z, NZ;}
{add nil,r7,z;oey;ewl;}
{r;cjp rdm, cp; add r8, bus_d,z;}
{add nil, r8,z; cjp no,TWOADR;}
{xor r9,r9,r9;}
{add r9,r9,400h;}
{and nil,r9,r8; cjp not zo,end;}
{xor r9,r9,r9;}
{add r9,r9,3ffh;}
{and nil,r9,r8; oey;ewl;}
{r;cjp rdm,cp;add r10,bus_d,z;}

{AND NIL, R8, 7000h; LOAD RM, FLAGS;}
{CJP RM_Z, pv1;}
{XOR NIL, R8, 1000h; LOAD RM, FLAGS;}
{CJP RM_Z, uJUMP;}
{XOR NIL, R8, 1800h; LOAD RM, FLAGS;}
{CJP RM_Z, jump;}

TWOADR {OR R9, 0300h, Z;}
 {AND NIL, R9, R8; CJP NOT ZO, END;}
 {OR R9, 0018h, Z;}
 {AND NIL, R9, R8; CJP NOT ZO, END;}

 {OR NIL, R8, Z; OEY; LOAD RA; LOAD RB;}
 {AND r12, R8, 7C00h;}
 {XOR NIL, r12, 0400h;LOAD RM, FLAGS;}
 {CJP RM_Z, ADDING;}
 {CJP NZ, end;}

pv1 {xor r11,r11,r11;}
 {xor r9,r9,r9;}
 {AND NIL, R10, R14; LOAD RM, FLAGS; CJP RM_Z, sh;}
 {AND R10, R10, 7FFFh;}

sh {OR SRL, R15, R15, Z;}
 {OR SR.9, R9, R9, Z;}

main {OR SLL, R10, Z; CJP NOT RM_C, no_adding;}
 {ADD R11, R11, R9, Z; LOAD RM, FLAGS;}
 {ADD R3, R3, R15, RM_C;}

no_adding {OR SRL, R15, R15, Z;}
 {OR SR.9, R9, R9, Z;}
 {OR NIL, R10, R10; CJP NOT ZO, main;}
 {AND R15,R11,0FFFFh;}
 {CJP NZ, beg;}

 {XOR R11,R11,0FFFFh;}
 {ADD R11,R11,1,Z;}
 {XOR R3,R3,0FFFFh;}

ADDING {ADD RB, RB, RA, Z; CJP NZ, beg;}

jump {xor r7,r7,r7;}
  {CJP NZ, beg;}

uJUMP {AND NIL, R15, 0080h; LOAD RM, FLAGS;}
 {CJP RM_Z, beg;}

 {xor r7,r7,r7;}
 {add r7,r7,5,z;}
 end {}
