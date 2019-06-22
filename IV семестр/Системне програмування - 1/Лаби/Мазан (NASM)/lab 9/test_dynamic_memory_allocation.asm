;sys_exit equ 1
%include "io.inc"
struc   mystruct
	a:	resw	1
	b:	resd	1
	c:	resb	1
	d:	resd	1
	e:	resb	6
endstruc

extern malloc

struct_size equ $ - mystruct

section .bss
    pStru:	resd	1         ; This is a pointer for a dynamically created structure

section .data

aData:  dw      0

struct:
    istruc mystruct
        at a, dw        -1
        at b, dd        0x12345678
        at c, db        ' '
        at d, dd        23
        at e, db        'Gary', 0
    iend

mysize: dd     $ - struct
msg:    db     'Size of struct is %d', 10, 0
msg1:   db     'struct + b = %d', 10, 0
msg2:   db     'pStru + b = %d', 10, 0

zData:  dw     0

section .text

global CMAIN

CMAIN:
    mov ebp, esp
    mov eax, 2
    
    mov     eax, 17                    ; size of the structure
    push    eax
    call    malloc                     ; get the memory allocated
    mov     dword [ pStru ], eax       ; store the address in the pointer
    add     esp, 4
    
    mov     eax, 7                    
    mov     dword [ struct + b ], eax  ; move a value into the structure
    push    dword [ struct + d ]       ; get the value
    push    dword msg1
    call    printf                     ; print it out
    add     esp, 8
    
    ;ret
    