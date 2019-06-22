; r0 - x1, x

mov a, p1
mov r0, a

; r2 - x2, y

mov a, p1
mov r2, a

; tmp input

mov r2, #0f8h
mov r0, #81h

; save sign

mov a, r0
xrl a, r2
mov r7, a

; copy data to first bank

; r1 r0 - x

mov a, r0
orl psw, #8h
mov r1, a

; r3 r2 - y

anl psw, #0e7h
mov a, r2
orl psw, #8h
mov r3, a

; prepare data

; make x positive

mov a, r1
anl a, #7fh
mov r1, a

; make y in pk

mov a, r3

anl a, #80h

jz y_in_pk_already

mov a, r3
cpl a
add a, #1
mov r3, a

y_in_pk_already:

mov a, r3
anl a, #7fh
mov r3, a

; shift y before division

mov a, r3
rrc a
mov r3, a
mov a, r2
rrc a
mov r2, a

; r6 - z - result

mov r6, #1

; here we go

loop:
mov a, r1
anl a, #80h
jz withoutSum

; sum x and y

mov a, r0
add a, r2
mov r0, a

mov a, r1
addc a, r3
mov r1, a

; shift z with carry

mov a, r6
rlc a
mov r6, a

sjmp shiftingY

withoutSum:

; make y negative

mov a, r2
cpl a
add a, #1
mov r2, a

mov a, r3
cpl a
addc a, #0
mov r3, a

; sum x and neg y

mov a, r0
add a, r2
mov r0, a

mov a, r1
addc a, r3
mov r1, a

; shift z with carry

mov a, r6
rlc a
mov r6, a

; make y positive

mov a, r2
cpl a
add a, #1
mov r2, a

mov a, r3
cpl a
addc a, #0
mov r3, a

shiftingY:

clr c

mov a, r3
rrc a
mov r3, a

mov a, r2
rrc a
mov r2, a

mov a, r6
anl a, #80h
jz loop

; decide for sign

mov a, r6
anl a, #7fh
mov r6, a

anl psw, #0e7h
mov a, r7
anl a, #80h

jz positiveResult

mov a, #80h

sjmp doNext

positiveResult:

mov a, #0h

doNext:

orl psw, #8h
add a, r6

anl psw, #0e7h

mov r4, a

; subtrack x2 and x1

mov a, r2
subb a, r0

mov r7, #2
shiftLoop:
rrc a
djnz r7, shiftLoop

;mov r0, a

add a, r4
mov r0, a
mov a, r1
addc a, #0
mov r1, a

; peremutate result from pk to dk

;mov a, r0
;cpl a
;add a, #1
;mov r0, a

;mov a, r1
;cpl a
;addc a, #0
;mov r1, a

end