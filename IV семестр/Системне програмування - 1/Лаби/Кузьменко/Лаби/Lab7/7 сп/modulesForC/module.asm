.586
.model flat, c
include \masm32\modules\longop.inc
.data
	temp db 544 dup(0)
	number db 544 dup(0)
	last db 544 dup(0)
	count db 10 dup(0)
	result db 544 dup(0)
	reggeax db 10 dup(0)
	reggebx db 10 dup(0)
	reggecx db 10 dup(0)
	reggedx db 10 dup(0)
	reggesi db 10 dup(0)
	reggedi db 10 dup(0)
	variable db 10 dup(0)
.code
;��������� StrHex_MY ������ ����� ����������������� ����
;������ �������� - ������ ������ ���������� (����� �������)
;������ �������� - ������ �����
;����� �������� - ���������� ����� � ���� (�� ���� ������ 8)
StrHex_MY proc bits:DWORD, src:DWORD, dest:DWORD 

	mov ecx, bits			;[ebp+8] ;������� ��� �����
	cmp ecx, 0
	jle @exitp
	shr ecx, 3 ;������� ����� �����
	mov esi, src			; [ebp+12] ;������ �����
	mov ebx, dest				;[ebp+16] ;������ ������ ����������
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

StrDec proc
	

	mov dword ptr[count], 0
	mov eax, [ebp + 16] ; result
	mov ebx, [ebp + 12] ; number
	mov ecx, [ebp + 8] ; n-bit

	cmp ecx, 0								; ���� ���������� 0 - �� �����
	je exit									;

	xor edi, edi						   ;
	cycle22:                               ;
		mov dword ptr[result  + edi], 0    ; 
		mov dword ptr[number + edi], 0     ;
	add edi, 4                             ;
	cmp edi, 544                           ;                             
	jl cycle22

	xor edi, edi						   ;
	cycle1:                                ;
		mov esi, dword ptr[ebx  + edi]     ; �������� � ����� ������� ����� ��� �������������
		mov dword ptr[number + edi], esi   ;
	add edi, 4                             ;
	cmp edi, 544                           ;
	je again                               ;
	jmp cycle1

again:
;-----------------------------------------------------------------------------
;---------����� ������� � ������� ������� �����--------------------------------
;-----------------------------------------------------------------------------
	mov dword ptr[reggecx], ecx             ;
	mov dword ptr[reggedx], edx				; �������� ����� �������
	mov dword ptr[reggesi], esi				;
	mov dword ptr[reggedi], edi				;


	push offset number			;
	push [ebp + 8]				;
	push offset result			; ��������� ������
	push offset last			;
	call module_div10			;
;	add esp, 16

	mov ecx, dword ptr[last]
;	mov edx, dword ptr[result]

	mov ecx, dword ptr[reggecx]	;
	mov edx, dword ptr[reggedx]	; ���������� ����� �������
	mov esi, dword ptr[reggesi]	;
	mov edi, dword ptr[reggedi]	;

	xor ecx, ecx							;
	xor edi, edi							;
	cycle2:									;
		mov esi, dword ptr[result  + edi]	;
		cmp esi, 0							;
		je nothing							;
		inc ecx								; ���������� ��������� ������ �� 0
nothing:									;
	add edi, 4								;
	cmp edi, 544							;
	je next1								;
	jmp cycle2								;
next1:

	mov eax, [ebp + 16]						;	
	mov dl, byte ptr[last]					;  �������� ������� �� ������ � ���������
	mov esi, dword ptr[count]				;
	add byte ptr[eax + esi], dl				;

	cmp ecx, 0								; ���� ��������� ������ 0 - �� �����
	je exit									;
	

	xor edi, edi							;
	cycle:									;
		mov esi, dword ptr[result  + edi]	;
		mov dword ptr[result + edi], 0h		; ���������� ��������� ������ � ����� �������
		mov dword ptr[number + edi], esi	;
	add edi, 4								;
	cmp edi, 544							;
	je nexth								;
	jmp cycle								;

nexth:
;-----------------------------------------------------------------------------
;---------����� ������� � ������ ������� �����--------------------------------
;-----------------------------------------------------------------------------
	mov dword ptr[reggecx], ecx             ;
	mov dword ptr[reggedx], edx				; �������� ����� �������
	mov dword ptr[reggesi], esi				;
	mov dword ptr[reggedi], edi				;


	push offset number			;
	push [ebp + 8]				;
	push offset result			; ��������� ������
	push offset last			;
	call module_div10			;
;	add esp, 16

	mov ecx, dword ptr[last]
;	mov edx, dword ptr[result]

	mov ecx, dword ptr[reggecx]	;
	mov edx, dword ptr[reggedx]	; ���������� ����� �������
	mov esi, dword ptr[reggesi]	;
	mov edi, dword ptr[reggedi]	;

	xor ecx, ecx							;
	xor edi, edi							;
	cycle2h:								;
		mov esi, dword ptr[result  + edi]	;
		cmp esi, 0							;
		je nothingh							;
		inc ecx								; ���������� ��������� ������ �� 0
nothingh:									;
	add edi, 4								;
	cmp edi, 544							;
	je next1h								;
	jmp cycle2h								;
next1h:

	mov eax, [ebp + 16]						;	
	mov dl, byte ptr[last]					;  �������� ������� �� ������ � ���������
	shl dl, 4								;
	mov esi, dword ptr[count]				;
	add byte ptr[eax + esi], dl				;

	cmp ecx, 0								; ���� ��������� ������ 0 - �� �����
	je exit									;
	

	xor edi, edi							;
	cycleh:									;
		mov esi, dword ptr[result  + edi]	;
		mov dword ptr[result + edi], 0h		; ���������� ��������� ������ � ����� �������
		mov dword ptr[number + edi], esi	;
	add edi, 4								;
	cmp edi, 544							;
	je next									;
	jmp cycleh								;

next:										; ���������� ������ � �������
	add dword ptr[count], 01h				;
	jmp again								;

exit:

;	mov eax, [ebp + 16]
;	mov ebx, dword ptr[last]
;	mov dword ptr[eax], ebx
	
	ret 12
StrDec endp

end


