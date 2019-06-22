.586
.model flat, c

.data 
	x dd 1h
	bitNumber dd ?

	a dd 0
	b dd 0
	r dd 0

.code

Mul_N_x_32_LONGOP proc

	
	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov edi, [ebp + 12]
	mov ebx, [ebp + 8]
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


Mul_N_x_N_LONGOP proc

push ebp
	mov ebp, esp

	mov esi, dword ptr[ebp + 16]
	mov edi, dword ptr[ebp + 12]
	mov ebx, dword ptr[ebp + 8]

	mov ecx, 14
	@cycle:

		push ecx

		mov ecx, 14
		@cycleInner:
			push ecx

			mov ecx, a
			mov eax, dword ptr[esi + 4 * ecx]

			;clc
			mov ecx, b
			mul dword ptr[edi + 4 * ecx]

			;mov ecx, a
			;add ecx, b
			;mov r, ecx

			mov ecx, r

			clc
			adc eax, dword ptr[ebx + 4 * ecx]
			mov dword ptr[ebx + 4 * ecx], eax
			mov eax, dword ptr[ebx + 4 * ecx]

			;clc
			adc edx, dword ptr[ebx + 4 * ecx + 4]
			mov dword ptr[ebx + 4 * ecx + 4], edx
			mov eax, dword ptr[ebx + 4 * ecx + 4]

			inc a
			inc r
			pop ecx
			dec ecx
			jnz @cycleInner

		inc b

		xor eax, eax
		mov a, eax
		mov eax, b
		mov r, eax
		pop ecx
		dec ecx
		jnz @cycle

	pop ebp
	ret 8

Mul_N_x_N_LONGOP endp

end
