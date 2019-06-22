.586
.model flat, c
.data
counter dd 0
temp dd 0
counterin dd 0
.code

Add_LONGOP proc
push ebp
mov ebp, esp

mov esi, [ebp + 16]; ESI = ������ A
mov ebx, [ebp + 12]; EBX = ������ B
mov edi, [ebp + 8]; EDI = ������ ����������

mov ecx, 20; ECX = ������� ������� ���������
mov edx, 0
clc; ������� �� CF ������� EFLAGS
cycle :
mov eax, dword ptr[esi + 4 * edx]
adc eax, dword ptr[ebx + 4 * edx]; ��������� ����� � 32 ���
mov dword ptr[edi + 4 * edx], eax

inc edx
dec ecx; �������� �������� �� 1
jnz cycle
pop ebp
ret 12

Add_LONGOP endp

Sub_LONGOP proc
push ebp
mov ebp, esp

mov esi, [ebp + 16]; ESI = ������ A
mov ebx, [ebp + 12]; EBX = ������ B
mov edi, [ebp + 8]; EDI = ������ ����������

mov ecx, 120; ECX = ������� ������� ���������
mov edx, 0
clc; ������� �� CF ������� EFLAGS
cycle :
mov eax, dword ptr[esi + 4 * edx]
sbb eax, dword ptr[ebx + 4 * edx]; �������� ����� � 32 ���
mov dword ptr[edi + 4 * edx], eax

inc edx
dec ecx; �������� �������� �� 1
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

pop ebp; ���������� �����
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

pop ebp; ���������� �����
ret 12
Mul_NN_LONGOP endp

Count proc
push ebp
mov ebp, esp
 mov esi, [ebp+12]
 mov edx, [ebp+8]
 xor eax, eax
@cycle1:
 mov ebx, eax ; eax � ����� ���
 mov ecx, ebx
 shr ebx, 3 ; ����� �����
 and ecx, 07h ; ����� ������� =������� 3 ������� ���
 mov al, 1
 shl al, cl ; AL = ����� �������� ���
 mov ah, byte ptr [esi+ebx]
 and ah, al ; ��������� � ������ AH
 cmp ah, 0
 jne @cycle2
 jmp @cycle3
@cycle2:
 add dword ptr[edx], 1h
@cycle3:
 mov eax, temp
 inc eax
 mov temp, eax
 cmp eax, 1184
 je @end
 jmp @cycle1
@end:
pop ebp
ret 8
Count endp

end
