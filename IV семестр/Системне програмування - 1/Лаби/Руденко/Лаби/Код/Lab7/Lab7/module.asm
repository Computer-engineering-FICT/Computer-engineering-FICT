.586

.model flat, c

include longop.inc

.data
	tempNumber dd 0
	isNotZero db 0
.code

StrDec_MY proc
	push ebp
	mov ebp,esp
	mov ecx, [ebp+8] ;к≥льк≥сть б≥т≥в числа
	cmp ecx, 0
	jle exitp

	mov esi, [ebp+12] ;адреса числа
	mov ebx, [ebp+16] ;адреса буфера результату

	xor edx, edx

cycle:
	
	push esi
	push esi
	push offset tempNumber
	push ecx
	call DIV_10_LONGOP

	mov eax, dword ptr[tempNumber]
	call DecSymbol_MY
	mov dword ptr[ebx + edx], eax
	inc edx

	push esi
	push ecx
	call Is_zero

	cmp [isNotZero], 0
	je exitp
	jmp cycle

exitp:

	xor ecx, ecx

reverse:
	mov al, [ebx+ecx]
	mov ah, [ebx+edx]
	mov [ebx+ecx], ah
	mov [ebx+edx], al
	inc ecx
	dec edx
	cmp ecx, edx
	jl reverse	

	mov al, [ebx]
	cmp al, 0
	jne exitp2
	mov byte ptr [ebx], 32

exitp2:
	
	pop ebp
	ret 12

StrDec_MY endp

Is_zero proc
	push ebp
	push eax
	push ebx
	push ecx
	push edx	
	mov ebp,esp
	mov eax, [ebp+28] 
	mov ebx, [ebp+24] ;к≥льк≥сть б≥т≥в числа
	shr ebx, 3
	mov ecx, 0
	mov [isNotZero], 0
cycle:
	
	cmp byte ptr[eax+ecx], 0
	jne notzero

	inc ecx

	cmp ecx, ebx
	je exitp

	jmp cycle

notzero:
	mov [isNotZero], 1
	
exitp:

	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret 8
Is_zero endp

StrHex_MY proc
	push ebp
	mov ebp,esp
	mov ecx, [ebp+8] ;к≥льк≥сть б≥т≥в числа
	cmp ecx, 0
	jle exitp
	shr ecx, 3 ;к≥льк≥сть байт≥в числа
	mov esi, [ebp+12] ;адреса числа
	mov ebx, [ebp+16] ;адреса буфера результату
cycle:
	mov dl, byte ptr[esi+ecx-1] ;байт числа - це дв≥ hex-цифри
	mov al, dl
	shr al, 4 ;старша цифра
	call HexSymbol_MY
	mov byte ptr[ebx], al
	mov al, dl ;молодша цифра
	call HexSymbol_MY
	mov byte ptr[ebx+1], al
	mov eax, ecx
	cmp eax, 4
	jle next
	dec eax
	and eax, 3 ;пром≥жок розд≥люЇ групи по в≥с≥м цифр
	cmp al, 0
	jne next
	mov byte ptr[ebx+2], 32 ;код символа пром≥жку
	inc ebx
next:
	add ebx, 2
	dec ecx
	jnz cycle
	mov byte ptr[ebx], 0 ;р€док зак≥нчуЇтьс€ нулем
exitp:
	pop ebp
	ret 12
StrHex_MY endp

DecSymbol_MY proc
	and al, 0Fh
	add al, 48 
	ret
DecSymbol_MY endp


;ц€ процедура обчислюЇ код hex-цифри
;параметр - значенн€ AL
;результат -> AL
HexSymbol_MY proc
	and al, 0Fh
	add al, 48 ;так можна т≥льки дл€ цифр 0-9
	cmp al, 58
	jl exitp
	add al, 7 ;дл€ цифр A,B,C,D,E,F
exitp:
	ret
	HexSymbol_MY endp
end