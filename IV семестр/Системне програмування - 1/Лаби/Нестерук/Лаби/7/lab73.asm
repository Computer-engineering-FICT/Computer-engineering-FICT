.386
multiply macro array1, array2, result, len, t, totype1, totype2, reg1, reg2, sign
	local mul_loop
	lea ebx, array1
	lea edx, array2
	mov cx, len-1
	
	xor esi, esi
mul_loop:
	mov eax, ebx[esi*t]
	mul edx[esi*t]
	mov 
	

	loop mul_loop
endm

assume cs: code, ds: data
data segment use16
	arr1 db 1, 2, 3, 4, 5
	arr2 db 2, 3, 4, 5, 6
	res dw 5 dup(?)
data ends
code segment use16
beg:
	mov ax, data
	mov ds, ax
	
;			array1, array2, result, len, 
;			t, totype1, totype2, reg1, reg2, sign
	multiply arr1, arr2, res, 5, 2, byte, word, ah, al, i
	
	mov ax, 4c00h
	int 21h
code ends
end beg
