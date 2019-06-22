.586
.model flat, c

.data 
	counter dd 0
	variable db 32 dup(0)
	tmp dd 10 dup(0)
	a dd 0
	b dd 0
	r dd 0
.code

Factor proc
	push ebp
	mov ebp,esp
	
	mov ebx, [ebp+12] ;var
	mov edi, [ebp+8] ; помещаем адрес переменной в edi

	;mov res, var
	mov eax, dword ptr[ebx] ; 32 bits from ebx
	mov dword ptr[edi], eax ; in 32bits edi write eax
	sub dword ptr[ebx], 1	;от значения что в регистре ебх отнимаем 1

	cycle1:
		;copy result(edi) to tmp
	mov ecx, 0 ; обнулем счетчик
	cycle2:
		mov eax, dword ptr[edi+ecx] ; записываем по 32 бита с edi со сдвигом ecx 
		mov [tmp+ecx], eax 
		add ecx, 4
		cmp ecx, 16
	jl cycle2						; jumpless
	
	mov ecx, 3
	cycle:
	;null res
	mov dword ptr[edi+4*ecx],0
	loop cycle
	mov dword ptr[edi],0

	push offset tmp
	push ebx
	push edi
	call My_Mul_Long

	dec dword ptr[ebx]
	cmp dword ptr[ebx], 0
	jg cycle1

	pop ebp
	ret 12
Factor endp

My_Mul_Long proc
	push ebp
	mov ebp,esp

	mov esi, [ebp+16] ;var1
	mov ebx, [ebp+12] ;var2
	mov edi, [ebp+8] ; result

	mov counter, 0
		mov ecx, 0
		cycle2:
	
			add ebx, counter
			mov eax, dword ptr[ebx]; current value of var2
			sub ebx, counter
			mul dword ptr[esi+ecx]
			add edi, counter
			adc dword ptr[edi+ecx], eax
			adc dword ptr[edi+ecx+4], edx
			sub edi, counter

			add ecx, 4
			cmp ecx, 36
		jl cycle2
		add counter, 4
		cmp counter, 36
	jl cycle2
	
	pop ebp
	ret 12
My_Mul_Long endp

Sqr proc
	push ebp
	mov ebp, esp

	mov esi, dword ptr[ebp + 16]
	mov edi, dword ptr[ebp + 12]
	mov ebx, dword ptr[ebp + 8]

	mov ecx, 8
	@cycle:

		push ecx

		mov ecx, 8
		@cycleInner:
			push ecx

			mov ecx, a
			mov eax, dword ptr[esi + 4 * ecx]

			
			mov ecx, b
			mul dword ptr[edi + 4 * ecx]

			mov ecx, r
			add eax, dword ptr[ebx + 4 * ecx]
			mov dword ptr[ebx + 4 * ecx], eax
			
			
			add edx, dword ptr[ebx + 4 * ecx + 4]
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

	Sqr endp
 
;mov res, var
;dec var

;mov tmp, res
;mul, tmp, var = res
;dec var

end
 