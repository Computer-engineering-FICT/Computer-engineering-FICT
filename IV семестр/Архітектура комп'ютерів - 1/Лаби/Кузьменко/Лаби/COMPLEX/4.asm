link l3: ct\�������� ��'���� �� L1 � CT
link l1: rdm
accept r1:0 \��������� r3
accept r2:7fffh \��������� r1
accept r3:7fffh \������� r2
accept r11:17 \� ��������� ����� r4

{or r0,r2,z;} \  �������� r1 � rq
{xor sll,r0,r0,r2;} \ RM_C ������ �������� ���� ��������� = R1[15] xor R2[15]
{xor sr.9,R1,R1;} \ R3[15]= ���� ����������, R3[14..0]=0

{or sll,nil,r2,z;} \ rm_c <= r1[15]
{cjp not RM_C,label0;} \ ���� ����� �������������
{xor R2,R2,1111111111111111%;} \ �������� ���������
{add R2,R2,z,nz;} / +1
label0
{or sll,nil,R3,z;}\ rm_c <= r2[15]
{cjp not RM_C,label1;}
{xor R3,R3,1111111111111111%;}
{add R3,R3,z,nz;}
{cont;load rm, z;}    \��������� RM
{label1 cjp not rm_c,label2;}   \����� ����� ��������
{add r1,r1,r9,z;}      \��������� ��������� �� R12
{label2 or srl,r1,r1,z;}   \���� � R12 � R10 ����
{or sr.9,r3,r3,z;}  \��������� �������
{sub r3,r3,z,z;load rm,flags;cem_c;}  \��������� � ��������
{cjp not rm_z, label1; }    \�� ���� ��������� (R11)
{}
