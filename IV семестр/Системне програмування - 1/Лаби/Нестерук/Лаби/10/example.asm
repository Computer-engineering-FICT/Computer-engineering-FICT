.386
i equ 3
ASSUME CS: CODE, DS: DATA
; ------------------------------------------------- ------
v_table struc; визначаємо список на який посилається хеш-таблиця
v dw 0; кількість елементів у списку 1
v_table ends
; ------------------------------------------------- ------
DATA SEGMENT use16
	value dw 2
	hash_table_size dw i; визначаємо розмір таблиці
	hash_table dw 0 "dup (i); виділяємо пам'ять під хеш-таблицю
	mytable v_table <1>; списки на які посилається хеш-таблиця
			v_table <2>; значення елементів за замовчуванням 0
			v_table <0>;
DATA ENDS
	; ------------------------------------------------- ------
CODE SEGMENT use16
beg:
	mov ax, data
	mov ds, ax

	lea si, hash_table; завантажуємо зсув хеш-таблиці
	mov cx, hash_table_size; записуємо в лічильник розмір таблиці
	mov di, 0
	mov bx, offset mytable; завантажуємо зсув таблиці списків
	l1:
	mov [si], bx; записуємо в хеш-таблицю посилання (зміщення) кожного зі списків
	inc si
	inc si
	add bx, 2
	loop l1

	xor ax, ax
	xor dx, dx
	mov ax, value
	div hash_table_size
	mov cx, dx
	  
	xor si, si
	mov dx, cx
	l3:
	add si, 2
	loop l3
	mov bx, hash_table [si]
	mov dx, [bx]; відмінність тільки в тому що значення витягується зі списків

	mov ah, 4Ch
	int 21h
CODE ENDS
END beg
