.386
.model flat, stdcall
option casemap :none

include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\gdi32.inc 

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\gdi32.lib 

.data
    Caption db "� �������� �� ��������!",0
    Text db "�����!",13,10, "���� ������� ����� ��, ��-71",0

.code
start:
    invoke MessageBoxA, 0, ADDR Text, ADDR Caption, 0
    invoke ExitProcess, 0
end start