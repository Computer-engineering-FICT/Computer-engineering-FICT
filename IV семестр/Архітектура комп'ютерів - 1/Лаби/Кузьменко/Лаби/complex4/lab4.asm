link l1: ct
link l2: rdm
link ewh: 16


dw 1111h: 08ffh \ ������� 0 0001 0 00 0000 1111
dw 0ffh: 1000000000000011%  \ �������

accept r12: 1111h

accept r14: 0h \Z(8-15) ��������� �����i �i�� ����������
accept r15: 1000000000000011% \Z(0-7)  ������i �i�� ����������


accept r5: 0ffffh
accept r6: 0h   \���i�� ���������� ����� ���������
accept r7: 0h   \���i�� ���������� ����� ��������

\--------------------------------------------------------------------------
\-----------------������ � ���'����----------------------------------------
\--------------------------------------------------------------------------

loading   {xor nil,r0,r0; oey; ewh;} \  ��������� ���ic��� ������
          {or nil, r12,z; oey; ewl;}  \

comread   {cjp rdm, comread; r; or r11,bus_d,z; load rm, flags;} \ ������� �������

          {cjp rm_n, exit;} \  ���� ������ �� ��� = �� ���i�
          {cjp rm_z, exit;}  \

          {and r0, r11, 7800h;}                 \
          {xor nil, r0, 0800h; load rm, flags;}  \ ���� ��� ����. �� ��� = �� ���i�
          {cjp not rm_z, exit;}                   \

          {and r0, r11, 400h; load rm, flags;} \  ���� ������� �������i� = �� ���i�
          {cjp not rm_z, exit;}                 \

          {xor nil,r0,r0; oey; ewh;}         \
          {or r0, 3ffh, z;}                   \ ����������� � ��� ������
          {and nil, r11, r0; oey; ewl;}        \ ��������

readop    {cjp rdm, readop; r; or r13, bus_d, z;}  \ �������� �������

\------------------------------------------------------------------------
\-----------------------��������-----------------------------------------
\------------------------------------------------------------------------
          {or r10, r15;}   \
          {xor r15, r15;}   \
          {or r11, r10;}     \
          {or r12, r13;}      \   ���i����� ����� �i� �����
          {or sll, r10,r10;}   \
          {or sll, r13,r13;}    \
          {or srl, r10,r10;}     \
          {or srl, r13,r13;}      \
          {xor r11, r10;}          \
          {xor r12, r13;}           \
          {add r11,r12;}             \

multstart {load rm, flags;}
extag     {or srl, r13,r13,z;}               \R13=0.r(R13)
     {cjp not rm_c,tag;}
          {add r15, r10;cjp not co, tag;}    \R15=R15+R10
          {add r14, r14, 1;}                 \R14=R14+1 ���� �i������� ������������
tag       {or sll, r10, r10,z;}              \R10=l(R10).0
          {or r13,r13,z;cjp not zo, extag;}
          {or sll, r11,r11;}
          {cjp not rm_c, exit;}
 minus    {add r14, r11;}            \
          {xor r15, 0ffffh;}          \ ����������� � ������������ ���
          {xor r14, 0ffffh;}           \
          {add r15, 1h;}                \
exit          {}
