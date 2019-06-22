; Zakhozhyy Ihor IO-73
;0 bank
orl PSW, #00000b
mov r0, #22
mov r1, #52h
; Пересылка 22 слов из порта в 
; резидентную память начиная с адреса 52h
ll:
mov @r1, #ffh
inc r1
djnz r0,ll
;F3=(16*(x1 + x2 -1)*(x3-x4)-(x5&x6)/8
mov r1,#3
mov r2,#2
mov r3,#5
mov r4,#2
mov r5,#16
mov r6,#16

;x2 = (x1 + x2)
mov a, 0
orl a, r1
add a, r2
mov r2,a

;x2 = (x1 + x2 -1)
mov a, r2
subb a, #1
mov r2,a

;x3 = (x3-x4)
mov a, r3
subb a, r4
mov r3,a

;x2.x3 = (x1 + x2 -1)*(x3-x4)
mov a, r2
mov b, r3
mul ab
mov r2, b
mov r3, a

;x2.x3=16*(x1 + x2 -1)*(x3-x4)
mov r0, #4
m: clr c
mov a, r3
rlc a
mov r3,a
mov a, r2
rlc a
mov r2,a
djnz r0, m

; x5 = (x5&x6)
mov a, r5
anl a, r6
mov r5, a

; x5 = (x5&x6)/8
mov r0, #3
l2: clr c
mov a, r5
rrc a
mov r5,a
djnz r0, l2
;bank 0 R6.R7=(16*(x1 + x2 -1)*(x3-x4)-(x5&x6)/8
mov a, r2
mov r6, a
mov a, r3
clr c
subb a, r5
mov r7, a
End