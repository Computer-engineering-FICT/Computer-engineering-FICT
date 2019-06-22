.586
.model flat, c

.data 
	bufForFactorial dd 1h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h
	x3 dd 1
	x dd 0h
	

.code
;Процедура факторіалу
FACTORIAL_LONGOP proc 

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov edi, [ebp + 12]
	mov ebx, [ebp + 8]

	mov dword ptr[x3], 1  ;обнульовка
	mov ecx, 0
	@cycle1:
		mov dword ptr[bufForFactorial+4*ecx], 0
		inc ecx
		cmp ecx, 30
		jne @cycle1
	mov dword ptr[bufForFactorial], 1

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
	

FACTORIAL_LONGOP endp

;;;;;Процедура множення
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
end