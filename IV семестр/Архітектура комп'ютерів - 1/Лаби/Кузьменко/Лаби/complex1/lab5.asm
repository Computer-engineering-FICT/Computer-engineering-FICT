link l1: ct
link l2: rdm
link ewh:16
link m:z,z,15,14,13,12,11,z,z,z,z,z
dw 0:4430h
dw 1:4430h
dw 2:4430h
dw 3:4430h
dw 4:4h
dw 30h:4h

accept r15:0bh
accept r7:0

org 20h


NEXT {ADD NIL, R7, Z; OEY; EWL;}

{R; CJP RDM, CP; ADD R8, BUS_D, Z;}

{ADD NIL, R8, Z; CJP NO, end;}

 {XOR R9, R9, R9;}
 {ADD R9, R9, 0400h;}

{AND NIL, R9, R8; CJP ZO, end;}
 {XOR R9, R9, R9;}
 {ADD R9, R9, 03FFh;}
 {AND NIL, R9, R8; OEY; EWL;}

 {R; CJP RDM, CP; ADD R12, BUS_D, Z;}
 {ADD NIL, R12, Z; OEY; EWL;}
 {R; CJP RDM, CP; ADD R13, BUS_D, Z;}
 {ADD NIL, R8, Z; OEY; JMAP;}

RETURN {ADD R7, R7, Z, NZ; CJP NZ, NEXT;}

org 100h

 {LOAD RM, Z;}
 {XOR R14, R14, R14;}
 {XOR R10, R10, R10;}
 {XOR R11, R11, R11;}
 {XOR R12, R12, R12;}

 {OR NIL, R13, Z; CJP NOT NO, NOT2;}
 {ADD R14, R14, 1, Z;}
 {SUB R13, Z, R13, NZ;}
NOT2 {OR NIL, R15, Z; CJP NOT NO, shift;}

 {SUB R14, R14, Z, Z;}
 {SUB R15, Z, R15, NZ;}

 shift{OR SRL, R13, R13, Z;}
 {OR SR.9, R12, R12, Z;}

cycle {OR SLL, R15, R15, Z; CJP NOT RM_C, noadd;}

 {ADD R11, R11, R12, Z; LOAD RM, FLAGS;}
 {ADD R10, R10, R13, RM_C;}
noadd {OR SRL, R13, R13, Z;}
 {OR SR.9, R12, R12, Z;}

 {OR NIL, R15, R15; CJP NOT ZO, cycle;}

 {AND R14, R14, R14; CJP ZO, noinvert;}

 {ADD R10, R10, 8000h, Z;}

noinvert {ADD R14, R10, Z, Z;}
 {ADD R15, R11, Z, Z;}
        {CJP NZ, RETURN;}
end {}
