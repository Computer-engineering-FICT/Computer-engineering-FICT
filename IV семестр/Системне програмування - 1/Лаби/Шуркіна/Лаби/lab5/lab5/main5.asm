.586
.model flat, stdcall
option casemap : none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\windows.inc
include \masm32\include\comdlg32.inc
include \masm32\modules\module.inc
include longpop.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\comdlg32.lib

.data

szFileName db 80 dup(0)
hFile dd 0
pRes dd 0
szTextBuf db 80 dup(0)
TextBuf db 80 dup(0)
fact dd 13 dup(0)
szLn db " ",13,10,0
n dd 80
pD dd 0
counter dd 0
pVal dd ?

.code

MySaveFileName proc
	LOCAL ofn : OPENFILENAME
	invoke RtlZeroMemory, ADDR ofn, SIZEOF ofn
	mov ofn.lStructSize, SIZEOF ofn
	mov ofn.lpstrFile, OFFSET szFileName
	mov ofn.nMaxFile, SIZEOF szFileName
	invoke GetSaveFileName, ADDR ofn
	ret
MySaveFileName endp

main:

call MySaveFileName 

invoke CreateFile, ADDR szFileName, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL,0
cmp eax, INVALID_HANDLE_VALUE
je exit
mov hFile, eax
xor eax, eax
invoke GlobalAlloc, GPTR, 1024
mov pVal, eax
mov dword ptr[eax], 1
mov edi, 0
cycle:
inc edi
cmp edi, [n]
jg exit
mov esi, 0
xor edx, edx
xor ebx, ebx
cycle2:
mov ecx, pVal
mov eax, [ecx + esi*4]
mul edi
add eax, ebx
mov [ecx + esi*4], eax
mov ebx, edx
inc esi
cmp esi, 18
jl cycle2

push offset TextBuf 
push pVal
push 544
call StrHex_MY


invoke lstrlen, ADDR szTextBuf
invoke WriteFile, hFile, ADDR szTextBuf, eax, ADDR pRes, 0
invoke lstrlen, ADDR szLn
invoke WriteFile, hFile, ADDR szLn, eax, ADDR pRes, 0
jmp cycle

exit:

invoke CloseHandle, hFile
invoke GlobalFree, pVal
invoke ExitProcess, 0
end main	
