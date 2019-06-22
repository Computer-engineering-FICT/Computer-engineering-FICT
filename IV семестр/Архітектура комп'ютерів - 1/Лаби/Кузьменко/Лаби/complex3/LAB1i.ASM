link l1:ct
link l2:rdm
link l3:rdd
link l4:int
link ewh:16
link m:z,z,z,z,z,z,z,z,14,13,12,11
link ra:z,2,1,0
link rb:z,7,6,5
link vec[1]:00aeh
link vec[2]:00beh

\значения регистров
accept r0:23h
accept r1:21h
accept r7:0006h
accept r11:0d0h

accept dev[1]:i, 0c2h,0c4h, 3, 12
accept dev_buf[1]: 0ah, 2h, 5h
accept dev[2]:o, 0c6h,0c8h, 3, 12
accept dev[4]:i, 32h, 34h, 3, 12
accept dev_buf[4]: 0fffbh, 3h, 2h
accept dev[3]:o, 0b2h, 0b4h, 3, 12

\код прогрммы
dw 6  :3891h  \test
dw 7  :1893h  \in
dw 8  :3020h  \mov to mem
dw 9  :3891h  \test
dw 0ah:1893h  \in
dw 0bh:3021h  \mov to mem
dw 0ch:3891h  \test
dw 0dh:1893h  \in
dw 0eh:3022h  \mov to mem
dw 0fh:8909h  \andi

\int1
dw 00aeh:18a2h  \in
\dw 00afh:38a1h test
\dw 00b0h:20a3h out
dw 00afh: 4800h \return

dw 00beh:20a3h \out
dw 00bfh:4800h \return

dw 10h:7820h  \mul
dw 11h:2092h  \out
dw 12h:2800h  \switch
dw 13h:2092h  \out
dw 14h:4000h  \exit

\данные
dw 20h:0000h  \значение операнда Z
dw 21h:0000h  \значение операнда X
dw 22h:0000h  \значение операнда Y
dw 23h:0000h

dw 32h:80h    \РС первого ВУ
dw 0b2h:80h    \РС второго ВУ

dw 90h:0b2h   \адрес указывающий на адрес РС второго ВУ
dw 91h:32h    \адрес указывающий на адрес РС первого ВУ
dw 92h:94h    \адрес указывающий на адрес РД второго ВУ
dw 93h:95h    \адрес указывающий на адрес РД первого ВУ
dw 94h:0b4h   \адрес РД второго ВУ
dw 95h:34h    \адрес РД первого ВУ

dw 0a0h:0c2h
dw 0a1h:0c6h
dw 0a2h:0a4h
dw 0a3h:0a5h
dw 0a4h:0c4h
dw 0a5h:0c8h

dw 0c2h:80h
dw 0c6h:80h

\stack
dw 0d0h:0000h

\векторы команд
org 0h
{cjp nz, null;}
org 1h
{cjp nz, andi;}
org 2h
{cjp nz, jmp;}
org 3h
{cjp nz, inputd;}
org 4h
{cjp nz, outputd;}
org 5h
{cjp nz, switch;}
org 6h
{cjp nz, movtmem;}
org 7h
{cjp nz, testd;}
org 8h
{cjp nz, exit;}
org 9h
{cjp nz, return;}
org 0fh
{cjp nz, mul;}

null
{reset;}
{load mr, 11111001%;}
{cjp nz, decode;}

\разпаковка команд
decode
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
\селектор команд
{or nil, r8, z; oey; jmap;}

\инкрементация СК
inc
{add r7, r7, z, nz;}
interruption
{cjp int, decode;}
{or nil, r11,z;oey;ewl;}
{w;or nil, r7,z; oey;cjp rdm, cp;}
{add r11,2;}
{or nil,r11,z;oey;ewl;}
{w;or nil,r15,z;oey;cjp rdm,cp;}
{add r11,2;}
{ev;read vr;or r7,bus_d,z;}
{clr ir,vr;}
{cjp nz, decode;}


\операция умножения
mul
{load rm, z;}
{xor r14, r14, r14;}
{xor r13, r13, r13;}
{or r13, r13, 15;}
{xor nil, r12, r15; load rn, flags;}
{or nil, r12, r12; cjp not no, imul;}
{sub r12, 0, r12, nz;}
imul
{or r14, r15, r14;}
{xor r15, r15, r15;}
{or sll, r14, r14,z;}
cond1 {or nil, r14, r14;cjp not no, cond2;}
 {add r15, r15, r12;cjp not co, cond2;}
 {add r14, r14, 1, z;}
cond2 {or sll,r15,r15,z;}
{or sl.25,r14,r14,z;}
{sub r13, r13, z, z; cjp not zo,cond1;}
{or srl,r14,r14, z;}
{or sr.9,r15,r15,z;}
{cjp not rn_n, continue;}
{sub r14, 0, r14, z;}
{sub r15, 0, r15, nz;}
continue
{cjp nz, inc;}

\двухадресные команды
tadr
{and r9, r8, 0318h;}
{xor nil, r9, 0108h; load rm, flags;}
{cjp not rm_z, exit;}
{or nil, r8, z; oey; load ra; load rb;}
{or nil, r8, z; oey; jmap;}

\операция "и"
andi
{or nil, ra, z; oey; ewl;}
{r; cjp rdm, cp; or r14, bus_d, z;}
{sub rb,rb,z,z;}
{or nil, rb, z; oey; ewl;}
{r; cjp rdm, cp; or r15, bus_d, z;}
{and r15, r15, r14;}
{or nil, r15, z; oey; w; cjp rdm, cp;}
{cjp nz, inc;}

\загрузка из памяти
movtor
{or nil, r12, z; ewl; oey;}
{r; cjp rdm, cp; or r12, bus_d, z;}
{crtn nz;}

\условный переход
cjmp
{and nil, r15, 0080h; load rm, flags;}
{cjp not rm_z, inc;}
{or r7, r7, r12; cjp nz, decode;}

\безусловный переход
jmp
{or r7, r12, z; cjp nz, decode;}

\проверка готовности ВУ
testd
{cjs nz, movtor;}
{and nil, r12, 0080h; load rm, flags;}
{cjp nz, inc;}

\считывание с ВУ
inputd
{cjs nz, movtor;}
{or nil, r12, z; oey; ewl;}
{i; cjp rdd, cp; or r15, bus_d, z;}
{cjp nz, inc;}

\записывание на ВУ
outputd
{cjs nz, movtor;}
{or nil, r12, z; oey; ewl;}
{o; cjp rdd, cp; or nil, r15, z; oey;}
{cjp nz, inc;}

\запись в память из регистра R15
movtmem
{and nil, r8, r9; oey; ewl;}
{or nil, r15, z; oey; w; cjp rdm, cp;}
{cjp nz, inc;}

\запись R14 в R15
switch
{xor r15, r15, r15;}
{or r15, r15, r14;}
{cjp nz, inc;}

return
{sub r11,r11,2,nz;}
{or nil,r11,z;oey;ewl;}
{r; or r15,bus_d,z;cjp rdm, cp;}
{sub r11,r11,2,nz;}
{or nil,r11,z;oey;ewl;}
{r; or r7,bus_d,z;cjp rdm, cp;}
{cjp nz, decode;}

\конец программы
exit {}
