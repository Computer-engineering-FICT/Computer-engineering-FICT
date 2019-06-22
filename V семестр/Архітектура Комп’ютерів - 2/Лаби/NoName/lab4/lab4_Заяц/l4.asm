
; r0 - l of x
; r1 - h of x

; r2 - ll of y
; r3 - lh of y
; r4 - hl of y
; r5 - hh of y

; read h bits

mov a, p1
mov r1, a
mov r5, a

; read l bits

mov a, p1
mov r0, a
mov r4, a

; tmp input

mov r0, #0feh
mov r1, #0ffh

mov r4, #01h
mov r5, #0h

; save sign

mov a, r1
xrl a, r5
mov r7, a

; make x in pk

mov a, r1

anl a, #80h

jz x_in_pk_already

mov a, r0
cpl a
add a, #1
mov r0, a

mov a, r1
cpl a
addc a, #0
anl a, #7fh
mov r1, a

x_in_pk_already:

; make y in pk

mov a, r5

anl a, #80h

jz y_in_pk_already

mov a, r4
cpl a
add a, #1
mov r4, a

mov a, r5
cpl a
addc a, #0
anl a, #7fh
mov r5, a

y_in_pk_already:

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

anl psw, #0e7h
mov a, r3
orl psw, #8h
addc a, r1
mov r1, a

anl psw, #0e7h
mov a, r4
orl psw, #8h
addc a, r2
mov r2, a

anl psw, #0e7h
mov a, r5
orl psw, #8h
addc a, r3
mov r3, a

anl psw, #0e7h

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
anl a, #0ffh
jnz loop

mov a, r0
anl a, #0ffh
jnz loop

; make correct result sign

mov a, r7
anl a, #80h

jz positiveResult

mov a, #80h

sjmp doNext

positiveResult:

mov a, #00h

doNext:

orl psw, #8h

add a, r3

mov r3, a

end