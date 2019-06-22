
link l3:ct
accept r12:0
accept r9:7fffh
accept r10:7fffh
accept r11:17

               {load rm, z;}
label1         {cjp not rm_c, label2;}
               {add r12, r12, r9, z;}
label2         {or sr1, r12, r12, z;}
               {or sr9, r10, r10, z;}
               {sub r11, r11, z, z; load rm, flags; cem_c;}
               {cjp not rm_z, label1;}
