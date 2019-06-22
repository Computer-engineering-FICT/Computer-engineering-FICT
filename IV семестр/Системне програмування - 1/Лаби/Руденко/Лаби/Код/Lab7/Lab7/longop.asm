.586
.model flat, c
.data 
	x dd 1h
	bitNumber dd ?
	a dd 0
	b dd 0
	r dd 0
	i dd ?
    j dd ?
	x3 dd 1
	bufForFactorial dd 1h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h
.code

DIV_10_LONGOP proc

	push ebp
	push eax
	push ebx
	push ecx
	push edx
	push esi
	mov ebp, esp
	mov esi, [ebp+40] ;Число
	mov edi, [ebp+36] ;результат деления
	mov ebx, [ebp+32] ;остача
	mov ecx, [ebp+28]  ;розрядность

	xor eax, eax
	
	shr ecx, 3
	sub ecx, 1
	xor edx, edx

	;берем старшие 8 битов
	mov dl, [esi+ecx]
	
	;ложим 4 старшие бита в al
	mov al, dl
	shr al, 4
	shl dl, 3
	mov ch, 4
	
while_1:
	; if al > 10
	cmp al , 10
		jl endif_1

		sub al, 10
		or dh, 1
		
	endif_1:

	shl al, 1
	shl dl, 1

	cmp ch, 0
		jne endif_2
		
		mov [edi+ecx], dh
		
		cmp ecx, 0
		je proc_end
		
		dec ecx
		mov dl, [esi+ecx]
		mov ch, 8
		xor dh, dh

	endif_2:

		shl dh, 1
		;берем старший бит и ложим его в младший разряд al
		mov ah, dl
		;and ah, 80h
		shr ah, 7
		or al, ah

		dec ch

		jmp while_1

proc_end:

		shr al, 1
		mov byte ptr[ebx], al

		pop esi
		pop edx
		pop ecx
		pop ebx
		pop eax
		pop ebp
		ret 16
DIV_10_LONGOP endp

MUL_N_32_LONGOP proc
	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov edi, [ebp + 12]
	mov ebx, [ebp + 8]
	mov x, ebx

	mov ecx, 8
	xor ebx, ebx
	@cycle1:
			
		mov eax, dword ptr[edi + 8 * ebx]
		mul x
		mov dword ptr[esi + 8 * ebx], eax
		mov dword ptr[esi + 8 * ebx + 4], edx

		inc ebx
		dec ecx

	jnz @cycle1
	mov ecx, 8
	xor ebx, ebx
	
	@cycle2:
		mov eax, dword ptr[edi + 8 * ebx + 4]	
		mul x
		
		clc
		adc eax, dword ptr[esi + 8 * ebx + 4]
		mov dword ptr[esi + 8 * ebx + 4], eax
		clc
		adc edx, dword ptr[esi + 8 * ebx + 8]
		mov dword ptr[esi + 8 * ebx + 8], edx
			
		inc ebx
	dec ecx

	jnz @cycle2
	pop ebp
	ret 12
MUL_N_32_LONGOP endp

Factorial_LONGOP proc

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov edi, [ebp + 12]
	mov ebx, [ebp + 8]

	@cycle:

		push edi
		push ebx
		
		push esi
		push offset bufForFactorial
		push x3
		call MUL_N_32_LONGOP 

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
end
