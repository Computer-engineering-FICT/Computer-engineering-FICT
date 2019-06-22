.586
.model flat, c

.data 
	
	level1 db 240 dup(0)
	level2 db 240 dup(0)
	
	counter dd 1
	variable db 32 dup(0)
	bit dd ?
	buf dd ?
	maska db ?
	imaska dd 1
	fractionalPart dw 0
	byteNumber dd ?
	two db 2
	
	shiftNumber db ?
	x dd 0h
	shift db 0
	TEN db 1010b
	flag db 0
.code



Factorial proc
	push ebp
	mov ebp,esp

	mov ebx, [ebp+12] ;адреса результату
	mov edi, [ebp+8] ;факторіал числа
	add dword ptr[ebx], 00000001h
	
	mov dword ptr [counter], 00000001h
	factcycle:
		mov ecx,0
		mov esi,4
		level1cycle:
			mov eax, 0
			mov edx, 0
			mov eax, dword ptr[ebx + 8*ecx]
			mul dword ptr [counter]
			mov dword ptr[level1 + 8*ecx], eax
			mov dword ptr[level1 + 4 + 8*ecx], edx
			inc ecx
			dec esi
		jnz level1cycle

		mov ecx,0
		mov esi,4
		level2cycle:
			mov eax, 0
			mov edx, 0
			mov eax, dword ptr[ebx + 4 + 8*ecx]
			mul dword ptr[counter]
			mov dword ptr[level2 + 4+8*ecx], eax
			mov dword ptr[level2 + 8 + 8*ecx], edx
			inc ecx
			dec esi
		jnz level2cycle

		mov ecx, 7
		mov esi, 0
		clc
		sumlevels:
			mov eax,0
			mov eax, dword ptr[level1 + 4*esi] 
			adc eax, dword ptr[level2 + 4*esi]
			mov [ebx + 4*esi], eax 
			inc esi
			dec ecx
		jnz sumlevels

		mov eax, 0
		mov eax, dword ptr[counter]
		add eax, 00000001h
		mov dword ptr[counter], eax
		cmp eax, [ebp+8]
	jle factcycle 


	pop ebp
	ret 12
Factorial endp


;---------------------------------

DIV10_GR_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 20]  ; Число
	mov edi, [ebp + 16]		;Целая часть
	mov ebx, [ebp + 12] ;Остаток
	mov eax, [ebp + 8] ; Количество байтов
	div two
	mov byteNumber, eax; Количество байтов/2

	push ebx
	xor edx, edx ; обнуление edx
	mov ecx, byteNumber; Счетчик
	dec byteNumber
	mov ebx, byteNumber
	mov fractionalPart , 0
	@cycle :
		push ecx; Сохраняем значение счетчика
		mov cx, 10
		mov ax, word ptr[esi + 2 *  ebx]
		div cx
		mov fractionalPart, dx
		mov word ptr[edi + 2 * ebx], ax
		dec ebx
		pop ecx
		dec ecx
		jnz @cycle
	pop ebx
	mov ax, fractionalPart
	mov word ptr[ebx], ax
	pop ebp
	ret 16
	
DIV10_GR_LONGOP endp

;----------------------

MyFunction proc
	push ebp
	mov ebp,esp

	mov eax , [ebp + 12]; X
	cdq
	mov ecx , [ebp + 8] ; M
	mov ebx , 5
	idiv ebx
	shr eax , cl
	pop ebp
	ret 8
MyFunction endp


end

