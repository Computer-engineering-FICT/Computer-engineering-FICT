link l1:ct
link l2:rdm
link ewh:16
link M:z,z,z,z,z,z,z,z,14,13,12,11 \bufer, 4-1 of it link to 14-11 of local_bus

accept dev[1]:I, 12h, 13h, 12, 2 \input device
accept dev[2]:O, 92h, 93h,12, 2 \output device
accept dev_buf[1]:0fff4h, 24ffh, 31ach
accept r7: 20h \reg of current adr

dw 06h:000eh \x
dw 08h:0007h \y
dw 0Ah:0013h \z

dw 20h: 0001000000000110% \ save x to r15
dw 22h: 0010000000001000% \ r15 & y
dw 24h: 0100000000001010% \ mult
dw 26h: 0011000000001010% \ result to z
dw 28h: 0101000000000000% \ END

org 0h {cjp nz, loadFromOP;}
org 2h {cjp nz, saveToReg;}
org 4h {cjp nz, andXY;}
org 6h {cjp nz, saveToMem;}
org 8h {cjp nz, mult;}
org 0Ah {cjp nz, end;}

loadFromOP
{or nil, r7, r7; ewl; oey;}
{xor nil, r7, r7; ewh; oey;}
{r;cjp rdm, cp; or r8, z, bus_d;} \write command to r6

{and nil, r8, 8000h; load rm, flags;}
{cjp not rm_z, end;}
     \rasshifrovka
{and nil, r8, 400h;load rm, flags;}
{cjp not rm_z, end;}

{and r14, r8, 03ffh;} \adr of operand

{or nil, r8, z; oey; JMAP;} \jump to action


andXY
{cjs nz, fromMem;}
{and r15, r15, r14;} \x & y
{cjp nz, next;}

saveToReg
{cjs nz, fromMem;}
{or r15, 0, r14;} \r15=operand
{cjp nz, next;}

saveToMem
{or nil, r14,z;ewl;oey;}
{w; cjp rdm, cp; or nil, r15, z;oey;} \mem[i]=operand
{cjp nz, next;}

fromMem
{or nil, r14,z; ewl; oey;}
{r; or r14, bus_d, z; cjp rdm, cp;} \r14=operand
{crtn nz;}

next
{add r7, r7, 2, z;}
{cjp nz, loadFromOP;} \next command


mult \multiplication
{cjs nz, fromMem;}
{xor r0, r0, r0;}

start
{and nil, r14, 8000h; load rm, flags;} \mnozhnyk[1]=?
{cjp rm_z, shift;}
{add r0, r0, r15, z;}

shift
{or sll, r14, r14, z;} \z=r14
{or sll, r0, r0, z;} \res=r0

{or nil, r14, r14; load rm, flags;}
{cjp not rm_z, start;} \if z!=0

{or srl, r0, r0, z;} \usuvaemo zsuv
{or r15, 0, r0;} \result
{cjp nz, next;}

\{and nil, r1, 8000h; load rm, flags;}
\{cjp rm_z, end;}
\{xor r1, r1, 0ffffh;}
\{xor r0, r0, 0ffffh;}
\{add r0, r0, 1, z; load rm, flags;} proverka znaka i perevod v PK
\{add r1, r1, 0, rm_c;}
\{or r1, r1, 8000h;}


end {}
