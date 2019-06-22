
       dw 00h:0010010000001101%         \ lab0:  jnz lab1
       dw 02h:1000001100011001%         \        add r0,r1
       dw 04h:0001100000001010%         \ lab1:  mul r15, [0Ah]
       dw 06h:0010110000001100%         \        jmp lab0

       dw 05h:0005h        \���࠭�1 � �� ��� ���堤�᭮�
       dw 0Bh:0FFFCh       \���࠭�2 � �� ��� ���堤�᭮�
       dw 0Ah:0fffh        \���࠭�1 ��� �������᭮�
       dw 0Ch:0h           \���࠭� ����᫮����� ���室�
       dw 0Dh:4h           \���࠭� �᫮����� ���室�


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
org 000000010000% {cjp nz,gocond;}
org 000000010100% {cjp nz,gonocond;}

\ �롮ઠ ������� �� �����
Start
       {ewh;oey;xor nil,r7,r7;}         \��⠥� � r8, [r7]
       {ewl;oey;or nil,r7,r7;}
r_w    {cjp rdm,r_w;R;or r8,bus_d,z;}   \���� �⥭��
       {add  r7, r7, 2, z;}             \㢥��稢��� r7

\������� �������᭠� ��� ���堤�᭠�?
       {and nil,R8,1000000000000000%;load rm,flags;}  \������ ������� � R8
       {cjp not rm_z,two_adr;}           \������� 2-� ��p�᭠�
       {jmp one_adr;}                    \������� �������᭠�

\---------------------------------------------------------------

\
one_adr

{and rq,r8,0000001111111111%;}\ � RQ �ନ�㥬 ���� ���࠭��
{ewl; oey; or rq,z;} \ � EWL ����ᨬ ���� ���࠭��
Wait2{r; cjp rdm,Wait2; or r14,Bus_D,z;} \ ���� �⥭�� ��६����� �� ����� �
                                        \ ����ᨬ �� � ॣ���� ���࠭��
{and rq,r8,0111100000000000%;}
{jmap; or rq,z; oey;}

\--�믮������ �᫮����� ���室�-------------------------------------
gocond

\�஢��塞 7-� ��� � ��������
{and nil,r15,10000000%;load rm,flags;}
{cjp not rm_z,next;}

\��室, �᫨ ��ﬠ� ������
{and rq,r8,0000010000000000%;load rm,flags;}
{cjp rm_z,next;}
{jmp set_ip;}

\--�믮������ ����᫮����� ���室�----------------------------------
gonocond

\��室, �᫨ ��ﬠ� ������
{and rq,r8,0000010000000000%;load rm,flags;}
{cjp rm_z,next;}

{jmp set_ip;}

\--------------------------------------------------------------------

\-��⠭���� ������ IP------------------------------------------------
set_ip

\����砥� � r10 ���� ᫥���饩 �������
{and r10,r8,1111111111%;}

        {ewh;oey;xor nil,r10,r10;}         \��⠥� � r11, [r10]
        {ewl;oey;or nil,r10,r10;}
r_w3    {cjp rdm,r_w3;R;or r11,bus_d,z;}   \���� �⥭��

        {or r7,r11,z;}
        {jmp next;}

\--�믮������ 㬭������----------------------------------------------
Mul
\r10 - ���稪
\r11 - ���࠭� � �� (�� � r15)
\r12 - � r12 ᤢ������� r11
\r13 - ���࠭� � �� (�� � r14)
\r14 - ���訥 ࠧ��� १����
\r15 - ����訥 ࠧ��� १����


\��室, �᫨ ��ᢥ���� ������
{and rq,r8,0000010000000000%;load rm,flags;}
{cjp not rm_z,next;}

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
