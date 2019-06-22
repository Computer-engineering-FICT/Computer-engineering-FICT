.586
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
option casemap :none
include \masm32\include\windows.inc
include module.inc
include Longop.inc


includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
.const
.data
TextBuf db 192 dup(?)
counter db ?
counter2 db ?
Caption db 'Result', 0
ValueA dd 80010001h, 80020001h, 80030001h, 80040001h, 80050002h
ValueA1 dd 1,0,0,0,0
Value dd 2
Result dd  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Result1 dd 1,0,0,0,0,0,0,0,0,0
Result2 dd 0,0,0,0,0,0,0,0,0,0

 

.code
start:
mov counter,62
cycle1:
push offset Result1
push offset Value
push offset Result2
call N32


push offset Result2
push offset Result1
call Copy

inc Value
dec counter
jnz cycle1




push offset TextBuf
push offset Result2
push 320
call StrHex_MY
invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION

xor eax,eax
push offset Result2
push offset Result2
push offset Result
call NN

push offset TextBuf
push offset Result
push 640
call StrHex_MY
invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION

invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION
invoke ExitProcess,0


end start