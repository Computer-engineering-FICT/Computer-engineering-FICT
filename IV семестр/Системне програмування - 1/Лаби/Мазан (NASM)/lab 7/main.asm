%include "io.inc"
%include "functions.asm"
%include "longop.asm"

section .bss
    ; my function
    result_buffer     : resd 10
    result_string     : resb 10
    
    ;factorial
    factorial         : resd 9
    buffer            : resd 9
    factorial_byte    : resb 36
    text_buffer       : resb 100
    
section .data
    inscription db "Лабораторна робота №7. Виконав Мазан Ян, група ІВ-71", 0
    inscription0 db "Моя функція: y = 5/(x+1) * 2^m. Результат обчислень (hex): ", 0
    inscription1 db "n = 48", 0
    inscription2 db "n! (hex) = ", 0
    inscription3 db "n! (dec) = ", 0
    
    var dd 1
    
    x dd 1
    m db 3
    
section .text
global CMAIN
CMAIN:

    PRINT_STRING inscription
    NEWLINE
    NEWLINE
    
    push x
    push m
    push result_buffer
    call MyFunction
    
    PRINT_STRING inscription0
    PRINT_HEX 4, result_buffer
    NEWLINE
    
    
    push result_buffer
    push result_string
    push 1
    call StrDec
    
    PRINT_STRING "Результат обчислень (dec): "
    PRINT_REVERSED_STRING 10, result_string
    NEWLINE
    NEWLINE
    
    mov dword [factorial + 8*4], 1
    mov ebx, 1
    @factorial:
        push 9
        push factorial
        push dword [var]
        push buffer
        call MulFactorial
        ;add esp, 16
        mov eax, dword [var]
        inc eax
        mov dword [var], eax
        cmp eax, 48
        jle @factorial
    
    ; converting dword factorial into byte factorial
    mov esi, 0
    @convertFactorialCycle:
        mov eax, dword [factorial + esi*4]
        mov byte [factorial_byte + esi*4 + 3], al
        shr eax, 8
        mov byte [factorial_byte + esi*4 + 2], al
        shr eax, 8
        mov byte [factorial_byte + esi*4 + 1], al
        shr eax, 8
        mov byte [factorial_byte + esi*4], al
        ;mov dword [factorial_byte + esi*4], ebx
        inc esi
        cmp esi, 9
        jl @convertFactorialCycle
    
    NEWLINE
    PRINT_STRING inscription1
    NEWLINE
    PRINT_STRING inscription2
    PRINT_LONG 9, factorial
    NEWLINE
    NEWLINE
    push factorial_byte
    push text_buffer
    push 36
    call StrDec
    
    PRINT_STRING inscription3
    PRINT_REVERSED_STRING 100, text_buffer
