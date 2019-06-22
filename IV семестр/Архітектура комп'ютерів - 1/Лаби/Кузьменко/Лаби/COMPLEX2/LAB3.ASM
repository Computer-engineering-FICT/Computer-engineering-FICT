link l2:ct
accept r1:0            \ Rh
accept r2:0            \ Rl
accept r3:0FFF9H       \ X
accept r4:0            \ Yl
accept r5:5            \ Yh
accept r6:0 \sign
\--------begin--------\
       {load rm,z;}
       {or r6,z,r3;load rm,flags;}
       {cjp RM_Z, null;}     \ X = null?
       {xor r6,r6,r5;load rn,flags;}
       {or r6,z,r5;load rm, flags;}
       {cjp RM_Z, null;}     \ Y = null?
       {and nil,r3,8000h;load rm,flags;}
       {cjp rm_z,plus_x;}
       {sub r3,z,r3,z;}
plus_x {and nil,r5,8000h;load rm,flags;}
       {cjp rm_z,plus_y;}
       {sub r4,0,r4,z;LOAD RM,FLAGS;}
       {SUB R5,0,R5,RM_C;}
plus_y {or srl,r5,r5,z;}            \shift
       {or sr.9,r4,r4,z;}
begin {or sll,r3,r3,z;load rm,flags;}
       {CJP NOT RM_N, notadd;}
       {add r2,r2,r4,z;LOAD RM,FLAGS;}
       {add r1,r1,r5,RM_C;}
notadd {or srl,r5,r5,z;}
       {or sr.9,r4,r4,z;}
       {or nil,r3,r3;load rm, flags;}
       {cjp not RM_Z, begin;}
       {cjp not RN_N, end;}
       {SUB r2,z,r2,z;load rm,flags;}
       {SUB r1,z,r1,rm_C;}
       {ADD r1,r1,8000H,z;}
       {cjp nz, end;}
null   {xor r1,r1,r1;}
       {xor r2,r2,r2;}
end{}
