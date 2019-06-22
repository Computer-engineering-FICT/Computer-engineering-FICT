%include "io.inc"
%include "MACRO_LONG.asm"
%include "longop.asm"

section .bss
    elderOnesCounter : resd 2
    numberToProcess  : resd 64
    
    
    
section .data
    inscription db "Лабораторна робота №6. Виконав Мазан Ян, група ІВ-71", 13, 13, 0
    numberInscription db "Число, у якому порахуємо кількість старших одиниць: ", 0
    resultInscription db "Кількість старших одиниць у двійковому коді: ", 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING inscription
    NEWLINE
    
    mov ecx, 64
    mov edx, 0
    dec ecx
    mov bl, 0b11111111
    @initLoop:
        mov byte [numberToProcess + edx], bl
        inc edx
        dec bl
        dec ecx
        cmp ecx, 0
        jge @initLoop
    
    PRINT_STRING numberInscription
    PRINT_BYTES_HEX 64, numberToProcess
    NEWLINE
    
    push 64
    push numberToProcess
    push elderOnesCounter
    call ElderOnesCount
    NEWLINE
    PRINT_STRING resultInscription
    PRINT_UDEC 2, elderOnesCounter
    ret