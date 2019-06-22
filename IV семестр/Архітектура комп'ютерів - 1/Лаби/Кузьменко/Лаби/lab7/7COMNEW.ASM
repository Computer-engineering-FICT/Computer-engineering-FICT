\*****задаем начальную команду*****\
accept r7:1515h  \наша начальная команда лежит по адресу

\*****задаем команды*****\
dw 1515h:2C05h   \команда 1, ввод
dw 1517h:1404h  \команда 2, умножение, r4 на r15
dw 1519h:1C03h  \команда 3, условный переход
dw 151Bh:8022h
dw 151Dh:3406h \команда 4,вывод
dw 151Fh:800h
\dw 1519h:2400h\ \команда 2, безусловный переход
\dw 1517h:1404h\  \команда 3, умножение, r4 на r15
\dw 1519h:8022h\  \команда 4, сложение, r1 и r2
\dw 151Dh:400h\
\dw 1513h:2C05h\ \input
\dw 1511h:3406h\ \output

dw 41h:22h
dw 42h:0A2h

\*****Установка начальных значений в регистрах*****\
accept r1:4  \первый операнд для сложения
accept r2:8  \второй операнд для сложения

accept dev[1]:i,22h,24h,7,16
accept dev[2]:o,0A2h,0A4h,3,10
accept dev_buf[1]:0Ah,1111h,0abcdh

accept r3:202h \условый переход
dw 202h:1517h

accept r4:101h  \в r4 записан адрес второго операнда для умножения
dw 101h:2   \второй операнд для умножения, ДК

accept r5:41h
accept r6:42h


\accept r15:0ah\  \аккумулятор, первый операнд для сложения, ПК

equ myAdd:100000000000%   \добавление
equ myMulty:000101000000%  \умножение
equ condJump:000111000000%  \условный переход
equ unCondJump:001001000000% \безусловный переход
equ input:001011000000%   \ввод
equ output:001101000000%  \вывод


equ begin:000000000000%


link l1:rdm
link l2:ct
link l3:rdd
link rb:3,2,1,0
link m:15,14,13,12,11,10,z,z,z,z,z,z \адреса переходу на множення

org begin
\*****выдача адреса*****\
{add nil,r7,z;oey;ewl;}\достаем команду по адресу который лежит в r7
{r;add r8,bus_d,z;cjp rdm,cp;}

\*****распаковка и загрузка операндов*****\
{add nil,r8,z;cjp no,twoAddress;} \проверка-одноадресная или двухадресная команда


\*****Обработка одноадресных команд*****\
 \*****Проверка типа адресации*****\
 {xor r9,r9;}
 {add r9,r9,0000010000000000%;}
 {and nil,r9,r8;cjp zo,end;}

 {add nil,r8,z;oey;jmap;}

 {cjp nz,end;}\если ни одна команда не совпадает-выход

 \*****Умножение*****
 org myMulty
  {add nil,r8,z;oey;ewb;}
  {add nil,rb,z;oey;ewl;}
  {r;add r13,bus_d,z;cjp rdm,cp;}\записываем 2-й операнд в r13\
  {xor r12,r12;}
  {or r12,r12,r15;}
  {xor r15,r15;}
  {xor r11,r11,r11;}
  {xor r10,r10,r10;}
  \--------------
      {add rq,rq,r12,z;}
      {xor rq,r13;}
      {or r12,r12,z; load rm, flags;}
      {cjp not rm_n , tem;}
      {xor r12,r12,8000h;}
  tem
      {or r13,r13,z;load rn,flags;}
      {cjp not rn_n, labe1;}
      {xor r13,0ffffh;}
      {add r13,r13,1,z;}
  labe1
      {or sr.2,r13,r13,z;}
      {or sr.9,r11,r11,z;}
  labe
      {or r12,r12,z;load rm, flags;}
      {cjp not rm_n,label1;}
      {add r14,r14,r11,z;load rm,flags;}
      {cjp not rm_c,next;}
      {add r15,r15,1,z;}
  next
      {add r15,r15,r13,z;}

  label1 {or sr.2,r13,r13,z;}
      {or sr.9,r11,r11,z;}
      {or sll,r12,r12,z;load rm,flags;}
      {cjp not rm_z ,labe;}
  {or rq,rq,z; load rn,flags;}
  {cjp not rn_n, nminus;}
  {xor r14,r14,0FFFFh;}
  {xor r15,r15,0FFFFh;}
  {add r14,r14,z,nz;}
  {cjp not rm_c,jump;}
  {add r15,r15,z,nz;}
  jump{}
  nminus
  {or r10,r15,z;}
  {or r15,r14,z;}
  {or r14,r10,z;}
  {cjp nz, nextCom;}
 \*****Конец умножения*****

 \*****Условный переход*****
 org condJump
 {xor r10, r10;}
 {add r10, 80h;}
 \******

 \*****
 {and nil, r10, r15; cjp zo, unCondJump;}
  {cjp nz, nextCom;}

 \*****Безусловный переход*****
 org unCondJump
 \******
{add nil,r8,z;oey;ewb;}
  {add nil,rb,z;oey;ewl;}
  {r;add r12,bus_d,z;cjp rdm,cp;}
 {xor r7,r7;}
 {or r7,r12;}
{sub r7,r7,1,z;}
{cjp nz,nextCom;}

\*****Ввод*****\
org input
{xor r15,r15;}
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;add r12,bus_d,z;cjp rdm,cp;}
{or nil,r12,z;oey;ewl;}
regStnDev {cjp rdd, regStnDev; i; or rq, BUS_D, z;}
{and nil, rq, 0080h; load rm, flags;}\проверка бита готовности
{cjp rm_z, nextCom;}
{add r12, r12, 2h, z;}
{or nil, r12, z; oey; ewl;}
readdev {cjp rdd, readdev; i; or r15, BUS_D, z;}
{cjp nz, nextCom;}


\*****Вывод*****\
org output
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;add r12,bus_d,z;cjp rdm,cp;}
{or nil,r12,z;oey;ewl;}
regStnDev2 {cjp rdd, regStnDev2; i; or rq, BUS_D, z;}
{and nil, rq, 0080h; load rm, flags;}\проверка бита готовности
{cjp rm_z, nextCom;}
{add r12, r12, 2h, z;}
{or nil, r12, z; oey; ewl;}
writeDev {cjp rdd, writeDev;o; or r15,z; oey; o;}
{cjp nz, nextCom;}


\*****Конец обработки одноадресных команд*****\

\*****Обработка двухадресных команд*****\
twoAddress{}
 
 {xor r9,r9;}
 {xor r10,r10;}
 {add r9,0111110000000000%;}
 {or r10,0000000000000000%;}
 {and r9,r9,r8;}
 {xor nil,r9,r10; cjp not zo,end;}
 
  {add nil,r8,z;oey;jmap;}

 \*****суммируем 2 числа*****\
 org myAdd
  {xor r9,r9,r9;}
  {add r9,r9,300h;}\определяем ПР или НП адр. для 1 операнда
  {xor r9,r9,r8;cjp zo, end;}

  {xor r9,r9,r9;}
  {add r9,r9,18h;}\определяем ПР или НП адр. для 2 операнда
  {xor r9,r9,r8;cjp zo, end ;}

  {xor r9,r9,r9;}
  {add r9,r9,0e0h;}\считываем первый элемент из памяти
  {and r9,r9,r8;}
  {push nz,4;}
  {or sr.6,r9,r9,z;}
  {rfct;}
  {add nil,r9,z;oey;ewa;}
  {add nil,ra,z;oey;ewl;}
  {xor r11,r11,r11;}
  {add r11,r11,ra;}
  {xor r9,r9,r9;}
  {add r9,r9,7h;} \считываем второй операнд из памяти
  {and r9,r9,r8;}
  {add nil,r9,z;oey;ewa;}
  {xor r10,r10,r10;}
  {add r10,r10,ra;}

  {add r11,r11,r10;} \результат в r11
  {xor r9,r9,r9;}
  {add r9,r9,0000000011100000%;}
  {and r9,r9,r8;}
  {push nz,4;}
  {or sr.6,r9,r9,z;}
  {rfct;}   \счетчик, декремент
  {add nil,r9,z;oey;ewb;}
  {add rb,r11,z;}
  {cjp nz, nextCom;}
 \*****Конец суммирования*****

\*****Конец обработки двухадресных команд*****\

\*****Формирование адреса следующей команды*****\
nextCom{}
{add r7,r7,2,z;} \формирование следующей команды
{cjp nz,begin;}
end{}
