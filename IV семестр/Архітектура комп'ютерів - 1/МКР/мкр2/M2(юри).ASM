link l1: ct
accept r1: 2
accept r6: 0        \RGA_Max
accept r7: 07fffh   \RGA_Min
accept r8: 07fffh   \RGB
accept r9: 0ffffh   \RGC
accept r13: 0       \RGD_Max
accept r14: 0       \RGD_Mid
accept r15: 0       \RGD_Min

{or srl, r1, r1, z;}
{cjp not rm_c, g0;}

{or sll, r7, r7, z;}
{or sl.25, r6, r6, z;}
{or sll, r7, r7, z;}
{or sl.25, r6, r6, z;}

{or sll, r15, r9, z;}
{or sl.25, r14, r14, z;}

label1
{add r15, r15, r7, z; load rm, flags;}
{add r14, r14, r6, rm_c; cjp not co, decr;}
{add r13, r13, z, nz;}

decr
{sub r8, r8, z, z; cjp not zo, label1;}
{cjp nz, exit;}

g0
{or sll, r15, r7, z; }\cjp not no, label2;}
\{sub r14, r14, z, z;}

label2
{or sl.25, r14, r14, z;}
{or sll, r15, r15, z;}
{or sl.25, r14, r14, z;}

{sub r15, r15, r8, z; }\cjp not vo, exit;}
\{sub r14, r14, z, z;}
exit
{}
