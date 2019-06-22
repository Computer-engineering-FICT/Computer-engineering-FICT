link l2:ct
accept r1:0
accept r2:0
accept r3:1
accept r4:0ffffh
accept r5:0fff6h
accept r6:0 \sign
\--------begin--------\
       {load rm,z;}
       {or r6,r6,r3;}
       {xor r6,r6,r5;load rn,flags;}

       {and nil,r3,8000h;load rm,flags;}
       {cjp rm_z,plx;}
       {sub r3,0,r3,z;}
plx    {and nil,r5,8000h;load rm,flags;}
       {cjp rm_z,ply;}
       {sub r4,0,r4,z;LOAD RM,FLAGS;}
       {SUB R5,0,R5,Z;}

ply

       {or srl,r5,r5,z;}            \shift
       {or sr.9,r4,r4,z;}
begin {or sll,r3,r3,z;}
       {CJP NOT RM_C, notadd;}
       {add r2,r2,r4,z;LOAD RM,FLAGS;}
       {add r1,r1,r5,RM_C;}
notadd {or srl,r5,r5,z;}
       {or sr.9,r4,r4,z;}
       {or nil,r3,r3;load rm, flags;}
       {cjp not RM_Z, begin;}

        {cjp not RN_N, end;}
       {ADD R1,R1,800H,Z;}
   \    {SUB r2,z,r2,nz;load rm,flags;}
   \    {SUB r1,z,r1,rm_C;}
   \    {sub r1,r1,1;}

end{}
