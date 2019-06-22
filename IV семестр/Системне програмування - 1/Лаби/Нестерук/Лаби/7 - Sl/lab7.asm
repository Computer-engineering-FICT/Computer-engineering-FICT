assume cs: code, ds: data
average macro array, result, len, t
	local sum
	lea bx, array
	mov cx, len
	xor esi, esi
sum:
	
endm

data segment use16
	arr1 db 12, 23, 34, 45, 56
	res1 dw 5 dup(?)
	
	arr2 dw 1234h, 2345h, 3456h
	res2 dd 3 dup(?)
	
	arr31 dd 01234567h, 12345678h
	res3 dq 2 dup(?)
data ends
code segment use16
beg:
	mov ax, data
	mov ds, ax
	
	
	mov ax, 4c00h
	int 21h
code ends
end beg
