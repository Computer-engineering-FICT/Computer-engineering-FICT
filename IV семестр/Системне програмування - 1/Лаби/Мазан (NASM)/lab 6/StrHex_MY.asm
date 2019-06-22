section .text
global StrHex_MY
global HexSymbol_MY

StrHex_MY:
    push ebp
    mov ebp,esp
    mov ecx, [ebp+8]                    ; кількість бітів числа
    cmp ecx, 0
    jle @exitp
    shr ecx, 3                          ; кількість байтів числа
    mov esi, [ebp+12]                   ; адреса числа
    mov ebx, [ebp+16]                   ; адреса буфера результату
    @cycle:
        mov dl, byte [esi+ecx-1]        ; байт числа - це дві hex-цифри
        mov al, dl
        shr al, 4                       ; старша цифра
        call HexSymbol_MY
        mov byte [ebx], al
        mov al, dl                      ; молодша цифра
        call HexSymbol_MY
        mov byte [ebx+1], al
        mov eax, ecx
        cmp eax, 4
        jle @next
        dec eax
        and eax, 3                      ; проміжок розділює групи по вісім цифр
        cmp al, 0
        jne @next
        mov byte [ebx+2], 32            ; код символа проміжку
        inc ebx

        @next:
            add ebx, 2
            dec ecx
            jnz @cycle
            mov byte [ebx], 0           ; рядок закінчується нулем
        
        @exitp:
            leave
            ret 12

;ця процедура обчислює код hex-цифри
;параметр - значення AL
;результат -> AL
HexSymbol_MY:
    and al, 0Fh
    add al, 48                          ; так можна тільки для цифр 0-9
    cmp al, 58
    jl @exitp2
    add al, 7                           ; для цифр A,B,C,D,E,F
    @exitp2:
        ret
