link l3:ct
accept r10:0 \������� ������� ����������
accept r11:0 \������� ������� ����������
accept r2:0FFF9h \x = -7 � ��
accept r3:8005h \� = -5 � ��
accept r4:8000h \��� ����������� �������� ���� � r2
accept r9:0     \��� ����������� ����� ����������
accept r8:10h   \������� ������

{load rm,z;}
{and nil,r2,8000h;load rm,flags;}
{cjp rm_z,check;}\���� r2 - �������������, �� � �� �� ���������.
{add r9, r9, 8000h, z;}\������ ������� � r9
{xor r2,r2,0FFFFh;}\��� � �������� - ������� r2 � ��
{add r2,r2,1,z;}
{and r2, r2, 7fffh;}\�������� �������� ���
check    {or r3,r3,r3; load rm,flags; cjp not rm_n, shift;}\�������� ��������� ���� � r3. ���� 0 - shift
         {add r9, r9, 8000h,z;}\��� � �������� - ���������� r2
         {and r3, r3, 7fffh;}
start    {and nil, r2, r4; load rm, flags; cjp rm_z, shift;}\��������� ������� ��� � r2.���� 0 -shift
         {add r10, r10, r3, z; load rm, flags;} \r10 = r10+r3. ��������� ��� ������������ � rm
         {add r11, r11, z, rm_c;} \r11 = r11+��� ������������
shift    {or sll, r2, r2, z;} \����� ����� r2
         {sub r8, r8, z, z; load rm, flags; cjp rm_z, setSign;}\��������� ��������. ���� 0 - setSign
         {or sl.16, r10, r10, z;}\����� ����� r10
         {or sl.25, r11, r11, z; cjp nz, start;} \����� ����� r11. ������� �� ����� start
setSign  {load rm, z;} \��������� rm
         {or sll, r9, r9; cjp not rm_c, end;} \����� ����� r9. ���� �������� 0 - end.
         {xor r11, r11, 0ffffh;} \��� � �������� - ����� ����� ���������� �� �������������
         {xor r10, r10, 0ffffh;}
end{} \����� ���������
