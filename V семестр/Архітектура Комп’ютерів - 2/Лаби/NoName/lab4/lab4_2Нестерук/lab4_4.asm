; ϳ����������� R0.R1 � RB0 i RB1
           Mov    R0, #0
           Mov    R1, #0
           Sel    Rb1
           Mov    R0, #0
           Mov    R1, #0
           Sel    Rb0

; ϳ����������� ��������� F0 (��� ���������� ����� ����������)
           Clr    F0

; �������� ����� ���
           In     A, P1
           Mov    R2, A
           In     A, P1
           Mov    R3, A

           Sel    Rb1
           In     A, P1
           Mov    R4, A
           In     A, P1
           Mov    R5, A

; ���������� ���� R4.R5
           Mov    A, R4
           Jb7    S1
; �����, �� �������� � R4.R5 ������, ���� ����� �� �������
           Jmp    Ns1
S1:
           Cpl    F0         ; ������� ���� �������
; ������� ���� R4.R5
           Anl    A, #7FH
           Mov    R4, A
Ns1:
; �������� ���� ������ R4.R5
; ������  ��� �����
           Clr    C
           Mov    A, R4
           Rrc    A
           Mov    R4, A

           Mov    A, R5
           Rrc    A
           Mov    R5, A
           Sel    Rb0
; ������� ��� �����
           Mov    A, R4
           Rrc    A
           Mov    R4, A

           Mov    A, R5
           Rrc    A
           Mov    R5, A

; ���������� ���� R2.R3
           Mov    A, R2
           Jb7    S2
; �����, �� �������� � R2.R3 ������, ���� ����� �� �������
           Jmp    Main
S2:
           Cpl    F0         ; ������� ���� �������
; ������� ���� R2.R3
           Anl    A, #7FH
           Mov    R2, A

; �������� ���� ��������
Main:
           Sel    Rb0
; ���������� ������� ������ R2 (R2.R3)
           Mov    A, R2
           Jb7    Ad
           Jmp    Shift      ; ���� R2[7] = 0 �� ��������� �� ��������

Ad:
; �������� ���������
; ������� ��� ����� ����������
           Clr    C
           Mov    A, R5
           Add    A, R1
           Mov    R1, A

           Mov    A, R4
           Addc   A, R0
           Mov    R0, A
; ������ ��� ����� ����������          
           Sel    Rb1
           Mov    A, R5
           Addc   A, R1
           Mov    R1, A

           Mov    A, R4
           Addc   A, R0
           Mov    R0, A
           Sel    Rb0

; �����
Shift:
; ������� R4.R5 ������
; ������  ��� �����
           Clr    C
           Sel    Rb1
           Mov    A, R4
           Rrc    A
           Mov    R4, A

           Mov    A, R5
           Rrc    A
           Mov    R5, A
           Sel    Rb0
; ������� ��� �����
           Mov    A, R4
           Rrc    A
           Mov    R4, A

           Mov    A, R5
           Rrc    A
           Mov    R5, A

; ������� R2.R3 ����
           Clr    C
           Mov    A, R3
           Rlc    A
           Mov    R3, A

           Mov    A, R2
           Rlc    A
           Mov    R2, A

; ���������� R2.R3 = 0
           Clr    A
           Orl    A, R2
           Orl    A, R3
           Jnz    Main
           Jf0    Sign       ; ������� ��'�����
           Jmp    Endp
Sign:
; �������� ���� ����� ����������
; ������� ��� ����� ����������
           Clr    C
           Mov    A, R1
           Cpl    A
           Add    A, #1
           Mov    R1, A

           Mov    A, R0
           Cpl    A
           Addc   A, #0
           Mov    R0, A
; ������ ��� ����� ����������
           Sel    Rb1
           Mov    A, R1
           Cpl    A
           Addc   A, #0
           Mov    R1, A

           Mov    A, R0
           Cpl    A
           Addc   A, #0
           Mov    R0, A
           Sel    Rb0
Endp:
; ʳ���� ��������
           Nop