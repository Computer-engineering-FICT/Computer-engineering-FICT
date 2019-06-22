link l1:ct
link l2:rdm
link ewh:16
link m:z,z,z,15,14,13,12,11,z,z,z,z
link ra:z,2,1,0
link rb:z,7,6,5


dw 0:4830h
dw 1:4831h

dw 2:8509h
dw 3:850ah
dw 4:850ah
dw 5:850ah
dw 6:850ah
dw 7:850ah

dw 8:8000h

dw 30h:0002h
dw 31h:0002h

dw 40h:0050h
dw 41h:0051h
dw 42h:0052h

dw 50h:0005h
dw 51h:0001h
dw 52h:0001h

accept r0:50h
accept r1:51h
accept r2:52h
accept r7:0000h
accept r15:0001h
decode {or nil, r7, z; oey; ewl;}
{r; cjp rdm, cp; add r8, bus_d, z;}
{or nil, r8, z; cjp no, dadr;}
{xor r9, r9, r9;}
{add r9, r9, 0400h;}
{or nil, r9, r8; cjp zo, exit;}
{xor r9, r9, r9;}
{add r9, r9, 3ffh;}
{and nil, r8, r9; oey; ewl;}
{r; cjp rdm, cp; add r12, bus_d, z;}
{or nil, r8, z; oey; jmap;}
return {add r7, r7, z, nz; cjp nz,decode;}

dadr {and r9, r8, 0318h;}
{xor nil, r9, 0108h; load rm, flags;}
{cjp not rm_z, exit;}
{or nil, r8, z; oey; load ra; load rb;}
{or nil, ra, z; oey; ewl;}
{r; cjp rdm, cp; or r10, bus_d, z;}
{or nil, rb, z; oey; ewl;}
{r; cjp rdm, cp; or r11, bus_d, z;}
{or nil, rb, z; oey; ewl;}
{sub r11, r11, r10, nz;}
{or nil, r11, z; oey; w; cjp rdm, cp;}
{add r7, r7, z, nz; cjp nz, decode;}

org 90h
multipl {xor r14,r14,r14;}
{and r13,r13,r14;}
{add r13,r13,17;}
{xor nil,r12,r15; load rn,flags;}
{and r15,r15,07fffh;}
{or nil,r12,z; load rm,z; cjp not no,log1;}
{sub r12,0,r12,nz;}
log1 {cjp not rm_c,log2;}
{add r14,r14,r12,z;}
log2 {or srl,r14,r14,z;}
{or sr.9,r15,r15,z;}
{sub r13,r13,z,z; cjp not zo,log1;}
{add r7, r7, z ,nz; cjp nz, decode;}

exit {}
