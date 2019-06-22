.586
.model flat, c

.data
x dd 32 dup(?)

.code

Write1_LONGOP proc

push ebp
mov ebp, esp

mov esi, [ebp+8]
mov edi, [ebp+12]
mov edx, [ebp+16]


@cycle:
mov ebx, dword ptr[edi]
mov ecx, ebx
shr ebx, 3
and ecx, 07h
mov al, 1
shl al, cl

or byte ptr[esi+ebx], al

dec dword ptr[edi]
dec dword ptr[edx]
jnz @cycle

pop ebp
ret 12
Write1_LONGOP endp

end
