.586
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\windows.inc
include \masm32\modules\module.inc
include \masm32\modules\longop.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib


.data
Valueb1 db 31
Captionb1 db "A+B (1 variant)",0
Captionb2 db "A+B (2 variant)",0
Captionb3 db "A-B ",0
TextBuf db 92 dup(?)
TextBuf1 db 48 dup(?)

ValueA dd 92 dup(?) 
ValueB dd 92 dup(?) 
ValueA1 dd 48 dup(?)
ValueB1 dd 48 dup(?)

Result dd 92 dup(0) 
Result1 dd 48 dup(0)


.code
start:

;À+B 1
mov eax , 80010001h
mov esi ,0
cycleAB1:	
mov DWord ptr[ValueA+esi], eax
mov DWord ptr[ValueB+esi], 80000001h
add eax , 10000h
add esi,4
cmp esi,92
jb cycleAB1
push offset ValueA
push offset ValueB
push offset Result
call Add_128_LONGOP
push offset TextBuf 
push offset Result 
push 736
call StrHex_MY 
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Captionb1,0

;À+B 2
mov eax , 15h
mov esi ,0
cycleAB2:	
mov DWord ptr[ValueA+esi], eax
mov DWord ptr[ValueB+esi], 00000001h
add eax , 1h
add esi,4
cmp esi,92
jb cycleAB2
push offset ValueA
push offset ValueB
push offset Result
call Add_128_LONGOP
push offset TextBuf 
push offset Result 
push 736
call StrHex_MY 
invoke MessageBoxA, 0, ADDR TextBuf, ADDR Captionb2,0

;À-B 
mov eax , 15h
mov esi ,0
cycleAB:	
mov DWord ptr[ValueA1+esi], 0
mov DWord ptr[ValueB1+esi], eax
add eax , 1h
add esi,4
cmp esi,48
jb cycleAB

push offset ValueA1
push offset ValueB1
push offset Result1
call Sub_128_LONGOP
push offset TextBuf1 
push offset Result1 
push 384
call StrHex_MY 
invoke MessageBoxA, 0, ADDR TextBuf1, ADDR Captionb3,0

invoke ExitProcess,0
end start
