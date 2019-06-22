accept r7:000ch       
dw 000ch:0c01h
dw 0010h:7c00h
dw 0012h:8fbch
dw 0014h:0402h
dw 0016h:2000h
equ beg:010000000000%
equ cond:000010000000%
equ mul:011110000000%
equ notcond:000000000000%
equ cancel:001000000000%
accept r0:001ah        \index op1
dw 001ah:0002h         \op1
accept r15:0002h       \op2
accept r4:0020h        \index op3
accept r5:0030h        \index op4
dw 0020h:0ffffh        \op3
dw 0030h:0f0fh         \op4
dw 0032h:0010h
dw 0034h:000ch
accept r1:0032h
accept r2:0034h

link l1:ct
link l2:rdm
link m:15,14,13,12,11,z,z,z,z,z,z,z
link ewh:16
link rb:3,2,1,0
link ra:7,6,5,4

org beg
{add nil,r7,z;oey;ewl;}
{r;cjp rdm,cp;add r8,bus_d,z;}
{add nil,r8,z;cjp no,twoop;}
{add nil,r8,z;oey;jmap;}
{cjp nz,cancel;}

org mul
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp;add r13,bus_d,z;}

{xor r3,r3,r3;}
{add r3,r3,16,z;}
{xor r14,r14;}
{load rm,z;}
{xor rq,r15,r13;}

{or r15,r15;load rm,flags;}
{cjp not rm_n,label1_1;}
{sub r15,r15,1,not z;}
{xor r15,0ffffh;}
label1_1

{or r13,r13;load rm,flags;}
{cjp not rm_n,label1;}
{xor r13,8000h;}
label1

{or sll,r14,r14,z;}
{or sl.25,r15,r15,z;}
{cjp not rm_c,label2;}
{add r14,r14,r13;}
{add r15,r15,z,z;}

label2
{sub r3,r3,z,z;load rm,flags;cem_c;}
{cjp not rm_z,label1;}

{or r3,rq; load rm,flags;}
{cjp not rm_n,nosign;}
{xor r14,r14,0ffffh;}
{xor r15,r15,0ffffh;}
{add r14,r14,1;}
{add r15,r15,z,z;}
nosign
{or r10,r14,z;}
{or r14,r15,z;}
{or r15,r10,z;}
{cjp nz,lnext;}

twoop
{xor r9,r9;}
{add r9,0000110000000000%;}
{and nil,r9,r8;cjp zo,cancel;}
{xor r9,r9;}
{add r9,0000001100011000%;}
{and nil,r9,r8;cjp zo,cancel;}

{xor r9,r9;}
{add r9,r8;}
{and r9,7h;}
{add nil,r9,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp;add r11,bus_d,z;}

{xor r9,r9;}
{add r9,r8;}
{and r9,0e0h;}
{add srl,r9,r9,z;}
{add nil,r9,z;oey;ewa;}
{add nil,ra,z;oey;ewl;}
{r;cjp rdm,cp;add r12,bus_d,z;}

{and r11,r11,r12;}
{add nil,rb,z;oey;ewl;}
lwrite {cjp rdm,lwrite;w;or nil,r11,z;oey;}
{sub r4,1,nz;}
{sub r5,1,nz;}
{cjp nz,lnext;}

org cond
{xor r9,r9;}
{add r9,000000010000000%;}
{and nil,r9,r15;cjp not zo,lnext;}
{xor r7,r7;}
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp;add r7,bus_d,z;}
{cjp nz,beg;}

org notcond
{xor r7,r7;}
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp;add r7,bus_d,z;}
{cjp nz,beg;}

lnext
{add r7,2;}
{cjp nz,beg;}
org cancel
{}
