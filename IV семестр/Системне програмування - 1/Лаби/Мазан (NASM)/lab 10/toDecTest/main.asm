%include "io.inc"

section .bss
    text_buffer : resb 20
    
    number : resd 100
    
    buf : resd 1
section .data
    y dd 0x00ffffff, 0x12345678, 0x87654321, 0x00000010
    

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    
    
    
    PRINT_STRING text_buffer
    
    ret

Div10_LONGOP:
    push ebp
    mov ebp, esp
    mov esi, [ebp+24] ; ділене
    mov eax, [ebp+20] ; дільник
    mov ebx, [ebp+16] ; розрядність діленого
    mov edi, [ebp+12] ; частка
    mov ecx, [ebp+8] ; остача
    mov dword [buf], eax
    shr ebx, 3
    dec ebx
    xor eax, eax
    @cycle:
        mov al, byte [esi + ebx]
        div byte [buf]
        mov byte [edi + ebx], al
        dec ebx
        cmp ebx, 0
        jge @cycle
    mov byte [ecx], ah
    mov esp, ebp
    pop ebp
    ret 20
    
StrDec:
    push ebp
    mov ebp, esp
    mov esi, [ebp+16] ; буфер тексту

    mov edi, [ebp+12] ; число
    mov ebx, [ebp+8] ; розрядність числа
    mov dword [Nbit], ebx
    shr ebx, 5 ; кількість 32-бітових елементів
    dec ebx
    mov ecx, ebx
    @copy:
    mov eax, dword [edi + 4*ecx]
    mov dword [number + 4*ecx], eax
    dec ecx
    cmp ecx, 0
    jge @copy
    @cycle2:
        push ebx
        push esi
        push edi
        
        push number
        push 10
        push Nbit
        push quotient
        push remainder
        call Div10_LONGOP
        
        pop edi
        pop esi
        pop ebx
        
        mov al, byte [remainder]
        add al, 48
        mov byte [esi], al
        inc counter
        mov ecx, counter
        @lshift:
            mov dl, byte [esi + ecx - 1]
            mov byte [esi + ecx - 1], 48
            mov byte [esi + ecx], dl
            dec ecx
            cmp ecx, 0
            jne @lshift
        mov ecx, ebx
        @swap:
            mov eax, dword [quotient + 4*ecx]
            mov dword [number + 4*ecx], eax
            mov dword [quotient + 4*ecx], 0
            dec ecx
            cmp ecx, 0
            jge @swap
        mov dword [remainder], 0
        mov ecx, ebx
        @check:
            mov eax, dword [number + 4*ecx]

            cmp eax, 0
            jne @cycle2
            dec ecx
            cmp ecx, 0
            jge @check

    mov esp, ebp
    pop ebp
    ret 12