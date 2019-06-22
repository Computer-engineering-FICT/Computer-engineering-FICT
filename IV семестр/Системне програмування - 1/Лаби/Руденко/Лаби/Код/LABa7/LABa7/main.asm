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
	Caption1 db "Div 1" ,0
	Caption2 db "Div 2" ,0
	Caption3 db "Factorial" ,0
	Caption4 db "Function" ,0
	textBuf1 dd 50 dup(?)
	intP dd 10 dup(?)
	fractP dd ?
	number dd 800020h,1080001h,52410401h,0A880001h,0FFFFCCCCh
	decCode dd 50 dup(?)
	factorial dd 16 dup(?)

	solution dd ?
	
	
.code
	main:
	
	push offset number
	push offset intP
	push offset fractP
	push 20
	call DIV1_LONGOP
	

	push offset textBuf1
	push offset intP
	push 160
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textBuf1, ADDR Caption1, 40h

	push offset number
	push offset intP
	push offset fractP
	push 5
	call DIV2_LONGOP
	
	push offset textBuf1
	push offset intP
	push 160
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textBuf1, ADDR Caption2, 40h

	push offset factorial
	push 30
	push 50
	call FACTORIAL_LONGOP


	 ;push offset factorial
	 ;push offset decCode
	 ;push 20
	 ;push 50
	 ;call StrToDec_LONGOP 
	 ;invoke MessageBoxA, 0, ADDR decCode, ADDR Caption3, 40h

	 mov eax, 2
	 mov ecx, 0
	 call getSolution_LONGOP

	 mov solution, eax

	

	 push offset solution
	 push offset decCode
	 push 8
	 push 8
	 call StrToDec_LONGOP 
	 invoke MessageBoxA, 0, ADDR decCode, ADDR Caption4, 40h



	invoke ExitProcess, 0


end main
