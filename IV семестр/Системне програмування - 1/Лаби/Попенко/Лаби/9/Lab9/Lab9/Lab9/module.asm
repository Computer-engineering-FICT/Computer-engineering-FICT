.586
.model flat, c
include longop.inc
.data
	ddNumber dd 0h
	byteNumber dd 0h
	b dd 0
	buf dd 80 dup(?)
	decCode dd 50 dup (?)
	two dd 2
.code
;��������� StrHex_MY ������ ����� ����������������� ����
;������ �������� - ������ ������ ���������� (����� �������)
;������ �������� - ������ �����
;����� �������� - ���������� ����� � ���� (�� ���� ������ 8)
StrHex_MY proc
push ebp
mov ebp,esp
mov ecx, [ebp+8] ;������� ��� �����
cmp ecx, 0
jle @exitp
shr ecx, 3 ;������� ����� �����
mov esi, [ebp+12] ;������ �����
mov ebx, [ebp+16] ;������ ������ ����������
@cycle:
mov dl, byte ptr[esi+ecx-1] ;���� ����� - �� �� hex-�����
mov al, dl
shr al, 4 ;������ �����
call HexSymbol_MY
mov byte ptr[ebx], al
mov al, dl ;������� �����
call HexSymbol_MY
mov byte ptr[ebx+1], al
mov eax, ecx
cmp eax, 4
jle @next
dec eax
and eax, 3 ;������� ������� ����� �� ��� ����
cmp al, 0
jne @next
mov byte ptr[ebx+2], 32 ;��� ������� �������
inc ebx
@next:
add ebx, 2
dec ecx
jnz @cycle
mov byte ptr[ebx], 0 ;����� ���������� �����
@exitp:
pop ebp
ret 12
StrHex_MY endp
;�� ��������� �������� ��� hex-�����
;�������� - �������� AL
;��������� -> AL
HexSymbol_MY proc
and al, 0Fh
add al, 48 ;��� ����� ����� ��� ���� 0-9
cmp al, 58
jl @exitp
add al, 7 ;��� ���� A,B,C,D,E,F
@exitp:
ret
HexSymbol_MY endp



StrToDec_LONGOP proc 
	push ebp
	mov ebp, esp

	mov dword ptr[b], 0

	mov esi, [ebp + 20] ;number
	mov edi, [ebp + 16] ;text buf
	mov eax, [ebp + 12]
	mov ddNumber, eax      ; number of dd
	mov eax, [ebp + 8]
	mov byteNumber, eax      ; bytes on screan


	xor ecx, ecx
	xor ebx, ebx
@cycle:
	push ecx
	push edi

	push esi; ����� ��� ��������
	push offset buf   ; ����� �����
	push offset decCode  ; �������
	push  byteNumber   ; ����������� ������
	call DIV10_GR_LONGOP
		
	pop edi
	mov ebx, b
	mov al, byte ptr[decCode]
	add al, 48
	mov byte ptr[edi + ebx], al ; ������ ������� � ����� ������

	xor ecx, ecx
	@cycleInner:
		mov eax, dword ptr[buf + 4 * ecx] ; ����� ����� � ���
		mov dword ptr[esi + 4 * ecx], eax  ; ��� � �������
		mov dword ptr[buf + 4 * ecx], 0 ; ���������
		inc ecx
		cmp ecx, ddNumber
		jl @cycleInner

	pop ecx
	inc ecx
	inc b
	cmp ecx, byteNumber
	jl @cycle
	
	mov ebx, byteNumber
	mov eax, byteNumber
	xor edx, edx
	div two
	mov byteNumber, eax
	dec ebx 
	xor ecx, ecx	
@cycle1:
	
	mov al, byte ptr[edi + ecx]; � �l ������ ���� ������ ������
	mov ah, byte ptr[edi + ebx];� �h ���������
	mov byte ptr[edi + ecx], ah;����� �� �������
	mov byte ptr[edi + ebx], al
		
	dec ebx
	inc ecx
	cmp ecx, byteNumber
	jl @cycle1

	pop ebp
	ret 16

StrToDec_LONGOP endp

end