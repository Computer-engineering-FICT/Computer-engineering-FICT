link l1: ct
link l2 : rdm
link ewh:16

dw 1111h : 08ffh \ 0 0001 0 00 0000 1111
dw 0ffh: 1111111111111001%

dw 1112h: 00ffh

accept r12:1111h

accept r14: 0h \Z(8-15) результат старшi бiти результату
accept r15: 5h \Z(0-7)  молодшi бiти резуль

accept r5: 0ffffh
accept r6: 0h   \регiст збереження знаку множеного
accept r7: 0h   \регiст збереження знаку множника
accept r10:0h   \

\-----------------РОБОТА З ПАМ'ЯТТЮ--------------------------------------

loading   {xor nil,r0,r0; oey; ewh;} \  обнуляэмо регicтер адреси
          {or nil, r12,z; oey; ewl;}  \

comread   {cjp rdm, comread; r; or r11,bus_d,z; load rm, flags;} \ зчитуємо команду

          {cjp rm_n, exit;} \  якщо формат не той = на вихiд
          {cjp rm_z, exit;}  \

          {and r0, r11, 7800h;}                 \
          {xor nil, r0, 0800h; load rm, flags;}  \ якщо код опер. не той = на вихiд
          {cjp not rm_z, exit;}                   \

          {and r0, r11, 400h; load rm, flags;} \  якщо непряма адресацiя = на вихiд
          {cjp not rm_z, exit;}                 \

          {xor nil,r0,r0; oey; ewh;}         \
          {or r0, 3ffh, z;}                   \ завантажуємо в РАД адресу
          {and nil, r11, r0; oey; ewl;}        \ операнду

readop    {cjp rdm, readop; r; or r13, bus_d, z;}  \ зчитуэмо операнд

\-----------------------МНОЖЕННЯ-----------------------------------------

{AND NIL, R13, 8000H; LOAD RM, FLAGS;}
{CJP RM_Z, CONTIN;}
{add r6,r6,1,z;}
{XOR R13,R13,0FFFFH;} \переведення r2 з дк в пк
{ADD R13,R13,1,Z;}    \

CONTIN
       {AND NIL, R15,8000H; LOAD RM,FLAGS;}
       {CJP RM_Z, START;}
       {add r7,r7,1,z;}
       {XOR R5,R5,0FFFFH;} \переведення r3 з дк в пк
       {ADD R5,R5,1,Z;}    \

start
{add r10, r10,r15;}
{xor r15,r15;}
{or srl, r10,r10,z;}
         {or sr.9, r4,r4,z;}
         {load rm, flags;}
multiply {xor r8,r8;}
         {or r8,r13;}
         {or sll, r8, r8 ,z;}
         {cjp  not rm_c, labelIF;}
         {add r15,r4;load rm, flags;}
         {cjp not rm_c,label1;}
         {add r14, r14, 1;}
 label1  {add r14,r10;}
 labelIF {or sll, r13,r13,z;}
         {or srl, r10,r10,z;}
         {or sr.9, r4,r4,z;}
         {or r13,r13,z;cjp not zo, multiply;}
         {cjp not rm_c, FIN;}
FIN  {}
{xor r10,r10;}
       {xor r10,r6;}                  \
       {xor r10,r7;load rm, flags;}   \визначення знаку результату
       {or srl, r10,r10;}      \
       {CJP not RM_C, EXIT;}     \якщо rm_c 1 то результат в?д*ємний
       {xor r14,r14,r5;}
       {xor r15,r15,r5;}
       {add r15,r15,1h,z;}
 exit{}
