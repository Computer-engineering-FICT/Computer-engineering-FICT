.386
assume cs:code, ds:data, ss:storage		

out_macro macro mes
	mov ah, 09h
	lea dx, mes
	int 21h
endm

STORAGE segment use16 stack
    db	128 dup (?)	
STORAGE ends

DATA segment use16
	out_mes1 db 'Task 1', 0dh, 0ah, '$'
	out_mes2 db 'File created successfully!', 0dh, 0ah, '$'
	out_mes3 db 'Failed to create file!', 0dh, 0ah, '$'
	out_mes4 db 'File writed successfully!', 0dh, 0ah, '$'
	out_mes5 db 'Failed to write file!', 0dh, 0ah, '$'
	out_mes6 db 'Failed to close file!', 0dh, 0ah, '$'
	out_mes7 db 'File closed successfully!', 0dh, 0ah, '$'
	file_name db 'io12.txt'
	file_desc dw ?
	file_out db 'Lab 14', 0dh, 0ah
			 db 'Creating file', 0dh, 0ah
		  	 db 'Variant 219', 0dh, 0ah
			 db 'Mrots Yuriy Bogdanovich', 0dh, 0ah
			 db 'IO-12.'
	file_size equ $ - file_out
	
	out_mes8 db 'Task 2', 0dh, 0ah, '$'
	out_mes9 db 'Enter path to file!', 0dh, 0ah, '$'
	out_mes10 db 'File does not exist!', 0dh, 0ah, '$'
	out_mes11 db 'File is opened successfully!', 0dh, 0ah, '$'
	out_mes12 db 'File does not readed!', 0dh, 0ah, '$'
	out_mes13 db 'File readed successfully!', 0dh, 0ah, '$'
	out_mes14 db 'Failed to create file!', 0dh, 0ah, '$'
	out_mes15 db 'File created successfully!', 0dh, 0ah, '$'
	out_mes16 db 'Failed to write file!', 0dh, 0ah, '$'
	out_mes17 db 'File writed successfully!', 0dh, 0ah, '$'
	out_mes18 db 'Failed to close file!', 0dh, 0ah, '$'
	out_mes19 db 'File closed successfully!', 0dh, 0ah, '$'
	file_path db 13, ?, 13 dup (?)
	file_desc2 dw ?
	file_in db file_size dup (?)
	file_copy db 'copy.txt'
	file_desc3 dw ?
	large_latin	 db 41h,42h,43h,44h,45h,46h,47h,48h,49h,4ah,4bh,4ch,4dh
				 db 4eh,4fh,50h,51h,52h,53h,54h,55h,56h,57h,58h,59h,5ah 
	small_kiril1 db 0A0h,0A1h,0A2h,0A3h,0A4h,0A5h,0A6h,0A7h,0A8h,0A9h,0AAh,0ABh,0ACh,0ADh,0AEh,0AFh
	small_kiril2 db 0E0h,0E1h,0E2h,0E3h,0E4h,0E5h,0E6h,0E7h,0E8h,0E9h,0EAh,0EBh,0ECh,0EDh,0EEh,0EFh
DATA ends

CODE segment use16
begin:			
	mov ax, data
	mov ds, ax
	mov es, ax
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;	TASK 1		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	out_macro out_mes1
	
	
	; Створення файлу в поточному каталозі
	mov ah, 3Ch
	mov cx, 0h 
	lea dx, file_name
	int 21h
	jc er1
	mov file_desc, ax
	out_macro out_mes2
	
	
	; Запис в файл
	mov ah, 40h
	lea dx, file_out
	mov cx, file_size
	mov bx, file_desc
	int 21h
	jc er2
	out_macro out_mes4
	
	
	; Закриття файлу
	mov ah, 3eh
	mov bx, file_desc
	int 21h
	jc er3
	out_macro out_mes7
	
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		TASK 2		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	out_macro out_mes8
	
	
	; Запит на введення шляху до файлу
	out_macro out_mes9
	
	
	; Зчитування рядка з STDIN
	mov ah, 0Ah
	lea dx, file_path
	int 21h
	
	
	; Відкриття файлу
	mov ax, 3D00h
	xor bh, bh
	mov bl, file_path[1]
	mov file_path[bx+2], 0
	lea dx, file_path[2]
	int 21h
	jc er4
	mov file_desc2, ax
	out_macro out_mes11
	
	
	; Зчитування даних з файлу
	mov ah, 3Fh
	lea dx, file_in
	mov cx, file_size
	mov bx, file_desc2
	int 21h
	jc er5
	out_macro out_mes13
	
	
	; Заміна великих латинських букв на маленькі
	xor bx, bx
	xor ax, ax
	cld							; обхід зліва направо
	scan1:												
	mov al, large_latin[bx]		; шуканий символ -> aх
	mov cx, file_size			; довжина рядка
	lea di, file_in				; адрес строки string
	cont1: 	
	repnz scasb 				; сканувати, поки сх!=0 або al!=[di]
	jne ns1
	dec di
	mov dl, al
	add dl, 20h
	mov [di], dl	
	inc di
	inc cx
	loop cont1		
	ns1:
	inc bx
	cmp bx, 26
	jne scan1
	
	
	; Заміна маленьких букв кирилиці а-п на великі
	xor bx, bx
	xor ax, ax
	cld							; обхід зліва направо
	scan2:												
	mov al, small_kiril1[bx]	; шуканий символ -> aх
	mov cx, file_size			; довжина рядка
	lea di, file_in				; адрес строки string
	cont2: 	
	repnz scasb 				; сканувати, поки сх!=0 або al!=[di]
	jne ns2
	dec di
	mov dl, al
	sub dl, 20h
	mov [di], dl	
	inc di
	inc cx
	loop cont2		
	ns2:
	inc bx
	cmp bx, 16
	jne scan2
	
	
	; Заміна маленьких букв кирилиці р-я на великі
	xor bx, bx
	xor ax, ax
	cld							; обхід зліва направо
	scan3:												
	mov al, small_kiril2[bx]	; шуканий символ -> aх
	mov cx, file_size			; довжина рядка
	lea di, file_in				; адрес строки string
	cont3: 	
	repnz scasb 				; сканувати, поки сх!=0 або al!=[di]
	jne ns3
	dec di
	mov dl, al
	sub dl, 50h
	mov [di], dl	
	inc di
	inc cx
	loop cont3		
	ns3:
	inc bx
	cmp bx, 16
	jne scan3
	
	; Створення файлу в поточному каталозі
	mov ah, 3Ch
	mov cx, 0h 
	lea dx, file_copy
	int 21h
	jc er6
	mov file_desc3, ax
	out_macro out_mes15
	
	
	; Запис в файл
	mov ah, 40h
	lea dx, file_in
	mov cx, file_size
	mov bx, file_desc3
	int 21h
	jc er7
	out_macro out_mes17
	
	
	; Закриття файлу
	mov ah, 3eh
	mov bx, file_desc3
	int 21h
	jc er8
	out_macro out_mes19
	
	
	; Блок повідомлень про помилку
	jmp er_fin
	er1:
	out_macro out_mes3
	jmp er_fin
	er2:
	out_macro out_mes5
	jmp er_fin
	er3:
	out_macro out_mes6
	jmp er_fin
	er4:
	out_macro out_mes10
	jmp er_fin
	er5:
	out_macro out_mes12
	jmp er_fin
	er6:
	out_macro out_mes14
	jmp er_fin
	er7:
	out_macro out_mes16
	jmp er_fin
	er8:
	out_macro out_mes18
	er_fin:
	
	mov ah, 01h
	int 21h
	
	int 03h
	
	mov  ax, 4C00h
	int 21h
CODE ends

end begin