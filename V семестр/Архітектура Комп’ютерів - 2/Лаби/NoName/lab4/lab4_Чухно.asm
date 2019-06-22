
mov r7,#2
mov R3,#0
mov R0,#2
mov R1,#12h
mov R2,#85h
mov R4,#0FCH

;reading and writing data from extend memory
met: 
mov A,@R0
movx @R1,A
movx A,@R1
mov @R0,A
inc R1
inc R0
inc R0
djnz R7,met

;analizing of operands
mov A,R2
xrl A,R4
Anl A,#10000000b
mov R6,A;sign of result

;X
mov A,R2
clr c
rlc A
jnc plus
mov A,R2
anl A,#01111111b
mov R2,A
plus:


;y
mov A,R4
clr c
rlc A
jnc plus2
Mov A,R4
dec A
cpl A
mov R4,A
plus2: 


;multiply
mov R0,#0
mov R1,#0

loop:
clr C
mov A,R2
RRC A
Mov R2,A
jnc skok
clr C
Mov A,R1
Add A,R4
Mov R1,A
Mov A,R0
Addc A,R3
Mov R0,A
skok:
clr C
Mov A,R4
RLC A
Mov R4,A
MOv A,R3
RLC A
Mov R3,A
mov A,R2
jnz loop

Mov A,R0
ORL A,R6
MOv R0,A
mov DPTR,#777h
mov A,R0
movx @DPTR, A
inc DPTR
mov A,R1
movx @DPTR, A
end




