.386
multiply macro array1, array2, result, len, t, sign
	;local mul_loop, l1, l2, l4, continue
	local continue
	mov cx, len - 1
	lea bx, array1
	lea si, array2
	lea di, result
mul_loop:
	mov eax, [bx]
	mov edx, [si]
	mul edx			;sing&mul
	jmp l&t
l1:
	mov [di], ax
	jmp continue
l2:
	mov [di], dx:ax
	jmp continue
l4:
	mov [di], edx:eax
	jmp continue
continue:
	add di, t*2
	add bx, t
	add si, t
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
	
;			array1, array2, result, len, t, sign	
	multiply arr1, arr2, res, 5, 1, i
	
	mov ax, 4c00h
	int 21h
code ends
end beg
