.386
.model flat, stdcall
option casemap: none

include E:\masm32\include\windows.inc
include E:\masm32\macros\macros.asm
include E:\masm32\include\masm32.inc
include E:\masm32\include\user32.inc
include E:\masm32\include\kernel32.inc
include E:\masm32\include\msvcrt.inc

includelib E:\masm32\lib\masm32.lib
includelib E:\masm32\lib\msvcrt.lib
includelib E:\masm32\lib\user32.lib
includelib E:\masm32\lib\kernel32.lib

.data
	nameS db "Сулима Олександр",0
	numb2 db "IП-53",0
	numb3 db "Series: 5318",0
	before byte "Введiть пароль:",0
	errors db "Введений пароль не вiрний",0
	inp DWORD ?
	outp DWORD ?
	bufferRead byte 8 dup (0)
	in_Num DWORD ?
	out_Num DWORD ?
	my_pass byte "0404",0
	msg1310 byte 13, 10	

.code
main:
	invoke GetStdHandle, STD_INPUT_HANDLE
	mov inp, eax
	invoke GetStdHandle, STD_OUTPUT_HANDLE
	mov outp, eax	
	
	invoke WriteConsoleA, outp, addr before, SIZEOF before,ADDR out_Num,0
	invoke ReadConsoleA, inp, ADDR bufferRead, 10, ADDR in_Num, 0
	invoke WriteConsoleA, outp,ADDR msg1310,SIZEOF msg1310, ADDR out_Num,0
	
	CLD 
    LEA ESI, bufferRead  
    LEA EDI, my_pass 
    REPE CMPSB
	jnz alternative
	invoke ClearScreen
	print chr$(10)
	print addr nameS
	print chr$(10)
	print addr numb2
	print chr$(10)
	print addr numb3
	print chr$(10)
	inkey
	invoke ExitProcess, 0
alternative:
	print addr errors
	print chr$(10)
	inkey
	invoke ExitProcess, 0
end main
