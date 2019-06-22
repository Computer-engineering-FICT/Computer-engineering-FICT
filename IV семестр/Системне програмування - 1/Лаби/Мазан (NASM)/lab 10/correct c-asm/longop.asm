section .bss
    i : resd 1
    j : resd 1
    partial_division : resd 1000
    convert_residue : resd 1
    less_than_ten : resd 1

section .text
global mulN_x_N
global addLongop
global subLongop
global strDec
global strHex

strHex:
    push ebp
    mov ebp,esp

    ;push eax
    push ebx
    ;push ecx
    ;push esi
    ;push edx

    mov ebx, dword [ebp+8]    ; result
    mov esi, dword [ebp+12]   ; number
    mov ecx, dword [ebp+16]   ; number's dwords number
    cmp ecx, 0
    jle @exitp
    shl ecx, 2                ; number's bytes number
    @cycleHex:
        mov dl, byte [esi+ecx-1] ; байт числа - це дві hex-цифри
        mov al, dl
        shr al, 4                ; старша цифра
        call HexSymbol_MY
        mov byte [ebx], al       ; записати в результат старшу цифру
        mov al, dl               ; молодша цифра
        call HexSymbol_MY
	mov byte [ebx+1], al     ; записати в результат молодшу цифру
	mov eax, ecx
	cmp eax, 4
	jle @next
	dec eax
	and eax, 3               ; проміжок розділює групи по вісім цифр
	cmp al, 0
	jne @next
	mov byte [ebx+2], 32     ; код символа проміжку
	inc ebx
    @next:
        add ebx, 2
        dec ecx
        jnz @cycleHex
	mov byte [ebx + ecx], 0 ; рядок закінчується нулем
    @exitp:
	;pop edx
	;pop esi
	;pop ecx
	pop ebx
	;pop eax
	leave
	ret

HexSymbol_MY:
    and al, 0Fh
    add al, 48                    ; так можна тільки для цифр 0-9
    cmp al, 58
    jl @exitp2
    add al, 7                     ; для цифр A,B,C,D,E,F
    @exitp2:
        ret

addLongop:
    push ebp
    mov ebp, esp

    ;push esi
    ;push edx
    push ebx
    ;push ecx

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
    
    ;pop ecx
    pop ebx
    ;pop edx
    ;pop esi

    leave
    ret					; add esp, 16

subLongop:
    push ebp
    mov ebp, esp

    ;push esi
    ;push edx
    push ebx
    ;push ecx
    ;push eax

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
    
    ;pop eax
    ;pop ecx
    pop ebx
    ;pop edx
    ;pop esi

    leave
    ret					; add esp, 16

mulN_x_N:                                   ; size, A, B, res
    push ebp
    mov ebp, esp
    
    ;push esi
    push ebx
    ;push edi
    ;push ecx
    ;push eax

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

    pop esi
    ;pop eax
    ;pop ecx
    ;pop edi
    pop ebx
    ;pop esi

    leave
    ret					; add esp, 16

div10:                              ; division by bits groups
    push ebp
    mov ebp, esp
    push eax
    
    mov edx, dword [ebp + 20]       ; size
    mov ebx, dword [ebp + 16]       ; divided number
    mov edi, dword [ebp + 12]       ; partial result
    
    
    ;push ebx                        ; ebx (bl) serves as divisor
    
    mov esi, 0
    ;and ax, 0xff
    mov edx, 0
    @division10Cycle:
        ;pop ebx
	mov ebx, dword [ebp + 16]
        mov eax, dword [ebx + 4*esi]
	add eax, edx
        ;push ebx
        mov ebx, 10
        div ebx
        mov dword [edi + 4*esi], eax
        
        inc esi
        cmp esi, dword [ebp + 20]
        jne @division10Cycle
    ;pop ebx
    ;mov edx, eax
    mov ecx, dword [ebp + 8]        ; residue
    mov dword [ecx], edx
    pop eax
    leave
    ret

strDec:
    push ebp
    mov ebp, esp
    
    push ebx

    mov eax, dword [ebp + 16]           ; number
    mov edi, dword [ebp + 12]           ; text buffer
    mov ecx, dword [ebp + 8]            ; number size

    mov esi, 0
    push esi
    @convertCycle:
	
        push ecx
        push dword [ebp + 16]
        push partial_division
        push convert_residue
        call div10
        add esp, 16
        
        mov edi, dword [ebp + 12]
        mov edx, dword [convert_residue]
        add edx, 48
        
        pop esi
        mov byte [edi + esi], dl
        inc esi
        push esi
        
        mov dword [less_than_ten], 1                          ; dword [less_than_ten] == 1 => partial_division < 10
        mov esi, dword [ebp + 8]
        dec esi
        cmp byte [partial_division + esi], 10
        jge @greaterThanTen
        
        @swapCycle1:
        mov dl, byte [partial_division + esi]
        mov ebx, dword [ebp + 16]
        mov byte [ebx + esi], dl
        dec esi
        @swapCycle:
            mov dl, byte [partial_division + esi]
            mov ebx, dword [ebp + 16]
            mov byte [ebx + esi], dl
            
            cmp dl, 0
            jz @zeroByte
            mov dword [less_than_ten], 0
            @zeroByte:
                dec esi
                cmp esi, 0
                jge @swapCycle
        
        mov edi, dword [ebp + 12]           ; text buffer
        mov ecx, dword [ebp + 8]            ; number size

        cmp dword [less_than_ten], 0
        jz @convertCycle
        jmp @end
        @greaterThanTen:
            mov dword [less_than_ten], 0
            jmp @swapCycle1
        
    @end:
        ;mov esi, dword [ebp + 8]
        ;dec esi
        ;mov al, byte [partial_division + esi]

        pop esi
        ;add al, 48
        ;mov byte [edi + esi], al
        
	pop ebx

        leave
        ret

