
SECTION .text

;global test ;unix
.globl test
.type test, %function

test:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx , [ebp+8]
    mov eax, ebx
    sub eax, 2

    pop ebx
    mov esp, ebp
    pop ebp
    ret
