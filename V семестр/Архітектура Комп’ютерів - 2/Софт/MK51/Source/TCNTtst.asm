R1b1 equ 0.3
mov acc,#1
cpl c		
;db #55h	

mov psw.3, C
mov psw.4,c
SJmp Start

Org 0bh
LT0:
Djnz R2,LT0
Mov TMOD,0
RetI

Org 1bh
LT1:
DJnz R3,LT1
Reti

Org 23h
Start:
Mov Dph,#54h
Mov dpl,#33h
MovX @dptr,A
Mov R1,#44h
Movx @R1,A
Mov A,1
Mov P1,A
Mov Th1,#1h
Mov Th0,#50h
Mov IE,0FFh
Cpl PT0

mov tmod,#00110011b

cpl tr0
cpl tr1

L1:
Mov C,TF1

Djnz R1,L1
jnc L1
Exit1:
end


org 100h
nop