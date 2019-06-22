link l3: ct
link l2: rdm
link l1: rdd
link ewh: 16
link m: z, z, z, z, z, z, z, z, 14, 13, 12, 11

link ra: z, 2, 1, 0
link rb: z, 2, 1, 0

accept dev[1]: i, 62h, 64h, 3, 8
accept dev_buf[1]: 1h

accept dev[2]: o, 0e2h, 0e4h, 3, 8

\COMMANDS
dw 0: 0C06h
dw 1: 7420h
dw 2: 7C50h
dw 3: 8c85h
dw 4: 1407h
dw 5: 0ffffh


dw 6h: 64h
dw 7h: 0e4h

dw 10h: 0ffffh \for r4

dw 12h: 0efafh \masks
dw 13h: 0fff0h \for
dw 14h: 0f0ffh \&

dw 20h: 2 \for mult

dw 50h: 1 \for jumper

accept r4: 10h
accept r5: 15h

accept r7: 0 \counter
\------------------------------------------
org 900

next {add nil, r7, z; oey; ewl;}\comand reading
{r; cjp rdm, cp; add r8, bus_d, z;}\loading from SHD
{add nil, r8, z, nz; cjp zo, sangreal;}

{or nil, r8, z; cjp no, doubleaddr;} \1 or 2?

\--oneadress comand
{xor r9, r9;}
{add r9, 0400h;}\checrhing type of adresation
{and nil, r9, r8; cjp zo, sangreal;}\if pryama then in end

{xor r9, r9;}
{add r9, 03ffh;}
{and nil, r9, r8; oey; ewl;}
{r; cjp rdm, cp; add r12, bus_d, z;}\reading operand 2 in r12

{or nil, r8, z; oey; jmap;}

\--
doubleaddr
{xor r9, r9;}
{add r9, 0c00h;}\checking operation
{and nil, r9, r8; cjp zo, sangreal;}

{xor r11, r11;}
{xor r12, r12;}
{xor r9, r9;}
{xor r10, r10;}

{xor r13, r13;}
{and sra, r9, r8, 0e0h;}
{or sra, r9, z;}
{or sra, r9, z;}
{or sra, r9, z;}
{or sra, r9, z;}
{or nil, r9, z; oey; load ra; load rb;}
{xor r11, r11;}
{or nil, ra, z; oey; ewl;}
{r; cjp rdm, cp; add r11, bus_d, z;}

{xor r13, r13;}
{and r10, r8, 7h;}
{or nil, r10, z; oey; load ra; load rb;}
{sub rb, ra, z, z;}
{xor r12, r12;}
{or nil, ra, z; oey; ewl;}
{r; cjp rdm, cp; add r12, bus_d, z;}

{and r11, r12;}

{or nil, r9, z; oey; load ra;}
{or nil, ra, z; oey; ewl;}
{w; cjp rdm, cp; or nil, r11, z; oey;}

\------------------------------------------
return {add r7, z, nz; cjp nz, next;}
\------------------------------------------

\”множение 1110
\-------------------------------------------
mult
{xor r13, r13, r13;} \sign
{xor r11, r11, r11;}
{xor r10, r10;}
{add r10, r15;}

{or nil, r12, z; cjp not no, r3_pos;}
{xor r12, r12, 8000h;}
{sub r12, z, r12, nz;}
{xor r13, r13, 8000h;}
r3_pos

{or nil, r10, z; cjp not no, r2_pos;}
{xor r10, r10, 8000h;}
{sub r12, z, r12, nz;}
{xor r13, r13, 8000h;}
r2_pos

{load rm, z;}
{push nz, 0fh;}

{or sll, r11, z;}
{or sl.25, r10, z;}
{cjp not rm_c, no_sum;}

{add r11, r11, r12, z; load rm, flags;}
{add r10, r10, z, rm_c;}

no_sum
{rfct;}

end
{or nil, r13, z; cjp not no, knowreal;}
{sub r11, z, r11, nz;}
{sub r10, z, r10, z;}

knowreal
{xor r15, r15;}
{add r15, r11;}
{xor r14, r14;}
{add r14, r10;}
{cjp nz, return;}
\------------------------------------------


\uslovnyy perehod 1111
\-------------------------------------------
condjmp
{xor r13, r13;}
{add r13, 80h;}
{and nil, r13, r15; cjp zo, strctjmp;}
{cjp nz, return;}


\bezuslovnyy perehod 0011
\-------------------------------------------
strctjmp
{xor r7, r7;}
{sub r7, r12, z, z;}
{cjp nz, return;}


\¬вод 0001
\-------------------------------------------
input
{or nil, r12, z; oey; ewl;}
{i; cjp rdd, cp; or r15, bus_d, z;}
{cjp nz, return;}

\vyvod 0010
\-------------------------------------------
output
{or nil, r12, z; oey; ewl;}
{o; cjp rdd, cp; or nil, r15, z; oey;}
{cjp nz, return;}


\JUMPERS
org 1110%
{cjp nz, mult;}
\------------------------------------------
org 1111%
\------------------------------------------
{cjp nz, condjmp;}
\------------------------------------------
org 0100%
{cjp nz, strctjmp;}
\------------------------------------------
org 0001%
{cjp nz, input;}
\-------------------------------------------
org 0010%
{cjp nz, output;}

\EXIT
\-------------------------------------------
sangreal
{}
