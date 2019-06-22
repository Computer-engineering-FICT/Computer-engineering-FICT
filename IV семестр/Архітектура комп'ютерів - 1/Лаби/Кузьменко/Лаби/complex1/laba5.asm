link l1: ct
link l2: rdm
link ewh:16
link ra:z,2,1,0
link rb:z,7,6,5

dw 0:0030h
dw 1:8022h
dw 2:8023h
dw 3:0400h
dw 30h:4h

accept r15:2h
accept r7:0
accept r1:5h
accept r2:0ffffh
accept r3:1h

next {or nil, r7, z; oey; ewl;}
 {r; cjp rdm, cp; or r8, bus_d, z;}
 {or nil, r8, z; cjp no, twoadr;}
 {or r9, 0400h, z;}
 {and nil, r9, r8; cjp not zo, end;}
 {or r9, 03ffh, z;}
 {and nil, r9, r8; oey; ewl;}
 {r; cjp rdm, cp; or r12, bus_d, z;}
 {and r13, r8, 7800h;}
 {xor nil, r13, z; cjs zo, mult;}
 {add r7, r7, z, nz; cjp nz, next;}
twoadr {or r9, 0300h, z;}
 {and nil, r9, r8; cjp not zo, end;}
 {or r9, 0018h, z;}
 {and nil, r9, r8; cjp not zo, end;}
 {or nil, r8, z; oey; load ra; load rb;}
 {and r13, r8, 7c00h;}
 {xor nil, r13, z; cjs zo, adding;}
 {add r7, r7, z, nz; cjp nz, next;}

mult
 {load rm, z;}
 {xor r14, r14, r14;}
 {xor r10, r10, r10;}
 {xor r11, r11, r11;}
 {xor r13, r13, r13;}
 {and nil, r12, 8000h; load rm, flags;}
 {cjp rm_z, not2;}
 {add r14, r14, 1, z;}
 {xor r12, r12, 0ffffh;}
 {add r12, r12, 1, z;}
not2 {and nil, r15, 8000h; load rm, flags;}
 {cjp rm_z, shift;}
 {xor r15, r15, 0ffffh;}
 {sub r14, r14, z, z;}
 {add r15, r15, 1, z;}
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
 {crtn nz;}

adding {add rb, rb, ra, z; crtn nz;}
end {}

