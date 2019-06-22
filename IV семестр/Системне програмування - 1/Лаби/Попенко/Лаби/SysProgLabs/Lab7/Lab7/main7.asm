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

	Caption db "Ділення 1-им методом", 0
	Caption1 db "Ділення 2-им методом", 0
	caption2 db "Факторіал", 0
	caption3 db "Функція", 0
	textBuf1 dd 60 dup(?)
	integerPart dd 10 dup(?)
	fractionalPart dd ?
	number dd 80CD01h,885001h,50A23401h,8B0001h,0FFFFFFFFh
	number1 dd 80CD01h,885001h,50A23401h,8B0001h,0FFFFFFFFh
	decCode dd 50 dup(?)
	val dd 2
	factorial dd 16 dup(?)
	result dd ?
	
.code

	start:

	push offset number
	push offset decCode
	push 5
	push 100
	call StrToDec_LONGOP 
	invoke MessageBoxA, 0, ADDR decCode, ADDR Caption1, 40h

	push offset number1
	push offset integerPart
	push offset fractionalPart
	push 5
	call DIV2_LONGOP

	push offset integerPart
	push offset decCode
	push 5
	push 200
	call StrToDec_LONGOP 
	invoke MessageBoxA, 0, ADDR decCode, ADDR Caption1, 40h

	push offset factorial
	push 78
	push 13
	call Factorial_LONGOP
	
	push offset factorial
	push offset decCode
	push 13
	push 116
	call StrToDec_LONGOP 
	invoke MessageBoxA, 0, ADDR decCode, ADDR caption2, 40h

	mov ebx, 4   ;x
	mov ecx, 5   ;m
	call FuncResult_LONGOP

	mov result, eax

	push offset result
	push offset decCode
	push 1
	push 5
	call StrToDec_LONGOP 
	invoke MessageBoxA, 0, ADDR decCode, ADDR caption3, 40h



	invoke ExitProcess, 0

end start