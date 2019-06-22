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
	TextBuf dd 100 dup(?)
	Caption db "Результат" ,0
	m dd 5
	n dd 5
	x dd 32 dup(1h)
	
.code
	main:
	
	
;	@cycle:
;	mov ebx, n
;	mov ecx, ebx
;	shr ebx, 3
;	and ecx, 07h
;	mov al, 1
;	shl al, cl
;
;	or byte ptr[x+ebx], al
;
;	dec n
;	dec m
;	jnz @cycle
;
;	push offset TextBuf
;	push offset x
;	push 1024
;	call StrHex_MY
;
;	invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 40h


	push offset m
	push offset n
	push offset x
	call Write1_LONGOP

	push offset TextBuf
	push offset x
	push 1024
	call StrHex_MY

	invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 40h
	invoke ExitProcess,0
end main