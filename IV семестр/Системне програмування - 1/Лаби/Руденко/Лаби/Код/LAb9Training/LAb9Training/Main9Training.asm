.586
.model flat, stdcall
option casemap :none 
include D:\\masm32\include\windows.inc
include D:\\masm32\include\kernel32.inc
include D:\\masm32\include\user32.inc
include D:\\masm32\include\comdlg32.inc

include longop.inc
include module.inc

includelib D:\\masm32\lib\kernel32.lib
includelib D:\\masm32\lib\user32.lib
includelib D:\\masm32\include\comdlg32.lib
.data
	Caption db "lala", 0
	szFileName db 256 dup(0)  ;����� ��� ���� �����
	hFile dd 0
	pRes dd 0
	szTextBuf db "Something",0
	endLine db 13,10,0
	pFactorial dd ? ;�������� �� ��������� ����� ��� ���������� ���������
	pTextBuffer dd ? ;�������� �� ��������� ����� ��� ���������� ����� ��� ������ � ����
	n dd 1     
	Nmax dd 36 ;�� �����
	
.code
MySaveFileName proc
	LOCAL ofn: OPENFILENAME

	invoke RtlZeroMemory, ADDR ofn, SIZEOF ofn     ;�������� �� ���� ���������
	mov ofn.lStructSize, SIZEOF ofn
	mov ofn.lpstrFile, offset szFileName
	mov ofn.nMaxFile, SIZEOF szFileName

	invoke GetSaveFileName, ADDR ofn   ;������ ���� File Save As
	ret
MySaveFileName endp


main:
	;����������� ��������� ������
	invoke GlobalAlloc, GPTR, 2048
	mov pFactorial, eax
	mov dword ptr[eax], 1 ;val = 1 (����� �� ��������� �������� ����� ������)
	add eax, 1024		  ;������ ������ textBuff
	mov pTextBuffer, eax

	;���� ���������
	;��������� �����
	call MySaveFileName
	cmp eax, 0
	je @exit
	

	invoke CreateFile, ADDR szFileName,
					   GENERIC_WRITE,
					   FILE_SHARE_WRITE,
					   0, CREATE_ALWAYS,
					   FILE_ATTRIBUTE_NORMAL,0
	cmp eax, INVALID_HANDLE_VALUE
	je @exit ; �����, ���� ���� �����������
	mov hFile, eax

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov dword ptr[n], 0
	@cycle:
		xor eax,eax
		xor ebx,ebx
		

		add n, 1			;n=n+1
		mov eax, dword ptr [n]
		mov ebx, dword ptr [Nmax]
		cmp eax, ebx				;�� �����
		jg @exit
		
		push pFactorial
		push n
		push 16
		call FACTORIAL_LONGOP

		push pTextBuffer
		push pFactorial
		push 160
		call StrHex_MY

		;invoke MessageBoxA, 0, pTextBuffer, ADDR Caption,0
		
		; ����� � ����
		invoke lstrlen, pTextBuffer
		invoke WriteFile, hFile, pTextBuffer, eax, ADDR pRes, 0
	
		invoke lstrlen, ADDR endLine
		invoke WriteFile, hFile, ADDR endLine, eax, ADDR pRes, 0
		
		jmp @cycle

	

	invoke lstrlen, ADDR szTextBuf
	invoke WriteFile, hFile, ADDR szTextBuf, eax, ADDR pRes, 0
	

	



@exit:
invoke CloseHandle, hFile
invoke GlobalFree, pFactorial
Invoke ExitProcess, 0
end main
end
