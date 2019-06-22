link l1:ct
accept r10:0 \first part of r1 register
accept r11:0 \second part
accept r3: 0fe0ch \operand 1
accept r2: 0fe0ch \operand 2
accept r9:0 \register for saving sign
accept r8:10h \counter
accept r7:8000h
{load rm, z;}
check1 {and nil, r3, r7; load rm, flags;cjp rm_z, check2;}
{add r9, r9, nz;}
{xor r3, r3, 0ffffh;}
{add r3, r3, 1, z;}
check2{and nil, r2, r7; load rm, flags;cjp rm_z, start;}
{sub r9, r9, z, z;}
{xor r2, r2, 0ffffh;}
{add r2, r2, 1, z;}
start {and nil, r2, r7; load rm, flags;cjp rm_z, shift;}
{add r10, r10, r3, z; load rm, flags;}
{add r11, r11,z, rm_c;}
shift{or sll, r2,r2,z;}
{sub r8, r8, z, z; load rm, flags;cjp rm_z, setSign;}
{or sl.16, r10, r10, z;}
{or sl.25, r11, r11, z;cjp nz, start;}
setSign {or nil, r9, r9; load rm, flags;cjp rm_z, end;}
{or r11, r11, r7;}
end{}
