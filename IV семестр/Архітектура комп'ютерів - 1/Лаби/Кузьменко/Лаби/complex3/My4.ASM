\preparing

accept r15:0      \hight answer register
accept r6:7777h   \first element
accept r11:17	  \counter

accept r7:100h	\link register and memory 
dw 100h:7003h	\our command in mamory
dw 3h:8fffh		\second element 
link l1:ct
link l2:rdm

\vybirka comandy

{add nil,r7,z;oey;ewl;}					\giving data on bus 
{r;add r8,bus_d,z; cjp rdm,cp;}			\reading, write into register8 from bus
{add nil,r8,z; cjp no,end;}				\cheking null command

{xor r9,r9,r9;}							\cleaning r9
{add r9,r9,400h;}						\cheking type of adressing 
{and nil,r9,r8;cjp not zo,end;}			\if undirect, go to end

{xor r9,r9,r9;}							\cleaning r9
{add r9,r9,3ffh;}						
{and nil,r9,r8;oey;ewl;}				\take the adress of second element in memory
{r;add r13,bus_d,z;cjp rdm,cp;}			\reading, write in r13 second element 


  {add rq,rq,r13,z;}					\resive sign of result 
  {xor rq,rq,r6;}

        {or r13,r13,z;load rm,flags;}		\modify to positive first element 
        {cjp not rm_n,neg1;}
        {xor r13,r13,8000h;}
neg1
       {or r6,r6,z;load rn,flags;}			\modify from additional to direct code of second element 
       {cjp not rn_n,neg2;}
       {xor r6,0ffffh;}
       {add r6,r6,1,z;}

neg2

       {load rm,z;}
label1 {cjp not rm_c,label2;}
       {add r15,r15,r13,z;}

label2 {or srl,r15,r15,z;}
       {or sr.9,r6,r6,z;}
       {sub r11,r11,z,z; load rm,flags;cem_c;}
       {cjp not rm_z,label1;}

{or rq,rq,z; load rn,flags;}				\modify result after multipliy
{cjp not rn_n,end;}
{xor r15,r15,0ffffh;}
{xor r6,r6, 0ffffh;}
{add r6,r6,1,z;load rn,flags;}
{cjp not rn_v, end;}
{add r15,r15,1,z;}
end
{}
