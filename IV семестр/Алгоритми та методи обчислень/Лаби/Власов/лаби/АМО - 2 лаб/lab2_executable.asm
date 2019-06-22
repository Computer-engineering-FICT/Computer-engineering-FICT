.586
.model flat, stdcall
option casemap : none; розрізнювати великі та маленькі букви


include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib


.data
Caption db "CPUID 0 Vendor string", 0
Text0 db "Vendor:", 10, 13, "xxxxxxxxxxxx", 10, 13, "Max cpuid command: xxxxxxxx", 0
Caption0 db "Результат CPUID 0", 0
Caption1 db "Результат CPUID 1", 0
Text2 db 'EAX=xxxxxxxx', 13, 10,
'EBX=xxxxxxxx', 13, 10,
'ECX=xxxxxxxx', 13, 10,
'EDX=xxxxxxxx', 0
Text3 db "xxxxxxxxxxxxxxxx",10,13, ;"xxxxxxxxxxxxxxxx", 10, 13,
"xxxxxxxxxxxxxxxx", 10, 13,
"xxxxxxxxxxxxxxxx", 0
Caption2 db "Результат CPUID 2", 0
Caption3 db "Результат CPUID 80000000h", 0
Caption4 db "Результат CPUID 80000001h", 0
Caption5 db "Результат CPUID 80000002h", 0
Caption6 db "Результат CPUID 80000003h", 0
Caption7 db "Результат CPUID 80000004h", 0
Caption8 db "Результат CPUID 80000005h", 0
Caption9 db "Результат CPUID 80000008h", 0
Caption10 db "Результат CPUID String info", 0
res dd 256 dup(0)


.code

DwordToStrHex proc
push ebp
mov ebp, esp
mov ebx, [ebp + 8]; другий параметр
mov edx, [ebp + 12]; перший параметр
xor eax, eax 
mov edi, 7
@next:
mov al, dl
and al, 0Fh; виділяємо одну шістнадцяткову цифру
add ax, 48; так можна тільки для цифр 0 - 9
cmp ax, 58
jl @store
add ax, 7; для цифр A, B, C, D, E, F
@store:
mov[ebx + edi], al
shr edx, 4
dec edi
cmp edi, 0
jge @next
pop ebp
ret 8
DwordToStrHex endp

main :
mov eax, 0
cpuid
 mov dword ptr[res], eax
 mov dword ptr[res + 4], ebx
 mov dword ptr[res + 8], edx
 mov dword ptr[res + 12], ecx
 mov dword ptr[Text0 + 9], ebx
 mov dword ptr[Text0 + 13], edx
 mov dword ptr[Text0 + 17], ecx
 push [res] 
 push offset[Text0 + 42] 
 call DwordToStrHex

 invoke MessageBoxA, 0, ADDR Text0, ADDR Caption, 0
 
 mov eax, 0
 cpuid
 mov dword ptr[res + 16], eax
 mov dword ptr[res + 20], ebx
 mov dword ptr[res + 24], ecx
 mov dword ptr[res + 28], edx

 push[res + 16]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 20]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 24]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 28]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption0, 0

 mov eax, 1
 cpuid
 mov dword ptr[res + 16], eax
 mov dword ptr[res + 20], ebx
 mov dword ptr[res + 24], ecx
 mov dword ptr[res + 28], edx

 push[res + 16]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 20]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 24]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 28]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption1, 0

 mov eax, 2
 cpuid
 mov dword ptr[res + 32], eax
 mov dword ptr[res + 36], ebx
 mov dword ptr[res + 40], ecx
 mov dword ptr[res + 44], edx

 push[res + 32]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 36]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 40]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 44]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption2, 0
 
 mov eax, 080000000h
 cpuid
 mov dword ptr[res + 48], eax
 mov dword ptr[res + 52], ebx
 mov dword ptr[res + 56], ecx
 mov dword ptr[res + 60], edx

 push[res + 48]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 52]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 56]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 60]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption3, 0

 mov eax, 080000001h
 cpuid
 mov dword ptr[res + 64], eax
 mov dword ptr[res + 68], ebx
 mov dword ptr[res + 72], ecx
 mov dword ptr[res + 76], edx

 push[res + 64]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 68]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 72]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 76]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption4, 0

 mov eax, 080000002h
 cpuid
 mov dword ptr[res + 80], eax
 mov dword ptr[res + 84], ebx
 mov dword ptr[res + 88], ecx
 mov dword ptr[res + 92], edx

 mov dword ptr[Text3], eax
 mov dword ptr[Text3 + 4], ebx
 mov dword ptr[Text3 + 8], ecx
 mov dword ptr[Text3 + 12], edx


 push[res + 80]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 84]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 88]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 92]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption5, 0
 
 mov eax, 080000003h
 cpuid
 mov dword ptr[res + 96], eax
 mov dword ptr[res + 100], ebx
 mov dword ptr[res + 104], ecx
 mov dword ptr[res + 108], edx

 mov dword ptr[Text3 + 18], eax
 mov dword ptr[Text3 + 22], ebx
 mov dword ptr[Text3 + 26], ecx
 mov dword ptr[Text3 + 30], edx

 push[res + 96]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 100]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 104]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 108]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption6, 0

 mov eax, 080000004h
 cpuid
 mov dword ptr[res + 112], eax
 mov dword ptr[res + 116], ebx
 mov dword ptr[res + 120], ecx
 mov dword ptr[res + 124], edx

 mov dword ptr[Text3 + 36], eax
 mov dword ptr[Text3 + 40], ebx
 mov dword ptr[Text3 + 44], ecx
 mov dword ptr[Text3 + 48], edx

 push[res + 112]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 116]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 120]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 124]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption7, 0

 mov eax, 080000005h
 cpuid
 mov dword ptr[res + 128], eax
 mov dword ptr[res + 132], ebx
 mov dword ptr[res + 136], ecx
 mov dword ptr[res + 140], edx

 push[res + 128]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 132]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 136]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 140]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption8, 0

 mov eax, 080000008h
 cpuid
 mov dword ptr[res + 144], eax
 mov dword ptr[res + 148], ebx
 mov dword ptr[res + 152], ecx
 mov dword ptr[res + 156], edx

 push[res + 144]
 push offset[Text2 + 4]
 call DwordToStrHex

 push[res + 148]
 push offset[Text2 + 18]
 call DwordToStrHex

 push[res + 152]
 push offset[Text2 + 32]
 call DwordToStrHex

 push[res + 156]
 push offset[Text2 + 46]
 call DwordToStrHex
 invoke MessageBoxA, 0, ADDR Text2, ADDR Caption9, 0
 invoke MessageBoxA, 0, ADDR Text3, ADDR Caption10, 0
invoke ExitProcess, 0
end main
