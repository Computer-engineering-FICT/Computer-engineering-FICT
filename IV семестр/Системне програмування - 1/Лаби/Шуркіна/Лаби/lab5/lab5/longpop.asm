
.586
.model flat, c
.data
counter dd 0
counterin dd 0
.code

Add_LONGOP proc
push ebp
mov ebp, esp

mov esi, [ebp + 16]; ESI = адреса A
mov ebx, [ebp + 12]; EBX = адреса B
mov edi, [ebp + 8]; EDI = адреса результату

mov ecx, 20; ECX = потрібна кількість повторень
mov edx, 0
clc; обнулює біт CF регістру EFLAGS
cycle :
mov eax, dword ptr[esi + 4 * edx]
adc eax, dword ptr[ebx + 4 * edx]; додавання групи з 32 бітів
mov dword ptr[edi + 4 * edx], eax

inc edx
dec ecx; лічильник зменшуємо на 1
jnz cycle
pop ebp
ret 12

Add_LONGOP endp

Sub_LONGOP proc
push ebp
mov ebp, esp

mov esi, [ebp + 16]; ESI = адреса A
mov ebx, [ebp + 12]; EBX = адреса B
mov edi, [ebp + 8]; EDI = адреса результату

mov ecx, 120; ECX = потрібна кількість повторень
mov edx, 0
clc; обнулює біт CF регістру EFLAGS
cycle :
mov eax, dword ptr[esi + 4 * edx]
sbb eax, dword ptr[ebx + 4 * edx]; віднімання групи з 32 бітів
mov dword ptr[edi + 4 * edx], eax

inc edx
dec ecx; лічильник зменшуємо на 1
jnz cycle
pop ebp
ret 12
Sub_LONGOP endp


Mul_N32_LONGOP proc
push ebp
mov ebp, esp
mov esi, [ebp + 16]
mov ebx, [ebp + 12]
mov edi, [ebp + 8]


mov ecx, 0
@cycle:
mov eax, dword ptr[esi + 4 * ecx]
mul ebx
add dword ptr[edi + 4 * ecx], eax
add dword ptr[edi + 4 * ecx + 4], edx
inc ecx
cmp ecx, 7
jb @cycle

pop ebp; відновлення стеку
ret 12
Mul_N32_LONGOP endp

Mul_NN_LONGOP proc
push ebp
mov ebp, esp
mov esi, [ebp + 16]; A
mov edi, [ebp + 8]; dest
mov ebp, [ebp + 12]; B

mov counter, 0
@cycle:
mov counterin, -7
@innerCycle :
mov ecx, counter
mov eax, dword ptr[esi + 4 * ecx]
mov ecx, counterin
mov ebx, dword ptr[ebp + 20 + 4 * ecx]
mul ebx
mov ebx, counter
add ebx, counter
add ebx, counter
add ebx, counter
add ebx, edi

adc dword ptr[20 + 4 * ecx + ebx], eax
adc dword ptr[24 + 4 * ecx + ebx], edx
inc counterin

jnz @innerCycle
inc counter
cmp counter, 7
jb @cycle

pop ebp; відновлення стеку
ret 12
Mul_NN_LONGOP endp

end
