assume cs: code, ds: data, ss: stk

stk segment stack
	stkd dw 32 dup(?)
stk ends

data segment use16
	cho db ?
	zer	db   '#### '
		db   '#  # '
		db   '#  # '
		db   '#  # '
		db   '#### '
	
	one	db   ' ##  '
		db   '  #  '
		db   '  #  '
		db   '  #  '
		db   ' ### '

	two	db   '#### '
		db   '   # '
		db   '#### '
		db   '#    '
		db   '#### '

	thr	db   '#### '
		db   '   # '
		db   '#### '
		db   '   # '
		db   '#### '

	fou	db   '#  # '
		db   '#  # '
		db   '#### '
		db   '   # '
		db   '   # '

	fiv	db   '#### '
		db   '#    '
		db   '#### '
		db   '   # '
		db   '#### '

	six	db   '#### '
		db   '#    '
		db   '#### '
		db   '#  # '
		db   '#### '

	sev	db   '#### '
		db   '   # '
		db   '  #  '
		db   ' #   '
		db   ' #   '

	eig	db   '#### '
		db   '#  # '
		db   '#### '
		db   '#  # '
		db   '#### '

	nin	db   '#### '
		db   '#  # '
		db   '#### '
		db   '   # '
		db   '#### '

	dts	db   '     '
		db   '  #  '
		db   '     '
		db   '  #  '
		db   '     '
        
	emp	db   '     '
		db   '     '
		db   '     '
		db   '     '
		db   '     '
	x db 3
	y db 5
data ends

code segment
beg:
	.386
	mov ax, data
	mov ds, ax

	mov ax, 0b800h
	mov es, ax
	
	mov dh, x
	mov dl, y
	push dx
	
l0:	;Визначаємо час RTC
	mov ah, 02h
	int 1ah	
	;Виділяємо першу цифру хвилин
	mov bl, cl
	shr bl, 4
	;Встановлюємо текстовий кольоровий режим
	mov ax, 3
	int 10h
	;Виводимо зображення цифри
	pop dx
	call OUT_DIGIT
	;Зсовуємо і перевіряємо на вихід за межі екрану
	inc dh
	cmp dh, 75
	jnz c1
	;Зміщуємо на рядок нижче і перевіряємо
	;на вихід за межі екрану
	mov dh, x
	inc dl
c1:	cmp dl, 20
	jnz c2
	mov dl, y
	
c2:	push dx
	;Перевіряємо чи була натиснута клавіша
	mov ah,01h
	int 16h
	jnz exit	;Переходимо до закінчення програми
	
	;Формуємо затримку в 2 секунди = 0f4240h мікросекунд
	mov ah, 86h
	mov dx, 4240h
	mov cx, 000fh
	int 15h
	
	loop l0
exit:	
	mov ax, 4c00h
	int 21h

;Процедура для виведення зображення цифри на екран
;Вхідні параметри:
;	bl - цифра (її номер)
;	dh - координата Х
;	dl - координата У
OUT_DIGIT proc near
	pusha
	
	mov al, 25
	mul bl
	mov bx, ax
	;Визначаємо зміщення в буфері екрану
	;відповідно до заданих координат
	xor di, di
	movzx cx, dl
	dec cx
	l1: 
		add di, 160
	loop l1
	movzx cx, dh
	dec cx
	l2: 
		add di, 2
	loop l2
	;Копіювання зображення цифри в буфер екрану
	mov ah, 134
	mov cx, 5
	l3:	
		push cx
		mov cx, 5
		l4:	
			mov al, zer[bx]
			mov es:[di], ax
			inc bx
			add di, 2
		loop l4
		add di, 150
		pop cx
	loop l3
	popa
	ret 
out_digit endp

code ends
end beg