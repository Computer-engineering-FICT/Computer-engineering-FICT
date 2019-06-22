.586
.model flat, c

.data 

	counter dd 0
	text_shift dd 0

	zero dd 48
	one dd 49



.code

include longop.inc

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



FloatToDec_module proc
	
	push ebp
	mov ebp, esp

	mov esi, [ebp + 8];esi 32 бітове число
	mov edi, [ebp + 12];edi адреса текстового буферу
	;mov ecx, edi

	;--------------вставка знаку числа

	mov eax, esi
	and eax, 80000000h
	cmp eax, 0
	je @end_sign
		mov byte ptr[edi], 45
		inc edi
	@end_sign:
	mov ecx, edi
	;--------------перевірка е
	mov eax, esi
	and eax, 7F800000h
	shr eax, 23

	cmp eax, 0
	jne @next
		mov byte ptr[edi], 48
		jmp @endproc
	@next:

	cmp eax, 0FFh
	jne @next2
		mov byte ptr[edi], 78
		mov byte ptr[edi + 1], 65
		mov byte ptr[edi + 2], 78
		jmp @endproc
	@next2:

	sub eax, 7Fh

	;------------проверка Е 
	cmp eax, 0
	jge @next3
		mov byte ptr[edi], 48
		inc ecx
		mov ebx, esi
		and ebx, 7FFFFFh ;мантиса
		add ebx, 800000h ;прихована одиниця в 24 розр.
		mov edx, 0FFFFFFFFh ;-1
		imul edx
		mov edx, ecx
		mov ecx, eax
		shr ebx, cl
		mov ecx, edx
		jmp @fraction
	@next3:

	jg @next4
		mov byte ptr[edi], 49
		inc ecx
		mov ebx, esi
		and ebx, 7FFFFFh
		jmp @fraction
	@next4:

	push ecx

	;-------пошук цілої частини
	mov ecx, 23
	sub ecx, eax ;експонента (позиція від якої накладати маску)
	push ecx

	mov eax, esi
	and eax, 7FFFFFh
	add eax, 800000h ;прихована одиниця в 24 розр.
	
	xor ebx, ebx
	mov ebx, 1
	shl ebx, cl
	mov edx, ebx

	@mask:
		inc cl
		shl ebx, 1
		add ebx, edx

		cmp cl, 24
	jne @mask

	mov edx, eax
	and edx, ebx ;целая часть
	
	mov ebx, eax
	sub ebx, edx ;дробная

	pop ecx
	shr edx, cl ;cдвиг целой к 0 разряду
	
	mov eax, 23
	sub eax, ecx
	mov ecx, eax
	shl ebx, cl ;сдвиг дробной к 23 разряду
	

	mov eax, edx
	pop ecx
	push ebx
	mov ebx, 10
	@full_part: ;обрахунок цілої частини
		xor edx, edx
		div ebx
		add edx, 48
		mov byte ptr[ecx], dl 
		inc ecx
		cmp eax, 0
	jne @full_part

	mov eax, ecx
	dec eax
	@reverse:
		xor edx, edx
		mov dh, byte ptr[eax]
		mov dl, byte ptr[edi]
		mov byte ptr[eax], dl
		mov byte ptr[edi], dh
		inc edi
		dec eax
		cmp edi, eax 
	jl @reverse


	pop ebx
	;-------пошук дробової частини в ebx 23 разр. дроби
	@fraction:
	mov byte ptr[ecx], 44
	inc ecx

	mov ax, 6
	@cycle:
		
		shl ebx, 1
		mov edx, ebx
		shl edx, 2
		add ebx, edx

		mov edx, ebx
		and edx, 0FF800000h
		shr edx, 23

		add dl, 48

		mov [ecx], dl 
		and ebx, 7FFFFFh

		inc ecx
		dec ax
		cmp ax, 0
		jne @cycle
	@endproc:

	pop ebp
	ret 8

FloatToDec_module endp

StrDec_module proc text:DWORD, number:DWORD, quant:DWORD 

	;mov counter, 33
	mov text_shift, 0

	;mov edi, [ebp + 8] ; текст результатa (адрес)
	;mov esi, [ebp + 12] ; длинное число (адрес)
	;mov ebx, [ebp + 16] ; розрядность числа (пока ячейками по 4 байта)

	mov ecx, quant
	xor ebx, ebx

	@cycle:

		push quant
		push number
		call Div10_longop

		add dl, 48
		mov ebx, text_shift
		mov edi, text
		mov byte ptr[edi + ebx], dl
		;mov byte ptr[text + ebx], dl

		inc text_shift

		;---------------------вставка пробела
		mov eax, text_shift
		inc eax
		xor edx, edx
		mov ecx, 4
		div ecx

		cmp edx, 0
		jne @else
			mov ecx, text_shift
			mov edi, text
			mov byte ptr[edi + ecx], 32
			inc text_shift
		@else:
		;---------------------конец
		
		mov ecx, quant
		mov eax, number
		@check:
			dec ecx
			cmp ecx, -1
		je @endcheck
											
		mov edx, dword ptr[eax + ecx*4]
		cmp edx, 0

		je @check
		jne @cycle

	@endcheck:

	xor ecx, ecx
	mov eax, text_shift
	mov ebx, text

	dec eax
	@reverse:
		mov dh, byte ptr[ebx + eax]
		mov dl, byte ptr[ebx + ecx]
		mov byte ptr[ebx + eax], dl
		mov byte ptr[ebx + ecx], dh
		
		inc ecx
		dec eax
		cmp ecx, eax
	jle @reverse

	ret 12
	
StrDec_module endp

end