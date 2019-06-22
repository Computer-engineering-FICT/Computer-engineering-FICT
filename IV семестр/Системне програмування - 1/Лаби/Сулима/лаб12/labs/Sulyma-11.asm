.386
.model flat, stdcall
option casemap :none
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib SulymaLib.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
myFunc PROTO :dword,:dword,:dword,:dword
.data
	varA dd 6.0, 2.0, 4.4, 2.5, -2.0 
	varB dd 5.0, 10.0, 17.6, 9.7, 0.5
    varC dd 9.4, 2.5, 4.1, 3.8, -1.0
    varD dd 3.0, 2.0, 3.9, 3.2, 3.5
	
.code 
start:
	mov ebx, 0
loops:
	invoke myFunc, varA[ebx], varB[ebx], varC[ebx], varD[ebx]
	add ebx, 4
	cmp ebx, 20
	jne loops
	invoke ExitProcess, 0
end start
