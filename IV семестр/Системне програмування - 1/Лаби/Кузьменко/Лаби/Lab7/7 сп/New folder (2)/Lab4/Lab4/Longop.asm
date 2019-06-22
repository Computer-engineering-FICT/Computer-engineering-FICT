.586
.model flat, c
.code
Add_128_LONGOP proc
push ebp
mov ebp,esp
mov esi, [ebp+16] ;ESI = адреса A
mov ebx, [ebp+12] ;EBX = адреса B
mov edi, [ebp+8] ;EDI = адреса результату
mov ecx, 5; ECX = потрібна кількість повторень
clc ; обнулює біт CF регістру EFLAGS
mov edx, 0
cycle:
mov eax, dword ptr[esi+4*edx]
adc eax, dword ptr[ebx+4*edx] ; додавання групи з 32 бітів
mov dword ptr[edi+4*edx], eax
inc edx; модифікація зсуву
dec ecx ; лічильник зменшуємо на 1
jnz cycle

pop ebp ;відновлення стеку
ret 12
Add_128_LONGOP endp

Sub_128_LONGOP proc
push ebp
mov ebp,esp
mov esi, [ebp+16] ;ESI = адреса A
mov ebx, [ebp+12] ;EBX = адреса B
mov edi, [ebp+8] ;EDI = адреса результату
mov ecx, 5; ECX = потрібна кількість повторень
clc ; обнулює біт CF регістру EFLAGS
mov edx, 0
cycle:
mov eax, dword ptr[esi+4*edx]
sbb eax, dword ptr[ebx+4*edx] ; додавання групи з 32 бітів
mov dword ptr[edi+4*edx], eax
inc edx; модифікація зсуву
dec ecx ; лічильник зменшуємо на 1
jnz cycle
pop ebp ;відновлення стеку
ret 12
Sub_128_LONGOP endp
end