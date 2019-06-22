.386
.model flat, stdcall
option casemap :none
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
extrn third_proced@0:near ; оголошуэмо зовнішню функцію
public a_, b_ ; доступ до зміних для інших файлів
.data
	a_ dd 3.5, -10.8, 5.6, 13.1, 2.1
	b_ dd 0.2, 2.3, 1.59, 3.6, 5.32
	c_ dd -0.6, -112.3, -15.2, 11.2, 3.1
	d_ dd 1.7, 3.5, 0.48, -0.21, 0.17
	e_two dd 82
	two dd -2
	z1 dd ?
	z2 dd ?
	z2 dd ?
	temp dd ?
	result dq ?
	buffer db 15 dup (?)
	titl db "Result",0
	;(-2*c-d*82)/(tg(a/4-b))
.code 
main:
	mov ebx, 0
begin:
	mov eax, c_[ebx]
	mov ecx, two
	call first_proced
	mov temp, eax
	push d_[ebx]
	push e_two
	call second_proced 
	fld temp
	fxch st(1) 
	fsub 
	fstp result
	call third_proced@0 ; виклик зовн функції
	fld result
	fxch st(1)
	fdiv
	fstp result
	invoke FloatToStr, result, addr buffer
	invoke MessageBoxA, 0, addr buffer, addr titl, 0
	add ebx, 4 ; наступні елементи
	cmp ebx, 20
	jne begin

	invoke ExitProcess,0
first_proced proc
	local c1, two1
	mov c1, eax
	mov two1, ecx
	fld c1
	fild two1
	fmul 
	fstp c1
	mov eax, c1
	ret
first_proced endp
second_proced proc
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	mov z1,eax
	mov ecx,[ebp+12]
	mov z2, ecx
	pop ebp
	fild z1
	fld z2
	fmul;82*d
	ret 8
second_proced endp
end main
