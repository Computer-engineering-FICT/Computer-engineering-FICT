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
	
	; Скопируем X и Y из банка 0 в банк 1
		mov A, R6
		sel rb1
		mov R6, A
		sel rb0
		mov A, R7
		sel rb1
		mov R7, A
		
	; Перегнать X и Y из ДК в ПК и взять их модуль, знак учесть отдельно (пусть он будет в R1)
		mov A, R6
		jb7 convertXagain
		jmp skipConvertXagain
			convertXagain:
			mov R1, #01h	; Записываем знак X
			dec A
			cpl A
			; Experimental
			;clr c
			;rlc A
			; ---
			mov R6, A
		skipConvertXagain:
		
		mov A, R7
		jb7 convertY
		jmp skipConvertY
			convertY:
			dec A
			cpl A
			; Experimental
			;clr c
			;rlc A
			; ---
			mov R7, A
			mov A, R1	; Умножаем знаки X и Y
			xrl A, #01h	;
		skipConvertY:
	
; R2 = Y / X
	; R = Y - X
		; Получаем -X
			mov A, R6
			cpl A
			inc A
			mov R6, A
			mov R5, #FFh
		; Добавляем Y
			mov A, R6
			add A, R7
			mov R6, A
			mov A, R5
			addc A, #00h
			mov R5, A
		; теперь в R5.R6 лежит R = Y - X
			
	; Z0 = (R < 0) ? 1 : 0
	mov A, R5
	jb7 setZ01l1
	jmp skipSetZ01l1
		setZ01l1:
		mov R0, #80h
	skipSetZ01l1:
	; Ct = n - 1
	mov R3, #07h
	ll:
		; R *= 2
		clr c
		mov A, R6
		rlc A
		mov R6, A
		mov A, R5
		rlc A
		mov R5, A
		
		; R = (R < 0) ? R + Y : R - Y;
		jb7 addY
		jmp subY
			addY:
			mov A, R7
			
			add A, R6
			mov R6, A
			mov A, R5
			addc A, #00h
			
			jmp skipSubY
		subY:
			mov A, R7
			cpl A
			inc A
			
			add A, R6
			mov R6, A
			mov A, R5
			addc A, #FFh
			
		skipSubY:
		mov R5, A
		
		; Z(i) = (R < 0) ? 1 : 0
		mov A, R5
		clr C
		jb7 setZ01l2
		jmp skipSetZ01l2
			setZ01l2:
			cpl C
		skipSetZ01l2:
		mov A, R0
		rrc A
		mov R0, A
	djnz R3, ll
	
	; Результат деления без учета знаков теперь лежит в R0, учитываем знак:
	mov A, R1
	jb0 convertResult
	jmp skipConvertResult
		convertResult:
		mov A, R0
		cpl A
		inc A
		mov R0, A
	skipConvertResult:
	; Деление посчитано! Результат - в rb1.R0, в ДК
	
; R1 += R2
	mov A, R0
	sel rb0
	add A, R0
	mov R0, A
