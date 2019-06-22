section .bss
    i : resd 1
    j : resd 1

section .text
global shl_1bit_LONG
global mulN_x_32
global mulN_x_N
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
    ret 16

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
    ret 16

MulN_x_32:                                  ; size, A, B 32 bit, res
    push ebp
    mov ebp, esp
    
    mov esi, dword [ebp + 20]               ; size
    mov edi, dword [ebp + 16]               ; A
    mov ebx, dword [ebp + 12]               ; B 32 bit
    mov ecx, dword [ebp + 8]                ; res
    dec esi
    
    @mulN_x_32:
        mov eax, dword [edi + 4*esi]
        mul dword [ebx]
        add dword [ecx + 4*esi + 4], eax
        add dword [ecx + 4*esi], edx
        
        dec esi
        cmp esi, 0
        jge @mulN_x_32
    leave
    ret 16

MulN_x_N:                                   ; size, A, B, res
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
    ret 16
    
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

SHL_1bit_LONG:                         ; array size, array
    push ebp
    mov ebp, esp
    
    mov eax, dword [ebp + 12]          ; size
    mov ebx, dword [ebp + 8]           ; array
    
    and eax, 0xff
    
    xor dl, dl
    clc
    @last_byte_shift:                  ; shifting last byte without adding anything
        mov cl, byte [ebx + eax - 1]
        shl cl, 1
        mov dl, 0
        adc dl, 0
        mov byte [ebx + eax - 1], cl
        dec eax                        ; make pointer on the end of array
    @shiftCycle:
        mov cl, byte [ebx + eax - 1]
        shl cl, 1
        pushf
        mov byte [ebx + eax - 1], cl
        add byte [ebx + eax - 1], dl
        popf
        mov dl, 0
        adc dl, 0
        dec eax
        
        cmp eax, 0
        jnz @shiftCycle
    ;xor cl, cl
    leave
    ret 8

SHL_Nbit_LONG:                  ; size, array, shifts number
    push ebp
    mov ebp, esp
    
    mov eax, dword [ebp + 16]   ; array size
    mov ebx, dword [ebp + 12]   ; array
    mov edx, dword [ebp + 8]    ; shifts number
    
    @longShiftCycle:
        push edx
        mov eax, dword [ebp + 16]   ; array size
        mov ebx, dword [ebp + 12]   ; array

        push eax
        push ebx
        call SHL_1bit_LONG
        pop edx
        dec edx
        cmp edx, 0
        jnz @longShiftCycle
    leave
    ret 12

ElderOnesCount:                 ; array's size, array, counter's output
    push ebp
    mov ebp, esp
    
    mov eax, dword [ebp + 16]   ; size
    mov ebx, dword [ebp + 12]   ; array
    mov edi, dword [ebp + 8]    ; counter's output
    
    @countingLoop:
        mov cl, byte [ebx]
        and cl, 0x80
        cmp cl, 0
        je @endp
        @incCounter:
            inc dword [edi]
        @shiftInCounterCycle:
            mov eax, dword [ebp + 16]   ; array size
            mov ebx, dword [ebp + 12]   ; array
            push eax
            push ebx
            call SHL_1bit_LONG
            jmp @countingLoop
    @endp:
        leave
        ret 12