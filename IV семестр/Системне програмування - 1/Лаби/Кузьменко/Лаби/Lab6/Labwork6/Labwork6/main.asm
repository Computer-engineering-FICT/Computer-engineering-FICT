.586
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
option casemap :none
include \masm32\include\windows.inc
include module.inc
include longop.inc


includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
.const
.data
TextBuf db 900 dup(?)
Caption db 'Result', 0
ValueA dd 0AAAAAAAAh, 0AAAAAAAAh, 0AAAAAAAAh
ValueB dd 1,2,3,4,5,6,7,8,9,10h,11h,12h,13h,14h,15h,16h,17h,18h,19h,20h,21h,22h,23h
 

.code
start:
push offset ValueB
push 200
call Shift

push offset ValueB
push offset ValueA
push 96
call Wr
;



push offset TextBuf
push offset ValueB
push 736
call StrHex_MY
invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION
invoke ExitProcess,0
end start

