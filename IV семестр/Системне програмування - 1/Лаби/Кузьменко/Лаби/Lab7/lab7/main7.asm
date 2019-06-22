.586
.model flat, stdcall
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

include \masm32\modules\module.inc
include \masm32\modules\longop.inc
.data
	Caption db "---",0
	Var db 544 dup(0)
	Sor db 544 dup(0)
	last db 544 dup(0)
	Text db 544 dup(0)
	divreshex db 10 dup(0)
	divresdec db 10 dup(0)

.code
main:

;	mov word ptr[sor], 110101110101b
;	push offset Sor
;	push 16
;	push offset Var
;	push offset last
;	call module_div10

	push offset Sor
	push 50
	call Factorial

	push offset Var
	push offset Sor
	push 544
	call StrDec


	push offset Text
	push offset Var
	push 544
	call StrHex_My

	invoke MessageBoxA, 0, ADDR Text, ADDR Caption, 0

	mov edx, 0h				; старші біти х
	mov eax, 40				; молодші біти х
	mov ebx, 5				; константа 5
	idiv bx					; ділення х на константу
	mov ecx, 2				; константа 2
	shr ecx, 1				; піднесення до потрібного степеню -m
	imul ax,cx				; знаходження у

	mov word ptr[divreshex], ax
	mov word ptr[divreshex + 2], dx

	push offset Text
	push offset divreshex
	push 32
	call StrHex_My

	invoke MessageBoxA, 0, ADDR Text, ADDR Caption, 0

	invoke ExitProcess, 0
end main