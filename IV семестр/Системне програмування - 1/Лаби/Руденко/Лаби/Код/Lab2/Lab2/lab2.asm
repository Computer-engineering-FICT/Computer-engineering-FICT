.586
.model flat, stdcall
include D:\\masm32\include\kernel32.inc
include D:\\masm32\include\user32.inc
includelib D:\\masm32\lib\kernel32.lib
includelib D:\\masm32\lib\user32.lib
.data   
Caption db "Я програма на асемблері",0
Text db 'Здоровенькі були!',0
.code
main:
invoke MessageBoxA, 0, ADDR Text, ADDR Caption, 0
mov edx, 0
mov eax, 0
mov al, 256
mov dl, -1
invoke ExitProcess, 0
end main