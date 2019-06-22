link l1:ct
link l2:rdm \ підключити до l2 сигнал READY пам’яті
link l3:rdd \підключити до l1 сигнал READY Зовнішнього пристрою
link ewh:16
link m: z,z, 14,13,12,11,10, nz,nz,nz,nz,nz \ буфер m, 10-6 розряди якого пiд'єднанi до 14-10 розрядiв ЛШ

accept dev[1]:i, \пристрій введеня
   22h, \адреса  Регістра Стану
   24h, \адреса Регістра Даних
   2,   \затримка сигналу rdd
   7 \затримка установки біта готовності в РС після звернення до РД
accept dev[2]:o, \пристрій виведення
   0a2h, \адреса РС
   0a4h, \адреса РД
   2,  \затримка сигналу rdm
   7 \затримка установки біта готовності в РС після звернення до РД
accept dev_buf[1]: 0AAAAh, 0BBBBh \дані, що будуть вводитись в процесор із РД



\ команди
dw 1h: 0010000000010001%  \ 2011  команда умовного переходу
dw 2h: 0001100001111111%  \ 187f  команда множення R15=R15*M
dw 3h: 1000000011000000%  \ 80c7  команда додавання DD=DD+SS
dw 4h: 0010100000010011%  \ 2813  команда безумовного переходу
dw 5h: 0011000000100010%  \ 3022  команда введення з ЗП
dw 6h: 0011100010100010%  \ 38A2  команда виведення з ЗП
dw 7h: 0011000000100010%  \ 3022  команда введення з ЗП
dw 8h: 0011100010100010%  \ 38A2  команда виведення з ЗП
dw 9h: 0h                 \ кiнець

\ значення
dw 11h:4h      \ 4h - адреса команди на яку слід перейти при R15[7]=0
dw 7fh:5h      \ операнд RX(M) для множення
dw 0c0h:4h     \ перший доданок(DD)
dw 0h:5h       \ другий доданок(SS)
dw 13h:0h      \ адреса команди на яку здiйснюється безумовний перехiд
dw 22h:22h
dw 0a2h:0a2h

\      r0    робочий
\      r1    зберiгатиме команду
accept r7:1h       \ лiчильник команд
\      r8            зберiгатиме значення R15 пiд час множення(виступатиме як RY)
\      r11           зберiгатиме доданок DD
\      r12          зберiгатиме доданок SS
\      r14           RZ(8-15)
accept r15:7h  \ RZ(0-7); 7 розряд - умова для переходу

equ CJUMP:11fh   \287
equ MULT:0dfh    \223
equ PLUS:1fh    \31
equ JUMP:15fh    \351
equ INPUT:19fh    \415
equ OUTPUT:1dfh  \479

begin  {xor nil,r0,r0; oey; ewh;} \ вибiрка команди з ОП
       {or nil,r7,z; oey; ewl;}  \ по адресу, що лежить в R7

read1  \ аналiз типу команди
       {cjp rdm, read1; r; or r1,bus_d,z; load rn, flags;}
       {cjp rn_z, exit;}
       {cjp rn_n, a2;}        \ якщо 1 - перейти на обробку двохадресної

       {and r0,r1,7800h;}   \ iдентифiкацiя одноадресної команди
       {or nil,r0,z; oey; jmap;}

a2     {and r0,r1,7c00h;}   \ iдентифiкацiя одвохадресної команди
       {or nil,r0,z; oey; jmap;}

\----------------------------------------------------------------------------------

       org CJUMP
       {and r0,r1,400h; load rn, flags;}    \ перевiрка типу адресацiї
       {cjp not rn_z, exit;}

       {and r3,r15,80h; load rn, flags;} \ перевiрка умови
       {cjp  rn_z, next;}

       {xor nil,r0,r0; oey; ewh;}
       {and r0,r1,3ffh;}
       {or nil,r0,z; oey; ewl;}

read2  {cjp rdm, read2; r; or r0,bus_d,z; load rn, flags;}

       {xor r7,r7,r7;}
       {or r7,r7,r0; cjp nz, next;}

\----------------------------------------------------------------------------------
       org MULT
       {and r0,r1,400h; load rm, flags;}
       {cjp not rm_z, exit;}  \ якщо непряма адресац?я - перейти на м?тку

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,3ffh,z;}
       {and nil,r1,r0; oey; ewl;} \ РАД(15-0)=r11(9-0)

read3  {cjp rdm, read3; r; or r13,bus_d,z;} \ зчитування операнда M з ОП в r13


 {CJP RM_Z, CONTIN;}
 {add r5,r5,1,z;}
 {XOR R13,R13,0FFFFH;} \переведення множника з дк в пк
 {ADD R13,R13,1,Z;}    \

CONTIN
       {AND NIL, R15,8000H; LOAD RM,FLAGS;}
       {CJP RM_Z, START;}
       {add r14,r14,1,z;}
       {XOR R15,R15,0FFFFH;} \переведення множеного з дк в пк
       {ADD R15,R15,1,Z;}    \

start
 {xor r10,r5;}                  \
        {xor r10,r14;load rm, flags;}   \визначення знаку результату
  {xor r5,r5;}   \
  {add r5,r5,r10;}  \

 {xor r14,r14;}
  {xor r10,r10;}
 {add r10, r10,r15;}
 {xor r15,r15;}
     \початок множення
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
       {load rm, flags;}   \визначення знаку результату
       {or srl, r5,r5;load rm , flags;}      \
       {cjp not RM_C, next;}     \якщо rm_c 1 то результат в?д*ємний
       {xor r14,r14,r5;}
       {xor r15,r15,r5;}
       {add r15,r15,1h,z;}

 {cjp nz, next;}
\----------------------------------------------------------------------------------

       org PLUS
       {and r0,r1,300h; load rm, flags;}
       {cjp not rm_z, exit;}  \ якщо непряма адресацiя вихід

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,0e0h,z;}
       {and nil,r1,r0; oey; ewl;} \ РАД(15-0)=r11(7-5)

read4  {cjp rdm, read4; r; or r11,bus_d,z;} \ зчитування операнда DD з ОП в r13

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,7h,z;}
       {and nil,r1,r0; oey; ewl;} \ РАД(15-0)=r11(2-0)

read5  {cjp rdm, read5; r; or r12,bus_d,z;} \ зчитування операнда SS з ОП в r14

       {add r11,r11,r12,z;}

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,0e0h,z;}
       {and nil,r1,r0; oey; ewl;} \ РАД(15-0)=r11(7-5)

write1 {cjp rdm, write1; w; or nil,r11,z; oey;}

       {cjp nz, next;}

\----------------------------------------------------------------------------------

       org JUMP
       {and r0,r1,400h; load rn, flags;} \перевiрка типу адресацiї
       {cjp not rn_z, exit;}

       {xor nil,r0,r0; oey; ewh;}   \зчитуємо значення мiтки
       {and r0,r1,3ffh;}     \для переходу
       {or nil,r0,z; oey; ewl;}

read6  {cjp rdm, read6; r; or r0,bus_d,z; load rn, flags;}

       {xor r7,r7,r7;}
       {or r7,r7,r0; cjp nz, next;}

\----------------------------------------------------------------------------------

    org INPUT
    {and r0,r1,400h; load rn, flags;}    \ перевiрка типу адресацiї
       {cjp not rn_z, exit;}

    {xor nil,r0,r0; oey; ewh;}
    {and r0,r1,3ffh;}
    {or nil,r0,z; oey; ewl;}

    {or r3,bus_d,z;}
    {and r4,r3,0080h; load rm, flags;}
    {cjp rm_z, exit;}

    {add r0,r0,2h;}

    {xor nil,r0,r0; oey; ewh;}
    {or nil,r0,z; oey; ewl;}

read9  {cjp rdd, read9;i;or r15, bus_d,z;}

    {cjp nz, next;}

\----------------------------------------------------------------------------------

    org OUTPUT
    {and r0,r1,400h; load rn, flags;}    \ перевiрка типу адресацiї
    {cjp not rn_z, exit;}

    {xor nil,r0,r0; oey; ewh;}
    {and r0,r1,3ffh;}
    {or nil,r0,z; oey; ewl;}

    {or r3,bus_d,z;}
    {and r4,r3,0080h; load rm, flags;}
    {cjp rm_z, exit;}

    {add r0,r0,2h;}

    {xor nil,r0,r0; oey; ewh;}
    {or nil,r0,z; oey; ewl;}

write2 {cjp rdd, write2; o;or nil,r15,z; oey;}

    {cjp nz, next;}

\----------------------------------------------------------------------------------

next   {add r7,r7,z,nz;} \ формування адреси наступної команди
       {cjp nz, begin;}

\----------------------------------------------------------------------------------

exit   {}
