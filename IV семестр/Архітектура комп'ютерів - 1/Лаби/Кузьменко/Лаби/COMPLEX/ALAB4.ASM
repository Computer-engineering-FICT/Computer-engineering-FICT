link l3:ct
link l1: rdm
link ewh: 11
link m: z,z,z,z,z,z,14,13,12,11,z,z

accept R7: 100 \ Счетчик команд
accept R8: 0 \ Регистр команд
accept R14: 0 \ Регистр множителя и старших разрядов результата
accept R15: 8020h \ Аккумулятор, регистр множимого

dw 100: 0110100000001010% \ Команда в памяти
dw 10: 32 \ Операнд

{cjp nz,Begin;} \ Переход к началу программы
org 000000110100% {cjp nz,mul;}

\ Начало программы
Begin

\ *** 1 - Выборка команды ***

{ewh; oey; xor nil,R7,R7;} \ В EWH заносим 0 (нулевая страница)
{ewl; oey; or nil,r7,z;} \ В EWL заносим адрес команды
Wait1
{r; cjp rdm,Wait1; or r8,Bus_D,z;} \ Ждем чтение команды из памяти и
                                        \ заносим её в регистр команд
\ *** 2 - Распаковка команды ***

\ Определение формата команды
{and rq,r8,1000000000000000%;load rm,flags;}
{cjp not rm_z,goaway;} \Выход, если двухадресная
{and rq,r8,0000010000000000%;load rm,flags;}
{cjp not rm_z,goaway;} \Выход, если косвенная адресация

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

\ *** 4 - Формирование адреса следующей команды ***
GoAway
{add r7,2;}
{}
