\--macros
macro rst reg: {xor reg, reg, reg;}

\--registers
ACCEPT R14: 0h
ACCEPT R15: 0h
ACCEPT R7: 0121h \command counter

ACCEPT R1: 010h
ACCEPT R2: 020h

accept dev[2]:o, 0F2h, 0F4h, 3, 12
accept dev[1]:i, 072h, 074h, 3, 12
accept dev_buf[1]: 5h, 2h, 4h

\-- memory
DW 010h: 03h
DW 020h: 04h

DW 03h: 02h
DW 05h: 0fff6h
DW 07h: 0fffeh

DW 0121h: 04472h \in
DW 0123h: 02403h \multÿ
DW 0125h: 03C07h \cond
DW 0127h: 0852ah \subÿ
DW 0129h: 04CF2h \out
\DW 012Bh: 03405h

\-- linking
LINK L1: CT
LINK L2: RDM
link l3: rdd
link ewh:16
LINK RA: 3, 2, 1, 0
LINK RB: 8, 7, 6, 5
LINK M: z, 14, 13, 12, 11, 10, z, z, z, z, z, z
org 000000000000%
next
\-- get adress of command in RA
{ADD NIL, R7, z; OEY; EWL;}
\-- get command in RK
{R; ADD R8, BUS_D, z; CJP RDM, CP;}

\--get FK
{rst R9;}
{ADD R9, R9, 08000h;}
{AND R9, R9, R8; CJP NOT zo, dfk;}

\-- get TE

{rst R9;}
{ADD R9, 0400h, z;}
{AND NIL, R9, R8; CJP zo, end;}

\-- load operand
{rst R9;}
{ADD R9, R9, 3ffh;}
{AND R9, R8, R9;}
{ADD NIL, R9, z; OEY; EWL;}
{R; ADD R13, BUS_D, z; CJP RDM, CP;}

{ADD NIL, R8, z; OEY; JMAP;}\4400,4C00
{}

dfk
\-- get TA
{rst R9;}
{ADD R9, R9, 0400h;}
{AND R9, R9, R8; CJP zo, end;}

{rst R9;}
{ADD R9, R9, 0100h;}
{AND R9, R9, R8; CJP zo, end;}

{rst R9;}
{ADD R9, R9, 08h;}
{AND R9, R9, R8; CJP zo, end;}

\-- load operand
{XOR R8, R8, 08h;}
{ADD NIL, R8, z; OEY; EWA;}
{ADD NIL, RA, z; OEY; EWL;}
{R; ADD R10, BUS_D, z; CJP RDM, CP;}
\-- load operand
{XOR R8, R8, 0100h;}
{ADD NIL, R8, z; OEY; EWB;}
{ADD NIL, RB, z; OEY; EWL;}
{R; ADD R13, BUS_D, z; CJP RDM, CP;}

\-- go for KO
{ADD NIL, R8, z; OEY; JMAP;}

\-- multiply
ORG 001001000000%
{rst r3;}
{add r3,r3,17,z;}
label1 {cjp not rm_c,label2;}
{add r14,r14,r13,z;}
label2 {or srl,r14,r14,z;}
{or sr.9,r15,r15,z;}
{sub r3,r3,z,z;load rm,flags;cem_c;}
{cjp not rm_z, label1;}

{CJP nz, inc;}
\-- substractÿ
ORG 000001000000%
{SUB R10, R10, R13, nz;}
{CJP nz, save;}

\--no cond
ORG 001101000000%
{add R7, R7, R13, z;jmap next;}

\-- cond
ORG 001111000000%
{rst r9;}
{ADD R9, R9, 0080h;}
{AND R9, R9, R15; CJP not zo, inc;}
{add R7, R7, R13, z;jmap next;}

\-- input
ORG 010001000000%
input {and r9, r8, 03ffh;}
 {or nil, r9, z; oey; ewl; push;}
 {i; cjp rdd, cp; or r10, bus_d, z;}
 {and nil, r10, 0080h; loop not zo;}
 {add r9, r9, 0002h;}
 {or nil, r9, z; oey; ewl;}
 {i; cjp rdd, cp; or r15, bus_d, z;}
 {cjp nz, inc;}

 \-- output
ORG 010011000000%
output {and r9, r8, 03ffh;}
 {or nil, r9, z; oey; ewl; push;}
 {i; cjp rdd, cp; or r10, bus_d, z;}
 {and nil, r10, 0080h; loop not zo;}
 {add r9, r9, 0002h;}
 {or nil, r9, r9; oey; ewl;}
 {or nil, r15, z; oey; o; cjp rdd, cp;}
 {cjp nz, inc;}

\-- operand to memory
save
{XOR R9, R9, R9;}
{ADD R9, R9, 0000000011100000%;}
{AND NIL, R9, R8; OEY; EWL;}
{W; ADD NIL, Z, R10; OEY; CJP RDM, CP;}

\-- increment of commad counter
inc
{ADD R7, R7, 02h;}
{CJP nz, next;}
end
{}
