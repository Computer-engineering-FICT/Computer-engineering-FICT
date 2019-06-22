.586
.model flat, c
.code

Add_Long proc
push ebp
mov ebp,esp

mov esi, [ebp+16]
mov ebx, [ebp+12]
mov edi, [ebp+8]

mov ecx, 0
addAB:
mov eax, dword ptr[esi+ecx]
adc eax, dword ptr[ebx+ecx]
mov dword ptr [edi+ecx], eax
add ecx, 4
cmp ecx, 104
jl addAB
pop ebp
ret 12
Add_Long endp


Sub_Long proc
push ebp
mov ebp,esp

mov esi, [ebp+16]
mov ebx, [ebp+12]
mov edi, [ebp+8]

mov ecx, 0
subAB:
mov eax, dword ptr[esi+ecx]
sbb eax, dword ptr[ebx+ecx]
mov dword ptr [edi+ecx], eax
add ecx, 4
cmp ecx, 36
jl subAB
pop ebp
ret 12
Sub_Long endp
End

