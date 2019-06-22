; load vector
	mov psw, #00000000b
	mov R1, #28h ; address
	mov R2, #Ch ; quantity - 6
load:	mov @R1, #1h ; value
	inc R1
	djnz R2, load
	mov R2, #06h
lx:   mov @R1, P0
	inc R1
	djnz R2, lx	
;start calculating
	anl psw, #e7h ; plug 0 bank
	; r3 = x1(40h) + x2(41h) - 1
	mov ACC, 40h
	add a, 41h
	inc a
	mov r3, a
	; r3 = r3*16
	mov R6, #04h
	clr C
	mov A, R3
mul:
	rlc A
	djnz R6, mul
	mov R3, A
	; r4 = x3(42h) - x4(43h)
	Mov A, 42h
	Clr C
	Subb A, 43h
	Mov R4, A
	; r2.r3 = r3 * r4
	mov 50h, r3
	mov 51h, r4
	Mul AB
	mov r2, f0h
	mov r3, a
	;R4 = x5(44h) & x6(45h)
	mov A, 44h
	anl A, 45h
	mov R4, A
	; r4 = r4/8
	clr C
	mov a, r4
	rrc a
	rrc a
	rrc a
	mov r4, a
	;r2.r3 = r2.r3 - r4
	clr c
	mov a, r3
	subb a, r4
	jnc simp
	mov a, r2
	dec a
	mov r2, a
simp:
	mov 50h, r2
	mov 51h, r3
	anl psw, #e7h
	orl psw, #10h
	mov r4, 50h
	mov r3, 51h
end;
