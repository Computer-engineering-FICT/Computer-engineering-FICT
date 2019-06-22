
       dw 01h:0010110000001010%         \одноадр.   0101 - mul
       dw 00h:1000010100001001%         \двуадр. косв. регистровая
                                        \r0 = r0 - r1

       dw 0Ah:0000111111111111%         \операнд в ОП

       link     l3:ct
       link     l1:rdm
       link     ewh:16

       accept    r0:10
       accept    r1:5
       accept    r7:0
       accept   r15:8fffh

\---------------------------------------------------------------
\       r7  - ip
\       r8  - регистр комманд
\       r9  - регистр комманд,1й операнд умножения
\       r10 -
\       r11 - счетчик циклов умножения
\       r12 -
\       r13 - знак при умножении
\       r14 - старшее слово сумматора
\       r15 - аккамулятор, 2й операнд умножения
\---------------------------------------------------------------
        include macro.inc
\ Выборка комманды из памяти
Start
       {ewh;oey;xor nil,r7,r7;}         \Читаем в r8, [r7]
       {ewl;oey;or nil,r7,r7;}
r_w    {cjp rdm,r_w;R;or r8,bus_d,z;}   \Цикл чтения

\Команда одноадоесная ?
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
   {or  r13,1,z;}              \ записать в r13 единицу в младший разряд
oklevel1

   {or  sll,r12,r15,z;}       \ проверить знаковый разряд r15
   {cjp not rm_c, oklevel2;}  \ положительное не требует перевода
   {add r15,r15,0ffffh,z;}    \ отнять 1 из r15
   {xor r15,r15,0ffffh;}      \ проинвертировать все разряды
   {add r13,r9,z,nz;}          \ прибавить 1 к знаку результата
oklevel2
   {ret;}                     \ отдать управление
\dk2pk endp


\корректировка знака результата r14
nres
   {or  srl,r12,r13,z;}       \ проверить младший разряд регистра r13
   {cjp not rm_c, exitret;}  \ положительный результат
   {or  r14,r14,8000h;}      \ если результат отрицательный, то
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
          {add  r7, r7, 1, z;}          \увеличиваем r7
          {or   r9, r8, z; }

          {and  r9, r9, 111100000000000%;} \Комманда умножения ?
          {sub  r9, r9, 010100000000000%, nz;load RM,Flags;}
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
          {jmp  next;}

notmul
          {jmp  next;}

\обработка двухадресной комманды
two_adr

          {add  r7, r7, 1, z;}          \увеличиваем r7
          {or   r9, r8, z; }
          {and  r9, r9, 111110000000000%;} \Комманда вычитания ?
          {sub  r9, r9, 000010000000000%, nz;load RM,Flags;}
          {cjp  not rm_z, notsub;}

          {or   r9, r8, z; }
          {and  r9, r9, 0000001100011000%;} \Комманда вычитания ?
          {sub  r9, r9, 0000000100001000%, nz;load RM,Flags;}
          {cjp  not rm_z, not_dr;}
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

          {sub  rb, rb, ra, nz;}
inf
          {jmp  next;}

not_dr    {jmp  next;}
notsub
          {jmp  next;}
next
          {jmp  Start;}
end
          {}
