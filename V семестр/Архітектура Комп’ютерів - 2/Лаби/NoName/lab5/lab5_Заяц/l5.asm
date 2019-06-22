; r0 - x1

mov r0, #1

; r2 - x2

mov r2, #2

; clone x1 and x2 into rb1

; r0 - zeros
; r1 - x
; r2 - 0

mov a, r0
orl psw, #8h
mov r1, a

; r3 - zeros
; r4 - y
; r5 - 0

anl psw, #e7h
mov a, r2
orl psw, #8h
mov r4, a

; r6 - z
; r7 - 2 h bits of z

mov r6, #1

; check h bit of x

loop:

mov a, r2
anl a, #1
jz zero

mov a, r0
add a, r3
mov r0, a

mov a, r1
addc a, r4
mov r1, a

mov a, r2
addc a, r5
mov r2, a

sjmp shifting

zero:

; make y negative :(

mov a, r3
cpl a
add a, #1
mov r3, a

mov a, r4
cpl a
addc a, #0
mov r4, a

mov a, r5
cpl a
addc a, #0
; deleting h unnecessary bits of y
anl a, #1
mov r5, a

;mov a, r5
;anl a, #1
;mov r5, a

; subt x and y

mov a, r0
add a, r3
mov r0, a

mov a, r1
addc a, r4
mov r1, a

mov a, r2
addc a, r5
mov r2, a

; save carry

; FIX IT

;mov f0, c

anl a, #1
clr c

jz st1

cpl c

st1:

mov f0, c

; make y positive :)

mov a, r3
cpl a
add a, #1
mov r3, a

mov a, r4
cpl a
addc a, #0
mov r4, a

mov a, r5
cpl a
addc a, #0
; deleting h unnecessary bits of y
anl a, #1
mov r5, a

;mov a, r5
;anl a, #1
;mov r5, a

shifting:

; delete h unnecessary bits of x

mov a, r2
anl a, #1
mov r2, a

; restore carry

mov c, f0
;cpl c

; shift z

mov a, r6
rlc a
mov r6, a

mov a, r7
rlc a
mov r7, a

; shift y

clr c

mov a, r5
rrc a
mov r5, a

mov a, r4
rrc a
mov r4, a

mov a, r3
rrc a
mov r3, a

mov a, r7
anl a, #2
jz loop
