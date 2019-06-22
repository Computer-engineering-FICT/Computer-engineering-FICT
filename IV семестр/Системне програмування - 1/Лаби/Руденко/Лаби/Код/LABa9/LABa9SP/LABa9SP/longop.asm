.586
.model flat, c

.data 
	numberOfBytes dd ?
	bits dd 0h
	dbytes dd 0h
	bitNumber dd ?
	count dd ?
	inner dd 0
	x dd 0h
	x1 dd 0h
	x2 dd 0h
	x3 dd 0
	a dd 0
	b dd 0
	r dd 0
	fractionalPart db ?
	g db 0
	maska db 0
	shiftNumber db ?
	TEN db 1010b
	DTEN db 1010b
	two dd 2
	buf dd 80 dup(0)

	bufForFactorial dd 1h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h
	decCode db ?
	four dd 4
	counter dd 0
	shift db 0
	insertBit db 0
	flag db 0
	count8 dq 0.0
	countForadd dq 0.0
	znak db 0h

	floatNumber db 0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h
	intNumber db 7 dup(?)

	buffer dd 128 dup(?)

.code

Add_448_LONGOP proc
	
	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov ebx, [ebp + 12]
	mov edi, [ebp + 8]

	mov ecx, 14
	mov edx, 0
    clc

	cycle:
	mov eax, dword ptr[esi + 4 * edx]
	adc eax, dword ptr[ebx + 4 * edx]
	mov dword ptr[edi + 4 * edx], eax
	
	inc edx
	dec ecx
	jnz cycle	

	pop ebp
	ret 12

Add_448_LONGOP endp	

Sub_672_LONGOP proc
		push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov ebx, [ebp + 12]
	mov edi, [ebp + 8]

	mov ecx, 21
	mov edx, 0
    clc

	cycle:
	mov eax, dword ptr[esi + 4 * edx]
	sbb eax, dword ptr[ebx + 4 * edx]
	mov dword ptr[edi + 4 * edx], eax
	
	inc edx
	dec ecx
	jnz cycle	

	pop ebp
	ret 12

Sub_672_LONGOP endp	

Mul_N_x_32_LONGOP proc

	
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


Mul_N_x_32_LONGOP endp


Mul_N_x_N_LONGOP proc

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

SHL_NORM_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov edi, [ebp + 12]
	mov esi, [ebp + 8]

	@cycle:

		mov al, byte ptr[esi + 75]
		and al, 0F0h
		;shr al, 4
		cmp al, 0
		
		jne @exit
	
		xor ecx, ecx
		xor ah, ah
		xor al, al

		@cycleInner:
		
			mov ah, al
		
			mov al, byte ptr[esi + 3 + 4 * ecx]
			and al, 0F0h
			shr al, 4

			shl dword ptr[esi + 4 * ecx], 4
			add ah, byte ptr[esi + 4 * ecx]
			mov byte ptr[esi + 4 * ecx], ah
			inc ecx
			cmp ecx, 19
			jl @cycleInner
		
		inc x
		jmp @cycle		

	@exit:
	mov eax, x	
	mov dword ptr[edi], eax

	pop ebp
	ret 8

SHL_NORM_LONGOP endp

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++LABA 7 SP++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DIV1_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 20]
	mov edi, [ebp + 16]
	mov edx, [ebp + 12]
	mov eax, [ebp + 8]
	mov x, eax
	
	
	mov ecx, x
	dec x
	mov ebx, x

	mov maska, 10h
	mov counter, 5
	mov shift, 4

	mov flag, 1

	mov al, byte ptr[esi + ebx]
	and al, 0F0h 
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
			jmp @EXIT	
			@Greater:
				push edx
				mov dl, maska
				add dl, byte ptr[edi + ebx]
				mov byte ptr[edi + ebx], dl
				sub al, TEN
				pop edx
			@EXIT:

			shr maska, 1
			dec shift
			
			dec ecx
			jnz @cycleInner

		mov flag, 0
		mov shift, 7
		mov maska, 80h
		mov counter, 8
		pop ecx
		dec ecx
		jnz @cycle

		mov byte ptr[edx],al


	pop ebp
	ret 16

DIV1_LONGOP endp




DIV2_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 20]  ; number
	mov edi, [ebp + 16]		;integer
	mov ebx, [ebp + 12] ;fractional
	mov eax, [ebp + 8] ; bytes
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

FACTORIAL_LONGOP proc 

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


getSolution_LONGOP proc

	mov ebx, eax
	
	add eax, 3
	sub ebx, 3

	xor edx, edx

	div ebx

	shl eax, cl


	ret


getSolution_LONGOP endp



;++++++++++++++++++++++++++++++++ LABA 8 ++++++++++++++++++++++++++++++++

FUNCTION_LONGOP proc

	push ebp 
	mov ebp, esp

	mov esi, [ebp + 20] ;result
	mov edi, [ebp + 16] ; A
	mov ebx, [ebp + 12] ; B
	mov edx, [ebp + 8] ; N
	mov x, edx

	
	mov eax, dword ptr[ebx]
	mov dword ptr[count8], eax
	mov eax, dword ptr[ebx + 4]
	mov dword ptr[count8 + 4], eax

	fld qword ptr[esi]

	xor edx, edx
	mov ecx, x
	@cycle:

	fld qword ptr[countForadd]

	fcos 

	fmul qword ptr[edi + 8 * edx]
	
	fadd st(0), st(1)
	
	fld qword ptr[countForadd]
	fadd qword ptr[count8]
	fstp qword ptr[countForadd]
	
		
	inc edx
	dec ecx
	jnz @cycle

	fstp qword ptr[esi]

	pop ebp
	ret 16
 

FUNCTION_LONGOP endp


FloatToDec_LONGOP proc

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov edi, [ebp + 12]
	mov eax, [ebp + 8]
	mov x2, eax

	xor eax, eax

	mov al, byte ptr[esi + 7]
	and al, 80h
	;shr al, 7
	mov znak, al

	mov ax, word ptr[esi + 6]
	and ax, 7FF0h
	shr ax, 4
	sub ax, 1023


	and word ptr[esi + 6], 000Fh
	add byte ptr[esi + 6], 10h



	mov ecx, 0
	@cycle:

		mov bl, byte ptr[esi + ecx]
		mov byte ptr[floatNumber + ecx], bl
		
		inc ecx
		cmp ecx,7
		jne @cycle


	push esi
	push edi
	push ax

	push offset floatNumber
	push 4
	push 14
	call SHL_LONGOP

	pop ax


	cmp ax, 0
	jge @greater

	not ax
	inc ax

	push offset floatNumber
	push eax
	push 14
	call SHR_LONGOP
	jmp @exit


	@greater:
	push offset floatNumber
	push eax
	push 14
	call SHL_LONGOP

	@exit:

	pop edi
	pop esi

	

	mov ecx, 0
	@cycle1:
		
		mov al, byte ptr[floatNumber + ecx + 7]
		mov [floatNumber + ecx + 7], 0
		mov byte ptr[intNumber + ecx], al

		inc ecx

		cmp ecx, 7
		jne @cycle1


	mov ecx, 6
	@cycle2:

		push esi 
		push edi
		push ecx
		
		push offset buf
		push offset floatNumber
		push 10
		call Mul_N_x_32_LONGOP

		pop ecx
		pop edi
		pop esi

		mov al, byte ptr[buf + 7]
		mov byte ptr[buf + 7], 0
		add al, 48
		mov byte ptr[edi + ecx - 1], al
			
			push ecx
			xor ecx, ecx	
			@cycle3:
				mov al, byte ptr[buf + ecx]
				mov byte ptr[floatNumber + ecx], al
				inc ecx
				cmp ecx, 7
				jne @cycle3

				pop ecx

		dec ecx
		jnz @cycle2


	mov byte ptr[edi + 6], 46

	
	mov b, 7

	xor ecx, ecx
	xor ebx, ebx
	@cycle4:

		push ecx
		push edi

		push offset intNumber
		push offset buf
		push offset decCode
		call DIV3_LONGOP

		pop edi
		mov ebx, b
		mov al, byte ptr[decCode]
		add al, 48
		mov byte ptr[edi + ebx], al

		xor ecx, ecx
		@cycleInner:
			mov eax, dword ptr[buf + 4 * ecx]
			mov dword ptr[intNumber + 4 * ecx], eax
			mov dword ptr[buf + 4 * ecx], 0
			inc ecx
			cmp ecx, 7
			jl @cycleInner

		pop ecx
		inc ecx
		inc b
		cmp ecx, x2
		jl @cycle4



	cmp znak, 0
	ja @above
	jmp @exit1

	@above:
	mov byte ptr[edi + ebx], 45

	@exit1:

	add x2, 7
	mov ebx, x2
	mov eax, x2
	xor edx, edx
	div two
	mov x2, eax
	dec ebx 
	xor ecx, ecx	
	@cycle5:

		mov al, byte ptr[edi + ecx]
		mov ah, byte ptr[edi + ebx]
		mov byte ptr[edi + ecx], ah
		mov byte ptr[edi + ebx], al
		
		dec ebx
		inc ecx
		cmp ecx, x2
		jl @cycle5
		
	pop ebp
	ret 12


	

FloatToDec_LONGOP endp


DIV3_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 16]  ;number
	mov edi, [ebp + 12]  ; integer
	mov ebx, [ebp + 8] ;fractional

	push ebx

	xor eax, eax
	mov ecx, 7
	mov ebx, 6

	@cycle :
		push ecx
		mov cl, 10

		mov al, byte ptr[esi + ebx]

		div cl

		mov byte ptr[edi + ebx], al

		dec ebx
		pop ecx
		dec ecx
		jnz @cycle

	
	pop ebx
	mov byte ptr[ebx], ah

	pop ebp
	ret 12
	
DIV3_LONGOP endp

SHL_LONGOP proc

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16]
	mov edi, [ebp + 12]
	mov x, edi
	;xor ecx, ecx
	mov ecx, x

	cmp ecx, 0

	je @exit

	mov edi, [ebp + 8]
	mov x, edi

	@cycle:
		
		push ecx
		mov ecx, 0

		xor al, al
		xor ah, ah
		
		@cyleinner:
			
			mov ah, al

			mov al, byte ptr[esi + ecx]
			and al, 80h
			shr al, 7

			shl byte ptr[esi + ecx], 1
			add byte ptr[esi + ecx], ah

			inc ecx
			cmp ecx, x

			jne @cyleinner
				
		pop ecx
		dec ecx
		jnz @cycle

	@exit:

	pop ebp
	ret 12


SHL_LONGOP endp


SHR_LONGOP proc

	push ebp
	mov ebp, esp

	mov esi, [ebp + 16] ; number
	mov eax, [ebp + 12] ; na skolko
	mov ecx, eax
	mov eax, [ebp + 8] ; skolko byte
	mov x3, eax


	@cycle:
		push ecx
		mov ecx, x3
		mov ebx, x3
		dec ebx
		xor al, al
		xor ah, ah
		@cycleInner :

			mov ah, al

			mov al, byte ptr[esi + ebx]
			and al, 1h
			shl al, 7

			shr byte ptr[esi + ebx], 1
			add byte ptr[esi + ebx], ah

			dec ebx
			dec ecx
			jnz @cycleInner

		pop ecx
		dec ecx
		jnz @cycle

	pop ebp
	ret 12

SHR_LONGOP endp

;++++++++++++++++++++++++++++++LABa9_SP++++++++++++++++++++++++++++++

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
