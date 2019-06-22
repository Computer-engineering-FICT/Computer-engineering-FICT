\FORMULA  F=(x+y)-z

\nastroiyka shemy
link l1:ct
link l2:rdm
link ewh:10 \mladshiy razriad starshego adresa
link M: z,z,z,z,z,z,z,14,13,12,11,10 \nachalnyi adres mikroprogrammy
link ra:3,2,1,0
link rb:3,2,1,0

\dannye
dw 0000h: 0h\resultat
dw 0002h: 0005h\x
dw 0004h: 0007h\y
dw 0006h: 0003h\z


\programma
dw 000Ah: 0000010000000010% \mov1 ak,x
dw 000Ch: 0000100000000000% \mov2 r0,ak
dw 000Eh: 0000010000000100% \mov1 ak,y
dw 0010h: 0000110000000000% \add  ak,r0
dw 0012h: 0000100000000000% \mov2 r0,ak
dw 0014h: 0000010000000110% \mov1 ak,z
dw 0016h: 0001000000001111% \com  ak
dw 0018h: 0000110000000000% \add  ak,r0
dw 001Ah: 0001010000000000% \mov3 m,ak
dw 001Ch: 0001110000000000% \halt

\mikroprogramma

ORG 0h {cjp nz,nach;}
ORG 1h {cjp nz,mov1;}
ORG 2h {cjp nz,mov2;}
ORG 3h {cjp nz,addd;}
ORG 4h {cjp nz, com;}
ORG 5h {cjp nz,mov3;}
ORG 7h {cjp nz,halt;}

\ustanovka nachalnogo adresa
nach   {and r13,r13,z;}
       {or r13,r13,000Ah;}

\chtenie comandy
begin  {ewh; oey; xor nil, r13, r13;}
       {ewl; oey; or nil, r13, z;}
       {cjp rdm, cp; r; or r14, bus_d, z;}

\raspakovka comandy

\proverka formata
       {and nil, r14, 8000h; load rm, flags;}
       {cjp not rm_z, halt;}\ perehod na 2-adresnuyu komandu

\perehod po kodu operacyi
       {oey;or nil,r14,z;jmap;}

mov1
\vybor operanda v r15 iz OP(memory)
      {ewl;oey; or nil,r14,z;}
      {cjp rdm,cp;r;or r15,bus_d,z;}
      {cjp nz,formadd;}

mov2
\zagruzka adresa registra v RB
      {oey;or nil,r14,z;load rb;load ra;}
      {or rb,r15,z;cjp nz,formadd;}

addd
\--------------slozhenie--------------------

      {add r15,r15,ra;cjp nz,formadd;}

mov3
\--------iz ak v OP (memory)----------------
      {oey;ewl;or nil,r14,z;}
      {oey; or nil,r15,z;w;cjp rdm,cp;}
      {cjp nz,formadd;}

com
\-----------invertirovanie ak --------------

      {sub r15,z,r15,nz;cjp nz,formadd;}




\formir sled adresa i na vyborku komandy

formadd{add r13,r13,2,z;}
       {cjp nz,begin;}


halt

\konec programmy
       {}
