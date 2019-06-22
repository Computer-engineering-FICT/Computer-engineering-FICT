.586
.model flat, stdcall
option casemap: none
	  
include \masm32\include\user32.inc
includelib \masm32\lib\user32.lib
include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib

data segment
	integer db "%d",0
	tCP db "CPU",0
	nameStep db "Stepping",0
	math_mmx db "Math, MMX",0
	nameFam db "Family",0
	nameCPU db ?
	stepping db ?
	step db ?
	fam db ?
	family db ?
	mathproc db	?
	com db ?
data ends

.code
main:
	;вывод имени процессора
	xor eax, eax
	cpuid
	mov dword ptr nameCPU, ebx
	mov dword ptr nameCPU[+ 4], edx
	mov dword ptr nameCPU[+ 8], ecx
	invoke MessageBoxA, 0, offset nameCPU, offset tCP, 0
	;вывод степпинга
	xor eax, eax
	inc eax
	cpuid
	mov stepping, al
	and stepping, 0Fh
	invoke wsprintf, addr step, addr integer, stepping	
	invoke MessageBoxA, 0, offset step, offset nameStep, 0
	;вывод семейства проца
	mov eax, 1
	cpuid
	mov fam, ah
	and fam, 0fh
	invoke wsprintf, addr family, addr integer, fam	
	invoke MessageBoxA, 0, offset family, offset nameFam, 0
	;вывод math and mmx
	xor eax, eax
	inc eax
	cpuid
	mov dword ptr mathproc, edx
	invoke wsprintf, addr com, addr integer, mathproc
	invoke MessageBoxA, 0, offset com, offset math_mmx, 0
	invoke ExitProcess, 0
	
end main