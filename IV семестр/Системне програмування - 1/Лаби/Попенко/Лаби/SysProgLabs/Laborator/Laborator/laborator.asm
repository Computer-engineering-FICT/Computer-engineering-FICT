.386 ;���������, �� ������� ��� ���������

.model flat, stdcall ;���������, �� ������� ������ ���'��

option casemap: none ;����������� ����� �� ������� �����

include \masm32\include\windows.inc ;������
 
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
; include ��� ������������ �����

includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
; includelib ��� �������

.data
  Caption db "� �������� �� ��������!", 0
  Text db "����������� ����!", 13, 10, "�� �������� ������� ������� ����������" , 0

.code
start:
  invoke MessageBoxA, 0, ADDR Text, ADDR Caption, MB_ICONINFORMATION
  mov edx, 0
  mov eax, 0  
  mov al, 255
  mov dl, -1
  invoke ExitProcess, 0
end start
