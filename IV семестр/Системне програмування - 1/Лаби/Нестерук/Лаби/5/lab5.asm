.386
assume cs: code, ss: stk

code segment use16
beg:
	mov ax, 3
	int 10h
	
	jmp code_contin
		message db 'Yurii Nesteruk, variant #220'
		len equ $-message
code_contin:

	mov ax, 0b800h
	mov es, ax
	
	mov di, 160
	mov bx, offset message - 8
	mov cx, len
	mov ah, 3

m1:
	mov al, message[bx]
	inc bx
	mov es:[di], ax
	add di, 2
	loop m1
	
	
	
	xor di, di
	mov cx, len
copy_mess:
	mov al, message[di]
	mov ss:dest[di], al
	inc di
	loop copy_mess
	
	mov ah, 1
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends

stk segment stack
	dest db ?
	dw 40 dup(?)
stk ends
end beg