\---------------setting links---------------\
link l1: ct
link l2: rdm
link l3: rdd
link ewh:16
link m:14,13,12,11,z,z,z,z,z,z,z,z
link ra:z,2,1,0
link rb:z,7,6,5
\---------------commands---------------\
dw 0:  0010100000110010%  \ in 32h
dw 2:  0011100000000000%  \ movefrom 0
dw 4:  0010100000110010%  \ in 32h
dw 6:  0011100000100000%  \ movefrom 1
dw 8:  1110000000100000%  \ add 1,0
dw 10: 0100000000000001%  \ movto 1
dw 12: 0100100001010000%  \ storeto 1010000%
dw 14: 0010100000110010%  \ in 32h
dw 16: 0010000001010000%  \ mult 1010000%
dw 18: 0011000010110010%  \ out 0b2h
dw 20: 0101000000000000%  \ moveToRA
dw 22: 0011000010100010%  \ out 0a2h
dw 24: 0111100000000000%  \ exit
\---------------init external devices---------------\
accept dev[0]:i, 32h,  34h,  3, 16 \ init input device
accept dev[1]:o, 0a2h, 0a4h, 3, 16 \ init output device1
accept dev[2]:o, 0b2h, 0b4h, 3, 16 \ init output device2
accept dev_buf[0]: 3h, 4h, 0fff9h \ init input device's buffer
\------accepting registers---------\
accept r0:0      \ r0 := 0
accept r1:0      \ r1 := 0
accept r2:0      \ r2 := 0
accept r3:0      \ r3 := 0
accept r4:0      \ r4 := 0
accept r5:0      \ r5 := 0
accept r6:0      \ r6 := 0
accept r7:0      \ counter := 0
\------------program's begin---------\
org 0000000000000000%
NEXT {ADD NIL, R7, Z; OEY; EWL;}  \ ��������� ������� ������� �� ���� ������
{R; CJP RDM, CP; ADD R8, BUS_D, Z;}  \ ���������� ������� � R8
{ADD NIL, R8, Z; CJP NO, doubleAdr;} \ �������� ���� ���������
\==one adr command==\     \ ���������� ����������� �������
       {XOR R9, R9, R9;}                \ �������� ���� ���������
       {ADD R9, R9, 0200h;}
       {AND NIL, R9, R8;load rm, flags;}
       { CJP not RM_Z, end;}

       {XOR R9, R9, R9;}    \ ������������ �������� � R12 � �����
       {ADD R9, R9, 03FFh;}
       {AND NIL, R9, R8; OEY; EWL;}
       {R; CJP RDM, CP; ADD R12, BUS_D, Z;}

       {ADD nil,r8,z;oey;JMAP;}   \ ������� �� ��������� ����������� ��������
\==two adr command==\     \ ���������� ���������� �������
doubleAdr{xor R9,R9,R9;}    \ �������� ���� ���������
       {and R9,R8,0318h;LOAD RM, FLAGS;}
       {cjp not RM_Z, end;}

       {or nil,r8,z;oey;LOAD RA;LOAD RB;}\ ����������� ������� RA �� RB

       {add nil,r8,z;oey;JMAP;}   \ ������� �� ��������� ���������� ��������

RETURN {ADD R7,R7,2,z;}     \ ����� ����������; ���������� �������� ������: R7 := R7 + 2
  { cjp nz, NEXT;}       \ ������� �� ���������� �������� �������

\-----------begin mult-----------\
org 0000010000000000%
       {xor r9,r9,r9;}     \ ��������� ������� ���
       {xor r10,r10,r10;}   \ ���������� �������� �����
       {or r14,z,r15;}     \ r14 := r15
       {xor r15,r15,r15;}   \ r15 := 0
       {load rm,z;}      \ rm := flags
       {or r11,z,r12;}    \ r11 := r12
       {xor r11,r11,r14;load rn,flags;} \ ���������� ����� ����������
          \ (���������� � RN_N)
       {or r11,z,8000h;}   \  �������� ����� 1-�� ��������
       {and nil,r12,r11;load rm,flags;cjp rm_z,plus_x;}
       {sub r12,z,r12,nz;}
plus_x {and nil,r14,r11;load rm,flags;cjp rm_z,plus_y;} \  �������� ����� 2-�� ��������
       {SUB R14,z,R14,nz;}
plus_y {or srl,r14,r14,z;}            \ ���� ����������� ����� 2-�� ��������
       {or sr.9,r15,r15,z;}
begin  {or sll,r12,r12,z;load rm,flags;CJP NOT RM_N, notadd;} \ ������� ����� ��������
       {add r10,r10,r15,z;LOAD RM,FLAGS;}
       {add r9,r9,r14,RM_C;}
notadd {or srl,r14,r14,z;}
       {or sr.9,r15,r15,z;}
       {or nil,r12,r12;load rm, flags;}
       {cjp not RM_Z, begin;}
       {cjp not RN_N, endMul;}
       {ADD r9,r9,r11,z;}
endMul {or r14,z,r9;}     \ ����� ��������; ����������� ���������� � ��������
       {or r15,z,r10;cjp nz,RETURN;} \ �������; ������� � ����� ����������
\----------add operation-----------\
org 0000110000000000%
       {add RB,RB,RA,z;cjp nz, RETURN;} \ ��������� ������� ���������� �������
\---------------write to memory-----------\
org 0000100100000000%
{and r9, r8, 0000001111111111%; }  \ ��������� ����� � ��
{or nil, r9, z; oey; ewl;}   \ ��������� ������ �� ��
{or nil,r15,z; oey; w;cjp rdm,cp;} \ ��������� ����� �� ��
{cjp nz, RETURN;}     \ ������� � ����� ����������
\---------------input---------------------\
org 0000010100000000%
{AND R9, R8, 03FFh;}      \ ��������� ����� � ��
labelIn{or nil, r9, z; oey; ewl;}   \�������� ��� ��������� ��
{i; cjp rdd, cp; or r12, bus_d, z;}
{and nil, r12, 0080h;load rm, flags;}
{cjp rm_z, labelIn;}
{add r9, r9, 0002h, z;}     \ ������ ��
{or nil, r9, z; oey; ewl;}
{i; cjp rdd, cp; or r15, bus_d, z;}  \ ���������� � ��
{cjp nz, RETURN;}       \ ������� � ����� ����������
\----------------output-------------------\
org 0000011000000000%
{AND R9, R8, 03FFh;}     \ ��������� ����� � ��
labelOut{or nil, r9, z; oey; ewl;}  \�������� ��� ��������� ��
{i; cjp rdd, cp; or r12, bus_d, z;}
{and nil, r12, 0080h;load rm, flags;}
{cjp rm_z, labelOut;}
{add r9, r9, 0002h, z;}     \ ������ ��
{or nil, r9, z; oey; ewl;}
{or nil, r15, z; oey; o; cjp rdd, cp;} \ ����� � ��
{cjp nz, RETURN;}      \ ������� � ����� ����������
\--------------r15 -> RB ----------\
org 0000011100000000%
{or nil, r8, z; oey; load rb;}   \ ������������ RB
{or rb, r15, z;}      \ RB := R15
{cjp nz, return;}      \ ������� � ����� ����������
\--------------r15 <- RA ----------\
org 0000100000000000%
{or nil, r8, z;oey;load RA;}   \ ������������ RB
{or r15, ra,z; }      \ R15 := RB
{cjp nz, return;}      \ ������� � ����� ����������
\------------- r14- > r15 ---------\
org 0000101000000000%
{or r15, r14, z; }      \ R15 := R14
{cjp nz, return;}      \ ������� � ����� ����������
\----------------exit---------------\
org 0000111100000000%
end {}         \ ����� � ��������
