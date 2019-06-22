dw 0c0h:0fffh \ A
dw 0cah:00c0h \ address

dw 0d0h : 40h \ address of start

accept r14:8fffh \ B

link l1:CT
link l2:RDM
link EWH : 16
link M : z,z,z,z,14,13,12,11,z,z,z,z

accept r7 : 040h
accept r15 : 11h

\---------------
\---------------

org 000h
{cjp nz, UNPACK; }

org 010h
{add nil, r15, z, z; load RM, flags; }
{cjp RM_Z, END; }
{cjp nz, NEXTCOMAND; }

org 020h
{cjp nz, MULTIPLY; }

org 030h
{xor r7, r7, r7  ; }
{add r7, r7, r10, z; }
{cjp nz, UNPACK; }

\---------------
\---------------

dw 40h: 0000100000000000% \ CJP
dw 42h: 0001010011001010% \ MULTIPLY
dw 44h: 0001100011010000% \ JMP

\---------------
\---------------

UNPACK \
 {or nil, r7, r7; oey; ewl;} \ Виставити ЛК на ШД і записати в РАдр
 ReadComand {r; cjp RDM, ReadComand; or r8, z, BUS_D; } \ Зчитати команду

 {add nil, r8, z, z; cjp NO, END; } \ Перевірити тип команди. Завершити виконання, якщо команд�

 {and r10, r8, 03ffh; } \ Скопіювати операнд в РА
 {and nil, r8, 0400h; load RM, flags; } \ Перевірити тип адресації
 {cjp RM_Z, DIRECT; } \ Перехід до прямої адресації за умови "0" в 10 біті

 INDIRECT
  {xor nil, r10, z; oey; ewl; } \ Виставити РА на ШД і записати в РАдр
  ID1 {r; cjp RDM, ID1; add r10, BUS_D, z; } \ Зчитати в РА операнд по адресі з РАдр.

 DIRECT
  {xor nil, r10, z; oey; ewl; } \ Виставити РА на ШД і записати в РАдр
  D1 {r; cjp RDM, D1; add r10, BUS_D, z; } \ Зчитати в РА операнд по адресі з РАдр.

 COMMAND
  {or nil, r8, z; oey; jmap; } \ Перейти до виконання операції

\---------------
\---------------

MULTIPLY
\----
{xor r11, r11, r11; }
{xor r11, r11, r10; }
\----
{cont; load RM, z; }
\----
{xor r13, r13, r13; }
{xor r12, r12, r12; }
\----
{xor nil, r11, r14; load RN, flags;}
\----
SignX
{and nil, r14, 8000h; load RM, flags;}
{cjp not RM_N, SignY;}
{xor r14, r14, 8000h;}
SignY
{and nil, r11, 8000h; load RM, flags;}
{cjp not RM_N, SUM;}
{sub r11, z, r11, nz;}
{cjp RM_N, SUM;}
{xor r11, r11, 8000h;}
\----
SUM
{cjp not RM_C, SHL;}
{add r12, r12, r11, z; load RM, flags;}
{add r13, r13, z, RM_C;}
SHL
{or sll, r12, r12, z;}
{or sl.25, r13, r13, z;}
{or sll, r14, r14, z;}
{sub r15, r15, z, z; load RM, flags;cem_c;}
{cjp not RM_Z, SUM;}
\----
RESULT
{or srl, r13, r13, z;}
{or sr.9, r12, r12, z;}
{cjp not RN_N, NEXTCOMAND;}
{or r13, r13, 8000h;}

{cjp nz, NEXTCOMAND; }

\---------------

NEXTCOMAND
{add r7, r7, 02H; } \ Ð—Ð±Ñ–Ð»ÑŒÑˆÐ¸Ñ‚Ð¸ Ð›Ðš Ð½Ð° 2
{cjp nz, UNPACK;} \ ÐŸÐµÑ€ÐµÐ¹Ñ‚Ð¸ Ð´Ð¾ Ñ€Ð¾Ð·Ð¿Ð°ÐºÐ¾Ð²ÐºÐ¸ Ð½Ð°ÑÑ‚ÑƒÐ¿Ð½Ð¾Ñ— Ð

\---------------

END {} \ ÐšÑ–Ð½ÐµÑ†ÑŒ
