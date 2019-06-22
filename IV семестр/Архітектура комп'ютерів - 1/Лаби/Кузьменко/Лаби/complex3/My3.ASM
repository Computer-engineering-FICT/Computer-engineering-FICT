link l3: ct
accept r12:0
accept r9:7BCDh
accept r10:0FDEFh
accept r11:17

       {add rq,rq,r9,z;}
       {xor rq,rq,r10;}

       {or r9,r9,z;load rm,flags;}
       {cjp not rm_n, neg1;}
       {xor r9,0ffffh;}
       {add r9,r9,1,z;}
neg1
       {or r10,r10,z;load rn, flags;}
       {cjp not rn_n, neg2;}
       {xor r10,8000h;}
neg2
       {load rm,z;}
label1 {cjp not rm_c, label2;}
       {add r12,r12,r9,z;}

label2 {or srl,r12,r12,z;}
       {or sr.9,r10,r10,z;}
       {sub r11,r11,z,z; load rm,flags;cem_c;}
       {cjp not rm_z,label1;}

{or rq,rq,z; load rn,flags;}
{cjp not rn_n,end;}
{xor r12,r12,0ffffh;}
{xor r10,r10, 0ffffh;}
{add r10,r10,1,z;load rn,flags;}
{cjp not rn_v, end;}
{add r12,r12,1,z;}
end
{}
