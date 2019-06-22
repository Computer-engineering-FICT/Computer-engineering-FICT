%include "io.inc"
%include "multiply.asm"

%macro PRINT_LONG 2                 ; length, dword long_number
    mov ebp, %1
    mov ecx, 0
    %%print:
        dec ebp
        PRINT_HEX 4, [%2 + ecx*4]
        PRINT_STRING " "
        inc ecx
        cmp ebp, 0
        jnz %%print
        
%endmacro

section .bss
    buffer            : resd 9
    factorial         : resd 9
    factorial_squared : resd 18
    ;test0       : resd 9
    ;res_test0   : resd 18
    test1       : resd 51
    res_test1   : resd 102
    res_test2   : resd 52
    test3       : resd 51
    res_test3   : resd 102
section .data
    test21 dd 0xffffffff
    var dd 1
    inscription db "Лабораторна №5. Виконав Мазан Ян, група ІВ-71", 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
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
    ;mov esi, 0
    ;@initTest0:
    ;    mov dword [test0 + 4*esi], 0xffffffff
    ;    inc esi
    ;    cmp esi, 9
    ;    jl @initTest0
    mov esi, 0
    @initTest1:
        mov dword [test1 + 4*esi], 0xffffffff
        inc esi
        cmp esi, 51
        jl @initTest1
    @initTest3:
        mov dword [test3], 0xc0             ; 0b11000000
    
    PRINT_STRING inscription
    NEWLINE
    
    ;push 9
    ;push test0
    ;push test0
    ;push res_test0
    ;call MulN_x_N
    ;NEWLINE
    ;PRINT_STRING "test0: "
    ;PRINT_LONG 18, res_test0
    push 51
    push test1
    push test1
    push res_test1
    call MulN_x_N
    ;add esp, 16
    NEWLINE
    PRINT_STRING "test1: "
    PRINT_LONG 102, res_test1
    
    push 51
    push test1
    push test21
    push res_test2
    call MulN_x_32
    ;add esp, 16
    NEWLINE
    NEWLINE
    PRINT_STRING "test2: "
    PRINT_LONG 52, res_test2
    
    push 51
    push test1
    push test3
    push res_test3
    call MulN_x_N
    ;add esp, 16
    NEWLINE
    NEWLINE
    PRINT_STRING "test3: "
    PRINT_LONG 102, res_test3
    
    NEWLINE
    NEWLINE
    PRINT_STRING "n! = "
    PRINT_LONG 9, factorial
    
    push 9
    push factorial
    push factorial
    push factorial_squared
    call MulN_x_N
    ;add esp, 16
    NEWLINE
    PRINT_STRING "(n!)^2 = "
    PRINT_LONG 18, factorial_squared
    
    
    ret