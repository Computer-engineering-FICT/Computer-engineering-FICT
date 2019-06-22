.586
.model flat, stdcall
option casemap :none

	  ;підключаю необхідні файли

	  include \masm32\macros\macros.asm
	  
	  include \masm32\include\masm32.inc
	  include \masm32\include\user32.inc
	  include \masm32\include\kernel32.inc
	  
	  includelib \masm32\lib\masm32.lib
	  includelib \masm32\lib\user32.lib
	  includelib \masm32\lib\kernel32.lib

.data
	birthday db "04041998",0
	format db "%d",0
.data?
	buffer db 64 dup(?)
	mainStr db ?
;визначаю потрібні константи, які присутні в лістингу
.const 
	A db 4
	A_ db -4
	A1 dw 4
	A1_ dw -4
	B1 dw 404
	B1_ dw -404
	A2 dd 4
	A2_ dd -4
	B2 dd 404
	B2_ dd -404
	C2 dd 4041998
	C2_ dd -4041998
	A3 dq 04
	A3_ dq -04
	B3 dq 404
	B3_ dq -404
	C3 dq 4041998
	C3_ dq -4041998
	D1 dd 0.0007
	D1_ dd -0.007
	E dq 0.075
	E_ dq -0.075
	F1 dt 760.059
	F1_ dt -760.059
	D dq 0.0007
	F dq 760.059
.code
start:
      ;виклик вікна, перетворення та виведення даних
	invoke wsprintf,addr buffer, addr format, A
	invoke szCatStr, offset mainStr, offset buffer
	invoke szCatStr, offset mainStr, offset chr$(10)
	invoke wsprintf,addr buffer, addr format, B1
	invoke szCatStr, offset mainStr, offset buffer
	invoke szCatStr, offset mainStr, offset chr$(10)
	invoke wsprintf,addr buffer, addr format, C2
	invoke szCatStr, offset mainStr, offset buffer
	invoke szCatStr, offset mainStr, offset chr$(10)
	invoke FloatToStr2, D, offset buffer
	invoke szCatStr, offset mainStr, offset buffer
	invoke szCatStr, offset mainStr, offset chr$(10)
	invoke FloatToStr2, E, offset buffer
	invoke szCatStr, offset mainStr, offset buffer
	invoke szCatStr, offset mainStr, offset chr$(10)
	invoke FloatToStr2, F, offset buffer
	invoke szCatStr, offset mainStr, offset buffer
	invoke MessageBoxA, 0, offset mainStr, offset chr$("Sulyma-2  04.04.1998"), 0
	invoke ExitProcess, 0
end start