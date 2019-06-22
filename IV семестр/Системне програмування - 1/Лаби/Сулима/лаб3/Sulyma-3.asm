.586
.model flat, stdcall
option casemap: none

include E:/masm32/macros/macros.asm

include E:/masm32/include/masm32.inc
include E:/masm32/include/kernel32.inc
include E:/masm32/include/msvcrt.inc
 
includelib E:/masm32/lib/kernel32.lib
includelib E:/masm32/lib/msvcrt.lib
includelib E:/masm32/lib/masm32.lib

data segment
    information db "Sulyma",10, "IP-53", 10, "5318",10,0
data ends

.code
start:
print offset information
inkey
invoke ExitProcess, 0
end start