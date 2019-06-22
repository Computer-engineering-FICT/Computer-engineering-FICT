%include "io.inc"

section .text
global MulN_x_32
global Factorial
global StrHex_MY

StrHex_MY:
    push ebp
    mov ebp,esp
    mov ecx, dword [ebp+8]    ; number's dwords number
    mov esi, dword [ebp+12]   ; number
    mov ebx, dword [ebp+16]   ; result
    cmp ecx, 0
    jle @exitp
    shl ecx, 2          ; number's bytes number
    ;dec ecx
    ;add ebx, ecx
    ;dec ebx
    @cycleHex:
        mov dl, byte [esi+ecx-1]   ; байт числа - це дві hex-цифри
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
        mov byte [ebx + ecx], 0        ; рядок закінчується нулем
    ;@revertDwords:
    ;    mov ecx, dword [ebp+8]    ; number's dwords number
    ;    shl ecx, 2
    ;    sbb ebx, ecx              ; make ebx pointing at the beginning of the number
    ;    mov ecx, dword [ebp+8]    ; number's dwords number
        
    ;    mov esi, 0
    ;    dec ecx
    ;    @revertingConvertCycle:
    ;        mov eax, dword [ebx + 4*ecx]    ; number's end
    ;        mov edx, dword [ebx + 4*esi]    ; number's start
    ;        mov dword [ebx + 4*ecx], edx
    ;        mov dword [ebx + 4*esi], eax
    ;        dec ecx
    ;        inc esi
    ;        cmp ecx, esi
    ;        jg @revertingConvertCycle
    @exitp:
	leave
	ret 12

HexSymbol_MY:
    and al, 0Fh
    add al, 48                    ; так можна тільки для цифр 0-9
    cmp al, 58
    jl @exitp2
    add al, 39                    ; для цифр A,B,C,D,E,F
    @exitp2:
        ret
  
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

Factorial:                                  ; size, number which factorial we must count, res
    push ebp
    mov ebp, esp
    
    mov esi, dword [ebp + 16]               ; size
    mov ebx, dword [ebp + 12]               ; factorial of number to count
    mov ecx, dword [ebp + 8]                ; res
    
    mov ebx, dword [ebx]
    dec esi                                 ; esi points at the end of array
    
    ;mov eax, esi                            ; create local buffer for temporary result
    ;mov edx, 4
    ;mul edx
    ;sub esp, eax                            ; sub esp, esi*4
    
    mov dword [ecx + 4*esi], 1              ; move initial number on the last position into ecx
    ;mov ebx, 1                              ; multiply on ebx on eact step
    
    mov edx, 0
    @mulCycle:
        mov eax, dword [ecx + 4*esi]
        mul ebx
        add dword [ecx + 4*esi], eax
        adc dword [ecx + 4*esi - 4], edx
        pushf
        mov edi, esi
        @addCarryFlag:
            popf
            adc dword [ecx + 4*edi - 4], 0
            pushf
            dec edi
            cmp edi, 0
            jge @addCarryFlag
        ;mov edx, dword [esp + 8]
        ;mov dword [ecx + 8], edx
    leave
    ret 12