link l1: ct
accept r0: 0h \Z(8-15) результат старшi бiти результату
accept r1: 0h \Z(0-7)  молодшi бiти результату
accept r2: 1111111111111111% \X(8-15) множене
accept r3: 1111111111111111% \Y  множник
accept r5: 0ffffh
accept r6: 0h   \регiст збереження знаку множеного
accept r7: 0h   \регiст збереження знаку множника

          {or r6, r3;}        \
          {or r7, r2;}         \   видiлення знаку вiд числа
          {or sll, r3,r3;}      \
          {or sll, r2,r2;}       \
          {or srl, r3,r3;}        \
          {or srl, r2,r2;}         \
          {xor r6, r3;}             \
          {xor r7, r2;}              \
          {add r6,r7;}                \
          {add r9, 1h;}                \
start    {or srl, r3,r3,z;}
         {or sr.9, r4,r4,z;}
         {load rm, flags;}
multiply {xor r8,r8;}
         {or r8,r2;}
         {or sll, r8, r8 ,z;}
         {cjp  not rm_c, labelIF;}
         {add r1,r4;load rm, flags;}
         {cjp not rm_c,label1;}
         {add r0, r0, 1;}
 label1  {add r0,r3;}
 labelIF {or sll, r2,r2,z;}
         {or srl, r3,r3,z;}
         {or sr.9, r4,r4,z;}
         {or r2,r2,z;cjp not zo, multiply;}
          {or sll, r6,r6;}
          {cjp not rm_c, exit;}
 minus    {add r0, r6;}             \
          {xor r1, r5;}              \ Переведення в доповняльний код
          {xor r0, r5;}               \
          {add r1, 1h;}                \
exit          {}
