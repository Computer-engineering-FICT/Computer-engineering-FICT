.586
.model flat, c
.code

Or_Longop proc

	push ebp
	mov ebp, esp

	mov ecx, [ebp + 8] ;розрядність маски
	mov edx, [ebp + 12] ;номер біта
	mov esi, [ebp + 16] ;адреса маски
	mov edi, [ebp + 20] ;адреса вихідного рядка

	shr ecx, 3
	shr edx, 3

	cycleOR:
		add edx, ecx
		mov al, byte ptr [edi + edx - 1]
		or al, byte ptr [esi + ecx - 1]
		mov byte ptr [edi + edx - 1], al
		sub edx, ecx
		dec ecx
	jnz cycleOR

	pop ebp

	ret 16

Or_Longop endp

end