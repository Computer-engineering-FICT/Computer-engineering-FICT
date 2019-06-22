.586
.model flat, c
include longop.inc
.data
	ddNumber dd 0h
	byteNumber dd 0h
	b dd 0
	buf dd 80 dup(?)
	decCode dd 50 dup (?)
	two dd 2
.code
;процедура StrHex_MY записує текст шістнадцятькового коду
;перший параметр - адреса буфера результату (рядка символів)
;другий параметр - адреса числа
;третій параметр - розрядність числа у бітах (має бути кратна 8)
StrHex_MY proc
push ebp
mov ebp,esp
mov ecx, [ebp+8] ;кількість бітів числа
cmp ecx, 0
jle @exitp
shr ecx, 3 ;кількість байтів числа
mov esi, [ebp+12] ;адреса числа
mov ebx, [ebp+16] ;адреса буфера результату
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
pop ebp
ret 12
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



StrToDec_LONGOP proc 
	push ebp
	mov ebp, esp

	mov dword ptr[b], 0

	mov esi, [ebp + 20] ;number
	mov edi, [ebp + 16] ;text buf
	mov eax, [ebp + 12]
	mov ddNumber, eax      ; number of dd
	mov eax, [ebp + 8]
	mov byteNumber, eax      ; bytes on screan


	xor ecx, ecx
	xor ebx, ebx
@cycle:
	push ecx
	push edi

	push esi; Число для перевода
	push offset buf   ; Целая часть
	push offset decCode  ; Остаток
	push  byteNumber   ; Колическтво байтов
	call DIV10_GR_LONGOP
		
	pop edi
	mov ebx, b
	mov al, byte ptr[decCode]
	add al, 48
	mov byte ptr[edi + ebx], al ; запись символа в буфер текста

	xor ecx, ecx
	@cycleInner:
		mov eax, dword ptr[buf + 4 * ecx] ; целую часть в еах
		mov dword ptr[esi + 4 * ecx], eax  ; еах в делимое
		mov dword ptr[buf + 4 * ecx], 0 ; обнуление
		inc ecx
		cmp ecx, ddNumber
		jl @cycleInner

	pop ecx
	inc ecx
	inc b
	cmp ecx, byteNumber
	jl @cycle
	
	mov ebx, byteNumber
	mov eax, byteNumber
	xor edx, edx
	div two
	mov byteNumber, eax
	dec ebx 
	xor ecx, ecx	
@cycle1:
	
	mov al, byte ptr[edi + ecx]; в аl первые байт буфера текста
	mov ah, byte ptr[edi + ebx];в аh последние
	mov byte ptr[edi + ecx], ah;менем их местами
	mov byte ptr[edi + ebx], al
		
	dec ebx
	inc ecx
	cmp ecx, byteNumber
	jl @cycle1

	pop ebp
	ret 16

StrToDec_LONGOP endp

end