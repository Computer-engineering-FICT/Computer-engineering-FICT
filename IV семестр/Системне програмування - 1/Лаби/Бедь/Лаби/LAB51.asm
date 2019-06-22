
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

mov AX, 4C00h
int 21h
endm



STSEG SEGMENT PARA STACK "STACK"
db 256 dup(?)
STSEG ENDS

DSEG SEGMENT PARA PUBLIC "DATA"
Buff db 5, 6 dup(0), '$'
fl db 0
Tabl db '0123456789'
text_ok db 13, 10, 'Number +1:', 13, 10, '$'
text_er db 13, 10, 'Error! Any key to exit!', 13, 10, '$'
text_mes db 'Enter integer number:', 13, 10, '$'
DSEG ENDS

assume CS:CSEG, DS:DSEG, SS:STSEG

CSEG SEGMENT PARA PUBLIC "CODE"
begin:
mov AX, DSEG
mov DS, AX


call Input			
output_str text_ok
call Output 		

exit_macros
;----------------------------------------------------------------------------------------------------------
Input proc
output_str text_mes

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

cmp fl,1			
jne ee
neg AX			

ee:
add ax,1			
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

;----------------------------------------------------------------------------------------------------------
Error_Exit proc		

output_str text_er
exit_macros

ret
Error_Exit endp
;----------------------------------------------------------------------------------------------------------
CSEG ends


end begin