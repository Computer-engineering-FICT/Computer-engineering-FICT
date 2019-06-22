mov r7, #24
; input data will save in br0

; r0 - l of x
; r1 - middle of x
; r2 - h of x


mov r0, #0ffh
mov r1, #0ffh
mov r2, #0ffh

;mov a, r0
;cpl a
;addc a, #1
;mov r0, a

;mov a, r1
;cpl a
;addc a, #0
;mov r1, a

;mov a, r2
;cpl a
;addc a, #0
;mov r2, a

; r3 - l of y
; r4 - m of y
; r5 - h of y


mov r3, #0ffh
mov r4, #0ffh
mov r5, #0ffh

loop:

; we will save result into rb1

; lets start

; if x[0]
; 	sum

mov a, r0
anl a, #1

jz skipSum

; sum

mov a, r3
orl psw, #00010000b
addc a, r0
mov r0, a

anl psw, #11100111b
mov a, r4
orl psw, #00010000b
addc a, r1
mov r1, a

anl psw, #11100111b
mov a, r5
orl psw, #00010000b
addc a, r2
mov r2, a

anl psw, #11100111b

skipSum:

; shifting result

orl psw, #00010000b

mov a, r2
rrc a
mov r2, a

mov a, r1
rrc a
mov r1, a

mov a, r0
rrc a
mov r0, a

anl psw, #11100111b

; shifting x

mov a, r2
rrc a
mov r2, a

mov a, r1
rrc a
mov r1, a

mov a, r0
rrc a
mov r0, a

djnz r7, loop

end