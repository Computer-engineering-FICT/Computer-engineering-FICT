link l1:ct
link l2:rdm
link ewh:16

accept rdm_delay:3

dw 1111h:18ffh         \ одноадресна команда 0  0011  0  00 1111 1111
dw 1112h:18ffh
dw 1113h:0h
dw 0ffh:02h

accept r12:1111h       \ адреса команди в ОП

accept r14:0           \ RZ(15-8)
accept r15:0ffh        \ RY, RZ(7-0)  ПК
accept r13:0           \ M(RX)    ДК


begin  {xor nil,r0,r0; oey; ewh;}   \ РАД(19-16)=0
       {or nil,r12,z; oey; ewl;}    \ РАД(15-0)=r12

read1  {cjp rdm, read1; r; or r11,bus_d,z; load rn, flags;} \ зчитування команди з ОП в r11

       {cjp rn_n, exit;} \ якщо команда двохадресна - перейти на м?тку
       {cjp rn_z, exit;}

       {and r0,r11,7800h;}
       {xor nil,r0,1800h; load rm, flags;}
       {cjp not rm_z, exit;} \ якщо код операц?ї не сп?впадає - перейти на м?тку

       {and r0,r11,400h; load rm, flags;}
       {cjp not rm_z, exit;}  \ якщо непряма адресац?я - перейти на м?тку

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,3ffh,z;}
       {and nil,r11,r0; oey; ewl;} \ РАД(15-0)=r11(9-0)

read2  {cjp rdm, read2; r; or r13,bus_d,z;} \ зчитування операнда M з ОП в r13

       \ початок множення
       {xor r10,r10,r10;}
       {or r10,r10,r15;}
       {xor r15,r15,r15;}

       {or r5,r5,r13;}
       {xor r5,r5,r10;}       \ збер?гаємо в r5 знак результату

c3     {or sll,r10,r10,z; load rn, flags;}  \ конвертуємо RY з ПК в ДК
       {or srl,r10,r10,z; cjp not rn_n, c2;}
       {sub r10,z,r10,nz;}

c2     {or srl,r13,r13,z;}                   \ зсув множника(RX) вправо
       {cjp not rm_c, c1;}                   \ якщо молодший розряд RX '0', перейти на м?тку с1
       {add r15,r15,r10,z; cjp not co, c1;}  \ RZ(0-7):=RZ(0-7)+RY(0-7)+CI
       {add r14,r14,z,z;}                    \ RZ(8-15):=RZ(8-15)+CI
c1     {or sll,r10,r10,z;}                   \ зсув множеного вл?во з врахуванням переносу
       {or r13,r13,z; cjp not zo, c2;}       \ якщо RX!=0, перейти на м?тку с2

       {or sll,r5,r5,z;}      \ задаємо знак результату
       {cjp not rm_c, end;}
       {sub r14,z,r14,z;}

end    {add r12,r12,z,nz;}
       {cjp nz, begin;}

exit   {}
