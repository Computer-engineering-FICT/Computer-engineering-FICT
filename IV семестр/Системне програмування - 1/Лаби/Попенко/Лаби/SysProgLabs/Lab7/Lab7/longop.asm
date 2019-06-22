.586
.model flat, c

.data 

	b dd 0
	x dd 0h
	x1 dd 0h
	x2 dd 0h
	x3 dd 1
	fractionalPart db ?
	maska db 0
	TEN db 1010b
	two dd 2
	buf dd 80 dup(0)
	bufForFactorial dd 1h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h
	decCode db ?
	four dd 4
	counter dd 0
	shift db 0
	flag db 0

.code

Mul_N_x_32_LONGOP proc

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]   ;адреса результату
	mov edi, [ebp + 12]   ;N
	mov ebx, [ebp + 8]    ;32
	mov x, ebx

	mov ecx, 7
	xor ebx, ebx
	@cycle1:
			
		mov eax, dword ptr[edi + 8 * ebx]
		mul x
		mov dword ptr[esi + 8 * ebx], eax
		mov dword ptr[esi + 8 * ebx + 4], edx

		inc ebx
		dec ecx

	jnz @cycle1

	mov ecx, 7
	xor ebx, ebx
	
	@cycle2:
			
		mov eax, dword ptr[edi + 8 * ebx + 4]									
		mul x
		
		add eax, dword ptr[esi + 8 * ebx + 4]
		mov dword ptr[esi + 8 * ebx + 4], eax
		add edx, dword ptr[esi + 8 * ebx + 8]
		mov dword ptr[esi + 8 * ebx + 8], edx
			
		inc ebx
		dec ecx

	jnz @cycle2

	pop ebp

	ret 12

Mul_N_x_32_LONGOP endp

;--------------------------------------------------------LAB_7------------------------------------------------------------------

DIV1_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 20]   ;адреса числа
	mov edi, [ebp + 16]   ;адреса цілої частини
	mov edx, [ebp + 12]   ;адреса залишку
	mov eax, [ebp + 8]    ;кількість байтів
	mov x, eax
	
	mov ecx, x
	dec x
	mov ebx, x

	mov maska, 10h   ;00010000
	mov counter, 5
	mov shift, 4

	mov flag, 1   ;перший прохід

	mov al, byte ptr[esi + ebx]
	and al, 0F0h   ;11110000 
	shr al, 4 

	@cycle:
		
		mov ebx, ecx
		dec ebx
		push ecx 
		mov ecx, counter			
		@cycleInner:
			mov ah, byte ptr[esi + ebx]
			and ah, maska
			push ecx
			mov cl, shift
			shr ah, cl
			pop ecx 

			cmp flag, 0
			jne @notShift
			shl al, 1
			add al, ah

			@notShift:

			mov flag, 0	
			cmp al, TEN
			jae @Greater
			jmp @Less	
			@Greater:
				push edx
				mov dl, maska
				add dl, byte ptr[edi + ebx]
				mov byte ptr[edi + ebx], dl
				sub al, TEN
				pop edx
			@Less:

			shr maska, 1
			dec shift
			
			dec ecx
			jnz @cycleInner

		mov flag, 0
		mov shift, 7
		mov maska, 80h   ;10000000
		mov counter, 8
		pop ecx
		dec ecx
		jnz @cycle

	pop ebp

	ret 16

DIV1_LONGOP endp


DIV2_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 20]   ;адреса числа
	mov edi, [ebp + 16]	  ;адреса цілої частини
	mov ebx, [ebp + 12]   ;адреса залишку
	mov eax, [ebp + 8]    ;кількість 32біток
	mov x, eax

	push ebx
	xor edx, edx
	mov ecx, x
	dec x
	mov ebx,x
	@cycle :
		push ecx
		mov ecx, 10
		mov eax, dword ptr[esi + 4 *  ebx]

		div ecx
		mov fractionalPart, dl
		mov dword ptr[edi + 4 * ebx], eax
		dec ebx
		pop ecx
		dec ecx

		jnz @cycle

	pop ebx
	mov al, fractionalPart
	mov byte ptr[ebx], al

	pop ebp

	ret 16
	
DIV2_LONGOP endp


StrToDec_LONGOP proc 
	
	push ebp
	mov ebp, esp

	mov esi, [ebp + 20] ;вхідне число
	mov edi, [ebp + 16] ;десятковий код
	mov eax, [ebp + 12]
	mov x1, eax         ;кількість 32хбіток
	mov eax, [ebp + 8]
	mov x2, eax         ;байти на виході

	mov ecx, 100
	@zero:
		mov byte ptr [edi + ecx - 1], 0
		dec ecx
	jnz @zero
	
	xor ecx, ecx
	xor ebx, ebx
	@cycle:
		push ecx
		push edi

		push esi
		push offset buf
		push offset decCode
		push x1
		call DIV2_LONGOP

		pop edi
		mov ebx, b
		mov al, byte ptr[decCode]
		add al, 48
		mov byte ptr[edi + ebx], al

		xor ecx, ecx
		@cycleInner:
			mov eax, dword ptr[buf + 4 * ecx]
			mov dword ptr[esi + 4 * ecx], eax
			mov dword ptr[buf + 4 * ecx], 0
			inc ecx
			cmp ecx, x1
			jl @cycleInner

		pop ecx
		inc ecx
		inc b
		cmp ecx, x2
		jl @cycle
	
	mov ebx, x2
	mov eax, x2
	xor edx, edx
	div two
	mov x2, eax
	dec ebx 
	xor ecx, ecx	
	@cycle1:

		mov al, byte ptr[edi + ecx]
		mov ah, byte ptr[edi + ebx]
		mov byte ptr[edi + ecx], ah
		mov byte ptr[edi + ebx], al
		
		dec ebx
		inc ecx
		cmp ecx, x2
		jl @cycle1

	pop ebp
	ret 16

StrToDec_LONGOP endp

Factorial_LONGOP proc 

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]  ;адреса результату
	mov edi, [ebp + 12]  ;число
	mov ebx, [ebp + 8]   ;кількість 32 бітів

	@cycle:
		push edi
		push ebx
		
		push esi
		push offset bufForFactorial
		push x3
		call Mul_N_x_32_LONGOP 

		pop ebx
		pop edi
	
		inc x3
	
		mov ecx, 0
		@cycleIn:
			mov eax, dword ptr[esi + 4 * ecx]
			mov dword ptr[bufForFactorial + 4 * ecx], eax
			inc ecx
			cmp ecx, ebx
		jl @cycleIn

		dec edi
	jnz @cycle

	pop ebp

	ret 8

Factorial_LONGOP endp


FuncResult_LONGOP proc

	mov eax, 11
	shl eax, cl
	add ebx, 1
	xor edx, edx
	div ebx
	ret

FuncResult_LONGOP endp

end