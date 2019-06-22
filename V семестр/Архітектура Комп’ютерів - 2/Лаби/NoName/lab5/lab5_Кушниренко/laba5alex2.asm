; Ct - R3
; R - R4
; X - R6
; Y - R7

sel rb0

; Загрузить X(ПК) из P1
	in A, P1
	; Преобразовать X(ПК) в X(ДК)
		jb7 convertX
		jmp skipConvertX
			convertX:
			anl A, #7Fh
			cpl A
			inc A
			mov R5, #FFh	; Старшие разряды
		skipConvertX:
	mov R6, A

; Загрузить Y(ДК) из P1
	in A, P1
	mov R7, A
	
; R0 = (Y - X) >> 2
	; Получить -X
		mov A, R6
		cpl A
		clr C
		add A, #01h
		mov R1, A	; Временно запоминаем младшие разряды
		mov A, #FFh
		addc A, R0	; Учитываем переполнение
		mov R0, A
	; Добавить Y - младшие разряды
		mov A, R7
		add A, R1
		mov R1, A	; запоминаем Y - X (младшие разряды)
		mov A, R7
		jb7 addFFhlol
		jmp add00hlol
			addFFhlol:
				mov A, R0
				addc A, #FFh
				jmp skipAdd00hlol
			add00hlol:
				mov A, R0
				addc A, #00h
		skipAdd00hlol:
		mov R0, A
	; Делим на 4
		mov A, R0
		rrc A
		mov R0, A
		mov A, R1
		rrc A
		mov R1, A
		
		mov A, R0
		rrc A
		mov R0, A
		mov A, R1
		rrc A
		mov R0, A
		
	; (Y - X) / 4 теперь лежит в rb0.R0, в ДК
	
	
	
	
; ----- Деление -----

	; Z = X / Y
	; RG1	-	Y	-	R6
	; RG2	-	X	-	R7
	; RG3	-	Z	-	R0
	; CT	-		-	R3
	
	; Скопируем X и Y из банка 0 в банк 1
		; RG1 := Y
			mov A, R6
			sel rb1
			; Дублирование знакового разряда
				clr c
				jb7 lSet11
				cpl c
				lSet11:
				cpl c
				rrc A
			mov R6, A	
		; RG2 := X
			sel rb0
			mov A, R7
			sel rb1
			; Дублирование знакового разряда
				clr c
				jb7 lSet12
				cpl c
				lSet12:
				cpl c
				rrc A
			mov R7, A
	
	; RG2 = RG2 - RG1
		; Получаем -RG1
			mov A, R6
			cpl A
			inc A
		; Добавляем RG2
			add A, R7
			mov R7, A
		; теперь в R7 лежит RG2 = RG2 - RG1
			
	; Ct = 5
	mov R3, #05h
	ll:
		; RG2 <<= 1
		clr c
		mov A, R7
		rlc A
		mov R7, A
		
		; RG3 <<= 1
		clr c
		mov A, R0
		rlc A
		mov R0, A
		
		; проверяем знак RG2
		mov A, R7
		jb7 addY
		jmp subY
		; RG2(1) == 1:
			; RG2 := RG2 + RG1
			addY:
			mov A, R6
			
			
			jmp skipSubY
		; RG2(1) == 0:
			; RG3++
			; RG2 := RG2 - RG1
		subY:
		
			mov A, R0
			inc A
			mov R0, A
		
			mov A, R6
			cpl A
			inc A
			
		skipSubY:
		add A, R7
		mov R7, A
		
	djnz R3, ll
	
	; Деление посчитано! Результат - в rb1.R0, в ДК
	
; R1 += R2
	mov A, R0
	sel rb0
	add A, R0
	mov R0, A
	
nop
