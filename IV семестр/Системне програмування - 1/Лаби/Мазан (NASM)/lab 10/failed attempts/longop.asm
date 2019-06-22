section .bss
    i : resd 1
    j : resd 1

section .text
global mulN_x_N
;global addLongop
global subLongop
.globl addLongop
.type addLongop, %function

addLongop:
    push ebp
    mov ebp, esp
    mov esi, dword [ebp+20]             ; length
    mov edx, dword [ebp+16]             ; A
    mov ebx, dword [ebp+12]             ; B
    mov ecx, dword [ebp+8]              ; C
    
    clc
    pushf
    dec esi
    @addCycle:
        popf
        mov eax, dword [edx + esi*4]
        adc eax, dword [ebx + esi*4]
        pushf
        mov dword [ecx+esi*4+4], eax
        dec esi
        cmp esi, 0
        jge @addCycle
        xor eax, eax
        popf                            ; забираємо наш прапор переносу зі стеку для того, щоби при наступному додаванні його використати
        adc eax, 0                      ; запис прапору переносу в eax
        mov dword [ecx], eax
    leave
    ret					; add esp, 16

subLongop:
    push ebp
    mov ebp, esp
    mov esi, dword [ebp+20]             ; length
    mov edx, dword [ebp+16]             ; A
    mov ebx, dword [ebp+12]             ; B
    mov ecx, dword [ebp+8]              ; C
    
    clc
    pushf
    dec esi
    @subCycle:
        popf
        mov eax, dword [edx + esi*4]
        sbb eax, dword [ebx + esi*4]
        pushf
        mov dword [ecx+esi*4], eax
        dec esi
        cmp esi, 0
        jge @subCycle
        popf
    leave
    ret					; add esp, 16

mulN_x_N:                                   ; size, A, B, res
    push ebp
    mov ebp, esp
    
    mov esi, dword [ebp + 20]               ; size
    dec esi                                 ; Making pointer to point on start of
    push esi                                ; save pointer on the last element
    mov dword [i], esi                      ; i - iterates over A's dwords
    mov dword [j], esi                      ; j - iterates over B's dwords
                                            ; base pointer: edi = i + j
    mov esi, dword [ebp + 16]               ; A
    mov ebx, dword [ebp + 12]               ; B
    mov edi, dword [ebp + 8]                ; result
    
    @outerCycle:
        pop dword [j]
        push dword [j]
        @innerCycle:
            mov ecx, dword [i]
            mov eax, dword [esi + 4*ecx]    ; eax = dword [A + i]
            mov ecx, dword [j]
            mul dword [ebx + 4*ecx]         ; eax *= dword [B + j]
            add ecx, dword [i]
            add dword [edi + 4*ecx + 4], eax; res = dword [edi + i + j + 4], eax
            adc dword [edi + 4*ecx], edx    ; res = dword [edi + i + j], edx
            push ecx
            pushf
            @addcarryflag:                  ; spread carry flag over all other digit numbers
                popf
                adc dword [edi + 4*ecx - 4], 0
                pushf
                dec ecx
                cmp ecx, 0
                jge @addcarryflag
            popf
            pop ecx
            mov eax, dword [j]
            dec eax
            mov dword [j], eax
            cmp eax, 0
            jge @innerCycle
        mov eax, dword [i]
        dec eax
        mov dword [i], eax
        cmp eax, 0
        jge @outerCycle
    leave
    ret					; add esp, 16

