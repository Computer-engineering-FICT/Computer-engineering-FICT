%macro  print 2
	
	mov eax, 4
      	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80

%endmacro


%include "toString.asm"
%include "print_hex.asm"
;%include "print_string.asm"

%macro toString 1
	mov eax, %1
	call showeaxd

%endmacro

section .bss
	;variable: resd 11

section .data
	;txt1 db "-1234", 0 
	;txt2 db "                         ", 0 
	;the_title db "String-Integer Algorithms Example", 0
	test_text db "Лабораторна №5.", 0xa, 0xd, "Виконав Мазан Ян, ІВ-71", 0xa, 0xd
	len_test_text equ $ - test_text
	iterations_num db 3
	;number dd 80010001h, 80020001h, 80030001h, 80040001h, 80050001h, 80060001h
	;number dw 1300
	;len_number equ $ - number
section .text
	global _start


	
_start:
	;print number, len_number
	
	;mov ebp, 3
	;@cycle:
	;	print test_text, len_test_text
	;	dec ebp
	;	cmp ebp, 1
	;jge @cycle
	
	;mov ebx, number
	;print ebx, 44

	;toString number
	jmp _end_program
	

_end_program:
	mov eax, 1
	mov ebx, 0
	int 0x80


