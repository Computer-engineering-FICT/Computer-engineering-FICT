link l1:ct
accept r1:0
accept r2:0ffffh
accept r3:8009h
\__________________

{add rq,rq,r2,z;}
{xor rq,r3;}
{or r2,r2,z;load rn,flags;}
{cjp not rn_n,neg1;}
{sub r2,r2,8000h,nz;}

neg1
{or r3,r3,z;load rm,flags;}
{cjp not rm_n,neg2;}
{xor r3,0ffffh;}
{add r3,r3,1,z;}

neg2
{push nz,16;}
{cjp not rm_c,label;}
{add r1,r1,r3,z;}
label
{or sr.2,r1,r1,z;}
{or sr.9,r2,r2,z;}
{rfct;}
{or rq,rq,z;load rm,flags;}
{cjp not rm_n,plus;}
{xor r1,0ffffh;}
{xor r2,0ffffh;}
{add r2,r2,1,z;}
{cjp not rn_v,plus;load rn,flags;}
{add r1,r1,1,z;}
plus
{}
