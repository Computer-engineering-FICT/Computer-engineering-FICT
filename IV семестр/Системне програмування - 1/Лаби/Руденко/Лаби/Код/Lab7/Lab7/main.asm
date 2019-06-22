.586
.model flat, stdcall
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include module.inc
include longop.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

option casemap :none

.data
	Caption1 db "Ділення у стовпчик (n!)",0
	textBuf dd 30 dup(?)
	factorial dd 16 dup(?)

.code
	main:
	push offset factorial
	push 90
	push 16
	call Factorial_LONGOP
	
	push offset textBuf
	push offset factorial
	push 32
	call StrDec_MY
	invoke MessageBoxA, 0, ADDR textBuf, ADDR Caption1, 40h

invoke ExitProcess,0
end main

