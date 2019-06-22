.586
.model flat, stdcall
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\module.inc
include longop.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

option casemap :none

.data
	Caption db "n!" ,0
	Caption1 db "n! * n!" ,0
	textBuf dd 30 dup(?)
	textBuf1 dd 30 dup(?)

	val dd 16 dup(?)
	val2 dd 1h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h,0h
	x dd 1h
	n dd 54

	result dd 18 dup(?)
	
	
.code
	start:

	@cycle:
	
		push offset val
		push offset val2
		push x
		call Mul_N_x_32_LONGOP 
	
	inc x
	
		mov ecx, 0
		@cycleIn:
			mov eax, dword ptr[val + 4 * ecx]
			mov dword ptr[val2 + 4 * ecx], eax
			inc ecx
			cmp ecx, 10
		jl @cycleIn
	
	dec n
	jnz @cycle

	push offset textBuf
	push offset val
	push 512
	call StrHex_MY

	invoke MessageBoxA, 0, ADDR textBuf, ADDR Caption, 40h

	push offset val
	push offset val
	push offset result
	call Mul_N_x_N_LONGOP 

	push offset textBuf1
	push offset result
	push 1024
	call StrHex_MY

	invoke MessageBoxA, 0, ADDR textBuf1, ADDR Caption1, 40h
	invoke ExitProcess,0
end start