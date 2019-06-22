;Bronfman, #3101

;sending an array to resident data memory
Mov R0, #60h
Mov R7,#27
Mov R1, #40h
send: 
Mov A, P0
Mov @R0, A
Inc R0
Djnz R7, send

;sending operands to registers
Mov PSW, #18h  ;Rb3
Mov R7, #5
Mov R0, #20h
Mov R1, #61h
toRegisters:
Mov A, @R1
Mov @R0, A
Inc R0
Inc R1
Djnz R7, toRegisters
Mov R1, 60
Mov A, @R1
Mov R1, A

;calculations
;16(X1-1) & X2
Mov A, R1
Dec A
Mov R7, 3

; 16(x1+x2-1)(x3-x4)
mov a, r01
add a, r02
subb a, 1
mov r30, a
mov a, r03
subb a, r04
mov b, r30
mul ab
mov r23, a
mov r24, b
mov r30, 4

cycle:
clr c
mov a, r23
rlc a
mov r23, a
mov a, r24
rlc a
mov r24, a
djnz r30, cycle

clr c
;(x5&x6)/8
mov a, r05
anl a, r06
mov b, 8
div ab
mov r30, a
mov r31, b
;-
mov a, 23
subb a, r30
mov r23, a
mov a, r24
subb a, r31
mov r24, a
