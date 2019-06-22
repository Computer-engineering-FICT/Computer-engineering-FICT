%include "io.inc"

%macro PRINT_REVERSED_STRING 2
    mov esi, %1
    dec esi
    %%print:
        PRINT_CHAR [%2 + esi]
        dec esi
        cmp esi, 0
        jge %%print
%endmacro

%macro PRINT_BYTES_HEX 2                 ; length, byte long_number
    mov ebp, %1
    mov ecx, 0
    %%print:
        dec ebp
        PRINT_HEX 1, [%2 + ecx]
        PRINT_STRING " "
        inc ecx
        cmp ebp, 0
        jnz %%print    
%endmacro

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

section .text
global MulFactorial
global MyFunction

MyFunction:                     ; 5/(x+1) * 2^m
    push ebp
    mov ebp, esp
    
    mov edi, dword [ebp + 16]   ; x 32 bit
    mov ecx, dword [ebp + 12]   ; m 8 bit unsigned
    mov eax, dword [ebp + 8]    ; result
    
    push eax
    mov edi, dword [edi]        ; prevent x value to be changed outside 
    inc edi
    cmp edi, 0
    je @error
    mov eax, 5
    cdq
    idiv edi
    
    mov cl, byte [ecx]
    shl eax, cl
    
    mov ecx, eax
    pop eax
    mov dword [eax], ecx
    jmp @return
    @error:
        PRINT_STRING "Division by zero! Return from function"
        NEWLINE
    @return:
        leave
        ret 12

MulFactorial:                               ; size, A, B 32 bit, res
    push ebp
    mov ebp, esp
    
    mov esi, dword [ebp + 20]               ; A's size
    mov edi, dword [ebp + 16]               ; A
    mov ebx, dword [ebp + 12]               ; B 32 bit
    mov ecx, dword [ebp + 8]                ; buffer
    push ecx                                ; save ecx if was used before
    push esi
    dec esi
    @mulFact:
        mov eax, dword [edi + 4*esi]
        mul ebx
        add dword [ecx + 4*esi], eax
        add dword [ecx + 4*esi - 4], edx
        dec esi
        cmp esi, 0
        jnz @mulFact
    
    pop esi
    dec esi
    @swap:                                  ; mov result into A
        mov edx, dword [ecx + 4*esi]
        mov dword [ecx + 4*esi], 0
        mov dword [edi + esi*4], edx
        dec esi
        cmp esi, 0
        jnz @swap
    pop ecx
    leave
    ret 16

;Factorial                                   ; buffer size, 