.386
.model flat, stdcall
option casemap : none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\windows.inc
include module.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.const
	messageCapt db "Лабораторна робота №3", 0
	messageWelcome db "Лабораторну виконав Мазан Ян", 13, 10, "група ІВ-71, 9 за списком", 0
.data
	textRes db 64 dup(?)
	num1 db 19
	num2 db -19
	num3 dw 19
	num4 dw -19
	num5 dd 19
	num6 dd -19
	num7 dq 19
	num8 dq -19
	num9 dd 19.0
	num10 dd -38.0
	num11 dd 19.19
	num12 dq 19.0
	num13 dq -38.0
	num14 dq 19.19
	num15 dt 19.0
	num16 dt -38.0
	num17 dt 19.19

.code

main:
	invoke MessageBoxA, 0, ADDR messageWelcome, ADDR messageCapt, 0

	push offset textRes
	push offset num1
	push 8
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num2
	push 8
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num3
	push 16
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num4
	push 16
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num5
	push 32
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num6
	push 32
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num7
	push 64
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num8
	push 64
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION


	push offset textRes
	push offset num9
	push 32
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num10
	push 32
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num11
	push 32
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION


	push offset textRes
	push offset num12
	push 64
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num13
	push 64
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num14
	push 64
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION


	push offset textRes
	push offset num15
	push 80
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num16
	push 80
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION

	push offset textRes
	push offset num17
	push 80
	call StrHex_MY
	invoke MessageBoxA, 0, ADDR textRes, ADDR messageCapt, MB_ICONINFORMATION


	invoke ExitProcess, 0
	end main