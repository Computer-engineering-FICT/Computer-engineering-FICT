%include "io.inc"

%macro PRINT_LONG 2                 ; length, dd long_number
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

%macro add352bit 3
    mov edi, 10
    clc
    pushf
    %%addCycle:
        popf
        mov eax, dword [%1+edi*4]
        adc eax, dword [%2+edi*4]
        pushf
        mov dword [%3+edi*4+4], eax
        dec edi
        cmp edi, 0
        jge %%addCycle
        xor eax, eax
        popf                        ; забираємо наш прапор переносу зі стеку для того, щоби при наступному додаванні його використати
        adc eax, 0                  ; запис прапору переносу в eax
        mov dword [%3], eax
%endmacro

%macro sub768bit 3
    mov edi, 10
    clc
    pushf
    %%subCycle:
        popf
        mov eax, dword [%1+edi*4]
        sbb eax, dword [%2+edi*4]
        pushf
        mov dword [%3+edi*4+4], eax
        dec edi
        cmp edi, 0
        jge %%subCycle
        xor eax, eax
        popf                        ; забираємо наш прапор переносу зі стеку для того, щоби при наступному додаванні його використати
        adc eax, 0                  ; запис прапору переносу в eax
        mov dword [%3], eax
%endmacro

section .bss
    addA1 : resd 11
    addB1 : resd 11
    res1  : resd 12

section .text
global CMAIN

CMAIN:
    nop
    mov ebp, esp                    ; for correct debugging
    mov edx, 0                      ; pointer
    mov eax, 80000001h
    @initAdd1:
        add eax, 10000h
        mov dword [addA1 + 4*edx], eax
        mov dword [addB1 + 4*edx], 80000001h
        inc edx
        cmp edx, 11
        jl @initAdd1
    PRINT_STRING "A1: "
    PRINT_LONG 11, addA1
    NEWLINE
    PRINT_STRING "B1: "
    PRINT_LONG 11, addB1
    NEWLINE
    sub768bit addA1, addB1, res1
    PRINT_LONG 12, res1
    xor eax, eax
    ret