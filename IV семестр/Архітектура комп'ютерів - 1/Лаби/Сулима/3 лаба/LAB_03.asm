\���� 3

\ ϳ��������� �� ������, �������� ���������� �����
DW 0C0h : 8FFFh \ A = 7 ��
DW 0C2h : 0FFFh \ B = 5 ��, ������ ������� ����������


LINK L1 : CT
LINK L2 : RDM
LINK EWH : 16
LINK M : Z,Z,Z,Z,Z,Z,Z,Z,14,13,12,11   \�����(��� 14-11 ��������)

ORG 00h
 {OR R11, R11, R13;}
 {CJP NZ, RPAK1; }

ORG 02h
 {OR R12, R12, R13;}
 {CJP NZ, CACL;}

ORG 06h {CJP NZ, MULT;}

dw 20h: 0000000011000000% \ LOAD A
dw 22h: 0001000011000010% \ LOAD B
dw 24h: 0010000011000101% \ mult

ACCEPT R7 : 020h

\ PROGRAMM

RPAK2
 {CJP NZ, END;} \ TODO



RPAK1
 {ADD NIL, R7, Z, Z; OEY; EWL; }
 {XOR R8, R8, R8; }

SS1
 {R; CJP RDM, SS1; ADD R8, BUS_D, Z;}
 {ADD NIL, R8, Z, Z; CJP NO, RPAK2; }

 {XOR R9, R9, R9;}
 {ADD R9, R9, 0400h; }
 {AND NIL, R8, R9; CJP NOT ZO, KA; }

\ ��
 {XOR R9, R9, R9;}
 {ADD R9, Z, 03FFh;} \ Mask
 {AND NIL, R9, R8; OEY; EWL;}

SS2
 {R; CJP RDM, SS2; ADD R13, BUS_D, Z;}
 {CJP NZ, WHATDO; }

KA
 {CJP NZ, END;} \ TODO

WHATDO
 {AND R8, R8, 07800h; }
 {ADD R7, R7, 02h; }
 {ADD NIL, R8, Z, Z; OEY; EWL; JMAP;}

CACL
  {XOR R10, R10, R10; }
  {ADD R10, R10, 10h, Z; }
  {XOR R13, R13, R13; }
\ �������� ���� ����������
 {OR R14, R11, Z;}
 {XOR R14, R14, R12; LOAD RM, FLAGS; }
 {XOR R14, R14, R14; }


\ ���������� ������� ����� � � ������� (�� �����������)
 {AND NIL, R11, 08000h; LOAD RN, FLAGS; }
 {CJP NOT RN_N, PROV_Y; }
 {XOR R11, R11, 08000h; }

 PROV_Y
 {AND NIL, R12, 08000h; LOAD RN, FLAGS; }
 {CJP not RN_N, MULT; }
 {SUB R12, Z, R12, NZ;}
 {XOR R12, R12, 08000h; }

 \ ��������
 MULT
 {AND NIL, R12, 08000h; LOAD RN, FLAGS; }
 {CJP NOT RN_N, SHIFTL; }

 {ADD R13, R13, R11, Z; LOAD RN, FLAGS; }
 {ADD R12, R12, Z, RN_C; }

SHIFTL
 {OR @SLL, R13, R13, Z;  }
 {OR @SL.25, R12, R12, Z; }
 {SUB R10, R10, Z; LOAD RN, FLAGS;}
 {CJP NOT RN_Z, MULT; }

RESULT
 {OR SRL, R12, R12, Z; }
 {OR SR.9, R13, R13, Z; }

 {CJP NOT RM_N, END; }
 {XOR R13, R13, 0FFFFh;}
 {XOR R12, R12, 0FFFFh;}
 {ADD R13, R13, Z, NZ; LOAD RN, FLAGS; }
 {ADD R12, R12, Z, RN_C; }

END {}
