link l1:ct
link l2:rdm \ ��������� �� l2 ������ READY �����
link l3:rdd \��������� �� l1 ������ READY ���������� ��������
link ewh:16
link m: z,z, 14,13,12,11,10, nz,nz,nz,nz,nz \ ����� m, 10-6 ������� ����� �i�'�����i �� 14-10 ������i� ��

accept dev[1]:i, \������� �������
   22h, \������  ������� �����
   24h, \������ ������� �����
   2,   \�������� ������� rdd
   7 \�������� ��������� ��� ��������� � �� ���� ��������� �� ��
accept dev[2]:o, \������� ���������
   0a2h, \������ ��
   0a4h, \������ ��
   2,  \�������� ������� rdm
   7 \�������� ��������� ��� ��������� � �� ���� ��������� �� ��
accept dev_buf[1]: 0AAAAh, 0BBBBh \���, �� ������ ��������� � �������� �� ��



\ �������
dw 1h: 0010000000010001%  \ 2011  ������� �������� ��������
dw 2h: 0001100001111111%  \ 187f  ������� �������� R15=R15*M
dw 3h: 1000000011000000%  \ 80c7  ������� ��������� DD=DD+SS
dw 4h: 0010100000010011%  \ 2813  ������� ����������� ��������
dw 5h: 0011000000100010%  \ 3022  ������� �������� � ��
dw 6h: 0011100010100010%  \ 38A2  ������� ��������� � ��
dw 7h: 0011000000100010%  \ 3022  ������� �������� � ��
dw 8h: 0011100010100010%  \ 38A2  ������� ��������� � ��
dw 9h: 0h                 \ �i����

\ ��������
dw 11h:4h      \ 4h - ������ ������� �� ��� ��� ������� ��� R15[7]=0
dw 7fh:5h      \ ������� RX(M) ��� ��������
dw 0c0h:4h     \ ������ �������(DD)
dw 0h:5h       \ ������ �������(SS)
dw 13h:0h      \ ������ ������� �� ��� ��i��������� ���������� �����i�
dw 22h:22h
dw 0a2h:0a2h

\      r0    �������
\      r1    ����i������ �������
accept r7:1h       \ �i������� ������
\      r8            ����i������ �������� R15 �i� ��� ��������(����������� �� RY)
\      r11           ����i������ ������� DD
\      r12          ����i������ ������� SS
\      r14           RZ(8-15)
accept r15:7h  \ RZ(0-7); 7 ������ - ����� ��� ��������

equ CJUMP:11fh   \287
equ MULT:0dfh    \223
equ PLUS:1fh    \31
equ JUMP:15fh    \351
equ INPUT:19fh    \415
equ OUTPUT:1dfh  \479

begin  {xor nil,r0,r0; oey; ewh;} \ ���i��� ������� � ��
       {or nil,r7,z; oey; ewl;}  \ �� ������, �� ������ � R7

read1  \ ����i� ���� �������
       {cjp rdm, read1; r; or r1,bus_d,z; load rn, flags;}
       {cjp rn_z, exit;}
       {cjp rn_n, a2;}        \ ���� 1 - ������� �� ������� �����������

       {and r0,r1,7800h;}   \ i������i���i� ����������� �������
       {or nil,r0,z; oey; jmap;}

a2     {and r0,r1,7c00h;}   \ i������i���i� ������������ �������
       {or nil,r0,z; oey; jmap;}

\----------------------------------------------------------------------------------

       org CJUMP
       {and r0,r1,400h; load rn, flags;}    \ �����i��� ���� �������i�
       {cjp not rn_z, exit;}

       {and r3,r15,80h; load rn, flags;} \ �����i��� �����
       {cjp  rn_z, next;}

       {xor nil,r0,r0; oey; ewh;}
       {and r0,r1,3ffh;}
       {or nil,r0,z; oey; ewl;}

read2  {cjp rdm, read2; r; or r0,bus_d,z; load rn, flags;}

       {xor r7,r7,r7;}
       {or r7,r7,r0; cjp nz, next;}

\----------------------------------------------------------------------------------
       org MULT
       {and r0,r1,400h; load rm, flags;}
       {cjp not rm_z, exit;}  \ ���� ������� �������?� - ������� �� �?���

       {xor nil,r0,r0; oey; ewh;}  \ ���(19-16)=0
       {or r0,3ffh,z;}
       {and nil,r1,r0; oey; ewl;} \ ���(15-0)=r11(9-0)

read3  {cjp rdm, read3; r; or r13,bus_d,z;} \ ���������� �������� M � �� � r13


 {CJP RM_Z, CONTIN;}
 {add r5,r5,1,z;}
 {XOR R13,R13,0FFFFH;} \����������� �������� � �� � ��
 {ADD R13,R13,1,Z;}    \

CONTIN
       {AND NIL, R15,8000H; LOAD RM,FLAGS;}
       {CJP RM_Z, START;}
       {add r14,r14,1,z;}
       {XOR R15,R15,0FFFFH;} \����������� ��������� � �� � ��
       {ADD R15,R15,1,Z;}    \

start
 {xor r10,r5;}                  \
        {xor r10,r14;load rm, flags;}   \���������� ����� ����������
  {xor r5,r5;}   \
  {add r5,r5,r10;}  \

 {xor r14,r14;}
  {xor r10,r10;}
 {add r10, r10,r15;}
 {xor r15,r15;}
     \������� ��������
 {or srl, r10,r10,z;}
         {or sr.9, r4,r4,z;}
         {load rm, flags;}
multiply {xor r8,r8;}
         {or r8,r13;}
         {or sll, r8, r8 ,z;}
         {cjp  not rm_c, labelIF;}
         {add r15,r4;load rm, flags;}
         {cjp not rm_c,label1;}
         {add r14, r14, 1;}
 label1  {add r14,r10;}
 labelIF {or sll, r13,r13,z;}
         {or srl, r10,r10,z;}
         {or sr.9, r4,r4,z;}
         {or r13,r13,z;cjp not zo, multiply;}
         {cjp not rm_c, FIN;}
FIN  {}
       {load rm, flags;}   \���������� ����� ����������
       {or srl, r5,r5;load rm , flags;}      \
       {cjp not RM_C, next;}     \���� rm_c 1 �� ��������� �?�*�����
       {xor r14,r14,r5;}
       {xor r15,r15,r5;}
       {add r15,r15,1h,z;}

 {cjp nz, next;}
\----------------------------------------------------------------------------------

       org PLUS
       {and r0,r1,300h; load rm, flags;}
       {cjp not rm_z, exit;}  \ ���� ������� �������i� �����

       {xor nil,r0,r0; oey; ewh;}  \ ���(19-16)=0
       {or r0,0e0h,z;}
       {and nil,r1,r0; oey; ewl;} \ ���(15-0)=r11(7-5)

read4  {cjp rdm, read4; r; or r11,bus_d,z;} \ ���������� �������� DD � �� � r13

       {xor nil,r0,r0; oey; ewh;}  \ ���(19-16)=0
       {or r0,7h,z;}
       {and nil,r1,r0; oey; ewl;} \ ���(15-0)=r11(2-0)

read5  {cjp rdm, read5; r; or r12,bus_d,z;} \ ���������� �������� SS � �� � r14

       {add r11,r11,r12,z;}

       {xor nil,r0,r0; oey; ewh;}  \ ���(19-16)=0
       {or r0,0e0h,z;}
       {and nil,r1,r0; oey; ewl;} \ ���(15-0)=r11(7-5)

write1 {cjp rdm, write1; w; or nil,r11,z; oey;}

       {cjp nz, next;}

\----------------------------------------------------------------------------------

       org JUMP
       {and r0,r1,400h; load rn, flags;} \�����i��� ���� �������i�
       {cjp not rn_z, exit;}

       {xor nil,r0,r0; oey; ewh;}   \������� �������� �i���
       {and r0,r1,3ffh;}     \��� ��������
       {or nil,r0,z; oey; ewl;}

read6  {cjp rdm, read6; r; or r0,bus_d,z; load rn, flags;}

       {xor r7,r7,r7;}
       {or r7,r7,r0; cjp nz, next;}

\----------------------------------------------------------------------------------

    org INPUT
    {and r0,r1,400h; load rn, flags;}    \ �����i��� ���� �������i�
       {cjp not rn_z, exit;}

    {xor nil,r0,r0; oey; ewh;}
    {and r0,r1,3ffh;}
    {or nil,r0,z; oey; ewl;}

    {or r3,bus_d,z;}
    {and r4,r3,0080h; load rm, flags;}
    {cjp rm_z, exit;}

    {add r0,r0,2h;}

    {xor nil,r0,r0; oey; ewh;}
    {or nil,r0,z; oey; ewl;}

read9  {cjp rdd, read9;i;or r15, bus_d,z;}

    {cjp nz, next;}

\----------------------------------------------------------------------------------

    org OUTPUT
    {and r0,r1,400h; load rn, flags;}    \ �����i��� ���� �������i�
    {cjp not rn_z, exit;}

    {xor nil,r0,r0; oey; ewh;}
    {and r0,r1,3ffh;}
    {or nil,r0,z; oey; ewl;}

    {or r3,bus_d,z;}
    {and r4,r3,0080h; load rm, flags;}
    {cjp rm_z, exit;}

    {add r0,r0,2h;}

    {xor nil,r0,r0; oey; ewh;}
    {or nil,r0,z; oey; ewl;}

write2 {cjp rdd, write2; o;or nil,r15,z; oey;}

    {cjp nz, next;}

\----------------------------------------------------------------------------------

next   {add r7,r7,z,nz;} \ ���������� ������ �������� �������
       {cjp nz, begin;}

\----------------------------------------------------------------------------------

exit   {}
