assume cs:code, ds:data  
   
data segment  
	arr1 db 3,1,-4,5,6,-2
	arr2 db -3,2,1,7,-9,4
	res db 6 dup(?)
	
	message    db "Yuriy" 
	endmess    equ $
data ends 

code segment  
beg:
	mov ax,data 		
	mov ds,ax 
; посимвольний вивід рядка
	mov cx,endmess - message 
	mov bx,offset message 
	mov ah,2 
str_loop: 	
	mov dl, [bx] 
	int 21h 
	inc bx 
	loop str_loop  
	mov ah,1 
	int 21h 
; множення елементів масиву
	mov bx, offset arr1
	mov si, offset arr2
	mov di, offset res
	mov cx, 5
mul_loop:
	mov al, [bx]
	mov dl, [si]
	imul dl
	mov [di], ax
	inc di
	inc bx
	inc si
	loop mul_loop
	mov ah, 1
	int 21h
; знаходження мінімального елемента
	mov bx, offset res
	mov al, [bx]
	inc bx
	mov cx, 4
max_loop:
	cmp [bx], al
	jge no_exch_oper
	mov al, [bx]
no_exch_oper:	
	inc bx
	loop max_loop


; завершення програми	
	mov  ax, 4c00h 
	int  21h 
code ends
end beg 