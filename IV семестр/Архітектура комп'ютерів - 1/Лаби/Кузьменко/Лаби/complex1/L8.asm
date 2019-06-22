link l1:ct
link l2:rdm
link l3:rdd
link ewh:16
link m:z,z,z,z,z,z,z,z,14,13,12,11
link ra:z,2,1,0
link rb:z,7,6,5

\значения регистров
accept r0:31h
accept r1:32h
accept r7:0006h

accept dev[1]:i, 82h, 84h, 3, 12
accept dev_buf[1]: 5h, 12h, 10h
accept dev[2]:o, 02h, 04h, 3, 12

dw 2:80h      \РС второго ЗП

\код прогрммы
dw 6  :4871h  \test
dw 7  :3873h  \in
dw 8  :1830h  \mov to mem
dw 9  :4871h  \test
dw 0ah:3873h  \in
dw 0bh:1831h  \mov to mem
dw 0ch:4871h  \test
dw 0dh:3873h  \in
dw 0eh:1832h  \mov to mem
dw 0fh:8909h  \subt
dw 10h:2030h  \mul
dw 11h:4072h  \out
dw 12h:1030h  \swap
dw 13h:4072h  \out
dw 14h:5000h  \exit

\данные
dw 30h:0000h  \значение Z
dw 31h:0000h  \значение X
dw 32h:0000h  \значение Y

dw 70h:2      \адрес на адрес РС второго ЗП
dw 71h:82h    \адрес на адрес РС первого ЗП 
dw 72h:74h    \адрес на адрес РД второго ЗП
dw 73h:75h    \адрес на адрес РД первого ЗП
dw 74h:4      \адрес РД второго ЗП
dw 75h:84h    \адрес РД первого ЗП
dw 82h:80h    \РС первого ЗП

\векторы команд
org 0h
{cjp nz, unpack;}
org 1h
{cjp nz, subt;}
org 2h
{cjp nz, swap;}
org 3h
{cjp nz, movtomem;}
org 4h
{cjp nz, mul;}
org 5h
{cjp nz, cjmp;}
org 6h
{cjp nz, jmp;}
org 7h
{cjp nz, idev;}
org 8h
{cjp nz, odev;}
org 9h
{cjp nz, tdev;}
org 0ah
{cjp nz, exit;}

org 20h
\разпаковка команды
unpack
{or nil, r7, z; oey; ewl;}
{r; cjp rdm, cp; add r8, bus_d, z;}
{or nil, r8, z; cjp no, tadr;}
{xor r9, r9, r9;}
{add r9, r9, 0400h;}
{and nil, r9, r8; cjp not zo, exit;}
{xor r9, r9, r9;}
{add r9, r9, 3ffh;}
{and nil, r8, r9; oey; ewl;}
{r; cjp rdm, cp; add r12, bus_d, z;}
\селектор команды
{or nil, r8, z; oey; jmap;}

\инкрементация ЛК
inc
{add r7, r7, z, nz; cjp nz, unpack;}

\обработка двухадресной команды
tadr
{and r9, r8, 0318h;}
{xor nil, r9, 0108h; load rm, flags;}
{cjp not rm_z, exit;}
{or nil, r8, z; oey; load ra; load rb;}
{or nil, r8, z; oey; jmap;}

\загрузка из памяти
loadm
{or nil, r12, z; ewl; oey;}
{r; cjp rdm, cp; or r12, bus_d, z;}
{crtn nz;}

\операция вычитания
subt
{or nil, ra, z; oey; ewl;}
{r; cjp rdm, cp; or r14, bus_d, z;}
{or nil, rb, z; oey; ewl;}
{r; cjp rdm, cp; or r15, bus_d, z;}
\{or nil, rb, z; oey; ewl;}
{sub r15, r15, r14, nz;}
{or nil, r15, z; oey; w; cjp rdm, cp;}
{cjp nz, inc;}

\операция умножения
mul
{load rm, z;}
{xor r14, r14, r14;}
{xor r13, r13, r13;}
{or r13, r13, 17;}
{xor nil, r12, r15; load rn, flags;}
{or nil, r12, r12; cjp not no, invert;}
{sub r12, 0, r12, z;}
invert
{or nil, r15, r15; cjp not no, imul;}
{sub r15, 0, r15, z;}
imul
{and r15, r15, 07fffh;}
{or nil, r12, z; load rm, z; cjp not no, cond1;}
{sub r12, 0, r12, nz;}
cond1 {cjp not rm_c, cond2;}
{add r14, r14, r12, z;}
cond2 {or srl, r14, r14, z;}
{or sr.9, r15, r15, z;}
{sub r13, r13, z, z; cjp not zo,cond1;}
{cjp not rn_n, continue;}
{or r14, r14, 8000h;}
continue
{cjp nz, inc;}

\условный переход
cjmp
{and nil, r15, 0080h; load rm, flags;}
{cjp not rm_z, inc;}
{or r7, r7, r12; cjp nz, unpack;}

\безусловный переход
jmp
{or r7, r12, z; cjp nz, unpack;}

\проверка готовности ЗП
tdev
{cjs nz, loadm;}
{and nil, r12, 0080h; load rm, flags;}
{cjp nz, inc;}

\считывание с ЗП
idev
{cjs nz, loadm;}
{or nil, r12, z; oey; ewl;}
{i; cjp rdd, cp; or r15, bus_d, z;}
{cjp nz, inc;}

\записывание на ЗП
odev
{cjs nz, loadm;}
{or nil, r12, z; oey; ewl;}
{o; cjp rdd, cp; or nil, r15, z; oey;}
{cjp nz, inc;}

\запись в память из регистра R15
movtomem
{and nil, r8, r9; oey; ewl;}
{or nil, r15, z; oey; w; cjp rdm, cp;}
{cjp nz, inc;}

\запись R14 в R15
swap
{xor r15, r15, r15;}
{or r15, r15, r14;}
{cjp nz, inc;}

\конец программы
exit {}
