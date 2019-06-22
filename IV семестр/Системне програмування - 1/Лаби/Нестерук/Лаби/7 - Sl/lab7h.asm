assume cs: code, ds: data

data segment use16
	arr1 db 1, 2, 3, 4, 5
	res1 dw 5 dup(?)
	
	arr2 dw 1234h, 2345h, 3456h
	res2 dd 3 dup(?)
	
	arr31 dd 01234567h, 12345678h
	res3 dq 2 dup(?)
data ends
code segment use16
beg:
	.386
	mov ax, data
	mov ds, ax
	
	lea esi, arr1
	mov cx, 5
	xor ax, ax
	xor bx, bx
sum:
	mov bl, byte ptr [esi]
	add ax, bx
	inc esi
	loop sum
	mov bx, 5
	div bx
	
	mov ax, 4c00h
	int 21h
code ends
end beg
