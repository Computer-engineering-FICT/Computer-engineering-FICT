.586
.model flat, c
.data 
	x dd 1h
	bitNumber dd ?

	a dd 0
	b dd 0
	r dd 0


.code

Add_LONGOP proc bits:DWORD, dest:DWORD, pB:DWORD, pA:DWORD

mov esi, pA ;ESI = ������ A
mov ebx, pB ;EBX = ������ B
mov edi, dest ;EDI = ������ ����������
mov ecx, bits; ECX = ������� ������� ���������
mov edx, 0
clc ; ������� �� CF ������� EFLAGS
mov edx, 0
cycle:
mov eax, dword ptr[esi+4*edx]
adc eax, dword ptr[ebx+4*edx] ; ��������� ����� � 32 ���
mov dword ptr[edi+4*edx], eax
inc edx; ����������� �����
dec ecx ; �������� �������� �� 1
jnz cycle

ret 
Add_LONGOP endp

Sub_LONGOP proc bits:DWORD, dest:DWORD, pB:DWORD, pA:DWORD
mov esi, pA ;ESI = ������ A
mov ebx, pB ;EBX = ������ B
mov edi, dest ;EDI = ������ ����������
mov ecx, bits; ECX = ������� ������� ���������
clc ; ������� �� CF ������� EFLAGS
mov edx, 0
cycle:
mov eax, dword ptr[esi+4*edx]
sbb eax, dword ptr[ebx+4*edx] ; ��������� ����� � 32 ���
mov dword ptr[edi+4*edx], eax
inc edx; ����������� �����
dec ecx ; �������� �������� �� 1
jnz cycle
ret 
Sub_LONGOP endp

Mul_NxN_LONGOP proc dest:DWORD, p2:DWORD, p1:DWORD

	
	mov esi, p1
	mov edi, p2
	mov ebx, dest

	mov dword ptr[a],0
	mov dword ptr[b],0
	mov dword ptr[r],0


	mov ecx, 18
	@cycle:

		push ecx

		mov ecx, 8
		@cycleInner:
			push ecx

			mov ecx, a
			mov eax, dword ptr[esi + 4 * ecx]

			
			mov ecx, b
			mul dword ptr[edi + 4 * ecx]

			mov ecx, r

			clc
			adc eax, dword ptr[ebx + 4 * ecx]
			mov dword ptr[ebx + 4 * ecx], eax
			
			mov eax, dword ptr[ebx + 4 * ecx]

			adc edx, dword ptr[ebx + 4 * ecx + 4]
			mov dword ptr[ebx + 4 * ecx + 4], edx

			mov eax, dword ptr[ebx + 4 * ecx + 4]

			inc a
			inc r
			pop ecx
			dec ecx
			jnz @cycleInner

		inc b

		xor eax, eax
		mov a, eax

		mov eax, b
		mov r, eax

		pop ecx
		dec ecx
		jnz @cycle

	ret 


Mul_NxN_LONGOP endp


End
