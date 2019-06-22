link l1: ct
accept r0: 0h \Z(8-15) результат старшi бiти результату
accept r1: 0h \Z(0-7)  молодшi бiти результату
accept r2: 1111111111111001% \ X(8-15) множене
accept r3: 7   \ Y  множник
accept r5: 0ffffh
accept r6: 0h   \регiст збереження знаку множеного
accept r7: 0h   \регiст збереження знаку множника
accept r10:0h   \

{LOAD RM, FLAGS;}
{AND NIL, R2, 8000H; LOAD RM, FLAGS;}
{CJP RM_Z, CONTIN;}
{add r6,r6,1,z;}
{XOR R2,R2,0FFFFH;}
{ADD R2,R2,1,Z;}

CONTIN
       {AND NIL, R3,8000H; LOAD RM,FLAGS;}
       {CJP RM_Z, START;}
       {add r7,r7,1,z;}
       {XOR R3,R3,0FFFFH;}
       {ADD R3,R3,1,Z;}

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
         {cjp not rm_c, FIN;}
FIN  {}
       {xor r10,r6;}
       {xor r10,r7;load rm, flags;}
       {or srl, r10,r10;}
       {CJP not RM_C, EXIT;}
       {xor r0,r0,r5;}
       {xor r1,r1,r5;}
       {add r1,r1,1h,z;}
 exit{}
