link l1:ct
accept r2:5h
accept r3:4h
accept r1:0h
beg   {add srl,r2,r2,z;}
{cjp rm_c,m1;}
{cjp nz,m2;}
m1 {add r2,r2,rm_c;}
{add r1,r1,r3,rm_c;}
{add srl,r2,r2,z;}
{add sll,r3,r3,z;}
{cjp nz,cond;}
m2 {add sll,r3,r3,z;}
cond {add r2,r2,z;cjp not zo,beg;}
{}
