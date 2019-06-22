.386
multiply macro array1, result, len, t, totype1, totype2, reg1, reg2, sign
	local mul_loop
	mov cx, len
	lea bx, array1
	lea di, result
	
mul_loop:
	mov reg1, totype1 ptr [bx]
	mov reg2, totype1 ptr [si]
	&sign&mul reg1
	
	mov [di], reg2
	mov [di+t], reg1
	
	add di, t*2
	add bx, t
	add si, t
	loop mul_loop
endm

assume cs: code, ds: data
data segment use16
	arr11 db 12, 23, 34, 45, 56
	arr12 db 23, 34, 45, 56, 67
	res1 dw 5 dup(?)
	
	arr21 dw 1234h, 2345h, 3456h
	arr22 dw 0123h, 1234h, 2345h
	res2 dd 3 dup(?)
	
	arr31 dd 01234567h, 12345678h
	arr32 dd 12345678h, 23456789h
	res3 dq 2 dup(?)
data ends
code segment use16
beg:
	mov ax, data
	mov ds, ax
	
;			array1, array2, result, len, 
;			t, totype1, totype2, reg1, reg2, sign
;1- ah, al
;2- dx, ax
;4- edx, eax

	multiply arr11, arr12, res1, 5, 1, byte, word, ah, al, i		;byte 
	multiply arr21, arr22, res2, 3, 2, word, dword, dx, ax, 		;word
	multiply arr31, arr32, res3, 2, 4, dword, qword, edx, eax, 	;dword
	mov ax, 4c00h
	int 21h
code ends
end beg
