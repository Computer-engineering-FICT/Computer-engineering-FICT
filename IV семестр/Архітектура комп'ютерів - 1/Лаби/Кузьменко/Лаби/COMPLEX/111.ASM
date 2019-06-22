link 13: ct
accept r12:0
accept r9:7
accept r10:0fffbh
accept r11:17

label1 {cjp not rm_c,label2;}
{add r12,r12,r9,z;}
label2 {or srl, r12,r12,z;}
{or sr.9,r10,r10,z;}
{sub r11,r11,z,z;load rm,flags;cem_c;}
{cjp not rm_z, label1;}
{nxor r10,1;}


