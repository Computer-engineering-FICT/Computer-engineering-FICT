.586
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

include \masm32\include\windows.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

include module.inc
include longop.inc

.data

	N0 db 104 dup(170)
	n dd 336
	m0 db 22 dup(85)
	m dd 176
	
	TextBuf0 db 256 dup(?)
	TextBuf1 db 256 dup(?)
	
	Caption0 db "Вхідний рядок",0
	Caption1 db "Вихідний рядок",0

.code

start:

	push offset TextBuf0
    push offset N0
    push 832
    call StrHex_MY

    invoke MessageBox, 0, ADDR TextBuf0, ADDR Caption0, MB_ICONINFORMATION

	push offset N0
	push offset m0
	push n
	push m
	call Or_Longop

	push offset TextBuf1
    push offset N0
    push 832
    call StrHex_MY

    invoke MessageBox, 0, ADDR TextBuf1, ADDR Caption1, MB_ICONINFORMATION

    invoke ExitProcess, 0

end start