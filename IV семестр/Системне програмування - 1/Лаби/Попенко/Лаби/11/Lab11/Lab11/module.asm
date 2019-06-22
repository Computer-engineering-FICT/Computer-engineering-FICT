.586
.model flat, c
.data

	base dd 0
	tmpEBX dd 0
	resAddr dd 0
	tmp dd 10 dup(0)

	expon dt 0
	mant dt 0

	x dd 0h
	fractPart db ?
	x1 dd 0h
	x2 dd 0h
	b dd 0
	two dd 2
	decCode db ?
	buf dd 80 dup(0)

.code

BinToDec_Module proc src: dword, result: dword

	mov eax, src;[ebp+16] ; число
	mov ebx, result;[ebp+12] ; результат

	xor ecx, ecx
	xor edx, edx
	mov cx, word ptr [eax+2]
	shr cx, 7
	sub cl, 127

	mov edx, dword ptr [eax]
	mov dword ptr [expon], edx
	and word ptr [expon+2], 0000000001111111b
	or word ptr [expon+2], 0000000010000000b

	mov edx, dword ptr [expon]
	mov dword ptr [mant], edx

	mov ch, cl
	@cycle1:	
	shl dword ptr [mant], 1
	and dword ptr [mant+2], 0000000001111111b
	dec ch
	cmp ch, 0
	jg @cycle1

	mov ch, 23
	sub ch, cl
	mov cl, ch ; експонента
	shr dword ptr [expon], cl

	mov byte ptr [ebx], 02Eh
	mov esi, 0

	@decWrite:
	
	mov edx, dword ptr [mant]
	shl dword ptr [mant], 1
	shl edx, 3
	add dword ptr [mant], edx
	
	mov dx, 0
	or dx, 0000011110000000b
	and dx, word ptr [mant+2]
	and word ptr [mant+2], 0000000001111111b
	shr dx, 7
	add dl, 48
	mov byte ptr [ebx+esi+1], dl
	inc esi
	cmp esi, 3
	jl @decWrite

	push offset expon
	push 8
	push ebx
	call ToDecStr_Module
	
	ret ;12

BinToDec_Module endp

ToDecStr_Module proc

	push ebp
	mov ebp,esp

	mov esi, [ebp+16]; число
	mov ebx, [ebp+12]; розмір числа в байтах
	mov ecx, [ebp+8] ; результат

	sub ebx, 4
	mov base, 10
	
	mov tmpEBX, ebx
	mov edi, 10

	@moreCycles:
	mov ebx, tmpEBX
	mov edx, 0
	@cycle1:
	mov eax, dword ptr [esi+ebx]
	div edi
	mov dword ptr [esi+ebx], 0
	mov dword ptr [esi+ebx], eax
	sub ebx, 4
	cmp ebx, 0
	jge @cycle1

	add dl, 48 ; magic number
	mov al, byte ptr [ecx+7]
	mov byte ptr [ecx+8], al 
	shl dword ptr [ecx+4], 8
	mov al, byte ptr [ecx+3]
	mov byte ptr [ecx+4], al
	shl dword ptr [ecx], 8
	mov byte ptr [ecx], dl

	mov edx, tmpEBX
	@checkCycle:
	sub edx, 4
	cmp dword ptr [esi+edx], 0
	jne @moreCycles
	cmp edx, 0
	jg @checkCycle

	pop ebp
	ret 12

ToDecStr_Module endp


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
		mov eax, esi

		div ecx
		mov fractPart, dl
		mov dword ptr[edi + 4 * ebx], eax
		dec ebx
		pop ecx
		dec ecx

		jnz @cycle

	pop ebx
	mov al, fractPart
	mov byte ptr[ebx], al

	pop ebp
	ret 16
	
DIV2_LONGOP endp


StrToDec_LONGOP proc bytesOnScreen: dword, numberOfDd: dword, decCodeLocal: dword, strCodeLocal: dword

	mov esi, strCodeLocal
	mov edi, decCodeLocal
	mov eax, numberOfDd
	mov x1, eax	
	mov eax, bytesOnScreen
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
			mov esi, eax
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

	;add esp, 16 
	ret

StrToDec_LONGOP endp

end