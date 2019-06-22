assume cs: code, ds: data
data segment use16
	task1 db 'Task #1', 0dh, 0ah, '$'
	task2 db 'Task #2', 0dh, 0ah, '$'
	message db 'Input name of file to copy:', 0dh, 0ah, '$'
	folder_name db 'Nesteruk', 0
	file_name db 'c:\Nesteruk\12.txt', 0
	file_text db 'Nesteruk Yurii Oleksandrovich #1220 #12'
	text_len equ $ - file_text
	copy_name db 10h dup(?)
	original_descr dw ?
	copy_descr dw ?
	copy_name_len dw ?
	buff_len dw 128
	buffer db 128 dup(?)
data ends

code segment
beg:
	.386
	mov ax, data
	mov ds, ax
	mov es, ax
;Завдання №1
	mov ah, 09h
	lea dx, task1
	int 21h
	;Створення каталога
	mov ah, 39h
	lea dx, folder_name
	int 21h
	;Створення файлу
	mov ah, 3ch
	xor cx, cx
	lea dx, file_name
	int 21h
	;Запис у файл
	mov bx, ax
	mov ax, 4000h
	mov cx, text_len
	lea dx, file_text
	int 21h
;Завдання №2
	mov ah, 09h
	lea dx, task2
	int 21h
	;"Запрошення" до введення
	lea dx, message
	int 21h
	;Зчитування назви файлу для копіювання
	mov ah, 3fh
	mov bx, 0
	mov cx, 29
	lea dx, copy_name
	int 21h
	;Модифікація зчитаного імені-оригіналу
	sub ax, 2
	mov copy_name_len, ax
	mov bx, dx
	add bx, ax
	mov byte ptr[bx], 0 
	mov byte ptr[bx + 1], 0
	;Відкриття для читання файлу-оригіналу
	mov ax, 3d00h
	xor cx, cx
	int 21h
	mov original_descr, ax
	;Модифікація зчитаного імені-копії (дописування "2")
	sub bx, 4
	mov eax, dword ptr [bx]
	mov dword ptr [bx + 1], eax
	mov byte ptr[bx], 32h
	;Створення файлу-копії
	mov ax, 3c00h
	xor cx, cx
	int 21h
	mov copy_descr, ax
	;Копіювання вмісту файлу-оригіналу
	copy:
		;Читання в буфер з оригіналу
		mov ah, 3fh
		int 3h
		mov bx, original_descr
		mov cx, buff_len
		lea dx, buffer
		int 21h
		;Запис у копію з буферу
		mov cx, ax
		mov ax, 4000h
		mov bx, copy_descr
		int 21h
		cmp cx, buff_len
	je copy
	
	mov ax, 4c00h
	int 21h
code ends
end beg