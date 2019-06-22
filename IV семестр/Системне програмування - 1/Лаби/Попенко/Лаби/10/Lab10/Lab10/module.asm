.586
.model flat, c
.code

;��������� StrHex_MY ������ ��������������� ��� �������� �����
;bits - ���������� ����� � ����
;src - ������ �����
;dest - ������ ������ ���������� (����� �������)

StrHex_MY proc bits:DWORD, src:DWORD, dest:DWORD

mov ecx, bits
cmp ecx, 0
jle @exitp
shr ecx, 3 ;������� ����� �����
mov esi, src
mov ebx, dest
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

ret

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

end