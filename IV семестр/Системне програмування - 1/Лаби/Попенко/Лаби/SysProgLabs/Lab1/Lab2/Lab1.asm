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
  invoke ExitProcess, 0
end start
