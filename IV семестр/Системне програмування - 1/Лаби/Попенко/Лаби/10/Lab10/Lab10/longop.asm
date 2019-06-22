.586
.model flat, c
.data
	
	x dd 0h
	x1 dd 0h
	x2 dd 0h
	a dd 0
	b dd 0
	r dd 0
	buffer dd 1h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h
	decCode db ?
	buf dd 80 dup(0)
	two dd 2
	fractionalPart db ?

.code

;Процедура Add_LONGOP: результат = A + B
;dest - адреса результату
;pA - адреса A
;pB - адреса B

Add_LONGOP proc dest:DWORD, pB:DWORD, pA:DWORD

	mov esi, pA
	mov ebx, pB
	mov edi, dest
	mov ecx, 10 

	mov edx,0
	clc 
	cycle: 
		mov eax, dword ptr[esi + 4*edx]  
		adc eax, dword ptr[ebx + 4*edx] 
		mov dword ptr[edi + 4*edx], eax   
		inc edx
		dec ecx
	jnz cycle

	ret

Add_LONGOP endp


;Процедура Sub_LONGOP: результат = A - B
;dest - адреса результату
;pA - адреса A
;pB - адреса B

Sub_LONGOP proc dest:DWORD, pB:DWORD, pA:DWORD

	mov esi, pA
	mov ebx, pB
	mov edi, dest
	mov ecx, 10

	mov edx,0
	clc
	cycle: 
		mov eax, dword ptr[esi + 4*edx]  
		sbb eax, dword ptr[ebx + 4*edx]
		mov dword ptr[edi + 4*edx], eax   
		inc edx
		dec ecx 
	jnz cycle

	ret

Sub_LONGOP endp


Mult_LONGOP proc dest:DWORD, pB:DWORD, pA:DWORD

	mov esi, pA
	mov edi, pB
	mov ebx, dest

	mov b, 0
	mov a, 0
	mov r, 0
	mov ecx, 10
	@cycle:
		push ecx
		mov ecx, 10
		@cycleInner:
			push ecx
			mov ecx, a
			mov eax, dword ptr[esi + 4 * ecx]
			mov ecx, b
			mul dword ptr[edi + 4 * ecx]
			mov ecx, r
			add eax, dword ptr[ebx + 4 * ecx]
			mov dword ptr[ebx + 4 * ecx], eax
			mov eax, dword ptr[ebx + 4 * ecx]
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

	ret

Mult_LONGOP endp


StrToDec_LONGOP proc bons:DWORD, dest:DWORD, src:DWORD

	mov esi, src
	mov edi, dest
	mov eax, 10
	mov x1, eax
	mov eax, bons
	mov x2, eax

	mov b, 0

	xor ecx, ecx
	xor ebx, ebx
	@cycle:
		push ecx
		push edi

		push esi
		push offset buf
		push offset decCode
		call Div_LONGOP

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
	
;	xor ebx, ebx
;	xor edx, edx
;	mov eax, x2
;	@shift:
;		mov bl, byte ptr [edi + eax - 2]
;		mov byte ptr [edi + eax - 2], dl
;		mov dl, bl
;		dec eax
;		cmp eax, 2
;	jne @shift

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

	ret

StrToDec_LONGOP endp


Div_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 16] ;number
	mov edi, [ebp + 12]	;integer
	mov ebx, [ebp + 8] ;fractional
	mov eax, 10
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
	ret 12
	
Div_LONGOP endp


end