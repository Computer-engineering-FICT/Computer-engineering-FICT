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
message_size db 13, 10, 'Enter size(NxN) (max 5):', 13, 10, '$'
message_element db 13, 10, 'Enter element:', 13, 10, '$'
message_findEl db 13, 10, 13, 10, 'Enter number for find:', 13, 10, '$'
message_outFind db 13, 10, 13, 10, 'Element ', '$'
message_prob db ' $'
message_entr db 13,10,'$'
message_d1	db ' ($'
message_d2	db ') $'
message_km	db ',$'
var_mass dw 25 dup (0)
var_size dw 0
var_max dw 5
var_find dw 1
var_i dw 0
var_j dw 0
DSEG ENDS

assume CS:CSEG, DS:DSEG, SS:STSEG

CSEG SEGMENT PARA PUBLIC "CODE"
begin:
mov AX, DSEG
mov DS, AX
my_begin:
mov var_max,5
 


mov DX, offset message_size 
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
mov ax,var_size
mul cx
mov cx,ax
xor ax,ax
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
mov DX, offset message_findEl 
mov AH, 9
int 21h
call Input
mov var_find,ax
;---------------
xor ax,ax
mov cx,var_size
mov ax,var_size
mul cx
mov cx,ax

xor ax,ax

mov si,0
mov var_i,1

mov ax, 03
int 10h
out_mass:
mov ax,var_find
xor di,di
mov di,si
shl di,1


mov ax,var_mass[di]
push si
push di
call Output
pop di

mov dx,var_size
cmp dx,var_i
ja prob
mov DX, offset message_entr
mov AH, 9
int 21h
mov var_i,0
jmp prob1
prob:
mov DX, offset message_prob
mov AH, 9
int 21h
prob1:
inc var_i

pop si
inc si

loop out_mass
mov DX, offset message_entr
mov AH, 9
int 21h
;---------------

mov DX, offset message_outFind
mov AH, 9
int 21h
mov ax,var_find
call Output

mov DX, offset message_entr
mov AH, 9
int 21h

xor ax,ax
mov cx,var_size
mov ax,var_size
mul cx
mov cx,ax

xor ax,ax

mov si,0

out_el_mass:
mov ax,var_find
xor di,di
mov di,si
shl di,1


cmp ax,var_mass[di]
jne next
push si
call FindEl
mov DX, offset message_entr
mov AH, 9
int 21h
mov DX, offset message_d1
mov AH, 9
int 21h
mov ax,var_i
call Output
mov DX, offset message_km
mov AH, 9
int 21h
mov ax,var_j
call Output
mov DX, offset message_d2
mov AH, 9
int 21h

mov var_i,0
mov var_j,0
pop si
next:
inc si

loop out_el_mass

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
FindEl proc
mov ax,si
inc ax
mov var_i,1		
cmp ax,var_size
jg next_pos
mov var_j,ax
;inc var_j
jmp lebl_EFE
next_pos:
inc var_i

sub ax,var_size
cmp ax,var_size
jg next_pos
mov var_j,ax
;inc var_j
lebl_EFE:
ret
FindEl endp
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