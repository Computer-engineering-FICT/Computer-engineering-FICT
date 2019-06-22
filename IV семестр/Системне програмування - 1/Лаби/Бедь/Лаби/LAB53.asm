
output_str macro string
push ax
push dx

mov DX, offset string 
mov AH, 9
int 21h

pop dx
pop ax
endm

input_str macro string
push ax
push dx

mov DX, offset string 
mov AH, 10
int 21h

pop dx
pop ax
endm

exit_macros macro
mov AH, 10h
int 16h

mov ax, 03
int 10h
endm


;-macros_end
STSEG SEGMENT PARA STACK "STACK"
db 256 dup(?)
STSEG ENDS

DSEG SEGMENT PARA PUBLIC "DATA"
Buff db 5, 6 dup(0), '$'
fl db 0
 Tabl db '0123456789'
 text_ok db 13, 10, 'Z =$'
 text_ost db ' ost =$'
 text_er db 13, 10, 'Error! Any key to exit!', 13, 10, '$'
 text_x db 'Enter x[-20,9999]:', 13, 10, '$'
var_buf dw 0 
var_x dw 0
var_y dw 0
var_ost dw 0
DSEG ENDS

assume CS:CSEG, DS:DSEG, SS:STSEG

CSEG SEGMENT PARA PUBLIC "CODE"
begin:
mov AX, DSEG
mov DS, AX

output_str text_x 
call Input
mov var_x,AX	



call Fun
output_str text_ok


call Output
cmp var_ost,0
je no_ost 	
output_str text_ost
xor ax,ax
mov ax,var_ost
call Output
no_ost:

exit_macros
;----------------------------------------------------------------------------------------------------------
Input proc

input_str Buff		

mov SI, offset Buff+1	
xor CX, CX
mov CL, [SI]		
cmp CX, 0		
je exit_lbl

mov fl, 0			
inc SI			
mov AL, [SI]
cmp AL,'-'			
jne positiv
mov fl, 1			
dec Cx			
cmp CX, 0	
je exit_lbl
inc SI			

positiv:
xor AX, AX
xor DI, DI
mov DI, 10		
dec SI			
 
lbl1:

symbol_macros
	
loop lbl1

cmp AX,9999
ja exit_lbl

cmp fl,1			
jne ee
neg AX			

ee:
;add ax,1			
ret
exit_lbl:
call Error_Exit
Input endp
;----------------------------------------------------------------------------------------------------------
Output proc
mov BX, 10		
mov DI, offset Buff+6	
mov fl, 0		
cmp AX, 0		
jge Pr1
neg AX			
mov fl, 1			

Pr1: xor DX, DX		
div BX			
mov SI, offset Tabl		
add SI, DX		
mov DL, [SI]	
mov [DI], DL
dec DI			

cmp AX, 0		
jnz Pr1			

cmp fl,1	
jne eee
mov DL, '-'
mov [DI], DL		
dec DI			
eee:

mov AH, 9		
mov DX, DI	
inc DX			
int 21h
ret
Output endp
;----------------------------------------------------------------------------------------------------------
Fun proc                
 xor AX,AX
 mov AX,var_x


 cmp AX,2
 jl men_1
 cmp AX,20
 jg bil_20
 
 cmp AX,1
 jl lb1
 lb1:
 cmp AX,21
 jl men_21
 
 ;--------------
 XOR AX,AX
 MOV AX,1
 jmp exit_fun
 ;--------------
 men_1:
	xor ax,ax
	xor cx,cx
	mov ax,var_x
	mov cx,75
	imul ax
	imul cx
	mov cx,ax
	
	xor ax,ax
	xor bx,bx
	mov ax,var_x
	mov bx,17
	imul bx
	
	sub cx,ax
	mov ax,cx
	mov dx,0
 jmp exit_fun
 ;--------------
 bil_20:
	 xor ax,ax
	 xor cx,cx
	 mov AX,var_x
	 mov cx,85
	 imul cx
	 mov cx,ax

	 xor ax,ax
	 mov AX,var_x
	 add AX,1

	 xor bx,bx
	 mov bx,ax
	 mov ax,cx
	 cwd
	 idiv bx
	  jmp exit_fun
;-------------
men_21:
	xor ax,ax
	 xor cx,cx
	 mov AX,var_x
	 imul ax
	 mov cx,54
	 add ax,cx
	 mov cx,ax

	 xor ax,ax
	 mov AX,var_x
	 add AX,1

	 xor bx,bx
	 mov bx,ax
	 mov ax,cx
	 cwd
	 idiv bx
	  jmp exit_fun
 ;-------------
 exit_fun:
 mov var_ost,dx
 ret
 Fun endp

;----------------------------------------------------------------------------------------------------------
Error_Exit proc		
output_str text_er
exit_macros
ret
Error_Exit endp
;----------------------------------------------------------------------------------------------------------
CSEG ends


end begin