\preparing
accept r15:20h     \first element,acumulator
accept r14:0h    \hight answer register

accept r7:116h
dw 116h:38c0h \jump
dw 130h:7003h \multiple
dw 132h:4040h \cjump
dw 134h:852ah \dvohadres sub
dw 136h:7003h \multiple
dw 138h:400h



accept r1:20h
dw 20h:15h
accept r2:30h
dw 30h:20h

dw 3h:2h

dw 0c0h:130h
dw 40h:130h

equ mull:011100000000%
equ jump:001110000000%
equ asub:000001000000%
equ cjump:010000000000%

link l1:ct
link l2:rdm
link ra:3,2,1,0
link rb:8,7,6,5

start
\vybirka comandy
\unpack 1 adress comand

        {add nil,r7,z;oey;ewl;}          \giving data on bus
 {r;add r8,bus_d,z; cjp rdm,cp;}     \reading, write into register8 from bus

 {xor r9,r9,r9;}
 {add r9,r9,8000h;}        \chi dvohadresna
 {and r9,r9,r8;cjp not zo,to2adres;}

 {xor r9,r9,r9;}        \cleaning r9
 {add r9,r9,400h;}       \cheking type of adressing
 {and nil,r9,r8;cjp not zo,err;}   \if undirect, go to end

 {xor r9,r9,r9;}       \cleaning r9
 {add r9,r9,3ffh;}
 {and nil,r9,r8;oey;ewl;}      \take the adress of second element in memory
 {r;add r13,bus_d,z;cjp rdm,cp;}   \reading, write in r13 second element

 link m:z,z,14,13,12,11,z,z,z,z,z,z  \tip operatii
 {add nil,r8,z;oey;jmap;}
{}

to2adres

  \unpack our command
  {xor r9,r9,r9;}
  {add r9,r9,400h;}
  {and r9,r9,r8;cjp zo, err;}

  {xor r9,r9,r9;}
  {add r9,r9,100h;}
  {and r9,r9,r8;cjp zo, err ;}


  {xor r9,r9,r9;}
  {add r9,r9,8h;}
  {and r9,r9,r8;cjp zo, err ;}

  {xor r9,r9,r9;}
  {add r9,r9,8h;}
  {xor r9,r9,r8;}
  {add nil,r9,z;oey;ewa;}
  {add nil,ra,z;oey;ewl;}
{xor r13,r13,r13;}
  {r;add r13,bus_d,z;cjp rdm,cp;}

  {xor r9,r9,r9;}
  {add r9,r9,100h;}
  {xor r9,r9,r8;}
  {add nil,r9,z;oey;ewb;}
  {add nil,rb,z;oey;ewl;}
{xor r12,r12,r12;}
  {r;add r12,bus_d,z;cjp rdm,cp;}

  link m:z,14,13,12,11,10,z,z,z,z,z,z  \tip operatii
  {add nil,r8,z;oey;jmap;}

org mull
 {xor r11,r11,r11;}
 {add r11,r11,17;}

    {add rq,rq,r13,z;}      \resive sign of result
    {xor rq,rq,r15;}

    {or r13,r13,z;load rm,flags;}  \modify to positive first element
    {cjp not rm_n,neg1;}
    {xor r13,r13,8000h;}
  neg1
   {or r15,r15,z;load rn,flags;}   \modify from additional to direct code of second element
   {cjp not rn_n,neg2;}
   {xor r15,0ffffh;}
   {add r15,r15,1,z;}

  neg2

   {load rm,z;}
  label1 {cjp not rm_c,label2;}
   {add r14,r14,r13,z;}

  label2 {or srl,r14,r14,z;}
   {or sr.9,r15,r15,z;}
   {sub r11,r11,z,z; load rm,flags;cem_c;}
   {cjp not rm_z,label1;}

  {or rq,rq,z; load rn,flags;}    \modify result after multipliy
  {cjp not rn_n,end;}
  {xor r14,r14,0ffffh;}
  {xor r15,r15, 0ffffh;}
  {add r15,r15,1,z;load rn,flags;}
  {cjp not rn_v, end;}
  {add r14,r14,1,z;}
  end
  {cjp nz, con;}

org asub

  {sub r12,r12,r13,nz;}
  {cjp nz,con;}
  \result in r15

con  \zberig rezult v pershu yacheyku

  {add nil,r8,z;cjp not no,one;}
  {xor r9,r9,r9;}
  {add r9,r9,0000000011100000%;}
  {and nil,r8,r9;oey;ewb;}
  {add nil,rb,z;oey;ewl;}
  {w;add nil,r12,z;oey;cjp rdm,cp;}

 {xor r9,r9,r9;}
  {add r9,r9,100h;}

  {xor r9,r9,r8;}
  {add nil,r9,z;oey;ewb;}
  {add nil,rb,z;oey;ewl;}
  {r;add r10,bus_d,z;cjp rdm,cp;}
  {cjp nz,one;}
org jump
  {xor r7,r7;}
  {add r7,r13,z;}  \next adress to jump
  {cjp nz,start;}

org cjump
  {xor r9,r9;}
  {add r9,r9,0000000010000000%;}
  {and nil,r15,r9; load rm,flags;}
  {cjp not rm_z,one;}
  {xor r7,r7;}
  {add r7,r13,z;}
  {cjp nz,start;}

 one
 {add r7,r7,2;} \form nastupnu commandu
 {cjp nz,start;}
err
{}
