link l1: ct
link l2: rdm
link ewh:16
link ra:z,2,1,0
link rb:z,7,6,5

dw 0:0802h
dw 1:8022h
dw 2:0030h
dw 3:1000h
dw 30h:2h

accept r15:3h
accept r7:0ffffh
accept r1:04h
accept r2:02h
accept r6:0ah

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
 {add r15, r11, z, z;}
 {cjp nz, next;}

adding {add rb, rb, ra, z; cjp nz, next;}

condjump {and nil, r15, 0080h; load rm, flags;}
 {cjp not rm_z, next;}
goto {and r7, 03ffh, r8;}
 {or r8, r12, z; cjp nz, adr;}

jump {sub r6, r6, z, z; cjp not zo, goto;}

end {}
