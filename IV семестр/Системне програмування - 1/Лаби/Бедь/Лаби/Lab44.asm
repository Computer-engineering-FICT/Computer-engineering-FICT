; LAB_2
STSEG SEGMENT PARA STACK "STACK"
db 256 dup(?)
STSEG ENDS

DSEG SEGMENT PARA PUBLIC "DATA"
Buff db 5, 6 dup(0), '$'
fl db 0
Tabl db '0123456789'
text_ok db 13, 10, 'Max element =$'
text_end db ' Any key to repeat!$'
text_er db 13, 10, 'Error! Any key to repeat!', 13, 10, '$'
text_size db 13, 10, 'Enter size array (max 25):', 13, 10, '$'
text_element db 13, 10, 'Enter element:', 13, 10, '$'
text_prob db ' $'
text_entr db 13,10,'$'
text_d1	db ' ($'
text_d2	db ') $'
text_km	db ',$'
var_mass dw 25 dup (0)
var_size dw 0
var_max dw 25
var_temp dw 0
var_i dw 0
var_j dw 0
DSEG ENDS

assume CS:CSEG, DS:DSEG, SS:STSEG

CSEG SEGMENT PARA PUBLIC "CODE"
begin:
mov AX, DSEG
mov DS, AX
my_begin:
mov var_max,25
 


mov DX, offset text_size 
mov AH, 9
int 21h
call Input
mov var_size,ax
cmp var_size,1
jg one_big
call Error_Exit
one_big:

mov var_max,9999
;--------------
xor cx,cx
xor ax,ax
mov cx,var_size
mov si,0
ent_el_mass:
push cx
push si

mov DX, offset text_element 
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
mov cx,var_size
xor ax,ax
mov si,0

mov ax, 03
int 10h
out_mass:

xor di,di
mov di,si
shl di,1

mov ax,var_mass[di]
push si
push cx

call Output

mov DX, offset text_prob
mov AH, 9
int 21h

pop cx
pop si
inc si

loop out_mass
mov DX, offset text_entr
mov AH, 9
int 21h
int 21h
;---------------
call Sort
;---------------
mov cx,var_size
xor ax,ax
mov si,0


out_mass_2:

xor di,di
mov di,si
shl di,1

mov ax,var_mass[di]
push si
push cx

call Output

mov DX, offset text_prob
mov AH, 9
int 21h

pop cx
pop si
inc si
loop out_mass_2

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
mov DX, offset text_ok
mov AH, 9
int 21h
pop AX
ret
Display_ok endp
;----------------------------------------------------------------------------------------------------------
Sort proc
mov ax,var_size
mov var_i,ax
for_1:
mov ax,var_i
mov var_j,ax
sub var_j,1
;    ---
mov cx,0
for_2:
mov si,cx
mov di,si
inc di
shl si,1
shl di,1
mov dx,var_mass[si]
cmp dx,var_mass[di]
jg next
mov dx,var_mass[si]
mov ax,var_mass[di]
mov var_mass[si],ax
mov var_mass[di],dx
next:

inc cx
cmp var_j,cx
jg for_2
;    ---
sub var_i,1
cmp var_i,1
jg for_1
ret
Sort endp
;----------------------------------------------------------------------------------------------------------
Error_Exit proc		
mov DX, offset text_er
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