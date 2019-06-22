%include "io.inc"

%macro PRINT_LONG 2                                 ; length, dd long_number
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
    temp : resd 10
    result : resd 10
section .text
    n dd 10
    i dd 1
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    
    mov ebx, 1
    mov dword [result + 4*9], 1
    mov esi, 9
    @start:
    
    @cycle:
        mov eax, dword [result + 4*esi]
        mul ebx
        ;dec esi
        add dword [temp + 4*esi], eax
        add dword [temp + 4*esi - 4], edx
        dec esi
        cmp esi, 0
        jge @cycle
    mov esi, 9
    @sw:
        mov edi, dword [temp + 4*esi]
        mov dword [result + 4*esi], edi
        mov dword [temp + 4*esi], 0
        dec esi
        cmp esi, 0
        jge @sw
    
    add ebx, 1
    mov esi, 9
    cmp ebx, 30
    jle @start
    NEWLINE
    NEWLINE
    PRINT_LONG 10, result
    ret
    
    ;@factorial:
    
    ;@mulCycle:                                      ; temp = result*i
    ;    mov eax, dword [result + 4*esi]
    ;    mul ebx
    ;    ;dec esi
    ;    add dword [temp + 4*esi - 4], edx
    ;    add dword [temp + 4*esi], eax
    ;    cmp esi, 0
    ;    jge @mulCycle
    ;mov esi, 9
    ;@swap:                                          ; result = temp
    ;    mov edi, dword [temp + 4*esi]
    ;    mov dword [result + 4*esi], edi
    ;    mov dword [temp + 4*esi], 0
    ;    dec esi
    ;    cmp esi, 0
    ;    jge @swap
    ;dec ebx
    ;;PRINT_LONG 10, result
    ;NEWLINE
    ;cmp ebx, 0
    ;jnz @factorial
    
    
    ret