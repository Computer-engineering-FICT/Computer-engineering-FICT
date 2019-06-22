%include "io.inc"
%include "longop.asm"

;extern fopen
;extern fprintf

extern free
extern malloc


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


%macro CREATE_FILE 2      ; full file address, permissions
    mov  eax, 8
    mov  ebx, %1	  ; file name with full path
    mov  ecx, %2          ; move permissions
    int  0x80             ; call kernel
    ;mov dword [file_pointer], eax
%endmacro

%macro DYNAMIC_END 1 ; pointer to allocate memory in, allocated memory size (bytes)
    mov eax, 45         ; system call brk
    mov ebx, 0x0
    int 0x80
    mov [%1], eax
    
%endmacro
; Using brk() system call for dynamic memory allocations
%macro DYNAMIC_ALLOCATION 2 ; pointer to allocate memory in, allocated memory size (bytes)
    mov eax, 45         ; system call brk
    mov ebx, [%1]
    add ebx, %2
    int 0x80
    mov [%1], eax
    
%endmacro

%macro DYNAMIC_ALLOCATION_FREE 1
    mov eax, 45
    mov ebx, [%1]
    int 0x80
    mov [%1], eax
%endmacro

section .bss
    array : resd 4
    ;res_array : resd 4
    text_buffer : resb 10
    pointer : resd 1
    pointer_end : resd 1
    buffer_pointer : resd 1
    buffer_pointer_end : resd 1
    file_pointer : resd 1
    
section .data
    file_name db "/home/yan/Desktop/4 семестр/Assembly/lab 9/lab9_file.txt", 0
    content db "is the best character of all times and nations!"
    content_length equ $-content
    factorial_to_count dd 10
    number dd 0xfadfffff, 0xffffffff
section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    
    DYNAMIC_END pointer
    mov eax, dword [pointer]
    mov dword [pointer_end], eax
    DYNAMIC_ALLOCATION pointer_end, 16
    mov eax, dword [pointer_end]
    mov dword [buffer_pointer], eax
    mov dword [buffer_pointer_end], eax
    DYNAMIC_ALLOCATION buffer_pointer_end, 16
    
    mov dword [pointer], 0
    mov dword [pointer + 4], 0
    mov dword [pointer + 2*4], 0
    mov dword [pointer + 3*4], 1
    
    ;mov dword [buffer_pointer], 0
    ;mov dword [buffer_pointer + 4], 0
    ;mov dword [buffer_pointer + 2*4], 0
    ;mov dword [buffer_pointer + 3*4], 0
    NEWLINE
    PRINT_LONG 10, buffer_pointer
    NEWLINE
    PRINT_LONG 40, pointer
    NEWLINE
    CREATE_FILE file_name, 0777
    mov dword [file_pointer], eax
    
    mov edx, content_length
    mov esi, content
    mov edi, dword [file_pointer]
    mov eax, 4
    int 0x80
    
    mov eax, 6
    mov ebx, dword [file_pointer]
    
    mov eax, 4
    mov ebx, 1
    mov ecx, 0xa
    mov edx, 1
    int 0x80
    
    mov eax, 6
    mov ebx, dword [file_pointer]
    int 0x80
    ;mov  eax, 8
    ;mov  ebx, file_name
    ;mov  ecx, 0777        ; read, write and execute by all
    ;int  0x80             ; call kernel
    
    ;push permission
    ;push file_name
    ;call fopen
    ;add esp, 8
    
    ;push 1
    ;push content
    ;push file_buffer
    ;call fprintf
    ;add esp, 12
    
    ;push text_buffer
    ;push number
    ;push 2
    ;call StrHex_MY
    ;PRINT_STRING text_buffer
    ;NEWLINE
    
    @factorialCycle:
        ;inc dword [factorial_to_count]
        ;inc dword [factorial_to_count]
        push 4
        push pointer
        push factorial_to_count
        push buffer_pointer
        call MulN_x_32
        
    PRINT_LONG 1, buffer_pointer
    NEWLINE
    
    DYNAMIC_ALLOCATION_FREE pointer
    ;PRINT_LONG 40, pointer
    
    ;push pointer
    ;push 10
    ;call malloc
    ;add esp, 8
    ;PRINT_LONG 40, pointer
    
    ;push pointer
    ;call free
    ;add esp, 4
    
    ;push 4
    ;push factorial_to_count
    ;push array
    ;call Factorial
    
    ;PRINT_LONG 4, array
    
    ;mov
    ret

moveLongop: ; destination, original, size dwords
    push ebp
    mov ebp, esp
    
    mov ebx, dword [ebp + 16]   ; destination
    mov ecx, dword [ebp + 12]   ; original
    mov edx, dword [ebp + 8]    ; size
    dec edx
    
    @moveCycle:
        mov eax, dword [ecx + 4*edx]
        mov dword [ebx + 4*edx], eax
        mov dword [ecx + 4*edx], 0
        dec edx
        cmp edx, 0
        jge @moveCycle
    
    leave
    ret
    