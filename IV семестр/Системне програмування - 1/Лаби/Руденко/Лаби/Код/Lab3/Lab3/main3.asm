.586
.model flat, stdcall
option casemap :none

include D:\\masm32\include\kernel32.inc
include D:\\masm32\include\user32.inc
include \masm32\include\windows.inc
include module3.inc

includelib D:\\masm32\lib\kernel32.lib
includelib D:\\masm32\lib\user32.lib

.data   

TextBuf db 64 dup(?)
Value1 db 00100011b
Value2 db 11011100b
Value3 dw 0000000000100011b
Value4 dw 1111111111011100b
Value5 dd 00000000000000000000000000100011b
Value6 dd -35
Value7 dq 35
Value8 dq -35
Value9 dd 35.0
Value10 dd -70.0
Value11 dd 35.35
Value12 dq 35.0
Value13 dq -70.0
Value14 dq 35.35
Value15 dt 35.0
Value16 dt -70.0
Value17 dt 35.35

Caption db "Lab 3", 0
.code
main:

    push offset TextBuf
    push offset Value1
    push 8
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value2
    push 8
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value3
    push 16
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value4
    push 16
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value5
    push 32
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value6
    push 32
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value7
    push 64
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value8
    push 64
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value9
    push 32
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value10
    push 32
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
   push offset Value11
    push 32
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value12
    push 64
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value13
    push 64
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value14
    push 64
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value15
    push 80
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value16
    push 80
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION 

push offset TextBuf
    push offset Value17
    push 80
    call StrHex_MY
    invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION

	invoke ExitProcess, 0
end main