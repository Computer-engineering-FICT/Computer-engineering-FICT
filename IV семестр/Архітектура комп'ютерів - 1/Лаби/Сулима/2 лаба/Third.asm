\ ����������� ������ #2

\ ϳ��������� �� ������, �������� ���������� �����
LINK L1 : CT
ACCEPT R10 : 00010h \ �T
ACCEPT R11 : 08FFFh \ A = -7 ��
ACCEPT R12 : 0FFFh \ B = -5 ��, ������ ������� ����������
ACCEPT R13 : 00000H \ ������� ������� ���������� ��
ACCEPT R14 : 00000h \ ���� ����������


\ �������� ���� ����������
 {OR R14, R11, Z;}
 {XOR R14, R14, R12; LOAD RN, FLAGS; }
 {XOR R14, R14, R14; }


\ ���������� ������� ����� � � ������ (�� �����������)
 {AND NIL, R11, 08000h; LOAD RM, FLAGS; }
 {CJP NOT RM_N, PROV_Y; }
 {XOR R11, R11, 08000h; }

 PROV_Y
 {AND NIL, R12, 08000h; LOAD RM, FLAGS; }
 {SUB R12, Z, R12, NZ;}
 {CJP not RM_N, MULT; }
 {XOR R12, R12, 08000h; }

 \ ��������
 MULT
 {AND NIL, R12, 08000h; LOAD RM, FLAGS; }
 {CJP NOT RM_N, SHIFTL; }

 {ADD R13, R13, R11, Z; LOAD RM, FLAGS; }
 {ADD R12, R12, Z, RM_C; }

SHIFTL
 {OR @SLL, R13, R13, Z;  }
 {OR @SL.25, R12, R12, Z; }
 {SUB R10, R10, Z; LOAD RM, FLAGS;}
 {CJP NOT RM_Z, MULT; }

RESULT
 {OR SRL, R12, R12, Z; }
 {OR SR.9, R13, R13, Z; }

 {CJP NOT RM_N, END; }
 {XOR R13, R13, 0FFFFh;}
 {XOR R12, R12, 0FFFFh;}
 {ADD R13, R13, Z, NZ; LOAD RM, FLAGS; }
 {ADD R12, R12, Z, RM_C; }

END {}
