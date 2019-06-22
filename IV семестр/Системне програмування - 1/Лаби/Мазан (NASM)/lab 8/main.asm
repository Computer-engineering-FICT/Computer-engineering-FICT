%include "io.inc"
%include "functions.asm"

section .bss
    res : resd 1
    text_res : resb 10
    text_res2 : resb 20
section .data
    inscription db "Лабораторна робота №8. Виконав Мазан Ян, група ІВ-71", 13, 13, 0
    inscription1 db "Результат обчислення функції у стандарті IEE-754: ", 0
    inscription2 db "Результат обчислення функції у десятковому форматі: ", 0
    inscription3 db "Тестове конвертування числа test_convert: ", 0
    a dd 0.14, 2.0, 1.0, 1.0, 2.1
    x dd 2.0
    
    test_convert dd 0xff800000
    
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    
    PRINT_STRING inscription
    
    push 5
    push a
    push x
    push res
    call myFunction         ; result = 49.74
    
    
    PRINT_STRING inscription1
    PRINT_HEX 4, res
    NEWLINE
    
    push res
    push text_res
    call floatToDec
    
    NEWLINE
    PRINT_STRING inscription2
    PRINT_STRING text_res
    NEWLINE
    
    push test_convert
    push text_res2
    call floatToDec
    
    NEWLINE
    PRINT_STRING inscription3
    PRINT_STRING text_res2
    
    ret



