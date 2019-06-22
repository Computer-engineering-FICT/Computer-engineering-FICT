.586
.model flat, c
.xmm

.data

	x dd 0
	y dd 0

	ten dd 10

.code

TAN_Function_longop proc

	LOCAL temp : DWORD
	
	;push ebp
	;mov ebp, esp

	mov edi, [ebp + 8] ;B
	mov esi, [ebp + 12] ;A array
	mov eax, [ebp + 16] ;Result
	mov ecx, [ebp + 20] ;iterations
	
	dec ecx
	fld dword ptr[esi] 

	@cycle:

		fld dword ptr [edi]
		fptan 
		fstp temp ;1
		mov edx, temp
		fst temp ;tan
		mov edx, temp
		mov ebx, ecx

		@tan_pow:
			
			fmul temp
			
			dec ebx
			cmp ebx, 0 
		jne @tan_pow

		fmul dword ptr[esi + ecx*4]
		faddp ST(1), ST(0)

		dec ecx
		cmp ecx, 0
	jne @cycle

	fstp dword ptr[eax]

	;pop ebp
	ret 12

TAN_Function_longop endp

Div10_longop proc
	
	push ebp
	mov ebp, esp

	mov edi, [ebp + 8] ; Source многоразрядное (адрес) и частное
		;mov esi, [ebp + 12] ; часткове (адрес)
		;mov ebx, [ebp + 16] ; залишок
	mov ecx, [ebp + 12] ; розрядність в группах по 4 байта

	xor edx, edx
	dec ecx

	@cycle:
		
		mov eax, dword ptr[edi + ecx*4]

		div ten

		mov dword ptr[edi + ecx*4], eax  ;для удобства частное записывается в source

		dec ecx
		cmp ecx, -1

	jne @cycle 

	pop ebp
	ret 8

Div10_longop endp

Shift_longop proc

	push ebp
	mov ebp, esp

	mov edi, [ebp + 8] ; Operand
	mov esi, [ebp + 12] ; Result
	mov ecx, [ebp + 16] ; N
	;mov edx, [ebp + 20] ; N в байтах 


	@cycle:

		mov ebx, [ebp + 20]
		dec ebx
		xor dh, dh

		@shift_oper:
	
			mov al, byte ptr[edi + ebx]
			mov ah, al
			and al, 0001h
			
			shr ah, 1
			mov byte ptr[edi + ebx], ah
			add byte ptr[edi + ebx], dh
			
			shl al, 7		
			mov dh, al		

			dec ebx
			cmp ebx, -1
		jne @shift_oper

		mov ebx, [ebp + 20]
		dec ebx

		@shift_res:

			mov al, byte ptr[esi + ebx]
			mov ah, al
			and al, 0001h
			
			shr ah, 1
			mov byte ptr[esi + ebx], ah
			add byte ptr[esi + ebx], dh
			
			shl al, 7		
			mov dh, al	


			dec ebx
			cmp ebx, -1
		jne @shift_res

	dec ecx
	cmp ecx, 0
	jne @cycle

	pop ebp
	ret 16

Shift_longop endp


end


