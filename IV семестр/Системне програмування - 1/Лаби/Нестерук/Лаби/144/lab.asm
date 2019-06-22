assume cs: code, ds: data
data segment use16
	file db 'c:\m222.txt', 0h
	file2 db 'c:\m2.txt', 0h
	file3 db 'c:\a.txt', 0h
data ends
code segment
beg:
	.386
	mov ax, data
	mov ds, ax

	mov ah, 3dh
	mov al, 1
	mov dx, offset file
	int 21h
	
	mov ah, 3dh
	mov al, 1
	mov dx, offset file2
	int 21h
	
	mov ah, 3dh
	mov al, 1
	mov dx, offset file3
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends
end beg