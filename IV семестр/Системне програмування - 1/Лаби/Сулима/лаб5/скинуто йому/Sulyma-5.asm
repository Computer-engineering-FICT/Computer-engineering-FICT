.model small
.stack 100h
option casemap :none

      
.data

    messg_P        		db "Пароль: $"
    studentName         db "Сулима Александр$"
    group_       		db "ИП-53$"
    numb       			db "5318$"
    password            db "0404",0
    unit	            dw 0
.code
main:
    mov ax, @data
    mov ds, ax
    xor ax, ax
    mov ah, 09h
    mov dx, offset messg_P
    int 21h
    mov cx, 7
    call enterPassword
    call InfoStud
    mov ah, 4Ch
    int 21h

enterPassword proc
    mov unit, cx
    
run:
    cmp cx, 0
    je end_
    xor ax, ax
    mov ah, 08h
    int 21h
    mov bx, unit
    sub bx, cx
    cmp al, password[bx]
    jne run
    dec cx
    jmp run
end_:
    mov unit, 0
    ret
	
enterPassword endp
    
InfoStud proc

    xor ax, ax
    mov ah, 00h
    int 10h
    mov ah, 09h
    mov dx, offset studentNumber
    int 21h
    mov ah, 09h
    mov dx, offset group_
    int 21h
    mov ah, 09h
    mov dx, offset numb
    int 21h

InfoStud endp

end main