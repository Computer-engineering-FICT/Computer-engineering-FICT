link l1:ct
link l2:rdm
link ewh:16
link m: z,z, 14,13,12,11,10, nz,nz,nz,nz,nz	\ буфер m, 10-6 розряди якого п?д'єднан? до 14-10 розряд?в ЛШ

accept rdm_delay:2	\ затримка 

\ команди
dw 1h: 0010000000010001%  \ 2011  команда умовного переходу
dw 2h: 0001100001111111%  \ 187f  команда множення R15=R15*M
dw 3h: 1000000011000000%  \ 80c7  команда додавання DD=DD+SS
dw 4h: 0010100000010011%  \ 2813  команда безумовного переходу
dw 5h: 0h                 \ к?нець

\ значення
dw 11h:4h      \ 4h - адреса команди на яку сл?д перейти при R15[7]=0
dw 7fh:2h      \ операнд RX(M) для множення
dw 0c0h:4h     \ перший доданок(DD)
dw 0h:5h       \ другий доданок(SS)
dw 13h:0h      \ адреса команди на яку зд?йснюється безумовний перех?д

\      r0			 робочий
\      r1			 збер?гатиме команду
accept r7:1h       \ л?чильник команд
\      r8            збер?гатиме значення R15 п?д час множення(виступатиме як RY)
\      r11           збер?гатиме доданок DD
\      r12	         збер?гатиме доданок SS
\      r14           RZ(8-15)
accept r15:0fff0h  \ RZ(0-7); 7 розряд - умова для переходу

equ CJUMP:11fh   \287
equ MULT:0dfh    \223
equ PLUS:1fh     \31
equ JUMP:15fh    \351

begin  {xor nil,r0,r0; oey; ewh;}	\ виб?рка команди з ОП 
       {or nil,r7,z; oey; ewl;}		\ по адресу, що лежить в R7

read1  \ анал?з типу команди
       {cjp rdm, read1; r; or r1,bus_d,z; load rn, flags;}
       {cjp rn_z, exit;}
       {cjp rn_n, a2;} 			    \ якщо 1 - перейти на обробку двохадресної
     
       {and r0,r1,7800h;}			\ ?дентиф?кац?я одноадресної команди
       {or nil,r0,z; oey; jmap;}

a2     {and r0,r1,7c00h;}			\ ?дентиф?кац?я одвохадресної команди
       {or nil,r0,z; oey; jmap;}

\----------------------------------------------------------------------------------

       org CJUMP
       {and r0,r1,400h; load rn, flags;}    \ перев?рка типу адресац?ї
       {cjp not rn_z, exit;}

       {and r3,r15,80h; load rn, flags;}	\ перев?рка умови
       {cjp not rn_z, next;}

       {xor nil,r0,r0; oey; ewh;}
       {and r0,r1,3ffh;}
       {or nil,r0,z; oey; ewl;}

read2  {cjp rdm, read2; r; or r0,bus_d,z; load rn, flags;}	

       {xor r7,r7,r7;}
       {or r7,r7,r0; cjp nz, next;}
	   
\----------------------------------------------------------------------------------

       org MULT
       {and r0,r1,400h; load rm, flags;}
       {cjp not rm_z, exit;}  \ якщо непряма адресац?я - перейти на м?тку

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,3ffh,z;}
       {and nil,r1,r0; oey; ewl;} \ РАД(15-0)=r11(9-0)

read3  {cjp rdm, read3; r; or r10,bus_d,z;} \ зчитування операнда M з ОП в r13

       {xor r8,r8,r8;}
       {or r8,r8,r15;}
       {xor r15,r15,r15;}

       {or r5,r5,r10;}
       {xor r5,r5,r14;}       \ збер?гаємо в r5 знак результату

c3     {or sll,r14,r14,z; load rn, flags;}  \ конвертуємо RY з ПК в ДК
       {or srl,r14,r14,z; cjp not rn_n, c2;}
       {sub r14,z,r14,nz;}

c2     {or srl,r10,r10,z;}                   \ зсув множника(RX) вправо
       {cjp not rm_c, c1;}                   \ якщо молодший розряд RX '0', перейти на м?тку с1
       {add r15,r15,r8,z; cjp not co, c1;}  \ RZ(0-7):=RZ(0-7)+RY(0-7)+CI
       {add r14,r14,z,z;}                    \ RZ(8-15):=RZ(8-15)+CI
c1     {or sll,r8,r8,z;}                   \ зсув множеного вл?во з врахуванням переносу
       {or r10,r10,z; cjp not zo, c2;}       \ якщо RX!=0, перейти на м?тку с2

       {or sll,r5,r5,z;}      \ задаємо знак результату
       {cjp not rm_c, next;}
       {sub r13,z,r13,z;}
	   
       {cjp nz, next;}

\----------------------------------------------------------------------------------
	   
       org PLUS
       {and r0,r1,300h; load rm, flags;}
       {cjp not rm_z, exit;}  \ якщо непряма адресац?я - перейти на м?тку

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,0e0h,z;}
       {and nil,r1,r0; oey; ewl;} \ РАД(15-0)=r11(7-5)

read4  {cjp rdm, read4; r; or r11,bus_d,z;} \ зчитування операнда DD з ОП в r13

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,7h,z;}
       {and nil,r1,r0; oey; ewl;} \ РАД(15-0)=r11(2-0)

read5  {cjp rdm, read5; r; or r12,bus_d,z;} \ зчитування операнда SS з ОП в r14

       {add r11,r11,r12,z;}

       {xor nil,r0,r0; oey; ewh;}  \ РАД(19-16)=0
       {or r0,0e0h,z;}
       {and nil,r1,r0; oey; ewl;} \ РАД(15-0)=r11(7-5)

write1 {cjp rdm, write1; w; or nil,r11,z; oey;}

       {cjp nz, next;}

\----------------------------------------------------------------------------------
	   
       org JUMP
       {and r0,r1,400h; load rn, flags;} \перев?рка типу адресац?ї
       {cjp not rn_z, exit;}

       {xor nil,r0,r0; oey; ewh;}   \зчитуємо значення м?тки
       {and r0,r1,3ffh;}     \для переходу
       {or nil,r0,z; oey; ewl;}

read6  {cjp rdm, read6; r; or r0,bus_d,z; load rn, flags;}

       {xor r7,r7,r7;}
       {or r7,r7,r0; cjp nz, next;}

\----------------------------------------------------------------------------------	   
	   	   	   
next   {add r7,r7,z,nz;}	\ формування адреси наступної команди
       {cjp nz, begin;}

\----------------------------------------------------------------------------------
	   
exit   {}
