.586
.model flat, stdcall

option casemap :none

include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\windows.inc
include module.inc 
include longop.inc 
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.const
CaptionSub db 'ResultSub', 0
CaptionAdd db 'ResultAdd', 0

.data
TextAdd db 160 dup(?)
Text1Add db 160 dup(?)
TextSub db 160 dup(?)
ValueAAdd dd 80010001h, 80020001h, 80030001h, 80040001h, 80050001h, 80060001h, 80070001h, 80080001h, 80090001h
ValueBAdd dd 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h, 80000001h
ValueA1Add dd 00070000h, 00080000h, 00090000h, 00100000h, 00110000h, 00120000h, 00130000h, 00140000h, 00150000h
ValueB1Add dd 00000001h, 00000001h, 00000001h, 00000001h, 00000001h, 00000001h, 00000001h, 00000001h, 00000001h
ValueASub dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
ValueBSub dd 00070000h, 00080000h, 00090000h, 00100000h, 00110000h, 00120000h, 00130000h, 00140000h, 00150000h, 00160000h, 00170000h, 00180000h, 00190000h, 00200000h, 00210000h, 00220000h, 00230000h, 00240000h, 00250000h, 00260000h, 00270000h, 00280000h, 00290000h, 00300000h, 00310000h, 00320000h
ResultAdd dd 9 dup(0)
Result1Add dd 9 dup(0)
ResultSub dd 26 dup(0)

.code

start:
mov eax,0
push offset ValueAAdd
push offset ValueBAdd
push offset ResultAdd
call Add_288_LONGOP

push offset ValueA1Add
push offset ValueB1Add
push offset Result1Add
call Add_288_LONGOP

push offset ValueASub
push offset ValueBSub
push offset ResultSub
call Sub_832_LONGOP

push offset TextAdd
push offset ResultAdd
push offset 288
call StrHex_MY

push offset Text1Add
push offset Result1Add
push offset 288
call StrHex_MY

push offset TextSub
push offset ResultSub
push offset 832
call StrHex_MY

invoke MessageBox, 0, ADDR TextAdd, ADDR CaptionAdd, MB_ICONINFORMATION
invoke MessageBox, 0, ADDR Text1Add, ADDR CaptionAdd, MB_ICONINFORMATION
invoke MessageBox, 0, ADDR TextSub, ADDR CaptionSub, MB_ICONINFORMATION

invoke ExitProcess,0

end start

