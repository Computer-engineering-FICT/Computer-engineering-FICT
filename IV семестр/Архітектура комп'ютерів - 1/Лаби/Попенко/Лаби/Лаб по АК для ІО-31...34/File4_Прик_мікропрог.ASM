\FORMULA  F=(x or y)+ kz

\nastroiyka shemy
link l1:ct
link l2:rdm
link ewh:10 \mladshiy razriad starshego adresa
link M: z,z,z,z,z,z,z,z,14,13,12,11
link ra:3,2,1,0
link rb:3,2,1,0

\dannye
dw 0000h: 0h\resultat
dw 0002h: 0005h\x
dw 0004h: 0006h\y
dw 0006h: 0003h\z
dw 0008h: 0007h\k

\programma
dw 000Ah: 0000100000001000% \mov1 ak,mk
dw 000Ch: 0001000000000110% \mul  ak,mz
dw 000Eh: 0010100000001000% \mov3 r8,ak
dw 0010h: 0000100000000010% \mov1 ak,mx
dw 0012h: 0001100000000100% \or   ak,my
dw 0014h: 0011000000001000% \add  ak,r8
dw 0016h: 0010000000000000% \mov2 mrez,ak
dw 0018h: 0011100000000000% \end

\mikroprogramma
ORG 0h {cjp nz, res;}
ORG 1h {cjp nz,mov1;}
ORG 2h {cjp nz,mul;}
ORG 3h {cjp nz,orr;}
ORG 4h {cjp nz,mov2;}
ORG 5h {cjp nz,mov3;}
ORG 6h {cjp nz,addd;}
ORG 7h {cjp nz,end;}

\ustanovka nachalnogo adresa
res    {and r13, r13, z;}
       {or r13, r13, 000Ah;}

\chtenie comandy
begin  {ewh; oey; xor nil, r13, r13;}
       {ewl; oey; or nil, r13, z;}
       {cjp rdm, cp; r; or r14, bus_d, z;}

\raspakovka comandy

\proverka formata
       {and nil, r14, 8000h; load rm, flags;}
       {cjp not rm_z, end;}

\proverka tipa adresazyi
       {and nil, r14, 0400h; load rm, flags;}
       {cjp not rm_z, end;}

\vybor operanda v r12 iz OP
       {ewl;oey; or nil,r14,z;}
       {cjp rdm,cp;r;or r12,bus_d,z;}

\zagruzka adresa registra v RB
       {oey;or nil,r14,z;load rb;load ra;}

\perehod po kodu operacyi
       {oey;or nil, r14,z;jmap;}

\mikroprogramy komand

\--------------mov1-------------------------

mov1   {or r15,r12,z;cjp nz,formadd;}

\--------------mul--------------------------

mul    {or nil,r12,z; cjp not zo,notnul;}
       {xor r15,r15,r15;cjp nz,formadd;}
notnul {or r11,r12,z;}
       {or r10,r15,z;}
       {sub r11,r11,z,z;}
minus  {add r15,r10,r15,z;}
       {sub r11,r11,z,z;load rm,flags;}
       {cjp not rm_z,minus;}
       {cjp nz,formadd;}

\--------------or---------------------------

orr    {or r15,r15,r12;cjp nz,formadd;}

\--------------mov2-------------------------

mov2   {oey; or nil,r15,z;w;cjp rdm,cp;}
       {cjp nz,formadd;}

\--------------mov3-------------------------

mov3   {or rb,r15,z;cjp nz,formadd;}

\--------------addd-------------------------

addd   {add r15,r15,ra,z;}

\---------------------------------------

\formir sled adresa i na vyborku komandy

formadd{add r13,r13,2,z;}
       {cjp nz,begin;}

\-------------end-----------------------

\konec programmy

end {}
