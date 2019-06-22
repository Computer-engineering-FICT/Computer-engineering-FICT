.386
.model flat, stdcall
option casemap: none
 
include /masm32/include/windows.inc
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
 
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib
 
.data
msg_title db "Лабораторна робота №1", 0
msg_message db "Сулима Олександр", 0dh, "КПІ Ім. Сікорського", 0dh, "ФІОТ, ІП-53, іп5318", 0
 
.code
start:
invoke MessageBox, 0, addr msg_message, addr msg_title, MB_OK
invoke ExitProcess, 0
end start