section .text
global addAnyDwordLength
global subAnyDwordLength

addAnyDwordLength:
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
    ret

subAnyDwordLength:
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
    ret