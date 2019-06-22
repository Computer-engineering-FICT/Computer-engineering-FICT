.586
.model flat, stdcall
option casemap :none
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

include \masm32\include\comdlg32.inc 
includelib \masm32\lib\comdlg32.lib
include \masm32\include\windows.inc

include \masm32\modules\module.inc
include \masm32\modules\longop.inc

.data
	Caption db "---",0
	Var dd ?
	Sor dd ?
	last dd 544 dup(0)
	Text dd 544 dup(0)
	divreshex db 10 dup(0)
	divresdec db 10 dup(0)
	hFile dd 0 
	pRes dd 0 
	szFileName db 256 dup(0)
	szTextBuf db " ",13,10, 0 
	regeax db 10 dup(0)
	regebx db 10 dup(0)
	regecx db 10 dup(0)
	regedx db 10 dup(0)
	regesi db 10 dup(0)

.code

MySaveFileName proc
LOCAL ofn : OPENFILENAME
invoke RtlZeroMemory, ADDR ofn, SIZEOF ofn ; �������� �� ���� ���������
mov ofn.lStructSize, SIZEOF ofn
mov ofn.lpstrFile, OFFSET szFileName
mov ofn.nMaxFile, SIZEOF szFileName
invoke GetSaveFileName,ADDR ofn ; ������ ���� File Save As
ret
MySaveFileName endp


main:
								
	call MySaveFileName
	cmp eax, 0 ; ��������: ���� � ��� ���� ��������� ������ Cancel, �� EAX=0
	je exit




	invoke CreateFile, ADDR szFileName,					;
						GENERIC_WRITE,					;
						FILE_SHARE_WRITE,				; �������� �����
						0, CREATE_ALWAYS,				;
						FILE_ATTRIBUTE_NORMAL,			;
						0								;

	cmp eax, INVALID_HANDLE_VALUE						;
	je exit												;������ �� ����� ���������� 

	mov hFile, eax										; ����'���� �� ��������

	xor esi, esi										
	mov esi, 1h	
	
	invoke GlobalAlloc, GPTR, 3000						;
		mov Var, eax										
		add eax, 545										;
		mov Sor, eax										; ��������� ��������� ������
											
	cycle:	
		

											;		
		xor eax, eax									;
		innercycle:										;
				; ��������� ���� ������,
			mov dword ptr[Text + eax], 0				; �� ����������������
		add eax, 4										; � �������
		cmp eax, 545									;
		jl innercycle									;
														
		mov dword ptr[regesi], esi						;
		push Sor									; ���������� ���������
		push esi										;
		call Factorial									;
			
		push Var									;
		push Sor									; ����������� � ��������� �������
		push 544										;
		call StrDec										;

	
		push offset Text								;
		push Var									;
		push 544										; ����������� � �����
		call StrHex_MY									;
					
		mov eax, dword ptr[regeax]						;
		mov ebx, dword ptr[regebx]						; ���������� �������
		mov ecx, dword ptr[regecx]						;
		mov edx, dword ptr[regedx]						;

		invoke lstrlen, ADDR Text						;
		invoke WriteFile, hFile, ADDR Text,				; ����� � ����
						eax, ADDR pRes, 0				;
		invoke lstrlen, ADDR szTextBuf					;
		invoke WriteFile, hFile, ADDR szTextBuf,		;
						 eax, ADDR pRes, 0				;

		mov dword ptr[regeax], eax						;
		mov dword ptr[regecx], ecx						;
		mov dword ptr[regebx], ebx						; ���������� �������
		mov dword ptr[regedx], edx						;
		mov esi, dword ptr[regesi]						;

	invoke RtlZeroMemory, Var, 3000	
					
	inc esi												;									
	cmp esi, 51											; �������
	jl cycle											;


	invoke GlobalFree, Var								; ���������� �������� ���'��							
	invoke CloseHandle, hFile							;	�������� �����								
exit:


	invoke ExitProcess, 0								; ����� � ��������.
end main