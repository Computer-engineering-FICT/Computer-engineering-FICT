assume cs: code, ds: data
list struc
	key db 255
list ends
;Макрос для виведення результату пошуку
result macro method, res
	mov ah, 09h
	mov dx, offset method
	int 21h
	mov dx, offset res
	int 21h
endm
;Макрос для отримання хеша ключа
getHashKey macro key, hash
	xor ax, ax
	xor dx, dx
	movzx ax, key
	div hash_size
	mov hash, edx
endm
;Макрос для вставки в хеш-таблицю посилання на список 
;(елемент структури) за хешем його ключа
insertInTable macro key
	getHashKey key, eax
	lea edi, hash_table[eax*2]
	mov [edi], al
	;lea eax, key
	;mov [edi+1], al
	lea ax, key
	mov [edi+1], al
endm

data segment use16
	lists 	list <'B'>
			list <'G'>
			list <'C'>
			list <'F'>
			list <'D'>
			list <'E'>
			list <'H'>
			list <'A'>
	num equ 8
	hash_size 	dw 8
	hash_table	dw 8 dup(?)
	findh db 'P'
	linear 	db 'Linear$'
	linearS	db 'Linear (sorted)$'
	binary 	db 'Binary$'
	hash 	db 'Hash$'
	success db ' search - success!', 0dh, 0ah, '$'
	failure db ' search - failure.', 0dh, 0ah, '$'
data ends

code segment
beg:
	.386
	mov ax, data
	mov ds, ax
	
	mov ecx, num
	lea ebx, lists
	xor esi, esi
	l4:
		insertInTable lists[esi].key
		inc esi
	loop l4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	getHashKey findh, esi
	lea ebx, hash_table
	mov dl, ebx[esi+1]
	lea ebx, lists
	movzx edi, dl
	mov al, ebx[edi]
	cmp al, findh
	je s4
	result hash, failure
	jmp c4
s4:	result hash, success
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
c4:
	mov ax, 4c00h
	int 21h
code ends
end beg