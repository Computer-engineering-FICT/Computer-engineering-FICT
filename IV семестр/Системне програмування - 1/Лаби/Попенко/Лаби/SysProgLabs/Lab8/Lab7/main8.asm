.686
.model flat, stdcall
option casemap : none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include module.inc
include longop.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data

	Text db 45 dup(0), 0

	Caption db "Лабораторна робота №8", 0

	sourse0 dd 0.5655345345
	sourse1 dd 1.2134563454
	sourse2 dd -78.0033454212

	iterations dd 5
	AArray dd 0.5, 1.0, 1.0, 0.6, 0.7 
	BValue dd 0.7854
	BValue2 dd 2.35619
	result dd 0

.code
start:

	push iterations
	push offset result
	push offset AArray
	push offset BValue
	call TAN_Function_longop
	
	push offset Text
	push sourse2
	call FloatToDec_module
	 
	invoke MessageBoxA, 0, ADDR Text, ADDR Caption, MB_ICONINFORMATION

	invoke ExitProcess, 0

end start