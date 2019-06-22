.586
.model flat, c

.data 
	
	level1 db 432 dup(0)
	level2 db 432 dup(0)
	
	counter db 40 dup(0)
	variable db 40 dup(0)

	cf db 1 dup(0)
	cf2 db 1 dup(0)
	temp db 1 dup(0)
	regeax db 10 dup(0)
	regebx db 10 dup(0)
	regecx db 10 dup(0)
	regedx db 10 dup(0)
.code

Add_Long proc dest:DWORD, pB:DWORD, pA:DWORD 
	

	mov esi, pA		;[ebp+16] a
	mov ebx, pB		;[ebp+12] b
	mov edi, dest		;[ebp+8]  res

	mov edx, 0
	mov ecx, 384
	addAB:
		mov eax, dword ptr[esi+edx]
		adc eax, dword ptr[ebx+edx]
		mov dword ptr [edi+edx], eax
		inc edx
		inc edx
		inc edx
		inc edx
		dec ecx 
		dec ecx
		dec ecx
		dec ecx
	jnz addAB

	ret 12
Add_Long endp


Sub_Long proc dest:DWORD, pB:DWORD, pA:DWORD 


	mov esi, pA		;[ebp+16]	;a
	mov ebx, pB		;[ebp+12]	;b
	mov edi, dest		; [ebp+8]	;res

	mov ecx, 384
	mov edx, 0
	subAB:
		mov eax, dword ptr[esi+edx]
		sbb eax, dword ptr[ebx+edx]
		mov dword ptr [edi+edx], eax
		inc edx
		inc edx
		inc edx
		inc edx
		dec ecx 
		dec ecx
		dec ecx
		dec ecx
	jnz subAB

	ret 12
Sub_Long endp


Factorial proc
	

	mov ebx, [ebp+12] ;адреса результату
	mov edi, [ebp+8] ;фактор≥ал числа
	add dword ptr[ebx], 00000001h
	
	mov ecx, edi
	mov dword ptr[counter], 00000001h
	factcycle:
		mov dword ptr [variable], ecx
		

		mov ecx, 56
		mov esi, 0
		level1cycle:
			mov eax, dword ptr[ebx + esi]
			mul dword ptr [counter]
			mov dword ptr[level1 + esi], eax
			mov dword ptr[level1 + 4 + esi], edx
			add esi, 8
			sub ecx, 8
		jnz level1cycle
	

		mov ecx, 48
		mov esi, 0
		level2cycle:
			mov eax, dword ptr[ebx + 4 + esi]
			mul dword ptr[counter]
			mov dword ptr[level2 + 4 + esi], eax
			mov dword ptr[level2 + 8 + esi], edx
			add esi, 8
			sub ecx, 8
		jnz level2cycle

		mov ecx, 56
		mov esi, 0
		sumlevelscycle:
			mov eax, dword ptr[level1 + esi] 
			add cf, 0ffh
			adc eax, dword ptr[level2 + esi]
			mov cf, 0
			adc cf, 0
			mov [ebx + esi], eax 
			add esi, 4
			sub ecx, 4
		jnz sumlevelscycle


	
		inc dword ptr [counter]
		mov ecx, dword ptr [variable]
		dec ecx
	jnz factcycle


;	mov ecx, dword ptr[counter]
;	mov dword ptr[ebx], ecx


	ret 
Factorial endp

Multlong proc dest:DWORD, pB:DWORD, pA:DWORD
	

	mov esi, pA	;[ebp+16] ; a
	mov ebx, pB		;[ebp+12] ; b
	mov edi, dest		;[ebp+8] ; res

	clc
	mov ecx, 28
	mov dword ptr[counter], 0
	level0cycle:
		mov eax, dword ptr[ebx]
		mov dword ptr[variable], ecx
		mov ecx, dword ptr[counter]
		mul dword ptr[esi + ecx]
		clc
		add cf, 11111111b
		adc dword ptr[edi + ecx],  eax
		adc dword ptr[edi + 4 + ecx],  edx
		mov cf, 00000000b
		adc cf, 0
		add dword ptr [counter], 4
		mov ecx, dword ptr[variable]
		sub ecx, 4
	jnz level0cycle

	clc
;	mov cf, 00000000b
	mov ecx, 28
	mov dword ptr[counter], 0
	level1cycle:
		mov eax, dword ptr[ebx + 4]
		mov dword ptr[variable], ecx
		mov ecx, dword ptr[counter]
		mul dword ptr[esi + ecx]
		clc
		add cf, 11111111b
		adc dword ptr[edi + 4 + ecx],  eax
		adc dword ptr[edi + 8 + ecx],  edx
		mov cf, 00000000b
		adc cf, 0
		add dword ptr [counter], 4
		mov ecx, dword ptr[variable]
		sub ecx, 4
	jnz level1cycle

	clc
	mov ecx, 28
	mov dword ptr[counter], 0
	level2cycle:
		mov eax, dword ptr[ebx + 8]
		mov dword ptr[variable], ecx
		mov ecx, dword ptr[counter]
		mul dword ptr[esi + ecx]
		clc
		add cf, 11111111b
		adc dword ptr[edi + 8 + ecx],  eax
		adc dword ptr[edi + 12 + ecx],  edx
		mov cf, 00000000b
		adc cf, 0
		add dword ptr [counter], 4
		mov ecx, dword ptr[variable]
		sub ecx, 4
	jnz level2cycle

	clc
	mov ecx, 28
	mov dword ptr[counter], 0
	level3cycle:
		mov eax, dword ptr[ebx + 12]
		mov dword ptr[variable], ecx
		mov ecx, dword ptr[counter]
		mul dword ptr[esi + ecx]
		clc
		add cf, 11111111b
		adc dword ptr[edi + 12 + ecx],  eax
		adc dword ptr[edi + 16 + ecx],  edx
		mov cf, 00000000b
		adc cf, 0
		add dword ptr [counter], 4
		mov ecx, dword ptr[variable]
		sub ecx, 4
	jnz level3cycle

	clc
	mov ecx, 28
	mov dword ptr[counter], 0
	level4cycle:
		mov eax, dword ptr[ebx + 16]
		mov dword ptr[variable], ecx
		mov ecx, dword ptr[counter]
		mul dword ptr[esi + ecx]
		clc
		add cf, 11111111b
		adc dword ptr[edi + 16 + ecx],  eax
		adc dword ptr[edi + 20 + ecx],  edx
		mov cf, 00000000b
		adc cf, 0
		add dword ptr [counter], 4
		mov ecx, dword ptr[variable]
		sub ecx, 4
	jnz level4cycle

	clc
	mov ecx, 28
	mov dword ptr[counter], 0
	level5cycle:
		mov eax, dword ptr[ebx + 20]
		mov dword ptr[variable], ecx
		mov ecx, dword ptr[counter]
		mul dword ptr[esi + ecx]
		clc
		add cf, 11111111b
		adc dword ptr[edi + 20 + ecx],  eax
		adc dword ptr[edi + 24 + ecx],  edx
		mov cf, 00000000b
		adc cf, 0
		add dword ptr [counter], 4
		mov ecx, dword ptr[variable]
		sub ecx, 4
	jnz level5cycle

	clc
	mov ecx, 28
	mov dword ptr[counter], 0
	level6cycle:
		mov eax, dword ptr[ebx + 24]
		mov dword ptr[variable], ecx
		mov ecx, dword ptr[counter]
		mul dword ptr[esi + ecx]
		clc
		add cf, 11111111b
		adc dword ptr[edi + 24 + ecx],  eax
		adc dword ptr[edi + 28 + ecx],  edx
		mov cf, 00000000b
		adc cf, 0
		add dword ptr [counter], 4
		mov ecx, dword ptr[variable]
		sub ecx, 4
	jnz level6cycle


	ret 12
Multlong endp




module_changer proc
	

	mov edi, [ebp+16] ; sourse/res
	mov ebx, [ebp+12] ; m
	mov edx, [ebp+8] ; n

;	not dword ptr [edi]


	mov ecx, 544
	mov esi, 0
	cycle:
		mov dword ptr[edi + esi], 0ffffffffh 	
	add esi, 4
    sub ecx, 4
	jnz cycle


	mov ecx, ebx
	cmp ecx, 0
	jz over
	mov esi, edx
	
	cycle2:
		mov ebx, esi                       ; esi Ц це номер б≥ту 
		mov edx, ebx 
		shr ebx, 3                         ; номер байту 
		and edx, 07h                       ; позиц≥€ потр≥бного б≥ту у байт≥ 
		mov eax, 1 
		mov dword ptr [temp], ecx
		mov ecx, edx
		shl eax, cl                         ; маска 0..010..0 за умовчанн€м
		mov ecx, dword ptr [temp] 
		not eax                             ; маска 1..101..1 дл€ AND 
		and dword ptr [edi + ebx], eax 
	add esi, 1
	sub ecx, 1
	jnz cycle2
	
over:
	ret 12
module_changer endp

module_div10 proc
	
	mov esi, [ebp+20] ; sourse
	mov edi, [ebp+16] ; n-bit
	mov ebx, [ebp+12] ; res
	mov edx, [ebp+8] ; last


	mov eax, edi
	shr eax, 3
	mov dword ptr[counter], 0h
	xor ecx, ecx
	mov cl, byte ptr[esi + eax - 1]
	shr cl, 4
	sub edi, 4
again:
	cmp cl, 10
	jl little
	sub cl, 10



	mov dword ptr[regeax], eax
	xor eax, eax
	mov dword ptr[regecx], ecx
	xor ecx, ecx

	mov edx, edi
	mov ecx, edx
	shr edx, 3
	and ecx, 07h
	mov al, 1
	shl al, cl
;	not al
	or byte ptr[ebx + edx], al

	mov eax, dword ptr[regeax]
	mov edx, [ebp+8]
	mov ecx, dword ptr[regecx]

little:
	

	dec edi
	cmp edi, 0
	jl exit
	shl cl, 1

	mov dword ptr[regeax], eax
	xor eax, eax
	mov dword ptr[regecx], ecx
	xor ecx, ecx


    mov edx, edi ; Nbit Ц це номер б≥ту 
	mov ecx, edx 
	shr edx, 3 ; номер байту 
 
	and ecx, 07h ; б≥това позиц≥€ = вир≥заЇмо 3 молодш≥ б≥ти 
	mov al, 1 
	shl al, cl ; AL = маска вир≥занн€ б≥ту Nbit 
 
	mov ah, byte ptr [esi + edx] 
	and ah, al ; результат у рег≥стр≥ AH



	mov edx, [ebp+8]
	mov ecx, dword ptr[regecx]
	cmp ah, 0
	je here
	add cl, 01h

here:
	mov eax, dword ptr[regeax]
	jmp again

exit:
	mov  byte ptr[edx], cl



	ret 16
module_div10 endp


great proc



ret 

great endp

end

