assume cs: code, ds: data
time macro
	aam
	mov bx, ax
	mov ah, 2
	mov dl, bh
	add dl, 30h
	int 21h
	mov dl, bl
	add dl, 30h
	int 21h
endm

data segment use16
	year dw ?
	month db ?
	day db ?
	week db ?
data ends

code segment
beg:
	.386
	mov ax, data
	mov ds, ax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Отримання системного часу
	mov ah, 2ch
	int 21h
	movzx ax, ch
	time
	mov dl, 3ah
	int 21h
	movzx ax, cl
	time
	mov dl, 3ah
	int 21h
	movzx ax, dh
	time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Занесення в пам'ять дати перевизначення системного часу
	mov ah, 2ah
	int 21h
	mov year, cx
	mov month, dh
	mov day, dl
	mov week, al
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Задання системного часу
	mov cx, 0c0ch
	mov dx, 0c0ch
	mov ah, 2dh
	int 21h
	;Перевірка системного часу
	mov ah, 2ch
	int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov ax, 4c00h
	int 21h
code ends
end beg