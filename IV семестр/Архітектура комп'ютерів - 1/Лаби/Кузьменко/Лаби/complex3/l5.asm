\r14.r15=r15*r10
\r11-counter
\r13-save sign
\r12-save sign

accept r15:0Bh
accept r7:0000h \first address
dw 0000h:0110000000000011% \r14.r15=r15*a
dw 0001h:0000h \end of the program
dw 0003h:4 \a

link l1:ct
link l2:rdm
link l3:rdd
link ewh:16
link rb:8, 7, 6, 5
link ra:3, 2, 1, 0

begin
{and r9, r9, z;}
{or nil, r7, z; oey; ewl;} \write next instr. address
{and r8, r8, z; oey; ewh;}
read_instr
{cjp rdm, read_instr; or r8, bus_d, z; r;} \read new instruction
{or r8, r8, r8; load rm, flags; cjp rm_z, end_prog;} \checking if the end of the program
{and nil, r8, 8000h; load rm, flags;}
{cjp rm_z, one_adr_i;}
\work with 2-address intsruction
\ra, rb-operands, rb-result
\commands to process 2-address instruction

one_adr_i
\work with one address instruction
{and r9, r8, 7800h;} \define instruction
{xor nil, r9, 6000h; load rm, flags;}
{cjp rm_z, multiply;} \multiply
\add other commands

\incrementing ip
instr_inc {add r7, r7, z, nz; cjp nz, begin;}

multiply
\reading data
{cjs nz, a1_rd_op;}
\converting data
{and r13,r10,8000h; load rm, flags;}
{cjp rm_z, conv_x;}
{xor r10,r10,0ffffh;}
{add r10,r10,z,nz;}

conv_x
{and r12,r15,8000h; load rm, flags;}
{cjp rm_z, conv_y;}
{xor r15,r15,0ffffh;}
{add r15,r15,z,nz;}
conv_y
\end of convertation
\loading counter
{or r11, 0010h, z;}
mull
{or sll,r14,r14,z;}
{or sl.25,r15,r15,z; load rm, flags; cem_c;}
{cjp not rm_c, not_add;}
{add r14,r14,r10,z; load rm,flags;}
{add r15,r15,z,rm_c;}
not_add
{sub r11,r11,z,z; load rm,flags;cjp not rm_z, mull;}
\define sign
{xor r13, r13, r12;}
{or r11, r15, z;} \exchange r14 and r15
{or r15, r14, z;}
{or r14, r11, z;}
{or r14, r14, r13;}
{cjp nz, instr_inc;}

a1_rd_op \system function. Reads operand of 1-operand instruction
\fetch address
{and r9, r8, 03ffh;}
{or nil, r9, z; oey; ewl;}
{xor nil, r9, r9; oey; ewh;}
one_ad_r_o
{or r10, bus_d, z; cjp rdm, one_ad_r_o; r;}
{and nil, r8, 0400h; load rm, flags;}
{cjp rm_z, one_a_r_o;}
{or nil, r10, z; oey; ewl;}
one_a_r_o2
{or r10, bus_d, z; cjp rdm, one_a_r_o2; r;}
one_a_r_o
{crtn nz;}

end_prog \the end of the program
{}
