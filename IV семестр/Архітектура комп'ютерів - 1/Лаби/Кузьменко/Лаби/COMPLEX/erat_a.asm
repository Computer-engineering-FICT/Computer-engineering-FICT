link ewh:16
link l1:rdm
link l2:rdd
link l3:ct
link m:z,z,z,z,z,z,z,14,13,12,11,10
link ra:z,7,6,5
link rb:z,2,1,0
\----------Программа----------
dw 14h:2012h
dw 16h:1214h
dw 18h:2014h
dw 1ah:4801h
dw 1ch:2012h
dw 1eh:121ch
dw 20h:2014h
dw 22h:4802h
dw 24h:8d2ah
dw 26h:5040h
dw 28h:38ddh
dw 2ah:2018h
dw 2ch:122ah
dw 2eh:201ah
dw 30h:08DDh
dw 32h:30afh
dw 34h:38efh
dw 36h:2044h
dw 38h:1236h
dw 3ah:40efh
dw 3ch:2846h
dw 3eh:2044h
dw 40h:123eh
dw 42h:40afh
dw 44h:2846h
dw 46h:5800h

accept r7:14h

accept dev[3]:i,12h,14h,3,12
accept dev[5]:i,18h,1ah,3,12
accept dev[7]:o,44h,46h,3,12
accept dev_buf[3]:0002h,0005h
accept dev_buf[5]:8006h

\Макросы
macro mov приемник,источник:
{or приемник, источник,z;}
macro read_mem приемник:
{r;mov приемник,bus_d;cjp rdm,cp;}
\Данные
\dw 03ffh:0ffh

{cjp nz,begin;}
\-------------выборка------------
begin {xor nil,r8,r8;ewh;oey;}
      {ewl;oey;or nil,r7,z;}
ll1   {r;cjp rdm,ll1;or r8,bus_d,z;}
\------------распаковка----------
{or rq,8000h,z;}
{and nil,r8,rq;cjp not zo,double;} \ в случае двухадресной команды double
{or rq,3ffh,z;}
{and r13,r8,rq;}
\ {or rq,0400h,z;}   проверка адресации одноадресной команды
\ {and nil,r8,rq;cjp zo,com;}
{or nil,r13,r13;ewl;oey;}
ll2 {r;cjp rdm,ll2;or r12,bus_d,z;}
com {or nil, r8,r8;jmap;oey;} \выполнение операции
\-------------------------------
\для двухадресной команды
double {xor nil,r8,r8;oey;ewh;}
       {or r9,0e7h,z;}
       {ewa;ewb;oey;and nil,r8,r9;} \номера регистров в RA,RB
\-------------------------------
 {oey;or nil,r8,z;jmap;}

org 10%
{cjs nz,multiply;}
{cjp nz,next;}
\-------------------------------
multiply {load rm,z;} \подпрограмма умножения

{xor nil,r15,r12;load rn,flags;LDCT 16;}

{and r6,r15,8000h;}
{xor r6,r6,r12;}
{and r6,r6,8000h;}

{ADD R12,R12,Z;CJP not NO,prov;} \проверка знаков операндов
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

     {xor r4,r4,0111111111111111%;} \перевод в ДК
     {xor r5,r5,1111111111111111%;}
     {add r5,z,nz;load rm,flags;}
     {add r4,z,rm_c;}

label5 {or r15,r4,z;}
       {or r14,r5,z;}
{crtn nz;}

     {cjp nz,next;}
org 11%
     {cjs nz,Madd;}
     {cjp nz,next;}
\выполнение операции
{oey;jmap;or nil,r8,z;}
Mand \подпрограмма конъюнкции
     {and rb,rb,ra;}
    {crtn nz;}
    {cjp nz,next;}

\безусловный переход
org  110%
op_jmp{or rq,r13,z;}
{or r7,rq,z;cjp nz,begin;}

\условный переход
org  100%
op_cjmp{or rq,80h,z;}
{and nil,r15,rq;load rm,flags;}
{cjp not rm_z,next;}
{mov r7,r13;cjp nz,begin;}

\Ввод с ВУ
org 1000%
op_in{or nil,r13,z;ewl;oey;}
input{i;cjp rdd,input;or r15,bus_d,z;}
{cjp nz,next;}

\Вывод с ВУ
org 1010%
op_out{or nil,r13,z;oey;ewl;}
{or nil,r15,z;oey;o;cjp rdd,cp;}
{cjp nz,next;}
\------------------------
\savelow-сохранение Р14 в памяти
org 1100%
{or r13,r13,z;oey;ewl;}
{w;or nil,r14,r14;oey;cjp rdm,cp;}
{cjp nz,next;}
\------------------------
\savehigh-сохранение Р15 в памяти
org 1110%
{or r13,r13,z;oey;ewl;}
{w;or nil,r15,r15;oey;cjp rdm,cp;}
{cjp nz,next;}
\-----------------------
\load-загрузка в Р15 из памяти
org 10000%
{or r13,r13,z;ewl;oey;}
{read_mem r15;}
{cjp nz,next;}
\-----------------------
\movora-R<--R15
org 10010%
{or nil,r13,z;ewa;ewb;oey;}
{or rb,r15,r15;}
{cjp nz,next;}
\-----------------------
\movira-R15<---R
org 10100%
{or nil,r13,z;ewa;ewb;oey;}
{or r15,ra,z;}
{cjp nz,next;}
\----------------------
\Выход
org 10110%
exit{cjp nz,end;}
\----------------------
next {add r7,r7,2,z;}
     {cjp nz,begin;}

end {}
