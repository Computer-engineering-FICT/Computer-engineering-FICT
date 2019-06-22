; F = 4 (X1 & X2) - (X3 - X4 + 1) - (X5 v X6 - 1) / 2
; X1 == 2C, X2 == 03, X3 == 71, X4 == CA, X5 == 11, X6 == FF
; F = 4 * (2C and 03) - (71 - CA + 1) - (11 or FF - 1) / 2

; Select bank #0

	sel rb0

; Init loop for reading X[0..5] from P4.P5 to R[1..6]

	mov R7, #06h	; steps
	mov R0, #01h	; address to write x
	
	loopLoadX:
	
		movd A, P4	; load senior 4 bits
		swap A
		
		mov @R0, A	;
		movd A, P5	;
		orl A, @R0	; complete them with senior 4 bits
		mov @R0, A
		
		
		inc R0		; prepare next register
		
	djnz R7, loopLoadX

; ---------------------------------------------------

; Calculating 4(X1 & X2)

	mov A, R1		; A = R1 & R2
	anl A, R2		;
	mov R2, A		; R2 = A
	
	mov R1, #00h	; R2.R1 <<= 2
	mov R7, #02h
	ls:
		clr C
		mov A, R2
		rlc A
		mov R2, A
		mov A, R1
		rlc A
		mov R1, A
	djnz R7, ls
	
; ----------------------

; Calculating - (X3 - X4 + 1)

	; X3 - X4 + 1 == X3 + !X4 + 1 + 1 == X3 + !X4 + 2
	mov A, R4
	cpl A
	add A, R3
	mov R4, A
	
	mov A, #00h
	addc A, #00h
	mov R3, A
	
	mov A, R4
	add A, #02h
	mov R4, A
	
	mov A, R3
	addc A, #00h
	mov R3, A
	
	; inverting and incrementing result
	mov A, R4
	cpl A
	add A, #01h
	mov R4, A
	mov A, R3
	cpl A
	addc A, #00h
	mov R3, A

; -----------------------

; Calculating - (X5 v X6 + 1)/2

	mov A, R5
	orl A, R6

	mov R6, A
	mov R5, #00h
	
	mov A, R6
	add A, #01h
	mov R6, A
	mov A, R5
	addc A, #00h
	mov R5, A
	
	; dividing by 2
	clr c
	mov A, R5
	rrc A
	mov R5, A
	mov A, R6
	rrc A
	mov R6, A
	
	; inverting and incrementing result
	mov A, R6
	cpl A
	add A, #01h
	mov R6, A
	mov A, R5
	cpl A
	addc A, #00h
	mov R5, A

; ---------------------------

; Calculating (X1 + X3 + X5).(X2 + X4 + X6)

	mov A, R1		; R1 = X1 + X3 + X5
	add A, R3
	add A, R5
	mov R1, A
	
	mov A, R2		; R2 = X2 + X4 + X6
	add A, R4		;
	mov R2, A		;
	mov A, R1		;
	addc A, #00h	;		
	mov R1, A		;
	mov A, R2		;
	add A, R6		;
	mov R2, A		;
	mov A, R1		;
	addc A, #00h	;
	mov R1, A		;
	
; -----------------------------------------
