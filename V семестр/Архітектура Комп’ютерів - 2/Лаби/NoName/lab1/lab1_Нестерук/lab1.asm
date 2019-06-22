; ��������� ����� (X1-X6) � �������(R2-R7)
           In     A, P2
           Mov    R2, A

           In     A, P2
           Mov    R3, A

           In     A, P2
           Mov    R4, A

           In     A, P2
           Mov    R5, A

           In     A, P2
           Mov    R6, A

           In     A, P2
           Mov    R7, A
;======================================================
; ���������� 4(X1 + X2 - 1)
; ϳ�������� ������� ��� ���������� ������ ����������
           Mov    R0, #0
           Mov    R1, #0
; ���������: X1 + X2
           Mov    A, R2
           Clr    C
           Add    A, R3
           Jnc    C11
           Inc    R0
C11:
; ³�������: X1 + X2 - 1
           Jnz    C12
           Dec    A
           Dec    R0
           Jmp    C13
C12:
           Dec    A
C13:
; �������� (�������): 4(X1 + X2 - 1)
           Clr    C
           Rlc    A
           Mov    R1, A
           Mov    A, R0
           Rlc    A
           Mov    R0, A
           Mov    A, R1

           Clr    C
           Rlc    A
           Mov    R1, A
           Mov    A, R0
           Rlc    A
           Mov    R0, A
; ����:
; R0,R1 = 4(X1 + X2 - 1)
;======================================================
; ���������� -(X3 + X4)
; ϳ�������� ������� ��� ���������� ������ ����������
           Mov    R2, #0
           Mov    R3, #0
; ���������: X3 + X4
           Mov    A, R4
           Clr    C
           Add    A, R5
           Jnc    C21
           Inc    R2
C21:
           Mov    R5, A
; ���� �����: -(X3 + X4)
           Cpl    A
           Mov    R3, A
           Mov    A, R2
           Cpl    A
           Clr    C
           Mov    R2, A
           Mov    A, R3
           Inc    A
           Jnz    C22
           Inc    R2
C22:
           Mov    R3, A
; ����:
; R2,R3 = -(X3 + X4)
;======================================================
; ���������� -(X5&X6)/4
; ϳ�������� ������� ��� ���������� ������ ����������
           Mov    R4, #0
           Mov    R5, #0
; ������ �: X5&X6
           Mov    A, R6
           Anl    A, R7
; ĳ����� (�������): (X5&X6)/4
           Jb7    C31
           Clr    C
           Rrc    A
           Clr    C
           Rrc    A
; ���� �����: -(X5&X6)/4
           Cpl    A
           Inc    A
           Mov    R4, #FFH
           Mov    R5, A
           Jmp    C32
C31:
           Clr    C
           Cpl    C
           Rrc    A
           Clr    C
           Cpl    C
           Rrc    A
; ���� �����: -(X5&X6)/4
           Cpl    A
           Inc    A
           Mov    R5, A
C32:
; ����:
; R4,R5 = -(X5&X6)/4
;======================================================
; ���������� 4(X1 + X2 - 1) - (X3 + X4) - (X5&X6)/4
           Clr    C
           Add    A, R1
           Jnc    C41
           Inc    R0
C41:
           Clr    C
           Add    A, R3
           Jnc    C42
           Inc    R0
C42:
           Mov    R1, A
           Mov    A, R0
           Clr    C
           Add    A, R2
           Mov    R0, A
; ��������:
; R0,R1 = 4(X1 + X2 - 1) - (X3 + X4) - (X5&X6)/4