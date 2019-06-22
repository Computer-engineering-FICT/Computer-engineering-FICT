\preparing
accept r7:101h         \command counter
dw 101h:03605h
dw 102h:03606h
dw 103h:03604h
accept r5:013h         \register with address of  operand2
dw 013h:0ffffh              \value of operand2
accept r6:015h
dw 015h:0ffffh
accept r4:017h
dw 017h:2
accept r15:03h       \accumulator with operand1
link l1:rdm
link l2:ct
link ra:3,2,1,0
\________________________________________________
start
\command selection
{add nil,r7,z;oey;ewl;}
{r;add r8,bus_d,z;cjp rdm,cp;}

\unpacking of command
{add nil,r8,z;cjp no,end;}
{xor r9,r9,r9;}
{add r9,400h,z;}
{and nil,r8,r9;cjp zo,end;}
{xor r9,r9,r9;}
{add r9,r9,7800h;}
{and r9,r9,r8;}
{xor r9,3000h;load rm,flags;}
{cjp not rm_z, end;}
\{xor r9,r9,r9;}
\{add r9,r9,3ffh;}
\{and r9,r9,r8;}
\{load ra;}
{add nil,r8,z;oey;ewa;}
{add nil,ra,z;oey;ewl;}
{r;add r13,bus_d,z;cjp rdm,cp;}
{cjp nz,mul;}

\execution(multiply)
mul
{add rq,rq,r15,z;}
{xor rq,r13;}
{or r15,r15,z;load rn,flags;}
{cjp not rn_n,neg1;}
{sub r15,r15,8000h,nz;}

neg1
{or r13,r13,z;load rm,flags;}
{cjp not rm_n,neg2;}
{xor r13,0ffffh;}
{add r13,r13,1,z;}

neg2
{push nz,16;}
{cjp not rm_c,label;}
{add r14,r14,r13,z;}
label
{or sr.2,r14,r14,z;}
{or sr.9,r15,r15,z;}
{rfct;}
{or rq,rq,z;load rm,flags;}
{cjp not rm_n,plus;}
{xor r15,0ffffh;}
{xor r14,0ffffh;}
{add r15,r15,1,z;load rn,flags;}
{cjp not rn_v,plus;}
{add r14,r14,1,z;}
plus
{}
\next command
{add r7,r7,1;}
{cjp nz,start;}


end
{}
