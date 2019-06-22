
       dw 02h:0001100000001010%         \�������.   0011 - mul
       dw 00h:1000001100011001%         \��㠤�. ��⮤��६��⭠� 00000 - plus
                                        \r0 = r0 + r1

       dw 05h:0005         \���࠭�1 � �� ��� ���堤�᭮�
       dw 0Bh:0FFFCh       \���࠭�2 � �� ��� ���堤�᭮�
       dw 10: 0fffh        \���࠭�1 ��� �������᭮�


       link     l3:ct
       link     l1:rdm
       link m: z,z,z,z,z,z,14,13,12,11,z,z
       link     ewh:16


       accept    r0:11
       accept    r1:5
       accept    r7:0
       accept R15: 8fffh  \���࠭�2 ��� �������᭮�

\---------------------------------------------------------------
\       r7  - ip
\       r8  - ॣ���� ������
\       r9  - ॣ���� ������
\---------------------------------------------------------------
        include macro.inc

{cjp nz,Start;} \ ���室 � ��砫� �ணࠬ��
org 000000001100% {cjp nz,mul;}

\ �롮ઠ ������� �� �����
Start
       {ewh;oey;xor nil,r7,r7;}         \��⠥� � r8, [r7]
       {ewl;oey;or nil,r7,r7;}
r_w    {cjp rdm,r_w;R;or r8,bus_d,z;}   \���� �⥭��
       {add  r7, r7, 2, z;}             \㢥��稢��� r7

\������� �������᭠� ?
       {and nil,R8,1000000000000000%;load rm,flags;}  \������ ������� � R8
       {cjp not rm_z,two_adr;}           \������� 2-� ��p�᭠�
       {jmp one_adr;}

\---------------------------------------------------------------

\
one_adr

{and rq,r8,0000010000000000%;load rm,flags;}
{cjp not rm_z,next;} \��室, �᫨ ��ᢥ���� ������

{and rq,r8,0000001111111111%;}\ � RQ �ନ�㥬 ���� ���࠭��
{ewl; oey; or rq,z;} \ � EWL ����ᨬ ���� ���࠭��
Wait2{r; cjp rdm,Wait2; or r14,Bus_D,z;} \ ���� �⥭�� ��६����� �� ����� �
                                        \ ����ᨬ �� � ॣ���� ���࠭��
{and rq,r8,0111100000000000%;}
{jmap; or rq,z; oey;}

\ *** 3 - �믮������ ������� ***
Mul
\r10 - ���稪
\r11 - ���࠭� � �� (�� � r15)
\r12 - � r12 ᤢ������� r11
\r13 - ���࠭� � �� (�� � r14)
\r14 - ���訥 ࠧ��� १����
\r15 - ����訥 ࠧ��� १����

\�����⠢������ ॣ�����
      {or r10,15,z;}
      {or r11,r15,z;}
      {xor r12,r12,r12;}
      {or r13,r14,z;}
      {xor r14,r14,r14;}
      {xor r15,r15,r15;}

\��ॢ���� r13, ���� - � r14

      {add r13,r13,0,z;load rm,flags;}
      {cjp not rm_n,label2;}
      {add r14,1000000000000000%,z;}
      {nxor r13,r13,0;}
      {add r13,r13,1,z;}

\���������� � r14 ����
label2
      {add r11,r11,0,z;load rm,flags;}
      {cjp not rm_n,label3a;}
      {xor r14,1000000000000000%;}
      {and r11,0111111111111111%;}

\�������� r13 ��� ࠧ� ��� ᨭ�஭���樨
label3a
      {or srl,r13,r13,z;load rm,flags;cem_c;}
      {or sr.9,r12,r12,z;}
      {or srl,r13,r13,z;load rm,flags;cem_c;}
      {or sr.9,r12,r12,z;}

\��������, �⢥� � r14-r15
label3
      {or sll,r11,r11,z;}
      {add r11,r11,0,z;load rm,flags;}
      {cjp not rm_n,label4;}
      {add r15,r15,r12,z;load rm,flags;}
      {add r14,r14,r13,rm_c;}

label4
      {or srl,r13,r13,z;load rm,flags;cem_c;}
      {or sr.9,r12,r12,z;}
      {sub r10,r10,0,z;load rm,flags;}
      {cjp not rm_z,label3;}

notmul
          {jmp  next;}

\----------------------------------------------------------------------
\��ࠡ�⪠ ���堤�᭮� ��������
two_adr


          {or   r9, r8, z; }            \r9:=r8
          {and  r9, r9, 0111110000000000%;load rm,flags;} \������� ᫮�����?
          {cjp  not rm_z, notplus;}

          {or   r9, r8, z; }                \r9:=r8
          {and  r9, r9, 0000001100011000%;} \��⮤��६��⭠�?
          {sub  r9, r9, 0000001100011000%, nz;load RM,Flags;}
          {cjp  not rm_z, not_autodr;}

          {or   r9, r8, z; }                 \r9:=r8
          {and  r9, r9, 111%;}               \㧭��� ��ன ॣ����
          {ewa; oey; or nil,r9,r9;load ra;}  \�⠥� ��ன ॣ���� � ra

          {or   r9, r8,z;}                   \r9:=r8
          {and  r9, r9, 11100000%;}          \㧭��� ���� ॣ����
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {ewb; oey; or nil,r9,r9;load rb;} \�⠥� ���� ॣ���� � rb

        \��९��뢠�� ���� ���࠭��� � r12 � r13
        {or r12,ra,z;}
        {oey; or rq,rb,z;}
        {or r13,rq,z;}

        {ewh;oey;xor nil,r12,r12;}         \��⠥� � r10, [ra]
        {ewl;oey;or nil,r12,r12;}
r_w1    {cjp rdm,r_w1;R;or r10,bus_d,z;}   \���� �⥭��

        {ewh;oey;xor nil,r13,r13;}         \��⠥� � r11, [rb]
        {ewl;oey;or nil,r13,r13;}
r_w2    {cjp rdm,r_w2;R;or r11,bus_d,z;}   \���� �⥭��

          {add r11,r11,r10,z;load rm,flags;} \r11:=r11+r10

writeres
          {ewh;oey;xor nil,r13,r13;}
          {ewl;oey;or nil,r13,r13;}
          {cjp rdm,writeres;w;or nil,r11,z;oey;} \������ १���� � ������

          {xor r14,r14,r14;}   \r14:=0
          {or r14,r14,1h;}     \r14:=1
          {sub rb,rb,r14,nz;} \��⮤��६��� [rb] - ��ࢮ�� ॣ����

          {or   r9, r8,z;}              \r9:=r8
          {and  r9, r9, 111%;}          \㧭��� ��ன ॣ����
          {ewb; oey; or nil,r9,r9;load rb;} \�⠥� ��ன ॣ���� � rb
          {sub rb,rb,r14,nz;} \��⮤��६��� [rb] - ��ண� ॣ����

inf
          {jmp  next;}

not_autodr
          {jmp  next;}
notplus
          {jmp  next;}
\-------------------------------------------------------------------
next
          {jmp  Start;}
end
          {}
