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
	TextBuf dd 32 dup(?)
	Caption db "Результат" ,0
	m dd 5
	n dd 16
	x dd 1h,2h,3h,4h,5h,6h,7h,8h,9h,10h,11h,12h,13h,14h,15h,16h,17h,18h,19h,20h,21h,22h,23h,24h,25h,26h,27h,28h,29h,30h,31h,32h
	
.code
	start:

	push offset m
	push offset n
	push offset x
	call Mul_N_x_N_LONGOP 

	push offset TextBuf
	push offset x
	push 1024
	call StrHex_MY

	invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption1, 40h
	invoke ExitProcess,0
end start