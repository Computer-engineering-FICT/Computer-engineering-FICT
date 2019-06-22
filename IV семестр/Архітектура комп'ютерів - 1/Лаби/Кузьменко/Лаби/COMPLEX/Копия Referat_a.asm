link ewh:16
link l1:rdm
link l2:rdd
link l3:ct
link m:z,z,14,13,12,11,10,z,z,z,z,z
link ra:z,7,6,5
link rb:z,2,1,0
\----------�ணࠬ��----------
dw 10h:2052h
dw 12h:1210h
dw 14h:2054h
dw 16h:4801h
dw 18h:2052h
dw 1ah:1218h
dw 1ch:2054h
dw 1eh:4802h
dw 20h:852ah
dw 22h:5040h
dw 24h:38ffh
dw 26h:2052h
dw 28h:1226h
dw 2ah:2054h
dw 2ch:0fffh
dw 2eh:30afh
dw 30h:38efh
dw 32h:20d2h
dw 34h:1232h
dw 36h:40efh
dw 38h:28d4h
dw 3ah:20d2h
dw 3ch:123ah
dw 3eh:40afh
dw 40h:28d4h
dw 42h:5800h

accept r7:10h

accept dev[1]:i,52h,54h,3,12
accept dev[2]:o,0D2h,0D4h,3,12
accept dev_buf[1]:0002h,0005h,8006h

\������
macro mov �ਥ����,���筨�:
{or �ਥ����, ���筨�,z;}
macro read_mem �ਥ����:
{r;mov �ਥ����,bus_d;cjp rdm,cp;}
\�����
dw 03ffh:0ffh

{cjp nz,begin;}
\-------------�롮ઠ------------
begin {xor nil,r8,r8;ewh;oey;}
      {ewl;oey;or nil,r7,z;}
ll1   {r;cjp rdm,ll1;or r8,bus_d,z;}
\------------�ᯠ�����----------
{or rq,8000h,z;}
{and nil,r8,rq;cjp not zo,double;} \ � ��砥 ���堤�᭮� ������� double
{or rq,3ffh,z;}
{and r13,r8,rq;}
{or rq,0400h,z;}   \�஢�ઠ ����樨 �������᭮� �������
{and nil,r8,rq;cjp zo,com;}
{or nil,r13,r13;ewl;oey;}
ll2 {r;cjp rdm,ll2;or r13,bus_d,z;}
{ewl;oey;or nil,r13,z;}
ll3 {r;cjp rdm,ll3;or r12,bus_d,z;}
com {or nil, r8,r8;jmap;oey;} \�믮������ ����樨
\-------------------------------
\��� ���堤�᭮� �������
double {xor nil,r8,r8;oey;ewh;}
       {or r9,0e7h,z;}
       {ewa;ewb;oey;and nil,r8,r9;} \����� ॣ���஢ � RA,RB
\-------------------------------
 {oey;or nil,r8,z;jmap;}

org 1100000%
{cjs nz,multiply;}
{cjp nz,next;}
\-------------------------------
multiply {load rm,z;} \����ணࠬ�� 㬭������

{xor nil,r15,r12;load rn,flags;LDCT 16;}

{and r6,r15,8000h;}
{xor r6,r6,r12;}
{and r6,r6,8000h;}

{ADD R12,R12,Z;CJP not NO,prov;} \�஢�ઠ ������ ���࠭���
{and r12,r12,7fffh;}
prov {add r15,r15,z;cjp not no,label1;}
     {and r15,r15,7fffh;}

label1 {CJP NOT RM_C,MUL;}

       {add r5,r5,r14,z;load rm,flags;}
       {add r4,r4,r12,rm_c;}
MUL  {ADD srl,r12,r12,z;}
     {ADD sr.9,r14,r14,z;}
     {ADD SLL,R15,R15,Z;RPCT LABEL1;load rm,flags;cEM_C;}


     {add r4,r6,r4;load rm,flags;}
     {ADD R4,R4,Z;LOAD RN, FLAGS;}
     {CJP NOT RM_N,label5;}

     {xor r4,r4,0111111111111111%;} \��ॢ�� � ��
     {xor r5,r5,1111111111111111%;}
     {add r5,z,nz;load rm,flags;}
     {add r4,z,rm_c;}

label5 {or r15,r4,z;}
       {or r14,r5,z;}
{crtn nz;}

     {cjp nz,next;}
org 100000%
     {cjs nz,Madd;}
     {cjp nz,next;}
\�믮������ ����樨
{oey;jmap;or nil,r8,z;}
Madd \����ணࠬ�� �㬬�஢����
     {add rb,rb,ra;}
    {crtn nz;}
    {cjp nz,next;}

\����᫮��� ���室
org  11000000%
op_jmp{or rq,r13,z;}
{or r7,rq,z;cjp nz,begin;}

\�᫮��� ���室
org  10000000%
op_cjmp{or rq,80h,z;}
{and nil,r15,rq;load rm,flags;}
{cjp not rm_z,next;}
{mov r7,r13;cjp nz,begin;}

\���� � ��
org 100000000%
op_in{or nil,r13,z;ewl;oey;}
input{i;cjp rdd,input;or r15,bus_d,z;}
{cjp nz,next;}

\�뢮� � ��
org 101000000%
op_out{or nil,r13,z;oey;ewl;}
{or nil,r15,z;oey;o;cjp rdd,cp;}
{cjp nz,next;}
\------------------------
\savelow-��࠭���� �14 � �����
org 110000000%
{or r13,r13,z;oey;ewl;}
{w;or nil,r14,r14;oey;cjp rdm,cp;}
{cjp nz,next;}
\------------------------
\savehigh-��࠭���� �15 � �����
org 111000000%
{or r13,r13,z;oey;ewl;}
{w;or nil,r15,r15;oey;cjp rdm,cp;}
{cjp nz,next;}
\-----------------------
\load-����㧪� � �15 �� �����
org 1000000000%
{or r13,r13,z;ewl;oey;}
{read_mem r15;}
{cjp nz,next;}
\-----------------------
\movora-R<--R15
org 1001000000%
{or nil,r13,z;ewa;ewb;oey;}
{or rb,r15,r15;}
{cjp nz,next;}
\-----------------------
\movira-R15<---R
org 1010000000%
{or nil,r13,z;ewa;ewb;oey;}
{or r15,ra,z;}
{cjp nz,next;}
\----------------------
\��室
org 1011000000%
exit{cjp nz,end;}
\----------------------
next {add r7,r7,2,z;}
     {cjp nz,begin;}

end {}
