.386
assume cs: code, ds:data
data segment use16
	string db 'Ytcnther >hsq$'
	lstr equ string - $
data ends

code segment use16
beg:
	mov ax, data
	mov ds, ax
	
	mov ah, 2
	mov cx, 0e0h
	mov dl, 021h
	mov dl, 0f2h
;l:
	int 21h
;	inc dl
;	loop l
	
	mov ax, 4c00h
	int 21h
code ends
end beg