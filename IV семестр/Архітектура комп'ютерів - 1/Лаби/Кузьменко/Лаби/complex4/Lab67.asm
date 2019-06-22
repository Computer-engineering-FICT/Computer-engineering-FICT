link l1:ct
link l2:rdm
link ewh:16
link m: z,z, 14,13,12,11,10, nz,nz,nz,nz,nz \ bufer m , 10-6 rozraydu pidyednani do 10-14 rozryadiv LSH



\ comandu
dw 1h: 0010000000010001%  \ 2011  comanda umovnoho perehodu
dw 2h: 0001100001111111%  \ 187f  comanda mnochenya� R15=R15*M
dw 3h: 1000000011000000%  \ 80c7  comanda dodavania� DD=DD+SS
dw 4h: 0010100000000000%  \ 2813  comanda bezumovnoho perehodu
dw 5h: 0h                 \ kinec

\ znachenya�
dw 11h:4h      \ 4h - andesa comandu na zku perehodumo pru r15[7]=0
dw 7fh:2      \ operand dlya mnoshenya�
dw 0c0h:4h     \ dodanok 1
dw 0h:5h       \ dodanok 2
\dw 13h:0h       adresa comandu bezumovnoho perehodu

\      r0    ������� ������
\      r1    ���������� �������
accept r7:1h       \ �������� ������
\      r10            ����?������ �������� R15 �?� ��� ��������(����������� �� RY)
\      r11           ����?������ ������� DD
\      r12          ����?������ ������� SS
\      r14           RZ(8-15)
accept r15:1  \ RZ(0-7); 7 ������ - ����� ��� ��������

equ CJUMP:11fh   \287
equ MULT:0dfh    \223
equ PLUS:1fh     \31
equ JUMP:15fh    \351

begin  {xor nil,r0,r0;oey; ewh;} \ ���?��� ������� � ��
       {or nil,r7,z; oey; ewl;}  \ �� ������, �� ������ � R7

read1  \ ����?� ���� �������
       {cjp rdm, read1; r; or r1,bus_d,z; load rn, flags;}
       {cjp rn_z, exit;}
       {cjp rn_n, a2;}        \ ���� 1 - ������� �� ������� �����������

       {and r0,r1,7800h;}   \ ?������?���?� ����������� �������
       {or nil,r0,z; oey; jmap;}

a2     {and r0,r1,7c00h;}   \ ?������?���?� ����������� �������
       {or nil,r0,z; oey; jmap;}

\----------------------------------------------------------------------------------

       org CJUMP
       {and r0,r1,400h; load rn, flags;}    \ �����?��� ���� �������?�
       {cjp not rn_z, exit;}

       {and r3,r15,80h; load rn, flags;} \ �����?��� �����
       {cjp rn_z, next;}

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
       {or srl, r5,r5;}      \
       {cjp not RM_C, next;}     \���� rm_c 1 �� ��������� �?�*�����
       {xor r14,r14,r5;}
       {xor r15,r15,r5;}
       {add r15,r15,1h,z;}

 {cjp nz, next;}



\----------------------------------------------------------------------------------

       org PLUS
       {and r0,r1,300h; load rm, flags;}
       {cjp not rm_z, exit;}  \ ���� ������� �������?� - ������� �� �?���

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
       {and r0,r1,400h; load rn, flags;} \�����?��� ���� �������?�
       {cjp not rn_z, exit;}

       {and r0,r1,1ffh; load rn, flags;}
       {cjp not rn_z, exit;}
                                                                                                                                                       {xor r7,r7,r7;}
       {xor r7,r7,r7;}          
       {or r7,r7,r0;}
       { cjp nz, next;}

\----------------------------------------------------------------------------------

next   {add r7,r7,z,nz;} \ ���������� ������ �������� �������
       {cjp nz, begin;}

\----------------------------------------------------------------------------------

exit   {}
