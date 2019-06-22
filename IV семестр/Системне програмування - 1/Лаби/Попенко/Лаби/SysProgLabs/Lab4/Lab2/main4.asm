.586
.model flat, stdcall
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

include module.inc
include longop.inc

.data
Caption1 db "A+B",0
Caption2 db "A2+B",0
Caption3 db "A2-B",0
Text db 832 dup(0)	
Text2 db 288 dup(0)
ValueA db 832 dup(0)
ValueA2 db 832 dup(0)
ValueB db 832 dup(0)
SubA db 288 dup(0)
SubB db 288 dup(0)
SubResult db 288 dup(0)
Result db 832 dup(0)
.code
main:
mov eax, 80010001h	
mov ecx, 0
setValueA:
mov dword ptr [ValueA + ecx], eax
add  eax, 00010000h
add ecx, 4
cmp ecx, 104
jl setValueA

mov eax, 80000001h
mov ecx, 0
setValueB:
mov dword ptr [ValueB + ecx], eax
add ecx, 4
cmp ecx, 104
jl setValueB
push offset ValueA
push offset ValueB
push offset Result
call Add_Long

push offset Text
push offset Result
push 832
call StrHex_MY
invoke MessageBoxA, 0, ADDR Text, ADDR Caption1, 0

mov eax, 00000018h	
mov ecx, 0
setValueA2:
mov dword ptr [ValueA2 + ecx], eax
add  eax, 00000001h
add ecx, 4
cmp ecx, 104
jl setValueA2

push offset ValueA2
push offset ValueB
push offset Result
call Add_Long

push offset Text
push offset Result
push 832
call StrHex_MY
invoke MessageBoxA, 0, ADDR Text, ADDR Caption2, 0

mov eax, 00000018h	
mov ecx, 0
setSubB:
mov dword ptr [SubB + ecx], eax
add  eax, 00000001h
add ecx, 4
cmp ecx, 36
jl setSubB

push offset SubA
push offset SubB
push offset SubResult
call Sub_Long

push offset Text2
push offset SubResult
push 288
call StrHex_MY
invoke MessageBoxA, 0, ADDR Text2, ADDR Caption3, 0

invoke ExitProcess, 0
end main

