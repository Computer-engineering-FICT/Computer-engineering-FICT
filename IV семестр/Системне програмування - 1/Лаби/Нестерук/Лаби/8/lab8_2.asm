assume cs:code, ds:data
data segment use16
tab db 65 dup (255)
    db 94h,88h,91h,82h,93h,80h,8fH,90H,98H,8Eh,8bh
    db 84h,9ch,92h,99h,87h,89h,8ah,69h,85h,83h,8ch
    db 96h,97h,8dh,9fh	 
line db "QETOLF","$"
leng dw $-line
mes db "Coverting line",0dh,0ah,"$"
data ends
code segment
beg:
	.386
	mov ax,data
	mov ds,ax
	lea bx,tab
	xor di,di
	lea si,line
	mov cx,leng
	cld
     l1:lodsb
	xlat
	stosb
	loop l1
	
	mov ah,09h
	mov dx,offset line
	int 21h
	
	mov ah,09h
	mov dx,offset mes
	int 21h
	
	xor di,di
	mov cx,leng
     l2:mov ah, 02H
	mov dl,es:[di]
	int 21h
	inc di
	loop l2

	mov ah,01h
	int 21h
	mov ax,4c00h
	int 21h

code ends
end beg
