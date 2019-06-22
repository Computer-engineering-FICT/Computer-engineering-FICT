.586
.model flat, stdcall
option casemap :none 
include D:\\masm32\include\windows.inc
include D:\\masm32\include\kernel32.inc
include D:\\masm32\include\user32.inc
include module.inc
include longop.inc

includelib D:\\masm32\lib\kernel32.lib
includelib D:\\masm32\lib\user32.lib

.data
Caption db "n!",0
Caption1 db "n!*n!",0
	number dd 0
	counter dd 0
	var dd 0
	res dd 5 dup(0)
	text dd 5 dup(0)
	text2 dd 30 dup(0)
	res2 dd 8 dup(0)

.code
main:
	mov var, 42

	push offset var
	push offset res
	call Factor

	mov eax, res
	
	push offset text ; строка, куда запишется
	push offset res ; число 
	push 128
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR text, ADDR Caption, 0

	push offset res
	push offset res
	push offset res2
	call Sqr

	push offset text ; строка, куда запишется
	push offset res2 ; число 
	push 256
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR text, ADDR Caption1, 0


invoke ExitProcess, 0
end main