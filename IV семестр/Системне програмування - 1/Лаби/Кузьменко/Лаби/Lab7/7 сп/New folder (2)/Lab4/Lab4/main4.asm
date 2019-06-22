.586
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
option casemap :none
include \masm32\include\windows.inc
include Longop.inc
include module.inc


includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
.const
.data
TextBuf db 160 dup(?)
Caption db 'Result', 0
ValueA dd 80010001h, 80020001h, 80030001h, 80040001h, 80050002h
ValueB dd 80010001h, 80020001h, 80030001h, 80040001h, 80050001h
Result dd 4 dup(0)
.code
start:
push offset ValueA
push offset ValueB
push offset Result
call Sub_128_LONGOP

push offset TextBuf
push offset dword ptr[Result]
push 32
call StrHex_MY

push offset byte ptr[TextBuf+8]
push offset dword ptr[Result+4]
push 32
call StrHex_MY

push offset byte ptr[TextBuf+16]
push offset dword ptr[Result+8]
push 32
call StrHex_MY

push offset byte ptr[TextBuf+24]
push offset dword ptr[Result+12]
push 32
call StrHex_MY

push offset byte ptr[TextBuf+32]
push offset dword ptr[Result+16]
push 32
call StrHex_MY


invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION

end start