.586
.model flat, stdcall

option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\comdlg32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\comdlg32.lib

include module.inc
include longop.inc

.data
	Caption db "FUNCTION" ,0
	textbuf dd 300 dup(?)

	x dd 1
	hFile dd 0
	
	szFileName db 256 dup(0), 0
	
	arrayPointerRES dd 0
	arrayPointerBUF dd 0
	decPointer dd 0

	text db 512 dup(0) , 13,10, 0
	nextLine db " ",13,10, 0

	n dd 78

	pRes dd 0

.code

	MySaveFileName proc

		LOCAL ofn : OPENFILENAME

		invoke RtlZeroMemory, ADDR ofn, SIZEOF ofn ; спочатку усі поля обнулюємо

		mov ofn.lStructSize, SIZEOF ofn
		mov ofn.lpstrFile, OFFSET szFileName
		mov ofn.nMaxFile, SIZEOF szFileName

		invoke GetSaveFileName,ADDR ofn ; виклик вікна File Save As

		ret

	MySaveFileName endp


	main:
	
		call MySaveFileName
		cmp eax, 0 ; перевірка: якщо у вікні було натиснуто кнопку Cancel, то EAX=0
		je @exit
			
			invoke CreateFile,  ADDR szFileName,
							    GENERIC_WRITE,
								FILE_SHARE_WRITE,
								0, CREATE_ALWAYS,
								FILE_ATTRIBUTE_NORMAL,
								0
			cmp eax, INVALID_HANDLE_VALUE
			je @exit
			
			mov hFile, eax

			invoke GlobalAlloc, GPTR, 1024

			mov arrayPointerRES, eax
			add eax, 512
			mov arrayPointerBUF, eax
			mov dword ptr[eax], 1


			@cycle:

				
				push arrayPointerRES
				push arrayPointerBUF
				push x
				call Mul_N_x_32_LONGOP 

				push offset textbuf
				push arrayPointerRES
				push 400
				call StrHex_MY

				invoke lstrlen, ADDR textbuf 
				invoke WriteFile, hFile, ADDR textbuf, eax, ADDR pRes, 0

				invoke lstrlen, ADDR nextLine 
				invoke WriteFile, hFile, ADDR nextLine,  eax, ADDR pRes, 0

	
				inc x
	
				push arrayPointerRES
				push arrayPointerBUF
				push 14
				call COPY_LONGOP
	
				dec n
				jnz @cycle
			

		invoke GlobalFree, arrayPointerRES

		invoke CloseHandle, hFile
		
		
		@exit:
	
	invoke ExitProcess, 0


end main
