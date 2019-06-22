link l3: ct
accept r11:0
accept r3:0
accept r9:0
accept r1:7h
accept r10:0FFFBh

 {LOAD RM, Z;}
 {AND NIL, R1, 8000h; LOAD RM, FLAGS;}
 {CJP RM_Z, NOT2;}
 {ADD R2, R2, 1, Z;}
 {XOR R1, R1, 0FFFFh;}
 {ADD R1, R1, 1, Z;}
  NOT2 {AND NIL, R10, 8000h; LOAD RM, FLAGS;}
 {CJP RM_Z, shift;}
 {XOR R10, R10, 0FFFFh;}
 {SUB R2, R2, Z, Z;}
 {ADD R10, R10, 1, Z;}
shift {OR SRL, R1, R1, Z;}
 {OR SR.9, R9, R9, Z;}
cicle {OR SLL, R10, Z;}
 {CJP NOT RM_C, noadd;}
 {ADD R11, R11, R9, Z; LOAD RM, FLAGS;}
 {ADD R3, R3, R1, RM_C;}
noadd {OR SRL, R1, R1, Z;}
 {OR SR.9, R9, R9, Z;}
 {OR NIL, R10, R10; CJP NOT ZO, cicle;}
 {AND R2, R2, R2; CJP ZO, end;}
 {ADD R3, R3, 8000h, Z;}
end {}
