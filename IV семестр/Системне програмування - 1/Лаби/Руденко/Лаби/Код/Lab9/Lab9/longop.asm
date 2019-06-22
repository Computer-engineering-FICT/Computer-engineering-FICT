.586
.model flat, c

.data 

	m dd 1
	x dd 0h
	x1 dd 0h
	x2 dd 0h
	x3 dd 1
	b dd 0
	fractionalPart db ?
	maska db 0
	TEN db 1010b
	two dd 2
	buf dd 80 dup(0)
	buffer dd 128 dup(?)

	bufForFactorial dd 1h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h
	decCode db ?
	four dd 4
	counter dd 0
	shift db 0
	insertBit db 0
	flag db 0

	RES dd 32 dup(0)
	BUFF dd 32 dup(0)
	num dd 0

.code

Mul_N_x_32_LONGOP proc

	
	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov edi, [ebp + 12]
	mov ebx, [ebp + 8]
	mov x, ebx

	mov ecx, 5
	xor ebx, ebx
	@cycle1:
			
		mov eax, dword ptr[edi + 8 * ebx]
		mul x
		mov dword ptr[esi + 8 * ebx], eax
		mov dword ptr[esi + 8 * ebx + 4], edx

		inc ebx
		dec ecx

		jnz @cycle1


	mov ecx, 5
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


Mul_N_x_32_LONGOP endp

FACTORIAL_LONGOP proc 

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]	
	mov edi, [ebp + 12]
	mov ebx, [ebp + 8]
	mov num, ebx

	@cycle:
					
				push edi
				push esi
				push m
				call Mul_N_x_32_LONGOP 

				inc dword ptr[m]
	
				mov edx, 16

				mov ecx, 0
				@cycle1:
					mov eax, dword ptr[edi + 4 * ecx]
					mov dword ptr[esi + 4 * ecx], eax
					inc ecx

					cmp ecx, edx
					jne @cycle1
	
				dec dword ptr[num]
				jnz @cycle

	pop ebp
	ret 8
	

FACTORIAL_LONGOP endp

DIV2_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 20]  
	mov edi, [ebp + 16]		
	mov ebx, [ebp + 12] 
	mov eax, [ebp + 8] 
	mov x, eax

	push ebx
	xor edx, edx
	mov ecx, x
	dec x
	mov ebx,x
	@cycle :
		push ecx
		mov ecx, 10
		mov eax, dword ptr[esi + 4* ebx]

		div ecx
		mov fractionalPart, dl
		mov dword ptr[edi + 4* ebx], eax
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

	mov esi, [ebp + 20] ;str code
	mov edi, [ebp + 16] ;dec code
	mov eax, [ebp + 12]
	mov x1, eax      ; number of dd
	mov eax, [ebp + 8]
	mov x2, eax      ; bytes on screan


	push esi
	push edi
	

	push esi
	push offset buffer
	push x1
	call COPY_LONGOP

	pop edi
	pop esi

	mov b, 0

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
	


	push offset buffer
	push esi
	push x2
	call COPY_LONGOP


	pop ebp
	ret 16

StrToDec_LONGOP endp

COPY_LONGOP proc

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov edi, [ebp + 12]
	mov edx, [ebp + 8]


	mov ecx, 0
	@cycle:
		mov eax, dword ptr[esi + 4 * ecx]
		mov dword ptr[edi + 4 * ecx], eax
		inc ecx

		cmp ecx, edx
		jne @cycle

	pop ebp
	ret 12


COPY_LONGOP endp

end


