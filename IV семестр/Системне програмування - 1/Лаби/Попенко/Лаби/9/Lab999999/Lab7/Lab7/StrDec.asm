.586
.model flat, c
 include longop.inc
.data
R dd 0
Rest dd 0
shift dd 0
Result1 dd 270,0,0,0,0,0,0,0,0,0
Result2 dd 10 dup(0)
Zero dd 10 dup(0)
ValueR dd 900 dup(0)
NBit dd 0
Value dd 0


.code


Result proc 
push ebp
mov ebp,esp
mov esi,[ebp+16]
mov ecx,[ebp+12]
mov ebx, [ebp+8];остача
mov Rest,ebx
mov NBit,esi
mov Value,ecx


cycle:
push 320
push offset Result1
push offset Result2
push offset R
call Div_10

mov ecx,shift
mov al,byte ptr [R]
add al,48
mov byte ptr[ValueR+ecx],al
xor ecx,ecx
xor eax,eax

push offset Result2
push offset Result1
call Copy

push offset Zero
push offset Result2
call Copy

inc shift
xor eax,eax
push offset Result1
call Zero_Longop
cmp ah,0
jnz cycle
pop ebp 
ret 12
Result endp




end