link l3:ct
accept r1:0005h\ 5[dk]
accept r2:0FFF9h\ -7[dk]
accept r0:16 \Counter
accept r3:0

{load rm,z;}

label1 \Перевод r2 в прямой код
      {add r2,r2,0,z;load rm,flags;}
      {cjp not rm_n,label2;}
      {add r3,1000000000000000%,z;} \формируем знак результата
      {nxor r2,r2,0000h;}
      {add r2,r2,1,z;}
label2
      {or sll,r4,r4,z;}
      {or sl.25,r1,r1,z;}
      {sub r0,r0,z,z;load rm,flags;cem_c;}
      {cjp not rm_c,label2;}
      {add r4,r4,r2,z;}
      {cjp not rm_z,label2;}
      {}
