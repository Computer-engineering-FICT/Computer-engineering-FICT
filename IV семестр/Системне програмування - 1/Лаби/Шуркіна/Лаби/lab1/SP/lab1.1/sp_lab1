.386
.model flat, stdcall
option casemap: none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\windows.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data
Caption db "Вітання", 0
Text db "З Днем Святого Валентина!",10, 13, "Анастасія Шуркіна",0

.code
start:
 invoke MessageBoxA, 0, ADDR Text, ADDR Caption, 0
 
 invoke ExitProcess, 0
end start