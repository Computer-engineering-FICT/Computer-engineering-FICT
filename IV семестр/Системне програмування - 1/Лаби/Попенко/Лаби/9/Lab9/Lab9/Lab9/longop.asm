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


;----------------------------------------
Add_Long proc
	push ebp
	mov ebp,esp

	mov esi, [ebp+16]	;addr a
	mov ebx, [ebp+12]	;addr b
	mov edi, [ebp+8]	;addr res

	mov edx, 0
	mov ecx, 6
	clc
	addAB:
	mov eax, dword ptr[esi+4*edx]
	adc eax, dword ptr[ebx+4*edx]
	mov dword ptr [edi+4*edx], eax
	inc edx
	dec ecx
	jnz addAB
	pop ebp
	ret 12
Add_Long endp

;------------------------------------------
Sub_Long proc
	push ebp
	mov ebp,esp

	mov esi, [ebp+16]
	mov ebx, [ebp+12]
	mov edi, [ebp+8]

	mov edx, 0
	mov ecx, 29
	clc
	subAB:
	mov eax, dword ptr[esi+4*edx]
	sbb eax, dword ptr[ebx+4*edx]
	mov dword ptr [edi+4*edx], eax
	inc edx
	dec ecx
	jnz subAB
	pop ebp
	ret 12
Sub_Long endp

;------------------------------------------


Factorial proc
	push ebp
	mov ebp,esp

	mov ebx, [ebp+12] ;result address
	mov edi, [ebp+8] ;dest number to count factorial of
	add dword ptr[ebx], 00000001h
	
	mov dword ptr [counter], 00000001h
	factcycle:
		mov ecx,0
		mov esi,3
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
		mov esi,3
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

		mov ecx, 5
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

;----------------------------------------

Multlong proc
	push ebp
	mov ebp,esp
	mov esi, [ebp+16] 
	mov ebx, [ebp+12] 
	mov edi, [ebp+8] ;result

	clc 
	mov edx,0
	mov ecx,0
	mov counter,5
	leve1:
		mov eax, dword ptr[esi+4*ecx]
		mul dword ptr[ebx]
		adc dword ptr[edi+4*ecx],eax
		adc dword ptr[edi+4*ecx+4],edx
		inc ecx
		dec counter
	jnz leve1

	clc
	mov edx,0
	mov ecx,0
	mov counter,5
	leve2:
		mov eax, dword ptr[esi+4*ecx]
		mul dword ptr[ebx+4]
		adc dword ptr[edi+4*ecx+4],eax
		adc dword ptr[edi+4*ecx+4+4],edx
		inc ecx
		dec counter
	jnz leve2

	clc
	mov edx,0
	mov ecx,0
	mov counter,5
	level3:
		mov eax, dword ptr[esi+4*ecx]
		mul dword ptr[ebx+8]
		adc dword ptr[edi+4*ecx+8],eax
		adc dword ptr[edi+4*ecx+4+8],edx
		inc ecx
		dec counter
	jnz level3

	clc
	mov edx,0
	mov ecx,0
	mov counter,5
	level4:
		mov eax, dword ptr[esi+4*ecx]
		mul dword ptr[ebx+12]
		adc dword ptr[edi+4*ecx+12],eax
		adc dword ptr[edi+4*ecx+4+12],edx
		inc ecx
		dec counter
	jnz level4


	clc
	mov edx,0
	mov ecx,0
	mov counter,5
	level5:
		mov eax, dword ptr[esi+4*ecx]
		mul dword ptr[ebx+16]
		adc dword ptr[edi+4*ecx+16],eax
		adc dword ptr[edi+4*ecx+4+16],edx
		inc ecx
		dec counter
	jnz level5

	pop ebp 
	ret 12
Multlong endp

;-------------------------------------------

ShiftProc proc
	push ebp
	mov ebp,esp

	mov ebx, [ebp+12] ;number
	mov edi, [ebp+8] ; shift

	mov counter , 0
	cycle:
		mov eax , dword ptr [ebx + 40] 
		and eax , 80000000h	  
		mov bit, eax		
			 
		mov ecx , 10		
		cycle2:
			mov eax , dword ptr [ebx+ 4*ecx - 4]
			and eax , 80000000h	 
			mov buf , eax
			mov eax , dword ptr [ebx + 4*ecx]
			shl eax , 1
			cmp buf,0
			jz @sett0
			or eax , 1
			jmp @gooon
			@sett0:
			and eax , 0FFFFFFFEh
			@gooon:
			mov dword ptr [ebx + 4*ecx] , eax
			dec ecx
			cmp ecx , 0
		jnz cycle2

		mov eax , dword ptr [ebx] 
		shl eax ,1
		cmp bit, 0
		jz @set0
		or eax , 1h
		jmp @goon
		@set0:
		and eax , 0FFFFFFFEh
		@goon:
		mov dword ptr [ebx] , eax
		inc counter
		cmp counter , edi
	jnz cycle
	pop ebp
	ret 8
ShiftProc endp



;---------------------------------
DIV10_ST_LONGOP proc



DIV10_ST_LONGOP endp

;---------------------------------

DIV10_GR_LONGOP proc

	push ebp
	mov ebp, esp
	
	mov esi, [ebp + 20]  ; number
	mov edi, [ebp + 16]	 ; whole part
	mov ebx, [ebp + 12]  ; fractional part
	mov eax, [ebp + 8]   ; number of bytes
	div two
	mov byteNumber, eax; number of bytes / 2

	push ebx
	xor edx, edx ; clear edx
	mov ecx, byteNumber; counter
	dec byteNumber
	mov ebx, byteNumber
	mov fractionalPart , 0
	@cycle :
		push ecx; save value of counter
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
;5 / x * 2^(m + 1)
Function proc
	push ebp
	mov ebp,esp

	mov eax , [ebp + 12]; X
	mov ecx , [ebp + 8] ; M
	inc ecx  
	mov ebx, 5  
   	mov edx , 1
	shl edx , cl ; cl save 8 beets of ecx, so in cl stores M
	imul edx
	idiv ebx
	pop ebp
	ret 8
Function endp


end

