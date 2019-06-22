.386
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

myFunc PROTO :dword,:dword,:dword,:dword

.data
	varA dd 6.0, 2.0, 4.4, 2.5, -2.0 
	varB dd 5.0, 10.0, 17.6, 9.7, 0.5
    varC dd 9.4, 2.5, 4.1, 3.8, -1.0
    varD dd 3.0, 2.0, 3.9, 3.2, 3.5

	MyLib db "lib.dll",0
	MyFunction db "myFunc",0
	LibNotFoundErr db "Cannot load library",0
	ProcName db "Load Library",0
	TestFuncNotEx db "TestHello function not found",0
   .data?
   hLib dd ?                                         ; хэндл библиотеки (DLL)
   myFuncAddr dd ?                        ; адрес функции Execute
.code 
start:
mov ebx,0
	invoke LoadLibrary,addr MyLib
	.if eax==0
                invoke MessageBox,0,addr LibNotFoundErr,addr ProcName,0
		.else
                mov hLib,eax
                invoke GetProcAddress,hLib,addr MyFunction
			   .if eax==0
                        invoke MessageBox,0,addr TestFuncNotEx,addr ProcName,0
                .else
                        mov myFuncAddr,eax
loops:
		push varD[ebx]
		push varC[ebx]
		push varB[ebx]
		push varA[ebx]
		call [myFuncAddr]
		pop ecx
		pop ecx
		;рop ecx
		pop ecx
		add ebx, 4
		cmp ebx, 20
		jne loops						
	.endif
	invoke FreeLibrary,hLib
	.endif
	invoke ExitProcess, 0
end start
