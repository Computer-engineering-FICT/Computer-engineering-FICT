.386
assume cs: code, ds: data
data segment use16
	request db 'Input term(2): ', 0dh, 0ah, '$'
	sterm db 32 dup (?)
	result db 0dh, 0ah, 'Output term10: ', 0dh, 0ah, '$'
	dterm db '+0000000000d'
	e db '$'
data ends

code segment use16
beg:
	mov ax, data
	mov ds, ax
	
	mov dx, offset request
	mov ah, 9
	int 21h
	
	mov ah, 1
	int 21h
	mov sterm, al
	
	xor si, si
	read:
		inc si
		mov ah, 1
		int 21h
		mov sterm[si], al
		cmp al, 'b'
	jnz read
	
	dec si
	mov cx, si
	
	xor eax, eax
	xor si, si
	c1:
		inc si
		mov dl, sterm[si]
		sub dl, 30h
		shl eax, 1
		add eax, edx
	loop c1
	cmp sterm, '-'
	jnz l1
		neg eax
	l1:
	
	or eax, eax
	jns l2
		neg eax
		mov dterm, '-'
    l2: 	
	
    mov si, offset(dterm+10)
    mov bx, 10
    l3: 
		xor dx, dx
		div bx
		add dl, 30h
		mov [si], dl
		dec si
		test ax, ax
	jnz l3	
	
	mov dx, offset result
	mov ah, 9
	int 21h
	mov dx, offset dterm
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends
end beg