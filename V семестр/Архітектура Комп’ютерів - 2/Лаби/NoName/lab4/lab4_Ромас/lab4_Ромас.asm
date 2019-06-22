; r0 - l of x
; r1 - h of x

mov r0, #99h
mov r1, #99h

mov a, r0
cpl a
addc a, #1
mov r0, a

mov a, r1
cpl a
addc a, #1
mov r1, a

; r2 - ll of y
; r3 - lh of y
; r4 - hl of y
; r5 - hh of y

mov r4, #99h
mov r5, #99h

mov a, r4
cpl a
addc a, #1
mov r4, a

mov a, r5
cpl a
addc a, #1
mov r5, a

; prepare y

mov a, r5
rrc a
mov r5, a


mov a, r4
rrc a
mov r4, a

mov a, r3
rrc a
mov r3, a

mov a, r2
rrc a
mov r2, a

loop:

mov a, r1
anl a, #80h
jz withoutAdding

; sum
mov a, r2
orl psw, #8h
addc a, r0
mov r0, a

anl psw, #e7h
mov a, r3
orl psw, #8h
addc a, r1
mov r1, a

anl psw, #e7h
mov a, r4
orl psw, #8h
addc a, r2
mov r2, a

anl psw, #e7h
mov a, r5
orl psw, #8h
addc a, r3
mov r3, a

anl psw, #e7h

withoutAdding:

; shift x

clr c
mov a, r0
rlc a
mov r0, a

mov a, r1
rlc a
mov r1, a

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

mov a, r2
rrc a
mov r2, a

; check x

mov a, r1
anl a, #ffh
jnz loop

mov a, r0
anl a, #ffh
jnz loop

end