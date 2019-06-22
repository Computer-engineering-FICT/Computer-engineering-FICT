%macro PRINT_BYTES_HEX 2                 ; length, byte long_number
    mov ebp, %1
    mov ecx, 0
    %%print:
        dec ebp
        ;mov dl, byte [%2 + ecx]
        ;clc
        ;sbb dl, 0x0f
        ;cmp dl, 0
        ;jle %%elderDigitZero
        ;PRINT_HEX 1, [%2 + ecx]
        ;PRINT_STRING " "
        ;jmp %%continue
        ;%%elderDigitZero:
        ;   PRINT_HEX 1, 0
           PRINT_HEX 1, [%2 + ecx]
           PRINT_STRING " "
        ;%%continue:
            inc ecx
            cmp ebp, 0
            jnz %%print    
%endmacro

%macro PRINT_DWORD_HEX 2                 ; length, dword long_number
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

%macro shl_1bit_LONG 2
    push %1
    push %2
    call SHL_1bit_LONG
%endmacro