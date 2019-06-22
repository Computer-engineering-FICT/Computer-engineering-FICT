link l1:ct
link l2:rdm
link ewh:16

accept rdm_delay:3

dw 1111h:80C7h         \ двохадресна команда 1  00000  00  110  00  111
\dw 1112h:18ffh
dw 1112h:0h

dw 0c0h:2h
dw 07h:3h

accept r12:1111h       \ адреса команди в ОП


begin  {xor nil,r0,r0; oey; ewh;}   \ РАД(19-16)=0
       {or nil,r12,z; oey; ewl;}    \ РАД(15-0)=r12

read1  {cjp rdm, read1; r; or r11,bus_d,z; load rn, flags;} \ зчитування команди з ОП в r11

       {cjp not rn_n, exit;} \ якщо команда не двохадресна - перейти на м?тку
       {cjp rn_z, exit;}  \ якщо 0 - перейти на м?тку

       {and r0,r11,7c00h;}
       {xor nil,r0,0h; load rm, flags;}
       {cjp not rm_z, exit;} \ якщо код операц?ї не сп?впадає - перейти на м?тку

       {and r0,r11,300h; load rm, flags;}
       {cjp not rm_z, exit;}  \ якщо непряма адресац?я - перейти на м?тку
  
       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,0e0h,z;}
       {and nil,r11,r0; oey; ewl;} \ РАД(15-0)=r11(7-5)

read2  {cjp rdm, read2; r; or r13,bus_d,z;} \ зчитування операнда DD з ОП в r13

    {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,7h,z;}
       {and nil,r11,r0; oey; ewl;} \ РАД(15-0)=r11(2-0)

read3  {cjp rdm, read3; r; or r14,bus_d,z;} \ зчитування операнда SS з ОП в r14

       {add r13,r13,r14,z;}

       {add r12,r12,z,nz;}
       {cjp nz, begin;}

exit   {}
