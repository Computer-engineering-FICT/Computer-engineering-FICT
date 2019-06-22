.386 ;Директива, що визначає тип процесора

.model flat, stdcall ;Директива, що визначає модель пам'яті

option casemap: none ;розрізнювати великі та маленькі букви

include \masm32\include\windows.inc ;Іконка
 
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
; include для заголовочних файлів

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
; includelib для бібліотек

.data
  Caption db "Я програма на асемблері!", 0
  Text db "Здоровеньки були!", 13, 10, "Це програма Попенка Руслана Леонідовича" , 0

.code
start:
  invoke MessageBoxA, 0, ADDR Text, ADDR Caption, MB_ICONINFORMATION
  invoke ExitProcess, 0
end start
