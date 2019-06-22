; X0 == 03, X1 == 5C, X2 == 30, X3 == 67, X4 == 0A, X5 == 11, X6 == A0, R7 == 07

jmp start

mpp:
	
	; Block 7
		; R6 = 2 (R5 - R2 - 1)
		; R6 = 2 (R5 + !R2)
		mov A, R2
		cpl A
		add A, R5
		clr c
		rlc A
		mov R6, A
	; -------
	
	jf1 skipBlock9
	
	; Block 9
		; R1 = 77h + R6
		mov A, R6
		add A, #77h
		mov R1, A
	; -------
	
	skipBlock9:
	
	; Block 10
		; R6 = (R0 - 1) / 2
		mov A, R0
		dec A
		rrc A
		mov R6, A
	; --------
	
	; Block 11
		; R5 = R6 + 1
		mov A, R6
		inc a
		mov R5, A
	; --------
	
	ret

start:

; Select bank #0

	sel rb0
	
	; load R0
		movd A, P4
		swap A
		mov R0, A
		movd A, P5
		orl A, R0
		mov R0, A
	; -------
	
	; load R1
		movd A, P4
		swap A
		mov R1, A
		movd A, P5
		orl A, R1
		mov R1, A
	; -------
	
	; load R2
		movd A, P4
		swap A
		mov R2, A
		movd A, P5
		orl A, R2
		mov R2, A
	; -------
	
	; load R3
		movd A, P4
		swap A
		mov R3, A
		movd A, P5
		orl A, R3
		mov R3, A
	; -------
	
	; load R4
		movd A, P4
		swap A
		mov R4, A
		movd A, P5
		orl A, R4
		mov R4, A
	; -------
	
	; load R5
		movd A, P4
		swap A
		mov R5, A
		movd A, P5
		orl A, R5
		mov R5, A
	; -------
	
	; load R6
		movd A, P4
		swap A
		mov R6, A
		movd A, P5
		orl A, R6
		mov R6, A
	; -------
	
	; load R7
		movd A, P4
		swap A
		mov R7, A
		movd A, P5
		orl A, R7
		mov R7, A
	; -------

; ---------------------------------------------------

; Block 1
	; R0 = !(R2 xor R3)
	mov A, R2
	xrl A, R3
	cpl A
	mov R0, A
; -------

; Block 2
	; R3 = 2 (R0 - R4 - 1)
	; R3 = 2 (R0 + !R4)
	mov A, R4
	cpl A
	add A, R0
	rlc A
	mov R3, A
; -------

loopMain:

	; Block 3
		; R2 = (R1 - 1) / 2
		mov A, R1
		dec A
		rrc A
		mov R2, A
	; -------

	jc skipMPP
	
		; Block 4
			call mpp
		; -------

	skipMPP:

djnz R7, loopMain

; Block 6
	; R0 = !R6 & R3
	mov A, R6
	cpl A
	anl A, R3
	mov R0, A
; -------
