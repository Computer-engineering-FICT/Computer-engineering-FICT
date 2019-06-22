.586
.model flat, c
include \masm32\modules\longop.inc
.data
	temp db 544 dup(0)
	number db 544 dup(0)
	last db 544 dup(0)
	count db 10 dup(0)
	result db 544 dup(0)
	reggeax db 10 dup(0)
	reggebx db 10 dup(0)
	reggecx db 10 dup(0)
	reggedx db 10 dup(0)
	reggesi db 10 dup(0)
	reggedi db 10 dup(0)
	variable db 10 dup(0)
.code
;процедура StrHex_MY записує текст шістнадцятькового коду
;перший параметр - адреса буфера результату (рядка символів)
;другий параметр - адреса числа
;третій параметр - розрядність числа у бітах (має бути кратна 8)
StrHex_MY proc bits:DWORD, src:DWORD, dest:DWORD 

	mov ecx, bits			;[ebp+8] ;кількість бітів числа
	cmp ecx, 0
	jle @exitp
	shr ecx, 3 ;кількість байтів числа
	mov esi, src			; [ebp+12] ;адреса числа
	mov ebx, dest				;[ebp+16] ;адреса буфера результату
	@cycle:
	mov dl, byte ptr[esi+ecx-1] ;байт числа - це дві hex-цифри
	mov al, dl
	shr al, 4 ;старша цифра
	call HexSymbol_MY
	mov byte ptr[ebx], al
	mov al, dl ;молодша цифра
	call HexSymbol_MY
	mov byte ptr[ebx+1], al
	mov eax, ecx
	cmp eax, 4
	jle @next
	dec eax
	and eax, 3 ;проміжок розділює групи по вісім цифр
	cmp al, 0
	jne @next
	mov byte ptr[ebx+2], 32 ;код символа проміжку
	inc ebx
	@next:
	add ebx, 2
	dec ecx
	jnz @cycle
	mov byte ptr[ebx], 0 ;рядок закінчується нулем
	@exitp:
	
	ret 
	StrHex_MY endp
	;ця процедура обчислює код hex-цифри
	;параметр - значення AL
	;результат -> AL
	HexSymbol_MY proc
	and al, 0Fh
	add al, 48 ;так можна тільки для цифр 0-9
	cmp al, 58
	jl @exitp
	add al, 7 ;для цифр A,B,C,D,E,F
	@exitp:
	ret
HexSymbol_MY endp

StrDec proc
	

	mov dword ptr[count], 0
	mov eax, [ebp + 16] ; result
	mov ebx, [ebp + 12] ; number
	mov ecx, [ebp + 8] ; n-bit

	cmp ecx, 0								; якщо розрядність 0 - на вихід
	je exit									;

	xor edi, edi						   ;
	cycle22:                               ;
		mov dword ptr[result  + edi], 0    ; 
		mov dword ptr[number + edi], 0     ;
	add edi, 4                             ;
	cmp edi, 544                           ;                             
	jl cycle22

	xor edi, edi						   ;
	cycle1:                                ;
		mov esi, dword ptr[ebx  + edi]     ; заносимо в масив діленого число для конвертування
		mov dword ptr[number + edi], esi   ;
	add edi, 4                             ;
	cmp edi, 544                           ;
	je again                               ;
	jmp cycle1

again:
;-----------------------------------------------------------------------------
;---------запис залишку в молодші розряди байта--------------------------------
;-----------------------------------------------------------------------------
	mov dword ptr[reggecx], ecx             ;
	mov dword ptr[reggedx], edx				; зберігаємо стани регістрів
	mov dword ptr[reggesi], esi				;
	mov dword ptr[reggedi], edi				;


	push offset number			;
	push [ebp + 8]				;
	push offset result			; викликаємо ділення
	push offset last			;
	call module_div10			;
;	add esp, 16

	mov ecx, dword ptr[last]
;	mov edx, dword ptr[result]

	mov ecx, dword ptr[reggecx]	;
	mov edx, dword ptr[reggedx]	; відновлюємо стани регістрів
	mov esi, dword ptr[reggesi]	;
	mov edi, dword ptr[reggedi]	;

	xor ecx, ecx							;
	xor edi, edi							;
	cycle2:									;
		mov esi, dword ptr[result  + edi]	;
		cmp esi, 0							;
		je nothing							;
		inc ecx								; перевіряємо результат ділення на 0
nothing:									;
	add edi, 4								;
	cmp edi, 544							;
	je next1								;
	jmp cycle2								;
next1:

	mov eax, [ebp + 16]						;	
	mov dl, byte ptr[last]					;  заносимо залишок від ділення в результат
	mov esi, dword ptr[count]				;
	add byte ptr[eax + esi], dl				;

	cmp ecx, 0								; якщо результат ділення 0 - на вихід
	je exit									;
	

	xor edi, edi							;
	cycle:									;
		mov esi, dword ptr[result  + edi]	;
		mov dword ptr[result + edi], 0h		; переносимо результат ділення в масив діленого
		mov dword ptr[number + edi], esi	;
	add edi, 4								;
	cmp edi, 544							;
	je nexth								;
	jmp cycle								;

nexth:
;-----------------------------------------------------------------------------
;---------запис залишку в старші розряди байта--------------------------------
;-----------------------------------------------------------------------------
	mov dword ptr[reggecx], ecx             ;
	mov dword ptr[reggedx], edx				; зберігаємо стани регістрів
	mov dword ptr[reggesi], esi				;
	mov dword ptr[reggedi], edi				;


	push offset number			;
	push [ebp + 8]				;
	push offset result			; викликаємо ділення
	push offset last			;
	call module_div10			;
;	add esp, 16

	mov ecx, dword ptr[last]
;	mov edx, dword ptr[result]

	mov ecx, dword ptr[reggecx]	;
	mov edx, dword ptr[reggedx]	; відновлюємо стани регістрів
	mov esi, dword ptr[reggesi]	;
	mov edi, dword ptr[reggedi]	;

	xor ecx, ecx							;
	xor edi, edi							;
	cycle2h:								;
		mov esi, dword ptr[result  + edi]	;
		cmp esi, 0							;
		je nothingh							;
		inc ecx								; перевіряємо результат ділення на 0
nothingh:									;
	add edi, 4								;
	cmp edi, 544							;
	je next1h								;
	jmp cycle2h								;
next1h:

	mov eax, [ebp + 16]						;	
	mov dl, byte ptr[last]					;  заносимо залишок від ділення в результат
	shl dl, 4								;
	mov esi, dword ptr[count]				;
	add byte ptr[eax + esi], dl				;

	cmp ecx, 0								; якщо результат ділення 0 - на вихід
	je exit									;
	

	xor edi, edi							;
	cycleh:									;
		mov esi, dword ptr[result  + edi]	;
		mov dword ptr[result + edi], 0h		; переносимо результат ділення в масив діленого
		mov dword ptr[number + edi], esi	;
	add edi, 4								;
	cmp edi, 544							;
	je next									;
	jmp cycleh								;

next:										; повторюємо процес з початку
	add dword ptr[count], 01h				;
	jmp again								;

exit:

;	mov eax, [ebp + 16]
;	mov ebx, dword ptr[last]
;	mov dword ptr[eax], ebx
	
	ret 12
StrDec endp

end


