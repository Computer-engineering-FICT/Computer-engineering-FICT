accept r7:000ah
dw 000ah:2445h
dw 000ch:7c00h
dw 000eh:0c03h
dw 0010h:9f59h
dw 0012h:2c46h
dw 0014h:4000h
equ beg:000000000000%
equ input:001000000000%
equ mul:011110000000%
equ cond:000010000000%
equ output:001010000000%
equ cancel:010000000000%
\operands for multiply
accept r0:0020h        \index op1
dw 00020h:0002h         \op1
accept r15:0002h       \op2
\operands for comutation/autodecrement
accept r1:0030h        \address op3
accept r2:0040h        \address op4
dw 0030h:0ffffh        \op3
dw 0040h:0f0fh         \op4
\operans for cond and not cond
accept r3:0050h        \address op4
accept r4:0052h        \address op5
dw 0050h:000ch         \op4
dw 0052h:000ch         \op5
\operands for input/output
accept r5:0060h
accept r6:0062h
dw 0060h:0072h
dw 0061h:0074h
dw 0062h:00f2h
dw 0063h:00f4h
accept dev[1]:i,72h,74h,2,16
accept dev[2]:o,0f2h,0f4h,3,10
accept dev_buf[1]:0002h

link l1:ct
link l2:rdm
link l3:rdd
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

{xor r10,r10,r10;}
{add r10,16,z;}
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
{sub r10,r10,z,z;load rm,flags;cem_c;}
{cjp not rm_z,label1;}

{or r10,rq; load rm,flags;}
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
{sub r1,1,nz;}
{sub r2,1,nz;}
{cjp nz,lnext;}

org cond
{add r15,0080h;}
{xor r9,r9;}
{add r9,000000010000000%;}
{and nil,r9,r15;cjp not zo,lnext;}
{xor r7,r7;}
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp;add r7,bus_d,z;}
{cjp nz,beg;}

notcond
{xor r7,r7;}
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp;add r7,bus_d,z;}
{cjp nz,beg;}

org input
{xor r15,r15;}
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp;ewl;}
readagain
{i;cjp rdd,cp;add rq,bus_d,z;}
{xor r9,r9;}
{add r9,0000000010000000%;}
{and nil,rq,r9;cjp zo,readagain;}
{xor r9,r9;}
{add r9,1;}
{add rb,r9;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp;ewl;}
{i;cjp rdd,cp;add r15,bus_d,z;}
{cjp nz,lnext;}

org output
{add nil,r8,z;oey;ewb;}
{add nil,rb,z;oey;ewl;}
{r;cjp rdm,cp; ewl;}
writeagain
{i;cjp rdd,cp;add rq,bus_d,z;}
{xor r9,r9;}
{add r9,0000000010000000%;}
{and nil,rq,r9;cjp zo,writeagain;}
{xor r9,r9;}
{add r9,1;}
{add rb,r9;}
{add rb,z;oey;ewl;}
{r;cjp rdm,cp;ewl;}
{o;cjp rdd,cp;add nil,r15,z;oey;o;}
{cjp nz,lnext;}
lnext
{add r7,2;}
{cjp nz,beg;}
org cancel
{}
