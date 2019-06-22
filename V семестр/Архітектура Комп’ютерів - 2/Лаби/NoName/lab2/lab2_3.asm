
macro jmp label: {cjp nz,label;}

\Начальные настройки
link l3:ct
link l1:rdm
link l2:rdd
link l4:irq
link ewh:16
link m: z,z,z,z,z,z,z,14,13,12,11,z

accept r6: 0F0h \ Стек

accept r7:2h \ Счетчик адресов микрокоманд


accept dev[5]:i,0C0h,0C2h,2,3
accept dev[3]:i,0D0h,0D2h,2,3
accept dev[6]:o,0E0h,0E2h,2,3

accept dev[2]: o,1A0h,1A2h,2,250,0104h
accept dev[4]: o,1B0h,1B2h,2,450


accept dev_buf[2]: 100%

accept dev_buf[5]:0000000000000111%\X

accept dev_buf[3]:0000000000000101%,\Y
                  0000000000000000% \Z


\-----devices
dw 00C0h:00C0h \ adress PC dev 5
dw 00C2h:00C2h \ adress PD dev 5
dw 00D0h:00D0h \ adress PC dev 3
dw 00D2h:00D2h \ adress PD dev 3
dw 00E0h:00E0h \ adress PC dev 6
dw 00E2h:00E2h \ adress PD dev 6
dw 01A0h:01A0h \ adress PC dev 2
dw 01A2h:01A2h \ adress PD dev 2
dw 01B0h:01B0h \ adress PC dev 4
dw 01B2h:01B2h \ adress PD dev 4


\ -----Programma------
dw 0002h:0010100011000000% \ InR15 input(PC) <---00C0h
dw 0004h:0001100010110010% \ Jpc_in R15==80h --->0008h
dw 0006h:0010000010110100% \ Jmp in1         ---->0002h
dw 0008h:0010100011000010% \ InR15 input(x)  <---00C2h
dw 000Ah:0011100010111000% \ WriteR15 MeMo(x) ---->00AEh

dw 000Ch:0010100011010000% \ InR15 input(PC)  <----00D0h
dw 000Eh:0001100010111010% \ Jpc_in R15==80h  ---->0012h
dw 0010h:0010000010111100% \ Jmp in2 ---->000Ch
dw 0012h:0010100011010010% \ InR15 input(y) <----00D2h
dw 0014h:0011100010111110% \ WriteR15 Memo(y) --> 00B0h

dw 0016h:0010100011010000% \ InR15 input(PC) <----00D0h
dw 0018h:0001100011000100% \ Jpc_in R15==80h   ---->001Ch
dw 001Ah:0010000011000110% \ Jmp in3          ----->0016h
dw 001Ch:0010100011010010% \ InR15 input(z)   <-----00D2h

dw 001Eh:0100000010110000% \ AddR15 (Y)       R15=R15+Y
\dw 0020h:0111100000000000%  Nop
dw 0020h:0001000010101110%  \Multiple (X); res R11 R12

dw 0022h:0010100011100000% \ InR15 input(PC) <---00E0h
dw 0024h:0001100011001100% \ Jpc_in R15==80h  ---->0028h
dw 0026h:0010000011001110% \ Jmp in2 ---->0022h

dw 0028h:0100100011001000% \ MovR15 r11;(номер регистра)
\dw 002Ah:0111100000000000%  Nop
dw 002Ah:0011000011100010% \ OutR15 ----->00E2h

dw 002Ch:0010100011100000% \ InR15 input(PC) <---00E0h
dw 002Eh:0001100011010100% \ Jpc_in R15==80h  ---->0032h
dw 0030h:0010000011010110% \ Jmp in2 ---->002Ch

dw 0032h:0100100011001010% \ MovR15 r12
dw 0034h:0011000011100010% \ outR15 ----->00E2h

dw 0036h:0101000000000000% \ end

\-----Данные
dw 00AEh:0000000000000000% \X
dw 00B0h:0000000000000000% \y
\-----Метки
dw 00B2h:0008h
dw 00B4h:0002h
dw 00B6h:00C2h
dw 00B8h:00AEh
dw 00BAh:0012h
dw 00BCh:000Ch
dw 00BEh:00B0h
dw 00C4h:001Ch
dw 00C6h:0016h
dw 00C8h:0000000000001011%
dw 00CAh:0000000000001100%
dw 00CCh:0028h
dw 00CEh:0022h
dw 00D4h:0032h
dw 00D6h:002Ch

\--------Обработчики прерываний
dw 0104h: 0011000110100010% \ OutR15 ----->01A2h
dw 0106h: 0101100000000000% \return

\----------Стек
dw 00F0h: 0h


{cjp nz,got;}

org 0000100% {jmp multiple;}  \0010
org 0000110% {jmp jpc_in;}    \0011
org 0001000% {jmp jmp_;}      \0100
org 0001010% {jmp inR15;}     \0101
org 0001100% {jmp outR15;}    \0110
org 0001110% {jmp writeR15;}  \0111
org 0010000% {jmp AddR15;}    \1000
org 0010010% {jmp movR15;}    \1001
org 0010100% {jmp end;}       \1010
org 0010110% {jmp return;}    \1011
org 0011110% {jmp nop;}       \1111

got

   {reset;}
   {or r12, 1A0h, z;}
   {or nil, r12, z; ewl; oey;}
   {or r15, 1000000%, z;}
   {or nil, r15, z; oey; o; cjp rdd,cp;}
   {or r12, 1B0h, z;}
   {or nil,r12, z; ewl;oey;}
   {or r15, 1000000%, z;}
   {or nil,r15,z; oey; o; cjp rdd,cp;}
   {and r15,z;}
   {and r12,z;}

\---Kod
begin
{or nil,r7,z; ewl; oey;}
{r; cjp rdm, cp; or r8, bus_d,z;}
{and rq, r8, 1000000000000000%; load rm,flags;}
{cjp not rm_z, two_adr;}
{jmp one_adr;}
two_adr {}

one_adr {and r14, r8,0000001111111111%;} \адрес операнда
        {or r14,z; ewl; oey;} \заносим адрес операнда
        {r; cjp rdm, cp; or r14, bus_d,z;}
        {and nil, r8, 0000010000000000%; load rm, flags;}
        {cjp rm_z, pryamaya;}
        {or r14, z; ewl;oey;}
        {r; cjp rdm, cp; or r14, bus_d,z;}
pryamaya {and rq, r8,0111100000000000%;}
         {jmap; or rq,z; oey;}

\----- Multiple (Y*X) Y-->R15, x -->R14 res= r11+r12
multiple
         {or r10,16;}
         {xor r11,r11,r11;}
         {xor r12,r12,r12;}
         {xor r13,r13,r13;}
         {or rq,r14,z; cjp not no, label1;}
         {sub r14,z,r14,nz;}
label1   {xor rq,r15;}
         {and rq,rq,8000h;}
         {and r14,r14,7fffh;}
         {or nil,r15,z; cjp not no, label11;}
         {and r15,r15,7fffh;}
label11 {or srl,r14,r14,z;}
        {or sr.9,r13,r13,z;}
        {or sll, r15,r15;}
        {cjp not rm_c, label2;}
        {add r12,r12,r13;load rm, flags;}
        {add r11,r11,r14,rm_c;}
label2  {sub r10,r10,z,z;load rm,flags;cem_c;}
        {cjp not rm_z,label11;}
        {or rq,z; cjp not no, label3;}
        {sub r12,z,r12,nz;load rm,flags;}
        {sub r11,z,r11,rm_c;}
label3  

        {cjp nz, next;}

\Условный переход
jpc_in  {and nil,r15,10000000%; load rm, flags;}
        {cjp not rm_z, jmp_;}
        {cjp nz, next;}
\Безусловный переход
jmp_    {or r7,r14,z;}
        {jmp begin;}
\запись в регистр 15 из устройства ввода
inR15   {or r14, z; ewl;oey;}
        {i;cjp rdd,cp; or r15, Bus_d,z;}
        {cjp nz, next;}
\вывод в устройство вывода
outR15  {or nil, r14,z; ewl; oey;}
        {or nil, r15,z;oey;o; cjp rdd,cp;}
        {cjp nz, next;}
\запись из регистра 15 в память
writeR15 {or r14, z; ewl;oey;}
        {w; or nil,r15,z; oey; cjp rdm,cp;}
        
  

 {cjp nz, next;}
\ Операция сложения R15=R15+R14
addR15  {add r15, r15,r14;}
        {cjp nz, next;}

\Запись из регистра в регистр 15
\ r15<--r12 or r15<--r11
movR15  {ewa; oey; or nil, r14,r14; load ra;}
        {or r15, ra,z;}
        {cjp nz, next;}

\Обработка выхода из подпрограммы
return  
        {sub r6, r6, 2, nz;}
        {or r6, z; ewl; oey;}
        {r; cjp rdm, cp; or r15, bus_d, z;}

        {sub r6,r6,2,nz;}
        {or r6,z;ewl;oey;}
        {r; cjp rdm,cp; or r10,bus_d,z;}
        {or r7,r10,z;}
        {jmp begin;}
      
\Окончание программы
end     {jmp end_;}

\Ничего не делать
nop     
        {cjp nz, next;}

\Формирование адреса следующей команды
next    {add r7,r7,2,z;}
        

\Обработка векторного
\децентрализированого прерывания

procInt 
        {cjp irq, begin;}

        {or nil,r6,z;ewl;oey;}
        {w; or nil,r7,z; oey; cjp rdm,cp;}
        {add r6,2;}

        {or nil, r6, z; ewl; oey;}
        {w; or nil, r15, z; oey; cjp rdm, cp;}
        {add r6, 2;}

        {Lock;}
        {Inta;o;cjp rdd,cp; or r7,bus_d,z;}

        {clr ir;}
        {jmp begin;}

end_    {}
