assume cs: code, ds: data
data segment use16
	tab db 22h dup (255)
		db 0f2h
		db 17h dup (255)
		db 86h, 255, 81h, 255, 9eh, 255, 255
		db 94h, 88h, 91h, 82h, 93h, 80h, 8fh, 90h
		db 98h, 8eh, 8bh, 84h, 9ch, 92h, 99h, 87h
		db 89h, 8ah, 49h, 85h, 83h, 8ch, 96h, 97h
		db 8dh, 9fh
		db 20h dup (255)
		db 95h, 255, 0f4h
	;line db '{}:', 22h, '<>', '$'
	line db 'YTCNTHER >HSQ', '$'
	leng dw $ - line
	mes db '', 0dh, 0ah, 'Coverting...', 0dh, 0ah, '$'
	tt dd 20 dup(?)
data ends
code segment
beg:
	.386
	mov ax, data
	mov ds, ax
	
	lea bx, tab
	;xor di, di
	les di, tt
	lea si, line
	mov cx, leng
	cld
	
	l1:
		lodsb
		xlat
		stosb
	loop l1
	
	mov ah, 09h
	mov dx, offset line
	int 21h
	
	mov ah, 09h
	mov dx, offset mes
	int 21h
	
	xor di, di
	mov cx, leng
	mov ah, 02h
	l2:
		mov dl, es:[di]
		int 21h
		inc di
	loop l2

	mov ah, 01h
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends
end beg
