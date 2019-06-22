.586
.model flat, stdcall
include /masm32/include/kernel32.inc
include /masm32/include/user32.inc
includelib /masm32/lib/kernel32.lib
includelib /masm32/lib/user32.lib
include /masm32/modules/longpop.inc
include /masm32/modules/module.inc

.data
Caption db "Лабараторна робота №6",0
Number dd 14 dup(0h)
numOfZeros dd 0h
Text db 170 dup(?)
Txt db '0000 - кількість нулів'
.code
main:

mov dword ptr[Number+55], 11111b
push offset Text
push offset [Number]
push 448
call StrHex_MY

invoke MessageBoxA, 0 , ADDR Text, ADDR Caption,0

push offset [Number]
push offset [numOfZeros]
call zeros_longop

push offset Text
push offset [numOfZeros]
push 16
call StrHex_MY

mov eax, dword ptr[Text]
mov dword ptr[Txt], eax

invoke MessageBoxA, 0 , ADDR Txt, ADDR Caption,0
invoke ExitProcess, 0
end main