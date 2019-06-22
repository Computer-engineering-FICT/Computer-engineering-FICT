\Umnogenie 2 sposob

\Nastroyka shemy

link l1:ct
accept r3:1111111111111011% \X
accept r4:1111111111111011% \Y
accept r5:0000000000000000% \Z
accept r7:0000000000000000% \Znak Z


\perevod v polog
       {or r7,r3,z;}
       {xor r7,r7,r4;}
       {and nil,r3,1000000000000000%;load rm,flags;}
       {cjp rm_z,prov_y;}
       {sub r3,0,r3,nz;}
prov_y {or r2,r3,z;}
       {and nil,r4,1000000000000000%;load rm,flags;}
       {cjp rm_z,mult;}
       {sub r4,0,r4,nz;}
mult   {or r1,r4,z;}


\Umnogenie celyh chisel
       {xor r0,r0,r0;}
shift_r{or r2,r2,z;cjp zo,rez;}
       {add srl,r2,r2,z;}
       {cjp not rm_c,shift_l;}
       {add r0,r0,r1,z;}
shift_l{or sll,r1,r1,z;}
       {cjp nz,shift_r;}

\zapis rezultata
rez    {or r5,r0,z;}
       {and r7,r7,1000000000000000%;load rm,flags;}
       {cjp rm_z,end;}
       {sub r5,z,r0,nz;}
end    {}
