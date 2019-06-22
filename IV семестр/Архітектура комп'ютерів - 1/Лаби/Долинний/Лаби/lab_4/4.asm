\FORMULA  A=(x nxor y)*z

\nastroiyka shemy
link l1:ct
link l2:rdm
link l3:rdd
link ewh:10 \mladshiy razriad starshego adresa
link M: z,z,z,z,z,z,z,z,14,13,12,11
link ra:3,2,1,0
link rb:3,2,1,0

\dannye
dw 0: 0fff9h \x=-7
dw 1h: 5 \y
dw 2h: 4 \z
dw 13h: 0 \addr x
dw 93h: 3 \adresa molodshyh rozryadiv resultatu

dw 5h: 1
dw 6h: 2

\programma
dw 000Ah: 0000110000010011% \mov1 r15, dev_i
dw 000Ch: 0010110000000101% \writei addr y (vstanovlennya registru danih pristroyu vvodu)
dw 000Eh: 0001010000010011% \nxor r15, dev_i
dw 0010h: 0010110000000110% \writei addr z
dw 0012h: 0001110000010011% \mul r15, dev_i
dw 0014h: 0010010010010011% \mov2 dev_o, r15, r10 (zapis resultatu u 2 susidni komirki pamyati)
dw 0016h: 0011010000000000% \end

\mikroprogramma
ORG 0h {cjp nz, res;}
ORG 1h {cjp nz,mov1;}
ORG 2h {cjp nz,nxorr;}
ORG 3h {cjp nz,mul;}
ORG 4h {cjp nz,mov2;}
ORG 5h {cjp nz, writei;}
ORG 6h {cjp nz,end;}

\ustanovka nachalnogo adresa
res    {and r13, r13, z;}
       {or r13, r13, 000Ah;}

\chtenie comandy
begin  {ewh; oey; xor nil, r13, r13;}
       {ewl; oey; or nil, r13, z;}
       {cjp rdm, cp; r; or r14, bus_d, z;}

\raspakovka comandy

\proverka formata (odnoadresna - kod 0)
       {and nil, r14, 8000h; load rm, flags;}
       {cjp not rm_z, end;}

\proverka tipa adresazyi (nepryama - kod 1)
       {and nil, r14, 0400h; load rm, flags;}
       {cjp rm_z, end;}

\vybir adresy operanda v r11 (z RD pristroyu vvody/vivodu, adresa yakogo - v r14)
       {ewl;oey; or nil,r14,z;}
       {cjp rdm, cp; r;or r11,bus_d,z;}

\vybor operanda v r12 iz OP za adresoyu v r11
       {ewl;oey; or nil,r11,z;}
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
notnul {or r11,r12,z;} \r11 - mnozhnik
       {or r1,r15,z;} \r1, r0 - mnozhene
 {xor r15, r15;} \r15, r10 - rezultat
cycle  {and nil, r11, 1; load rm, flags;}
 {cjp rm_z, mulnext;}
 {add r15, r15, r1, z; load rm, flags;}
 {add r10, r10, r0, rm_c;}
mulnext {or sll, r1, z;}
 {or sl.25, r0, z;}
  {or srl, r11, z;load rm, flags;}
       {cjp not rm_z,cycle;}
       {cjp nz,formadd;}

\--------------nxor---------------------------

nxorr  {nxor r15,r15,r12;cjp nz,formadd;}

\--------------mov2-------------------------

mov2   {oey; or nil,r15,z;w;cjp rdm,cp;} \molodschi rosryadi
 {add r11, r11, z, nz;}
 {ewl;oey; or nil,r11,z;}
 {oey; or nil,r10,z;w;cjp rdm,cp;} \starschi rozryadi
       {cjp nz,formadd;}

\--------------writei-------------------------

writei {xor r2, r2;}
{or r2, 0013h;}
 {ewl; oey; or nil,r2,z;}
 {cjp rdm, cp;oey; or nil,r11,z;w;}
       {cjp nz,formadd;}


\formir sled adresa i na vyborku komandy

formadd{add r13,r13,2,z;}
       {cjp nz,begin;}

\-------------end-----------------------

\konec programmy

end {}
