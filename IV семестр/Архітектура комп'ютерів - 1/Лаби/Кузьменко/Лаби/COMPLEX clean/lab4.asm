link l3: ct
accept r12:0      \ ����. ࠧ��� �����⥫�
accept r9:7       \ �������� �
accept r10:0fffbh \ ����訥 ࠧ��� �����⥫� �
accept r11:17     \ ���稪 横���

label1 {cjp not rm_c,label2;} \ �᫨ ��� ��७��, � �� ���� 2
{add r12,r12,r9,z;} \ ���� +1 � ���訩 ࠧ��
label2 {or srl,r12,r12,z;} \ ���訩 ࠧ�� �����⥫� ᬥ頥� ��ࠢ� �� 1 (����� �� 2)
{or sr.9,r10,r10,z;} \ ᬥ頥� �� 1 ��ࠢ� (� ��७�ᮬ) �����⥫� (����� �� 2)
{sub r11,r11,z,z;load rm,flags;cem_c;} \ ���稪 -1
{cjp not rm_z, label1;} \ �᫨ �� �����, � ����� 横��
{nxor r10,1;} \ ������� � ��אַ� ���
