link l1: ct
link l2: rdm
link ewh: 16
link m: z,z,z,z,z,z,z,14,13,12,11,10


dw 0011h: 08ffh \ ����������� ������� 0 0001 0 00 1111 1111
dw 0012h: 400bh
dw 0013h: 08ffh
dw 0014h: 8022h \ ����������� ������� 1 00011 00 001 00 010
dw 0015h: 600ah
dw 0ffh: 5  \ �������
dw 0ah:   0012h \ ������ ����������� ��������
dw 0bh:   0013h \ ������ �������� ��������

accept r7: 0011h            \������� �� ���������
accept r1: 0000000000000001%
accept r2: 0000000000000011%
accept r3: 0000000000000001%
accept r14: 0h \Z(8-15) ��������� �����i �i�� ����������
accept r15: 7 \Z(0-7)  ������i �i�� ����������
accept r5: 0ffffh

include macro.inc
          {cjp not z, loading;}
\org 000000000011% {cjp nz, double;}
\org    000000000010% {cjp nz, multing;}

\--------------------------------------------------------------------------
\-----------------������ � ���'����----------------------------------------
\--------------------------------------------------------------------------


loading   {xor nil, r13,r13; oey; ewh;} \  ��������� ���ic��� ������
          {or nil, r7,z; oey; ewl;}  \

comread   {cjp rdm, comread; r; or r11,bus_d,z; load rm, flags;}   \ �������� �������
          {xor r13, r13;}
          {and r13, r11, 8000h; load rm, flags;}
          {cjp not rm_z, double;} \  ���� ������ �� ��� = �� ���i�

          {xor r13, r13;}
          {and r13, r11, 400h; load rm, flags;}   \  ���� ������� �������i� = �� ���i�
          {cjp not rm_z, exit;}                   \

          {xor r13, r13;}
          {and r13,r11,0111100000000000%;}
          {sub r13, 0000100000000000%, nz; load rm, flags;}
          {cjp not rm_z, notmult;}


multing   {xor nil, r13,r13; oey; ewh;}         \
          {or r13, 3ffh, z;}                   \ ������������ � ��� ������
          {and nil, r11, r13; oey; ewl;}        \ ��������

readop    {cjp rdm, readop; r; or r13, bus_d, z;}  \ �������� �������

\------------------------------------------------------------------------
\-----------------------��������-----------------------------------------
\------------------------------------------------------------------------
{AND NIL, R13, 8000H; LOAD RM, FLAGS;}
{CJP RM_Z, CONTIN;}
{add r6,r6,1,z;}
{XOR R13,R13,0FFFFH;} \����������� r2 � �� � ��
{ADD R13,R13,1,Z;}    \

CONTIN
       {AND NIL, R15,8000H; LOAD RM,FLAGS;}
       {CJP RM_Z, START;}
       {add r14,r14,1,z;}
       {XOR R5,R5,0FFFFH;} \����������� r3 � �� � ��
       {ADD R5,R5,1,Z;}    \

start
{xor r10,r6;}                  \
       {xor r10,r14;load rm, flags;}   \���������� ����� ����������
 {xor r6,r6;}
 {add r6,r6,r10;}
 {xor r14,r14;}
 {xor r10,r10;}
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
       {load rm, flags;}   \���������� ����� ����������
       {or srl, r6,r6;}      \
       {CJP not RM_C, command;}     \���� rm_c 1 �� ��������� �?�*�����
       {xor r14,r14,r5;}
       {xor r15,r15,r5;}
       {add r15,r15,1h,z;}

        {cjp not z, command;}
command   {add r7, r7, 1h;}        \  �����i� �� ��������� �������
          {jmp ending;}       \


notmult   {xor r8, r8;}
          {and r8, r11, 0111100000000000%;}
          {xor r13, r13;}
          {sub r13, r8, 4000h, nz;load rm, flags;}
          {cjp rm_z, logjmp;}
          {xor r13, r13;}
          {sub r13, r8, 6000h, nz; load rm, flags;}
          {cjp rm_z, ordjmp;}
          {jmp exit;}


logjmp
          {and nil,r15,000000010000000%; load rm,flags;}
          {cjp not rm_z, exit;}         \

          {jmp  set_new_ip;}



ordjmp {}
set_new_ip
          {and  r11,  r11, 3FFh;}
          {or   r7, r11, z; oey; ewl;}
          {r;   or r7,BUS_D,z; cjp rdm,cp;}  \R7 - new IP

          {jmp  ending;}

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
          {add r7, r7,1h;}                     \  �������� �������
          {jmp ending;}

          {add r7, r7,1h;}                     \  �������� �������
ending    {jmp loading;}                   \
 exit     {}
