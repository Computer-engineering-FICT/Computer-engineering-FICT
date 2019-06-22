link l1: ct
link l2: rdm
link l3: rdd
link ewh:16
link ra:z,2,1,0
link rb:z,7,6,5

dw 0:1802h
dw 1:0030h
dw 2:0804h
dw 3:8043h
dw 4:2082h
dw 5:0031h
dw 6:1000h
dw 30h:02h
dw 31h:0h

accept r15:1h
accept r7:0ffffh
accept r1:0h
accept r2:0064h
accept r3:00c8h
accept r6:0003h
accept dev[2]:o, 82h, 84h, 3, 12
accept dev[1]:i, 02h, 04h, 3, 12
accept dev_buf[1]: 1h, 2h, 4h

next {add r7, r7, z, nz;}
 {or nil, r7, z; oey; ewl;}
 {r; cjp rdm, cp; or r8, bus_d, z;}

 adr {or nil, r8, z; cjp no, twoadr;}
 {or r9, 0400h, z;}
 {and nil, r9, r8; cjp not zo, end;}
 {or r9, 03ffh, z;}
 {and nil, r9, r8; oey; ewl;}
 {r; cjp rdm, cp; or r12, bus_d, z;}
 {and r13, r8, 7800h; load rm, flags;}
 {cjp rm_z, mult;}
 {xor nil, r13, 0800h; load rm, flags;}
 {cjp rm_z, condjump;}
 {xor nil, r13, 1000h; load rm, flags;}
 {cjp rm_z, jump;}
 {xor nil, r13, 1800h; load rm, flags;}
 {and r12, r12, z; cjp rm_z, input;}
 {xor nil, r13, 2000h; load rm, flags;}
 {cjp rm_z, output;}
 {cjp nz, next;}

 twoadr {or r9, 0300h, z;}
 {and nil, r9, r8; cjp not zo, end;}
 {or r9, 0018h, z;}
 {and nil, r9, r8; cjp not zo, end;}
 {or nil, r8, z; oey; load ra; load rb;}
 {and r13, r8, 7c00h;}
 {xor nil, r13, z; cjp zo, adding;}
 {cjp nz, next;}

mult
 {load rm, z;}
 {xor r14, r14, r14;}
 {or r10, r14, z;}
 {or r11, r14, z;}
 {or r13, r14, z;}
 {and nil, r12, 8000h; load rm, flags;}
 {cjp rm_z, not2;}
 {sub r12, z, r12, nz;}
 {add r14, r14, 1, z;}
not2 {and nil, r15, 8000h; load rm, flags;}
 {cjp rm_z, shift;}
 {sub r14, r14, z, z;}
 {sub r15, z, r15, nz;}

shift {or srl, r12, r12, z;}
 {or sr.9, r13, r13, z;}
cicle {or sll, r15, z; cjp not rm_c, noadd;}
 {add r10, r10, r12, z; load rm, flags;}
 {add r11, r11, r13, rm_c;}
noadd {or srl, r12, r12, z;}
 {or sr.9, r13, r13, z;}
 {or nil, r15, r15; cjp not zo, cicle;}
 {and r14, r14, r14; cjp zo, invert;}
 {add r10, r10, 8000h, z;}
invert {add r14, r10, z, z;}
 {add r15, r11, z, z; cjp nz, next;}

adding {add rb, rb, ra, z; cjp nz, next;}

input {and r9, r8, 03ffh;}
 {or nil, r9, z; oey; ewl; push;}
 {i; cjp rdd, cp; or r10, bus_d, z;}
 {and nil, r10, 0080h; loop not zo;}
 {add r9, r9, 0002h;}
 {or nil, r9, z; oey; ewl;}
 {i; cjp rdd, cp; or r15, bus_d, z;}
 {cjp nz, next;}

output {and r9, r8, 03ffh;}
 {or nil, r9, z; oey; ewl; push;}
 {i; cjp rdd, cp; or r10, bus_d, z;}
 {and nil, r10, 0080h; loop not zo;}
 {add r9, r9, 0002h;}
 {or nil, r9, r9; oey; ewl;}
 {or nil, r15, z; oey; o; cjp rdd, cp;}
 {cjp nz, next;}

condjump {and nil, r15, 0080h; load rm, flags;}
 {cjp not rm_z, next;}
goto {and r7, 03ffh, r8;}
 {or r8, r12, z; cjp nz, adr;}

jump {sub r6, r6, z, z; cjp not zo, goto;}

end {}

