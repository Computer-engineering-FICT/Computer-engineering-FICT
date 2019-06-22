.586
.model flat, stdcall

option casemap :none

include d:\masm32\include\kernel32.inc
include d:\masm32\include\user32.inc
include d:\masm32\include\comdlg32.inc

include d:\masm32\include\windows.inc

include module.inc
include longop.inc

includelib d:\masm32\lib\kernel32.lib
includelib d:\masm32\lib\user32.lib
includelib d:\masm32\lib\comdlg32.lib



.data
	factorial dd 16 dup(?)
	hFile dd 0
	pRes dd 0
	pResult dd 32 dup(0)
	n dd 0
	myFileName dd ?
	decCode db 1024 dup(0), 13,10, 0
	line db " ",13,10, 0
	NM dd 3
	x dd 1
	BUFF dd 32 dup(0)

	
.code

	MySaveFileName proc

		LOCAL ofn : OPENFILENAME

		invoke RtlZeroMemory, ADDR ofn, SIZEOF ofn
		mov ofn.lStructSize, SIZEOF ofn
		mov ofn.lpstrFile, OFFSET myFileName
		mov ofn.nMaxFile, SIZEOF myFileName

		invoke GetSaveFileName, ADDR ofn
		ret

	MySaveFileName endp

	main:
		
		invoke GlobalAlloc, GPTR, 512
		mov myFileName, eax
		;mov dword ptr[eax], 1 

		call MySaveFileName
		cmp eax, 0
		je @exit

		invoke CreateFile, ADDR myFileName, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0
		cmp eax, INVALID_HANDLE_VALUE
		je @exit
		mov hFile, eax

		
		@cycle:

				
				push pResult
				push BUFF
				push x
				call Mul_N_x_32_LONGOP 


				push pResult
				push offset decCode
				push 16
				push 80
				call StrToDec_LONGOP

				;push offset decCode
				;push pResult
				;push 80
				;call StrHex_MY


				invoke lstrlen, ADDR decCode 
				invoke WriteFile, hFile, ADDR decCode, eax, ADDR pRes, 0

				invoke lstrlen, ADDR line 
				invoke WriteFile, hFile, ADDR line,  eax, ADDR pRes, 0
	
				inc x
	
				push pResult
				push BUFF
				push 16
				call COPY_LONGOP
	
				dec n
				jnz @cycle
			


		@endF:

		invoke GlobalFree, myFileName

		
		
		invoke CloseHandle, hFile

		@exit:
		

		invoke ExitProcess, 0


	end main
