; Порт - P2
; Способ умножения - 4-й
; Z = X * Y
; Разрядность операндов - 16 бит
; Z - ДК - RG1:  R4 -  R7	(32 бита)
; X - ПК - RG2: @32 - @33	(16 бит )
; Y - ДК - RG3: @34 - @37	(32 бита)
; 		   CT :  R3			( 8 бит )
; Знак X * Y - @38
;

sel rb0

; Инициализируем Z

	mov R4, #00h
	mov R5, #00h
	mov R6, #00h
	mov R7, #00h

; Загружаем X

	mov R0, #20h ;#32d
	in A, P2
	; Извлекаем знак из X
		jb7 setXsign
		jmp skipXsign
			setXsign:
			mov R1, #26h ;#38d
			mov @R1, #01h
		skipXsign:
		anl A, #7Fh
	mov @R0, A
	inc R0
	in A, P2
	mov @R0, A

; Загружаем Y

	mov R0, #22h ;#34d
	mov @R0, #00h
	inc R0
	mov @R0, #00h
	inc R0
	in A, P2
	mov @R0, A
	inc R0
	in A, P2
	mov @R0, A
	
; Переводим Y из ДК в ПК

	; Извлекаем знак из Y
	mov R0, #24h ;#36d
	mov A, @R0
	jb7 setYsign
	jmp skipYsign
		setYsign:
		mov R1, #26h ;#38d
		mov A, @R1
		xrl A, #01h
		mov @R1, A
		inc R0
		clr c
		mov A, @R0
		add A, #FFh
		cpl A
		mov @R0, A
		dec R0
		mov A, @R0
		addc A, #FFh
		cpl A
		anl A, #7Fh
		mov @R0, A
	skipYsign:
	

; Инициализируем CT

	mov R3, #0Fh ;#15d
	
	
lIteration:

	; RG2[0]
		mov R0, #21h ;#33d
		mov A, @R0
		jb0 lNoSkip
            jmp lSkip
	; -----
	
      lNoSkip:
	; RG1 += RG3
	
		clr c
		
		mov R2, #04h
	
		mov R0, #07h
		mov R1, #25h ;#37d
		
		lAdding:
			mov A, @R0
			addc A, @R1
			mov @R0, A
			dec R0
			dec R1
		djnz R2, lAdding
		
	; ----------
	
	lSkip:
	
		; RG2 = 0.R(RG2)
	
			clr c
	
			mov R0, #20h ;#32d
			mov A, @R0
			rrc A
			mov @R0, A
			inc R0
			mov A, @R0
			rrc A
			mov @R0, A
		
		; --------------
	
		; RG3 = L(RG3).0
	
			clr c
		
			mov R1, #04h
			mov R0, #25h ;#37d
			
			lShift:
				mov A, @R0
				rlc A
				mov @R0, A
				dec R0
			djnz R1, lShift
		
		; --------------

	
djnz R3, lIteration

; Разбираемся со знаком Z - он будет отрицательным, если по адресу @38d будет лежать 1
mov R0, #26h ;#38d
mov A, @R0
jb0 invertZ
jmp skipInvertZ
	invertZ:

	mov A, R7
	cpl A
	add A, #01h
	mov R7, A
	
	mov R1, #03h
	mov R0, #06h
	
	iz2:
		mov A, @R0
		cpl A
		addc A, #00h
		mov @R0, A
		dec R0
	djnz R1, iz2
skipInvertZ:

nop
