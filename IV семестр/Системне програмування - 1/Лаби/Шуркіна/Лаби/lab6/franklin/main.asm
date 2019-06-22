.586
.model flat, stdcall
include /masm32/include/kernel32.inc
include /masm32/include/user32.inc
include longpop.inc
include /masm32/modules/module.inc
includelib /masm32/lib/kernel32.lib
includelib /masm32/lib/user32.lib
.data
Caption db "Lab Work ¹6",0
Number dd 37 dup(0h)
result dd 0h
Text db ?
Txt db 1184 dup (0)
.code
start:

mov dword ptr[Number+144], 11110011b
mov dword ptr[Number+145], 00110011b
mov dword ptr[Number+146], 11111111b
mov dword ptr[Number+147], 10101010b

push offset Txt
push offset Number
push 1184
call StrHex_MY

invoke MessageBoxA, 0 , ADDR Txt, ADDR Caption,0

push offset Number
push offset result
call Count

push offset Text
push offset result
push 16
call StrHex_MY

invoke MessageBoxA, 0 , ADDR Text, ADDR Caption,0

invoke ExitProcess, 0
end start