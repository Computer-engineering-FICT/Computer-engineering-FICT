link l1:ct
link l2:rdm
link l3:rdd
link ewh:16
link m:z,z,z,15,14,13,12,11,10,z,z,z
link ra:z,2,1,0
link rb:z,7,6,5

dw 0:4822h
dw 1:400eh
dw 5:300dh
dw 6:8509h
dw 7:380ch
dw 8:50a2h
dw 9:8000h
dw 0ah:0005h
dw 0bh:0001h
dw 0ch:0005h
dw 0dh:0002h
dw 0eh:0005h

accept dev[1]:i, 22h, 24h, 3, 16
accept dev[2]:o, 0a2h, 0a4h, 3, 16
accept dev_buf[1]: 0001h
accept r0:000ah
accept r1:000bh
accept r7:0000h
accept r15:0005h

decod {add nil, r7, z; oey; ewl;}
{r; cjp rdm, cp; or r8, bus_d, z;}
{or nil, r8, z; cjp no, dvoadr;}

odnoadr {or r9, z, 0400h;}
{and nil, r9, r8; cjp not zo, end;}
{or r9, z, 03ffh;}
{and r9, r8, r9; oey; ewl;}
{r; cjp rdm, cp; or r12, bus_d, z;}
{or nil, r8, z; oey; jmap;}

dvoadr {or r9, 0200h, z;}
{and nil, r9, r8; cjp not zo, end;}
{or r9, 0100h, z;}
{and nil, r9, r8; cjp zo, end;}
{or r9, z, 0010h;}
{and nil, r9, r8; cjp not zo, end;}
{or r9, z, 0008h;}
{and nil, r9, r8; cjp zo, end;}
{or nil, r8, z; oey; load ra; load rb;}
{or nil, ra, z; oey; ewl;}
{r; cjp rdm, cp; or r10, bus_d, z;}
{or nil, rb, z;oey;ewl;}
{r; cjp rdm, cp; or r11, bus_d, z;}
{or nil,r8,z; oey; jmap;}

increm {add r7, r7, z, nz; cjp nz,decod;}

org 60h
mult{xor r14,r14,r14; load rm,z;}
{xor r13,r13,r13;}
{add r13,r13,17,z;}
{xor nil,r12,r15; load rn,flags;}
{or nil,r15,z; cjp not no,conv;}
{sub r15,z,r15,nz;}
conv {or nil,r12,z; cjp not no,label1;}
{sub r12,z,r12,nz;}
label1 {cjp not rm_c,label2;}
{add r14,r14,r12,z;}
label2 {or srl,r14,r14,z;}
{or sr.9,r15,r15,z;}
{sub r13,r13,z,z; cjp not zo,label1;}
{cjp not rn_n,increm;}
{sub r15,z,r15,nz; load rm,flags;}
{sub r14,z,r14,rm_c;cjp nz,increm;}

org 70h
condjump{and nil,r11,8000h; load rm,flags;}
{cjp not rm_z,increm;}
{or r7,r12,z; cjp nz,decod;}

org 80h
uncondjump{or r7,r12,z; cjp nz,decod;}

org 90h
input {or nil, r9, z; oey; ewl; push;}
{i; cjp rdd, cp; or r12, bus_d, z;}
{and nil, r12, 0080h; loop not zo;}
{add r9, r9, 0002h, z;}
{or r9, r9, z; oey; ewl;}
{i; cjp rdd, cp; or r15, bus_d, z;}
{cjp nz, increm;}

org 0a0h
output {or nil, r9, z; oey; ewl; push;}
{i; cjp rdd, cp; or r12, bus_d, z;}
{and nil, r12, 0080h; loop not zo;}
{add r9, r9, 0002h, z;}
{or r9, r9, z; oey; ewl;}
{or nil, r15, z; oey; o; cjp rdd, cp;}
{cjp nz, increm;}

org 108h
dwoadrsub{sub r11,r11,r10,nz;}
{or nil,r8,z; oey; load rb;}
{or nil,rb,z; oey; ewl;}
{or nil,r11,z; oey; w; cjp rdm,cp;}
{cjp nz,increm;}
end {}
