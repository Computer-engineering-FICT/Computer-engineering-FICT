.586
.model flat, c
.code

Add_288_LONGOP proc
push ebp
mov ebp,esp
mov esi, [ebp+16] ;ESI = ������ A
mov ebx, [ebp+12] ;EBX = ������ B
mov edi, [ebp+8] ;EDI = ������ ����������
mov ecx, 9; ECX = ������� ������� ���������
clc ; ������� �� CF ������� EFLAGS
mov edx, 0
cycle:
mov eax, dword ptr[esi+4*edx]
adc eax, dword ptr[ebx+4*edx] ; ��������� ����� � 32 ���
mov dword ptr[edi+4*edx], eax
inc edx; ����������� �����
dec ecx ; �������� �������� �� 1
jnz cycle
pop ebp ;���������� �����
ret 12
Add_288_LONGOP endp

Sub_832_LONGOP proc
push ebp
mov ebp,esp
mov esi, [ebp+16] ;ESI = ������ A
mov ebx, [ebp+12] ;EBX = ������ B
mov edi, [ebp+8] ;EDI = ������ ����������
mov ecx, 26; ECX = ������� ������� ���������
clc ; ������� �� CF ������� EFLAGS
mov edx, 0
cycle:
mov eax, dword ptr[esi+4*edx]
sbb eax, dword ptr[ebx+4*edx] ; ��������� ����� � 32 ���
mov dword ptr[edi+4*edx], eax
inc edx; ����������� �����
dec ecx ; �������� �������� �� 1
jnz cycle
pop ebp ;���������� �����
ret 12
Sub_832_LONGOP endp

end
