link l1: ct
link l2: rdm
link ewh: 16
link m: z,z,z,z,z,z,z,14,13,12,11,10


dw 0011h: 08ffh \ одноадресна команда 0 0001 0 00 1111 1111
dw 0012h: 400bh
dw 0013h: 08ffh
dw 0014h: 8022h \ двохадресна команда 1 00011 00 001 00 010
dw 0015h: 600ah
dw 0ffh: 0000000000000010%  \ множник
dw 0ah:   0012h \ адреса безумовного переходу
dw 0bh:   0013h \ адреса умовного переходу

accept r7: 0011h            \команда на виконання
accept r1: 0000000000000001%
accept r2: 0000000000000011%
accept r3: 0000000000000001%
accept r14: 0h \Z(8-15) результат старшi бiти результату
accept r15: 000000000000001% \Z(0-7)  молодшi бiти результату


include macro.inc
          {cjp not z, loading;}
\org 000000000011% {cjp nz, double;}
\org    000000000010% {cjp nz, multing;}

\--------------------------------------------------------------------------
\-----------------РОБОТА З ПАМ'ЯТТЮ----------------------------------------
\--------------------------------------------------------------------------


loading   {xor nil, r13,r13; oey; ewh;} \  обнуляэмо регicтер адреси
          {or nil, r7,z; oey; ewl;}  \

comread   {cjp rdm, comread; r; or r11,bus_d,z; load rm, flags;}   \ зчитуэмо команду
          {xor r13, r13;}
          {and r13, r11, 8000h; load rm, flags;}
          {cjp not rm_z, double;} \  якщо формат не той = на вихiд

          {xor r13, r13;}
          {and r13, r11, 400h; load rm, flags;}   \  якщо непряма адресацiя = на вихiд
          {cjp not rm_z, exit;}                   \

          {xor r13, r13;}
          {and r13,r11,0111100000000000%;}
          {sub r13, 0000100000000000%, nz; load rm, flags;}
          {cjp not rm_z, notmult;}


multing   {xor nil, r13,r13; oey; ewh;}         \
          {or r13, 3ffh, z;}                   \ завантажуэмо в РАД адресу
          {and nil, r11, r13; oey; ewl;}        \ операнду

readop    {cjp rdm, readop; r; or r13, bus_d, z;}  \ зчитуэмо операнд

\------------------------------------------------------------------------
\-----------------------МНОЖЕННЯ-----------------------------------------
\------------------------------------------------------------------------
          {xor r10, r10;}
          {or r10, r15;}   \
          {xor r15, r15;}   \
          {or r11, r10;}     \
          {or r9, r13;}       \   видiлення знаку вiд числа
          {or sll, r10,r10;}   \
          {or sll, r13,r13;}    \
          {or srl, r10,r10;}     \
          {or srl, r13,r13;}      \
          {xor r11, r10;}           \
          {xor r9, r13;}            \
          {add r11,r9;}               \

multstart {load rm, flags;}
extag     {or srl, r13,r13,z;}               \R13=0.r(R13)
          {cjp not rm_c,tag;}
          {add r15, r10;cjp not co, tag;}    \R15=R15+R10
          {add r14, r14, 1;}                 \R14=R14+1 якщо вiдбулось переповнення
tag       {or sll, r10, r10,z;}              \R10=l(R10).0
          {or r13,r13,z;cjp not zo, extag;}
          {or sll, r11,r11;}
          {cjp not rm_c, command;}
 minus    {add r14, r11;}                \
          {xor r15, 0ffffh;}              \ Переведення в доповняльний код
          {xor r14, 0ffffh;}               \
          {add r15, 1h;}
          {cjp not z, command;}
command   {add r7, r7, 1h;}        \  Перехiд до наступноъ команди
          {jmp ending;}       \


notmult   {xor r8, r8;}
          {and r8, r11, 0111100000000000%;}
          {xor r13, r13;}
          {sub r13, r8, 4000h, nz;load rm, flags;}
          {cjp rm_z, logjmp;}
          {xor r13, r13;}
          {sub r13, r8, 6000h, nz; load rm, flags;}
          {cjp rm_z, ordjmp;}
          {jmp exit;}


logjmp
          {and nil,r15,000000010000000%; load rm,flags;}
          {cjp not rm_z, exit;}         \

          {jmp  set_new_ip;}



ordjmp {}
set_new_ip
          {and  r11,  r11, 3FFh;}
          {or   r7, r11, z; oey; ewl;}
          {r;   or r7,BUS_D,z; cjp rdm,cp;}  \R7 - new IP

          {jmp  ending;}

double    {or r9, r11;}                 \   Перевiрка коректностi
          {and r9, 0111110000000000%;}   \  операцiъ
          {xor r9, 0h; load rm, flags;}   \
          {cjp not rm_z, exit;}            \

          {or r9, r11;}                  \
          {and r9, 0000001100011000%;}    \ Перевiрка адресацiъ
          {xor r9, 0h; load rm, flags;}    \
          {cjp not rm_z, exit;}             \

          {or r9, r11;}                       \
          {and r9, 0111%;}                     \ Визначення другого регiстру
          {ewa; oey; or nil, r9,r9; load ra;}   \

          {or r9, r11;}                        \
          {and r9, 11100000%;}                  \ Визначення першого регiстру
          {or srl, r9,r9,z;}                     \
          {or srl, r9,r9,z;}                      \
          {or srl, r9,r9,z;}                       \
          {or srl, r9,r9,z;}                        \
          {or srl, r9,r9,z;}                         \
          {ewb; oey; or nil, r9,r9; load rb;}         \

          {add rb, ra;}                          \ Додавання
          {add r7, r7,1h;}                     \  Наступна команда
          {jmp ending;}

          {add r7, r7,1h;}                     \  Наступна команда
ending    {jmp loading;}                   \
 exit     {}
