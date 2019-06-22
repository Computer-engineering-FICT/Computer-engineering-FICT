.386
assume cs: code, ds: data
data segment use16
	block dd 5, 8, 13, 21, 34, 55, 89, 144, 233, 377
	n dd 10
	yes db 'Floating-point unit available$'
	no db 'Floating-point unit not available$'
data ends

code segment use16
beg:
	mov ax, data
	mov ds, ax
	
	mov edx, block
	xor esi, esi
	mov ecx, n-1
	lea ebx, block

li:	mov eax, ebx[esi*4+4] 
	shld ebx[esi*4], eax, 220
	inc esi
	loop l
	shld ebx[esi*4], edx, 220
	
	int 11h
	bt ax, 1
	mov dx, offset yes
	jc yes_l
	mov dx, offset no
	
yes_l:
	mov ah, 09h
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends
end beg