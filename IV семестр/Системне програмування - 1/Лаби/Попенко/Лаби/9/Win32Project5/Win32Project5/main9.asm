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

include module.inc
include longop.inc

.data
	Caption db "---",0
	Var dd 544 dup(0)
	Sor dd 544 dup(0)
	last dd 544 dup(0)
	Text dd 544 dup(0)
	res_fact db 544 dup(0)
	divreshex db 10 dup(0)
	divresdec db 10 dup(0)
	hFile dd 0 
	pRes dd 0 
	count dd 0 dup(0)
	szFileName db "tmp.txt",0 
	szTextBuf db " ",13,10, 0 
	regeax db 10 dup(0)
	regebx db 10 dup(0)
	regecx db 10 dup(0)
	regedx db 10 dup(0)
	regesi db 10 dup(0)

.code
main:




	invoke CreateFile, ADDR szFileName,						;
						GENERIC_WRITE,				;
						FILE_SHARE_WRITE,				; сторення файлу
						0, CREATE_ALWAYS,				;
						FILE_ATTRIBUTE_NORMAL,			;
						0						;

	cmp eax, INVALID_HANDLE_VALUE						;
	je exit									;доступ до файлу неможливий 

	mov hFile, eax								; прив'язка до хендлера

	xor esi, esi										
	mov esi, 1h	
	mov dword ptr[count], 1h										
	cycle:	
		xor esi, esi	
		xor ecx, ecx
		xor edi, edi										
		xor eax, eax								;
		innercycle:								;
			mov dword ptr[res_fact + eax], 0					; обнулення всих масивів,
			mov dword ptr[Text + eax], 0				; які використовуються
		add eax, 4								; в програмі
		cmp eax, 545								;
		jl innercycle								;
														
		mov dword ptr[regesi], esi						;
		push offset res_fact
		push dword ptr[count]
		call Factorial
			
		push offset res_fact							;
		push offset Text						; переведення в десяткову систему
		push 19
		push 76							;
		call StrToDec_LONGOP							;

		;push offset Text
		;push offset res_fact
		;push 
		;call StrHex_MY
	
					
		mov eax, dword ptr[regeax]						;
		mov ebx, dword ptr[regebx]						; відновлення регістрів
		mov ecx, dword ptr[regecx]						;
		mov edx, dword ptr[regedx]						;

		invoke lstrlen, ADDR Text						;
		invoke WriteFile, hFile, ADDR Text,				; запис у файл
						eax, ADDR pRes, 0			;
		invoke lstrlen, ADDR szTextBuf					;
		invoke WriteFile, hFile, ADDR szTextBuf,				;
						 eax, ADDR pRes, 0			;

		mov dword ptr[regeax], eax						;
		mov dword ptr[regecx], ecx						;
		mov dword ptr[regebx], ebx						; збереження регістрів
		mov dword ptr[regedx], edx						;
		;mov esi, dword ptr[regesi]						;
					
	add dword ptr[count],1h						;							
	cmp dword ptr[count], 51							; перехід
	jl cycle							;
								
	invoke CloseHandle, hFile					;	закриття файлу					
			
exit:

	invoke ExitProcess, 0					; вихід з програми.
end main
