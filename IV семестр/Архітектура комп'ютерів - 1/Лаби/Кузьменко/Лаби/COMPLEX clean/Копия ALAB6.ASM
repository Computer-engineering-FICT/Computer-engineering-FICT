       dw 00h:0111010000001100%         \lab0:    jnset lab1
       dw 01h:0110110000001010%         \одноадр.   1101 - mul
       dw 02h:1000110100001001%         \двуадр. косв. регистровая
                                        \r0 = r0 & r1
       dw 03h:0111110000001011%         \jmp lab0

       dw 0Ah:0000000000100000%         \операнд умножения в ОП
       dw 0Bh:0000000000000000%         \операнд безусловного перехода
       dw 0Ch:0000000000000001%         \операнд условного перехода

       link     l3:ct
       link     l1:rdm
       link     ewh:16

       accept    r0:111111100001%
       accept    r1:100001111111%
       accept    r7:0
       accept   r15:0FF80h

\---------------------------------------------------------------
\       r7  - ip
\       r8  - регистр команд
\       r9  - регистр команд, 1й операнд умножения
\       r10 -
\       r11 - счетчик циклов умножения
\       r12 -
\       r13 - знак при умножении
\       r14 - старшее слово сумматора
\       r15 - аккумулятор, 2й операнд умножения
\---------------------------------------------------------------
        include macro.inc
\ Выборка команды из памяти
Start
\{sub nil,r7,2,z;load rm,flags;cem_c;}  Декремент и про-
\{cjp rm_z, end;}    верка на нуль счетчика (R11)
       {ewh;oey;xor nil,r7,r7;}         \Получаем из r7 адрес команды
       {ewl;oey;or nil,r7,r7;}
r_w    {cjp rdm,r_w;R;or r8,bus_d,z;}   \Цикл чтения в r8

\ Определение формата команды
\ {and rq,r8,1000000000000000%;load rm,flags;}
\ {cjp not rm_z,two_adr;} если двухадресная
\ {jmp one_adr;}

\Команда одноадресная ?
       {or sll,R9,R8,Z;}             \R9:=R8; и анализ ком-ды в R8
       {cjp rm_c,two_adr;}           \R9[15]=1 - ком-да 2-х адpесная
       {jmp one_adr;}

\ перевод из dk в положительное пк (регистр r15 и r15)
dk2pk
   {or  r13,0,z;}             \ записать в r13 нуль
   {or  sll,r12,r9,z;}        \ проверить знаковый разряд r9
   {cjp not rm_c, oklevel1;}  \ если положительное, то не трубуется перевода
   {add r9,r9,0ffffh,z;}      \ отнять 1 от r9
   {xor r9,r9,0ffffh;}        \ проинвертировать все разряды (включая знак)
   {or  r13,1,z;}             \ записать в r13 единицу в младший разряд
oklevel1

   {or  sll,r12,r15,z;}       \ проверить знаковый разряд r15
   {cjp not rm_c, oklevel2;}  \ положительное не требует перевода
   {add r15,r15,0ffffh,z;}    \ отнять 1 из r15
   {xor r15,r15,0ffffh;}      \ проинвертировать все разряды
   {add r13,r9,z,nz;}         \ прибавить 1 к знаку результата
oklevel2
   {ret;}                     \ отдать управление
\dk2pk endp


\корректировка знака результата r14
nres
   {or  srl,r12,r13,z;}       \ проверить младший разряд регистра r13
   {cjp not rm_c, exitret;}  \ положительный результат
   {or  r14,r14,8000h;}      \ если результат отрицательный, то меняем знак результата
exitret
   {ret;}                    \ отдать управление


mul_it
          {or  r14,0,z;}          \Обнуление r14
          {or  r11,17,z;}         \R11 - счетчик циклов

          {cont;load rm, z;}      \Обнуление RM
label1    {cjp not rm_c,label2;}  \Анализ цифры множителя
          {add r14,r14,r9,z;}     \Добавление множимого к r14
label2    {or srl,r14,r14,z;}     \Сдвиг в r14 и r15 суммы
          {or sr.9,r15,r15,z;}    \частичных произведений
          {sub r11,r11,z,z;load rm,flags;cem_c;} \Декремент и про-
          {cjp not rm_z, label1;} \верка на нуль счетчика (R11)
          {ret;}                  \результат r14:r15

\---------------------------------------------------------------------------
\
one_adr
          \{add  r7, r7, 1, z;}          увеличиваем r7
          {or   r9, r8, z; }

          {and  r9, r9, 111100000000000%;} \Команда умножения ?
          {sub  r9, r9, 110100000000000%, nz;load RM,Flags;}
          {cjp  not rm_z, notmul;}

          {or   r9, r8, z; }
          {or   r9, 0400h, z;}
          {and  nil,r8,r9;cjp not zo,i_mul;} \ Косвенная адресация ?
          {cjp nz,next;} \нет
i_mul

          \Читаем операнд по адресу из ОП в регистр R9

          {and r8,r8,3FFh;}
          {or  r12,r8,z;oey;ewl;}
          {r;or r9,BUS_D,z;cjp rdm,cp;}  \R9 - множитель

multiple
          {call dk2pk;}             \ преобразовать x и y в пк
          {call mul_it;}
          {call nres;}
          {add  r7, r7, 1, z;}
          {jmp  next;}
          \{jmp  set_new_ip;}

notmul
          {or   r9, r8, z; }
          {and  r9, r9, 111100000000000%;} \Безусловный переход ?
          {sub  r9, r9, 111100000000000%, nz;load RM,Flags;}
          {cjp  rm_z, ncjmp;}

          {or   r9, r8, z; }
          {and  r9, r9, 111100000000000%;} \Условный переход ?
          {sub  r9, r9, 111000000000000%, nz;load RM,Flags;}
          {cjp  rm_z, c_jmp;}
          {jmp  next;}

ncjmp     \Безусловный переход
          {or   r9, r8, z; }
          {or   r9, 0400h, z;}
          {and  nil,r8,r9;cjp zo,next;} \ Косвенная адресация ?

set_new_ip
          {and  r8,  r8, 3FFh;}
          {or   r12, r8, z; oey; ewl;}
          {r;   or r7,BUS_D,z; cjp rdm,cp;}  \R7 - new IP

          {jmp  next;}
c_jmp     \Условный переход
          {or   r9, r8, z; }
          {or   r9, 0400h, z;}
          {and  nil,r8,r9;cjp zo,next;} \ Косвенная адресация ?

          {and nil,r15,0000000001000000%; load rm,flags;}
          {cjp not rm_z, next;}         \ не удовлетвоpяет условию

          {jmp  set_new_ip;}

\обработка двухадресной команды
two_adr
          {or   r9, r8, z; }
          {and  r9, r9, 111110000000000%;} \Команда конъюнкции ?
          {sub  r9, r9, 000110000000000%, nz;load RM,Flags;}
          {cjp  not rm_z, next;}
          {or   r9, r8, z; }
          {and  r9, r9, 0111%;}
          {ewa; oey; or nil,r9,r9;load ra;}

          {or   r9, r8,z;}

          {and  r9, r9, 11100000%;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {or srl,r9,r9,z;}
          {ewb; oey; or nil,r9,r9;load rb;}

          {and  rb, rb, ra;}\{and  rb, rb, ra, nz;}
          {add  r7, r7, 1, z;}
          \{jmp  set_new_ip;}
next
          \{add  r7, r7, 1, z;}          увеличиваем r7
          {jmp  Start;}
end
          {add r7,2;}
          {}
