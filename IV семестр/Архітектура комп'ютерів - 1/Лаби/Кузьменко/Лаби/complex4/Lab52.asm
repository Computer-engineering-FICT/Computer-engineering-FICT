link l1: ct
link l2 : rdm
link ewh:16
link m: z,z,z,z,z,z,z,14,13,12,11,10

dw 1111h: 08ffh \ ����������� ������� 0 0001 0 00 1111 1111
dw 1112h: 8022h \ ����������� ������� 1 00011 00 001 00 010
dw 1113h: 8062h
dw 1114h: 08ffh
dw 0ffh: 7  \ �������


accept r12:1111h \ ������� �� ���������
accept r1: 0000000000000001%
accept r2: 0000000000000011%
accept r3: 0000000000000001%


accept r14: 0h \Z(8-15) ��������� �����i �i�� ����������
accept r15: 5h \Z(0-7)  ������i �i�� ������

{cjp not z, loading;}
\org 000000000011% {cjp nz, double;}
org  000000000010% {cjp nz, multing;}



accept r5: 0ffffh
accept r6: 0h   \���i�� ���������� ����� ���������
accept r7: 0h   \���i�� ���������� ����� ��������
accept r10:0h   \

\-----------------������ � ���'����--------------------------------------

loading   {xor nil, r13,r13; oey; ewh;} \  ��������� ���ic��� ������
          {or nil, r12,z; oey; ewl;}  \

comread   {cjp rdm, comread; r; or r11,bus_d,z; load rm, flags;}   \ �������� �������

          {cjp rm_n, double;} \  ���� ������ �� ��� = �� ���i�
          {cjp rm_z, exit;}  \

          {and r13, r11, 400h; load rm, flags;}   \  ���� ������� �������i� = �� ���i�
          {cjp not rm_z, exit;}                   \

          {and rq,r11,0111100000000000%;}
          {jmap; or rq,z; oey;}
          {cjp not rm_z, exit;}                    \

multing   {xor nil, r13,r13; oey; ewh;}         \
          {or r13, 3ffh, z;}                   \ ������������ � ��� ������
          {and nil, r11, r13; oey; ewl;}        \ ��������

readop    {cjp rdm, readop; r; or r13, bus_d, z;}  \ �������� �������


\-----------------------��������-----------------------------------------

{AND NIL, R13, 8000H; LOAD RM, FLAGS;}
{CJP RM_Z, CONTIN;}
{add r6,r6,1,z;}
{XOR R13,R13,0FFFFH;} \����������� r2 � �� � ��
{ADD R13,R13,1,Z;}    \

CONTIN
       {AND NIL, R15,8000H; LOAD RM,FLAGS;}
       {CJP RM_Z, START;}
       {add r7,r7,1,z;}
       {XOR R5,R5,0FFFFH;} \����������� r3 � �� � ��
       {ADD R5,R5,1,Z;}    \

start
{add r10, r10,r15;}
{xor r15,r15;}
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
{xor r10,r10;}
       {xor r10,r6;}                  \
       {xor r10,r7;load rm, flags;}   \���������� ����� ����������
       {or srl, r10,r10;}      \
       {CJP not RM_C, EXIT;}     \���� rm_c 1 �� ��������� �?�*�����
       {xor r14,r14,r5;}
       {xor r15,r15,r5;}
       {add r15,r15,1h,z;}

           {cjp not z, command;}
command   {add r12, r12, 1h;}        \  �����i� �� ��������� �������
          {cjp not z, loading;}       \

double    {or r9, r11;}                 \   �����i��� ����������i
          {and r9, 0111110000000000%;}   \  ������i�
          {xor r9, 0h; load rm, flags;}   \
          {cjp not rm_z, exit;}            \

          {or r9, r11;}                  \
          {and r9, 0000001100011000%;}    \ �����i��� �������i�
          {xor r9, 0h; load rm, flags;}    \
          {cjp not rm_z, exit;}             \

          {or r9, r11;}                       \
          {and r9, 0111%;}                     \ ���������� ������� ���i����
          {ewa; oey; or nil, r9,r9; load ra;}   \

          {or r9, r11;}                        \
          {and r9, 11100000%;}                  \ ���������� ������� ���i����
          {or srl, r9,r9,z;}                     \
          {or srl, r9,r9,z;}                      \
          {or srl, r9,r9,z;}                       \
          {or srl, r9,r9,z;}                        \
          {or srl, r9,r9,z;}                         \
          {ewb; oey; or nil, r9,r9; load rb;}         \

          {add rb, ra;}                          \ ���������

          {add r12, r12,1h;}                     \  �������� �������
          {cjp not z, loading;}                   \

 exit{}
