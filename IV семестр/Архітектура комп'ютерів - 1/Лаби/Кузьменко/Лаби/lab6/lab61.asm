link l1: ct
link l2: rdm
link l3: rdd
link ra:z,2,1,0
link rb:z,7,6,5
link ewh:16
link m:z,z,15,14,13,12,11,10,z,z,z,z

\dw 0: 7800h
\dw 0: 6830h
\dw 1: 780Ah
\dw 2: 3000h
\dw 4: 8FBEh
\dw 5: 8FBEh
dw 0: 703Ah
\dw 1: 703Bh
dw 1: 483Bh
\dw 0Ah: 0Bh
dw 2h:  8000h

dw 30h:2h
dw 31h:4h
dw 40h:  1111h
dw 3fh:  0111h
dw 3dh:  0011h
dw 3bh:  0001h
dw 39h:  0000h
dw 3Ah:  0012h
dw 3Bh:  0092h

accept dev[1]:i, 12h, 13h, 3, 16
accept dev[2]:o, 92h, 93h, 3, 16
accept dev_buf[1]: 1234h

accept r7:0
accept r6:40h
accept r5:41h
accept r15:1h

NEXT {ADD NIL, R7, Z; OEY; EWL;}
{R; CJP RDM, CP; ADD R8, BUS_D, Z;}
{add r7,r7,1;}
{ADD NIL, R8, Z; CJP NO, Twoadr;}
{ADD NIL, R8, Z; CJP NO, end;}

 {XOR R9, R9, R9;}
 {ADD R9, R9, 0400h;}
{AND NIL, R9, R8; CJP not ZO, end;}
 {XOR R9, R9, R9;}    \очищаем R9
 {ADD R9, R9, 03FFh;}   \ставим маску на последние 10 бит (биты адреса)
 {AND NIL, R9, R8; OEY; EWL;}
 {R; CJP RDM, CP; ADD R13, BUS_D, Z;}
 {or nil, r7,z;oey;ewl;}

{ADD NIL, R8, Z; OEY; JMAP;}


Twoadr {and r9,r8,0318h;}
{xor nil,r9,0318h;load rm,flags;}
{cjp not rm_z,end;}
{or nil,r8,z;oey;load ra; load rb;}
{or nil,ra,z;oey;ewl;}
{r;cjp rdm,cp; or r1, bus_d,z;}
{or r2,2,z;}
{sub rb,rb,r2,nz;}
{xor r2,r2,r2;}
{or nil,rb,z;oey;ewl;}
{r;cjp rdm,cp; or r2, bus_d,z;}
{ADD NIL, R8, Z; OEY; JMAP;}
RETURN {CJP NZ, NEXT;}

org 1a0h

{load rm, z;}
 {XOR R10, R10, R10;}
 {XOR R11, R11, R11;}
 {XOR R12, R12, R12;}
{xor r4,r4,r4;}
{add r4,r4,10h;}
{add r11,r11,r15;}
{or r13, r13, r13;load rm, flags; cjp not rm_n, chek;}
{add r12, r12, 1, z;}
{and r13, r13, 7fffh;}
chek{or r15, r15, r15;load rm, flags; cjp not rm_n, start;}
{xor r12, r12, 1;}
{and r15, r15, 7fffh;}
{and r11, r11, 7fffh;}

start {and nil, r13, 8000h; load rm, flags;}
{cjp rm_z, shift;}
{add r15, r15, r11, z; load rm, flags;}
{add r14, r14,z, rm_c;}
shift{or sll, r13,r13,z;}
                                                                                                          {xor r14,r14,r14;and r15,r15,7fffh;}
{sub r4, r4, z, z; load rm, flags; cjp rm_z, setSign;}
{or sl.16, r15, r15, z;}
{or sl.25, r14, r14, z;cjp nz, start;}

setSign {or nil, r12, r12; load rm, flags; cjp rm_z, return;}

{xor r14, r14, 0ffffh;}
{xor r15, r15, 0ffffh;}
{add r15, r15, 1, z;}
{CJP NZ, RETURN;}

ORG 230h

{and r1,r1,r2;}
{or nil,ra,z;oey;ewl;}
{w;cjp rdm,cp; or r1,r1;oey;}
{xor r1,r1,r1;}
{cjp nz,return;}

org 0C0h
{XOR R7,R7,R7;}
{cjp nz, NEXT;}

org 1E0h
{AND NIL, r15, 0080h; LOAD RM, FLAGS;}
{cjp rm_z, next;}
{xor r7,r7,r7;}
{ADD r7,r7,r13;}
{CJP NZ, next;}



org 1C0h
input {or nil, r13, z; oey; ewl; push;}
{i; cjp rdd, cp; or r12, bus_d, z;}
{and nil, r12, 0080h; loop not zo;}
{add r13, r13, 0001h, z;}
{or r13, r13, z; oey; ewl;}
{i; cjp rdd, cp; or r15, bus_d, z;}
{cjp nz, NEXT;}

org 120h
output {or nil, r13, z; oey; ewl; push;}
{i; cjp rdd, cp; or r12, bus_d, z;}
{and nil, r12, 0080h; loop not zo;}
{add r13, r13, 0001h, z;}
{or r13, r13, z; oey; ewl;}
{or nil, r15, z; oey; o; cjp rdd, cp;}
{cjp nz, NEXT;}


end {}
