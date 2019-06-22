.586
.model flat, c
.data
counter dd ?
counter2 dd ?
m dd 31
Nbit dd ?
N dd ?
tmp dd ?
p db ?
p1 db ?



.code
Write proc
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
cmp ah, 0
jz @set0
or byte ptr [esi+ebx], al
jmp @goon
@set0:
not al 
and byte ptr [esi+ebx], al
@goon:
mov eax,eax
Write endp



Read proc 
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
mov ah, byte ptr [edx+ebx]
and ah, al 
Read endp


Wr proc 
push ebp
mov ebp,esp
mov esi, [ebp+16] ;число
mov edx, [ebp+12] ;біти
mov edi, [ebp+8] ;кількість
mov Nbit,0
cycle:
xor eax,eax
mov ebx,Nbit
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
mov ah, byte ptr [edx+ebx]
and ah, al 

mov ebx,Nbit
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
cmp ah, 0
jz @set0
or byte ptr [esi+ebx], al
jmp @goon
@set0:
not al 
and byte ptr [esi+ebx], al
@goon:
inc Nbit
dec edi
jnz cycle
pop ebp 
ret 12
Wr endp 

Shift proc
push ebp
mov ebp,esp
mov edx, [ebp+12] ;число
mov edi, [ebp+8] ;кількість
mov Nbit,736
mov counter,736
sub counter,edi
inc counter
cycle:
mov ebx,Nbit
sub ebx,edi
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
mov ah, byte ptr [edx+ebx]
and ah, al 

mov ebx,Nbit
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
cmp ah, 0
jz @set0
or byte ptr [edx+ebx], al
jmp @goon
@set0:
not al 
and byte ptr [edx+ebx], al
@goon:
dec Nbit
dec counter
jnz cycle
pop ebp
ret 8
Shift endp




end