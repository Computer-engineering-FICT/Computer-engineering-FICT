link l1: ct
link l2: rdm
link l3: rdd
link ewh: 16
link M: 14,13,12,11,10,z,z,z,z,z,z,z
link rb: z,2,1,0

accept dev[1]:i, 62h, 64h,0,5
accept dev[2]:o,0E2h,0E4h,0,5
accept dev_buf[1]:1h,2222h

dw 1000h: 0000110000100010% \command input
dw 1004h: 1000111110111100% \command &
dw 0001h:010h    \address
dw 0002h:0101%
dw 0003h:1001h
dw 0004h:1001%
dw 0010h:0000000000000010% \operand
dw 0022h:0062h
dw 0032h:00E2h
dw 0300h:1001h
dw 0062h:062h
dw 00E2h:0E2h

dw 1001h: 0111010000000001% \command mul
dw 1003h: 0111010000000001% \mul again
dw 1005h: 0111110000000011% \command jnz
dw 1002h: 0000011100000000% \command jmp
dw 1006h: 0000011100000000% \jmp again
dw 1007h: 0001010000110010% \command output
accept ra:1

accept r4:004h
accept r5:006h
accept r6:16 \counter for multiply
accept r7:1000h \address of command in RAM
accept r9:0  \command register
accept r10: 0h
accept r11: 0h
accept r12: 0h\buffer for Y
accept r13: 0h\X in additional
accept r14: 0h\Z
accept r15: 0h\Z and Y

equ MUL: 0E80h
equ JMP: 0080h
equ JNZ: 0F80h
equ INP: 0180h
equ OUT: 0280h

start  {xor nil, r0,r0;oey;ewh;}
       {or nil, r7, z; oey;ewl;}
read1  {r;cjp rdm, read1; or r8,bus_d,z;}\reading first command

       {or nil, r8,z;load rm,flags;}\checking the type of command
       {cjp rm_n, doub;}
       {cjp rm_z, fExit;}\if command is empty- exit from program

       {or nil,r8,z;oey;jmap;}

org MUL
       {and r10,r8,7800h;}\checking the operation
       {xor nil,r10,7000h;load rm, flags;}
       {cjp not rm_z, exit;}\if not-new command

       {and nil, r8,400h;load rm,flags;}\checking addressing type
       {cjp rm_z, exit;}\if not new command

       {xor nil,r0,r0;oey;ewh;}
       {or r0,3ffh,z;}
       {and nil,r8,r0;oey;ewl;}\define the address

read2  {r;cjp rdm, read2; or r11,bus_d,z;}
       {or nil, r11,z;oey;ewl;}\define the operand

read3  {r;cjp rdm, read3; or r13,bus_d,z;}\X
\multiply

{load rm,z;}
{or sll,r13,r13,z;}
{add r9,z,rm_c;}
{or sra,r13,r13,z;}
{cjp not rm_c,sign;}
{sub r13,r13,z,z;}
{nxor r13,r13,z;}
sign       {load rm,z;}
{xor r10,r10;}
{or sll,r15,r15,z;}
{add r5,z,rm_c;}
{or sra,r15,r15,z;}
{xor r9,r9,r10;}
{xor r10,r10;}
{load rm,z;load rn,z;}
{or r12,r12,r15;}
{xor r15,r15;}
label1         {and nil,r13,8000h;load rm,flags;cem_z;cem_c;}
               {or sll,r15,r15,z;}
               {or sla,r14,r14,z;}
               {add r14,z,rm_c;}
               {cjp not rm_n,label2;}
               {add r15,r15,r12;load rm,flags;cem_n;cem_z;cem_v;}
               {add r14,z,rn_c;}
label2         {sub r6,r6,z,z;load rm,flags;cem_c;}
               {or sla, r13,r13,z;}
               {cjp not rm_z,label1;}
{load rm,z;}
{add r6,r6,10h;}
{xor r12,r12;}
{or srl,r9,r9,z;}
{cjp not rm_c,exit;}
{add r14,r14,8000h,z;}
{cjp nz,exit;}

doub   {and r10, r8,7C00h;}\checking operation
       {xor nil, r10,0c00h;load rm,flags;}
       {cjp not rm_z,exit;}\if wrong operation-new command

       {and nil, r8,318h;load rm, flags;}\checking addressing type
       {cjp rm_z, exit;}

       {or nil,r8,z;oey;load rb;}\loading address of first operand
       {or nil,rb,z;oey;ewl;}
       {or r0,2h,z;}
       {sub rb,rb,r0,nz;}
       {xor nil, r0,r0;oey;ewh;}
       {or nil, r4,z;oey;ewl;}

read4  {r; cjp rdm, read4; or r4,bus_d,z;}\reading first operand
       {or srl,r8,r8,z;}\shifting for finding second address
       {or srl,r8,r8,z;}
       {or srl,r8,r8,z;}
       {or srl,r8,r8,z;}
       {or srl,r8,r8,z;}

       {or nil,r8,z;oey;load rb;}
       {or nil,rb,z;oey;ewl;}
       {sub rb,rb,r0,nz;}
       {or nil,r5,z;oey;ewl;}
read5  {r;cjp rdm,read5; or r5,bus_d,z;}\reading second operand
       {and r4,r5;}\operation &

       {or nil,ra,z;oey;ewl;}
write  {w;cjp rdm,write;or nil,r4,z;oey;}
       {cjp nz,exit;}
org JNZ {and nil,r8,0010h;load rm,flags;}
       {cjp not rm_z,fExit;}

       {xor nil,r1,r1;oey;ewh;}
       {and r1,r8,3ffh;}
       {or nil,r1,z;oey;ewl;}
la1     {r;cjp rdm,la1;or r1,bus_d,z;load rm,flags;}
       {cjp nz,exit;}

org JMP {and nil,r8,0010h;load rn,flags;}
       {cjp not rn_z,exit;}
       {and nil,r15,80h;load rm,flags;}\checking condition
       {cjp not rm_z,ml1;}

       {xor nil,r1,r1;oey;ewh;}
       {and r1,r8,3ffh;}
       {or nil,r1,z;oey;ewl;}
la2    {r;cjp rdm,la2;or r1,bus_d,z;load rm,flags;}
       {xor r7,r7;}
       {or r7,1002h,z;}
       {cjp nz,exit;}

org INP {and nil,r8,400h;load rn,flags;}
       {cjp rn_z,fExit;}

       {xor nil,r0,r0;oey;ewh;}
       {and r0,r8,3ffh;}
       {or nil,r0,z;oey;ewl;}\address

rdi1   {r;cjp rdm,rdi1;or r3,bus_d,z;}
       {xor nil,r3,r3;oey;ewh;}
       {or nil, r3,z;oey;ewl;}

rdi2   {r;cjp rdm,rdi2;or r0,bus_d,z;}
       {xor nil,r0,r0;oey;ewh;}
       {and r2,r0,0ffffh;}
       {or nil,r2,z;oey;ewl;}

rdi3   {i;cjp rdd,rdi3;or r1,bus_d,z;}

       {and nil,r1,0080h;load rm,flags;}
       {cjp rm_z, rdi3;}
       {add r0,r0,2h;}
       {xor nil,r0,r0;oey;ewh;}
       {or nil,r0,z;oey;ewl;}

rdi4   {i;cjp rdd,rdi4;or r15,bus_d,z;}
       {cjp nz,exit;}

org OUT {and nil,r8,400h;load rn,flags;}
       {cjp rn_z,fExit;}
       {xor r3,r3;}
       {xor r0,r0;}

       {xor nil,r0,r0;oey;ewh;}
       {and r0,r8,3ffh;}
       {or nil,r0,z;oey;ewl;}

rdo1   {r;cjp rdm,rdo1;or r3,bus_d,z;}
       {xor nil,r3,r3;oey;ewh;}
       {xor nil,r3,z;oey;ewl;}
rdo2   {r;cjp rdm, rdo2;or r0,bus_d,z;}

       {xor nil,r0,r0;oey;ewh;}
       {and r2,r0,0ffffh;}
       {or nil,r2,z;oey;ewl;}
rdo3   {o;cjp rdd, rdo3;or r1,bus_d,z;}

       {and r1,r1,0800h;load rm,flags;}
       {cjp rm_z,rdo3;}

       {add r0,r0,2h;}
       {xor nil,r0,r0;oey;ewh;}
       {or nil,r0,z;oey;ewl;}
wro    {o;cjp rdd,wro;or nil,r15,z;oey;}
       {cjp nz,exit;}

ml1    {xor r7,r7;}
       {or r7,1007h,z;}
       {cjp nz,start;}

exit   {add r7,r7,z,nz;}
       {cjp nz,start;}
fExit  {}
