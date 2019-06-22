link l1: rdm
link ewh: 10
link l2:ct
link M:z,z,z,z,z,z,z,14,13,12,11,z

dw 10h: 0000100000000111% \add AC,M
dw 12h: 0001000000001000% \add M,AC
dw 14h: 0001100000000000% \stop

dw 07h: 70h \operand1
dw 06h: 10h \operand2

accept r7: 10h
accept r15: 5h

       org 0
       {cjp nz,begin;}

       org 2
       {cjp nz,l_add;}

       org 4
       {cjp nz,l_add2;}

       org 6
       {cjp nz,stop;}

\______command choice
begin  {ewh; xor nil, r0, r0; oey;}            \put zero in AR(high)
       {ewl; or nil, r7, z; oey;}              \put comaddress in AR (low)
       {cjp rdm,cp; r; or r8, bus_d, z;}       \command choice
       {and nil, r8, 8000h;load rm,flags;}     \format check
       {cjp not rm_z,stop;}
       {oey;jmap;or nil,r8,z;}

\______command add2
l_add2 {or r10,7ffh,z;}
       {ewl;and nil,r8,r10;oey;}
       {cjp rdm,cp;r;or r9,bus_d,z;}
       {add r15,r15,r9,z;}
       {oey;w;cjp rdm,cp;or nil,r15,z;}
       {cjp nz,next_ad;}

\______command add
l_add  {or r10,7ffh,z;}
       {ewl;and nil,r8,r10;oey;}
       {cjp rdm,cp;r;or r9,bus_d,z;}
       {add r15,r15,r9,z;}
       {cjp nz,next_ad;}

\______next addres
next_ad
       {add r7,r7,2,z;}
       {cjp nz,begin;}

\______command stop
stop   {}
