
       dw 02h:0001100000001010%         \одноадр.   0011 - mul
       dw 00h:1000001100011001%         \двуадр. автодекрементная 00000 - plus
                                        \r0 = r0 + r1

       dw 05h:0005         \операнд1 в ОП для двухадресной
       dw 0Bh:0FFFCh       \операнд2 в ОП для двухадресной
       dw 10: 0fffh        \операнд1 для одноадресной


       link     l3:ct
       link     l1:rdm
       link m: z,z,z,z,z,z,14,13,12,11,z,z
       link     ewh:16


       accept    r0:11
       accept    r1:5
       accept    r7:0
       accept R15: 8fffh  \операнд2 для одноадресной

\---------------------------------------------------------------
\       r7  - ip
\       r8  - регистр команд
\       r9  - регистр команд
\---------------------------------------------------------------
        include macro.inc

{cjp nz,Start;} \ Переход к началу программы
org 000000001100% {cjp nz,mul;}

\ Выборка команды из памяти
Start
       {ewh;oey;xor nil,r7,r7;}         \Читаем в r8, [r7]
       {ewl;oey;or nil,r7,r7;}
r_w    {cjp rdm,r_w;R;or r8,bus_d,z;}   \Цикл чтения
       {add  r7, r7, 2, z;}             \увеличиваем r7

\Команда одноадресная ?
       {and nil,R8,1000000000000000%;load rm,flags;}  \анализ команды в R8
       {cjp not rm_z,two_adr;}           \команда 2-х адpесная
       {jmp one_adr;}

\---------------------------------------------------------------

\
one_adr

{and rq,r8,0000010000000000%;load rm,flags;}
{cjp not rm_z,next;} \Выход, если косвенная адресация

{and rq,r8,0000001111111111%;}\ В RQ формируем адрес операнда
{ewl; oey; or rq,z;} \ В EWL заносим адрес операнда
Wait2{r; cjp rdm,Wait2; or r14,Bus_D,z;} \ Ждем чтение переменной из памяти и
                                        \ заносим её в регистр операнда
{and rq,r8,0111100000000000%;}
{jmap; or rq,z; oey;}

\ *** 3 - Выполнение команды ***
Mul
\r10 - Счетчик
\r11 - Операнд в ПК (был в r15)
\r12 - в r12 сдвигается r11
\r13 - Операнд в ДК (был в r14)
\r14 - Старшие разряды результата
\r15 - Младшие разряды результата

\Подготавливаем регистры
      {or r10,15,z;}
      {or r11,r15,z;}
      {xor r12,r12,r12;}
      {or r13,r14,z;}
      {xor r14,r14,r14;}
      {xor r15,r15,r15;}

\Переводим r13, знак - в r14

      {add r13,r13,0,z;load rm,flags;}
      {cjp not rm_n,label2;}
      {add r14,1000000000000000%,z;}
      {nxor r13,r13,0;}
      {add r13,r13,1,z;}

\Запоминаем в r14 знак
label2
      {add r11,r11,0,z;load rm,flags;}
      {cjp not rm_n,label3a;}
      {xor r14,1000000000000000%;}
      {and r11,0111111111111111%;}

\Сдвигаем r13 два раза для синхронизации
label3a
      {or srl,r13,r13,z;load rm,flags;cem_c;}
      {or sr.9,r12,r12,z;}
      {or srl,r13,r13,z;load rm,flags;cem_c;}
      {or sr.9,r12,r12,z;}

\Умножаем, ответ в r14-r15
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
\обработка двухадресной комманды
two_adr


          {or   r9, r8, z; }            \r9:=r8
          {and  r9, r9, 0111110000000000%;load rm,flags;} \команда сложения?
          {cjp  not rm_z, notplus;}

          {or   r9, r8, z; }                \r9:=r8
          {and  r9, r9, 0000001100011000%;} \автодекрементная?
          {sub  r9, r9, 0000001100011000%, nz;load RM,Flags;}
          {cjp  not rm_z, not_autodr;}

          {or   r9, r8, z; }                 \r9:=r8
          {and  r9, r9, 111%;}               \узнаем второй регистр
          {ewa; oey; or nil,r9,r9;load ra;}  \читаем второй регистр в ra

          {or   r9, r8,z;}                   \r9:=r8
          {and  r9, r9, 11100000%;}          \узнаем первый регистр
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {ewb; oey; or nil,r9,r9;load rb;} \читаем первый регистр в rb

        \переписываем адреса операндов в r12 и r13
        {or r12,ra,z;}
        {oey; or rq,rb,z;}
        {or r13,rq,z;}

        {ewh;oey;xor nil,r12,r12;}         \Читаем в r10, [ra]
        {ewl;oey;or nil,r12,r12;}
r_w1    {cjp rdm,r_w1;R;or r10,bus_d,z;}   \Цикл чтения

        {ewh;oey;xor nil,r13,r13;}         \Читаем в r11, [rb]
        {ewl;oey;or nil,r13,r13;}
r_w2    {cjp rdm,r_w2;R;or r11,bus_d,z;}   \Цикл чтения

          {add r11,r11,r10,z;load rm,flags;} \r11:=r11+r10

writeres
          {ewh;oey;xor nil,r13,r13;}
          {ewl;oey;or nil,r13,r13;}
          {cjp rdm,writeres;w;or nil,r11,z;oey;} \запись результата в память

          {xor r14,r14,r14;}   \r14:=0
          {or r14,r14,1h;}     \r14:=1
          {sub rb,rb,r14,nz;} \автодекремент [rb] - первого регистра

          {or   r9, r8,z;}              \r9:=r8
          {and  r9, r9, 111%;}          \узнаем второй регистр
          {ewb; oey; or nil,r9,r9;load rb;} \читаем второй регистр в rb
          {sub rb,rb,r14,nz;} \автодекремент [rb] - второго регистра

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
