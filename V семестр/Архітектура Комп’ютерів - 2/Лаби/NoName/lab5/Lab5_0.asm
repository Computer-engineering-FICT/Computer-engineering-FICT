                                                         ORG  0
;--------------------------------------------
;mcu51
Mov DPTR, #0A004h
mov A, #0Fh
movx @dptr, A
; ϳ�������� ���� HL1-HL8 � ���������� �������
mov a, #0
mov DPTR, #0A006h
mov A, #10101010b
movx @DPTR, A
; ��������
mov r7, #05h
hs:
call zad
djnz r7, hs

mov A, #0h
movx @dptr, A
;--------------------------------------
; ���������� ���� �� ������� �������
mov r4, #07h
mov r5, #30h
mov a, r5
add a, r4
mov r4, A
;--------------------------------------
Continue:

Mov A, #03h
Mov DPTR, #0A004h
Movx @DPTR, A

Mov A, R4
Mov DPTR, #0B000h
Movx @DPTR, A

call zad

Mov DPTR, #0A004h
mov A, #0Fh
movx @dptr, A

mov r7, #2
ms: mov r6, #0ffh
mark3:

mov A, #10b
mov dptr,#08002h
movx @dptr,a
mov DPTR,#08001h	;���������� ����� ����� �A
Mov A, #01001111b
movx @DPTR,A	;��������� �� ���.����� �������� � B

call zad1

mov A, #11b
mov dptr,#08002h
movx @dptr,a
mov DPTR,#08001h	;���������� ����� ����� �A
Mov A, #00000111b
movx @DPTR,A	;��������� �� ���.����� �������� � B

call zad1

djnz r6, mark3
djnz r7, ms

mov A, #11b
mov dptr,#08002h
movx @dptr,a
mov DPTR,#08001h
mov A,#0h	;�������� � ���. ����� FFh
movx @DPTR,A	;�������� ������� �_���

mov A, #10b
mov dptr,#08002h
movx @dptr,a
mov DPTR,#08001h
mov A,#0h	;�������� � ���. ����� FFh
movx @DPTR,A	;�������� ������� �_���


jmp  Continue

;----------��������----------------
zad: Mov R3, #2
C8:  Mov R1, #0FFh
C2:  Mov R2, #0FFh
C3:  DJNZ R2, C3
     DJNZ R1, C2
     DJNZ R3, C8
     ret

zad1: Mov R1, #1h
C4:  Mov R2, #0FFh
C5:  DJNZ R2, C5
     DJNZ R1, C4
     ret
END


