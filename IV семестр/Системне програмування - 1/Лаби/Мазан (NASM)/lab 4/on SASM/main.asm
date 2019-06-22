%include "io.inc"
%include "add_subtract.asm"

%macro PRINT_LONG 2                 ; length, dd long_number
    mov ebp, %1
    mov ecx, 0
    %%print:
        dec ebp
        PRINT_HEX 4, [%2 + ecx*4]
        ;cmp dword [%2 + ecx*4], 0h
        ;jne %%continue
        ;PRINT_STRING "00"
        ;%%continue:
        PRINT_STRING " "
        inc ecx
        cmp ebp, 0
        jnz %%print
        
%endmacro

section .bss
    addA1 : resd 11
    addB1 : resd 11
    res1  : resd 12
    
    addA2 : resd 11
    addB2 : resd 11
    res2  : resd 12
    
    subA : resd 24
    subB : resd 24
    res3 : resd 24
section .data
    inscription db "Лабораторну роботу виконав Мазан Ян, ІВ-71", 13, 13, 10, 0

section .text
global CMAIN
global testProc
global add352Bit
global subtract768Bit


CMAIN:
    nop
    mov ebp, esp                ; for correct debugging
    
    mov edx, 0                  ; pointer
    mov eax, 80000001h
    @initAdd1:
        add eax, 10000h
        mov dword [addA1 + 4*edx], eax
        mov dword [addB1 + 4*edx], 80000001h
        inc edx
        cmp edx, 11
        jl @initAdd1
    mov eax, 9h
    mov edx, 0                  ; pointer
    @initAdd2:
        mov dword [addA2 + 4*edx], eax
        mov dword [addB2 + 4*edx], 1h
        inc eax
        inc edx
        cmp edx, 11
        jl @initAdd2
    mov eax, 9h
    mov edx, 0 
    mov dword [subB], eax
    @initSub:
        mov dword [subA + 4*edx], 0
        mov dword [subB + 4*edx], eax
        inc eax
        inc edx
        cmp edx, 24
        jl @initSub
    PRINT_STRING inscription
    PRINT_STRING "A1: "
    PRINT_LONG 11, addA1
    NEWLINE
    PRINT_STRING "B1: "
    PRINT_LONG 11, addB1
    NEWLINE
    NEWLINE
    PRINT_STRING "A2: "
    PRINT_LONG 11, addA2
    NEWLINE
    PRINT_STRING "B2: "
    PRINT_LONG 11, addB2
    NEWLINE
    NEWLINE
    PRINT_STRING "subA: "
    PRINT_LONG 24, subA
    NEWLINE
    PRINT_STRING "subB: "
    PRINT_LONG 24, subB
    
    NEWLINE
    NEWLINE
    
    ;PRINT_LONG 12, res2
    push 11
    push addA1
    push addB1
    push res1
    call addAnyDwordLength
    add esp, 16
    PRINT_STRING "A1+B1: "
    PRINT_LONG 12, res1
    
    NEWLINE
    NEWLINE
    
    push 11
    push addA2
    push addB2
    push res2
    call addAnyDwordLength
    add esp, 16
    PRINT_STRING "A2+B2: "
    PRINT_LONG 12, res2
    
    NEWLINE
    NEWLINE
    
    push 24
    push subA
    push subB
    push res3
    call subAnyDwordLength
    add esp, 16
    PRINT_STRING "A-B: "
    PRINT_LONG 24, res3
    xor eax, eax
    ret
