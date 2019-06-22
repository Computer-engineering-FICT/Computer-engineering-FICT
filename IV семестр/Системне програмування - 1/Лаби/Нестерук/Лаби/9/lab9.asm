assume cs: code, ds: data
element struc
	key db 255
	field db 0
element ends

data segment use16
	mes db 'Nesteruk#IO-12#20', 0dh, 0ah, '$'
	elems 	element <'F', 66h>
			element <'C', 63h>
			element <'D', 64h>
			element <'E', 65h>
			element <'B', 62h>
			element <'A', 61h>
			element <?, ?>
	num dd 6
	insnum dd 2
	inselem element <20, 12>
	delnum dd 3
data ends

code segment
beg:
	.386
	mov ax, data
	mov ds, ax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	;Виведення інформації про студента
	mov ah, 09h
	mov dx, offset mes
	int 21h	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	;Сортування
	lea edx, elems
	mov ecx, num
	dec ecx
	li:	xor esi, esi
		lj: cmp esi, ecx
			je lj_end
			mov ax, edx[esi*2]
			mov bx, edx[esi*2 + 2]
			cmp al, bl
			jl no_exch
			mov edx[esi*2], bx
			mov edx[esi*2 + 2], ax
	no_exch:inc esi
			jmp lj
	lj_end: loop li
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Додавання елемента в таблицю
	lea edx, elems
	mov esi, num
	mov ecx, insnum
	dec ecx
	copy:
		cmp esi, ecx
		jl end_copy
		dec esi
		mov ax, edx[esi*2]
		mov edx[esi*2 + 2], ax
		jmp copy
	end_copy:
	mov ax, word ptr inselem
	mov edx[esi*2 + 2], ax
	inc num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	;Видалення елемента з таблиці
	lea edx, elems
	mov esi, delnum
	mov ecx, num
	del:
		cmp ecx, esi
	je end_del
		mov ax, edx[esi*2]
		mov edx[esi*2 - 2], ax
		inc esi
		jmp del
	end_del:
	dec num
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Виведення елементів таблиці
	mov ah, 2
	mov cx, word ptr num
	lea di, elems
	l_out1:
		mov dl, ds:[di]
		int 21h
		mov dl, ds:[di + 1]
		int 21h
		add di, 2
	loop l_out1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	mov ax, 4c00h
	int 21h
code ends
end beg
