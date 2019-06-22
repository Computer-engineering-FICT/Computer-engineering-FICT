link l1: ct
link l2: rdm
link l3: rdd
link ewh: 16
link M: z, z, z, z, z, z, z, z, 14, 13, 12, 11
accept dev[1]:I, 12h, 14h, 12, 2
accept dev[2]:O, 92h, 94h,12, 2
accept dev_buf[1]:0fff4h, 24ffh, 31ach

accept r7: 00020h
accept r5: 16

dw 00050h: 00053h \(x)
dw 00051h: 00054h \(y)
dw 00052h: 00055h \(z)

dw 00053h: 9h     \x
dw 00054h: 0Fh   \y
dw 00055h: 6h   \z


dw 00020h: 0000110001010000% \save to RA(r15)[50h]
dw 00022h: 0001010001010001% \RA NXOR y [51h]
dw 00024h: 0010010001010010% \RA mul z [52h]
dw 00026h: 0011010000000001% \result to memory[56h]
dw 00028h: 0100010000000000% \exit from process

org 0h {cjp nz, decoding;}
org 1h {cjp nz, saveToRA;}
org 2h {cjp nz, RANxorY;}
org 4h {cjp nz, RAMulZ;}
org 6h {cjp nz, ToMemory;}
org 8h {cjp nz, exit;}


\---------------decoding the command---------------\

decoding
{xor nil, r7, r7; ewh; oey;}
{or nil, r7, r7; ewl; oey;}
{cjp rdm, cp;r;or r8, bus_d, z;}

{and nil, r8, 8000h; load rm, flags;}
{cjp not rm_z, exit;}

{and nil, r8, 0400h; load rm, flags;}
{cjp rm_z, exit;}

{and r14, r8, 03FFh;}

{or nil, r8, z; oey; JMAP;}

\---------------read from memory---------------\

fromMemory
{or nil, r14, z; ewl; oey;}
{cjp rdm, cp;r;or r14, bus_d, z;}
{or nil, r14, z; ewl; oey;}
{cjp rdm, cp;r;or r14, bus_d, z;}
{crtn nz;}

\---------------save to RA(r15)[50h]---------------\
saveToRA
{cjs nz, fromMemory;}
{or r15, r14, z;}
{cjp nz, next;}


\---------------------RA NXOR y--------------------\
RANxorY
{cjs nz, fromMemory;}
{nxor r15, r15, r14;}
{cjp nz, next;}

\---------------------RA mul z--------------------\
RAMulZ
{cjs nz, fromMemory;}
cycle {or srl, r14, z;}
{cjp not rm_c, noAdd;}

{add r3, r3, r15; load rm, flags;}
{add r4, r4, Z, rm_c;}
{add r4, r4, r1, z;}

noAdd
{or sll, r15, r15, z;}
{or sla, r1, r1, z;}
{add r1, r1, z, rm_c;}
{sub r5, r5, z, z; cjp not zo, cycle;}
{cjp nz, next;}


\---------------------result to memory[56h]--------------------\
ToMemory
{cjs nz, fromMemory;}
{or nil,r14,z;oey;ewl;}      \ zapis adresa v RAD
{cjp rdm,cp;w;or nil,r3,z;oey;}  \zapis v OP
{add r14, r14, 1, z;}
{or nil,r14,z;oey;ewl;}      \ zapis adresa v RAD
{cjp rdm,cp;w;or nil,r4,z;oey;}  \zapis v OP
{cjp nz, next;}

\-----------------next command-----------------\
next
{add r7, r7, 2, z;}
{cjp nz, decoding;}

\-----------------exit from process-----------------\
exit {}
