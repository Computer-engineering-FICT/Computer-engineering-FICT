; LAB_2
STSEG SEGMENT PARA STACK "STACK"
db 256 dup(?)
STSEG ENDS

DSEG SEGMENT PARA PUBLIC "DATA"
Buff db 5, 6 dup(0), '$'
fl db 0
Tabl db '0123456789'
message_ok db 13, 10, 'Max element =$'
message_end db ' Any key to repeat!$'
message_er db 13, 10, 'Error! Any key to repeat!', 13, 10, '$'
message_size db 13, 10, 'Enter size for mass (max 10):', 13, 10, '$'
message_element db 13, 10, 'Enter element:', 13, 10, '$'
var_mass dw 15 dup (0)
var_size dw 0
var_max dw 15
DSEG ENDS

assume CS:CSEG, DS:DSEG, SS:STSEG

CSEG SEGMENT PARA PUBLIC "CODE"
begin:
mov AX, DSEG
mov DS, AX
my_begin:
mov var_max,10
mov DX, offset message_size 
mov AH, 9
int 21h
call Input
cmp ax,1
jg inp_ok
call Error_Exit
inp_ok:
mov var_size,ax

mov var_max,9999
;--------------
xor cx,cx
mov cx,var_size
mov si,0
ent_el_mass:
push cx
push si
mov DX, offset message_element 
mov AH, 9
int 21h
call Input
pop si

xor di,di
mov di,si
shl di,1
mov var_mass[di],ax


inc si

pop cx
loop ent_el_mass
;---------------

;---------------
call Display_ok
xor ax,ax
mov cx,var_size
mov si,0
mov ax,var_mass[si]
out_el_mass:

xor di,di
mov di,si
shl di,1


cmp ax,var_mass[di]
jg next
mov ax,var_mass[di]
next:
inc si

loop out_el_mass
call Output
;---------------



mov AH, 10h
int 16h

mov ax, 03
int 10h
jmp my_begin
;mov AX, 4C00h
;int 21h
;----------------------------------------------------------------------------------------------------------
Input proc

mov DX, offset Buff		
mov AH, 10
int 21h

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

inc SI			
xor BX, BX
mov BL, [SI]

cmp BL, '+'
je pluse

sub BL, '0'	
cmp BL, 9			
jg exit_lbl
cmp BL, 0			
jl exit_lbl

mul DI			
add AX, BX
pluse:	
loop lbl1

cmp AX,var_max 
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

;----------------------------------------------------------------------------------------------------------
Display_ok proc		
push AX
mov DX, offset message_ok
mov AH, 9
int 21h
pop AX
ret
Display_ok endp
;----------------------------------------------------------------------------------------------------------
Ost proc		

Ost endp
;----------------------------------------------------------------------------------------------------------
Error_Exit proc		
mov DX, offset message_er
mov AH, 9
int 21h

mov AH, 10h
int 16h

mov ax, 03
int 10h
jmp my_begin
;mov AX, 4C00h
;int 21h
ret
Error_Exit endp
;----------------------------------------------------------------------------------------------------------
CSEG ends


end begin