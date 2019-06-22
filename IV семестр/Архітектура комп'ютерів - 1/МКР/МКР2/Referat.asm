\First  Nastroyka sxemu

LINK l1:ct
LINK l2:rdm
LINK l3:rdd
LINK ewh:16
LINK M:z,z,z,z,z,z,z,14,13,12,11,z
ACCEPT dev[1]:I,052h,054h,12,2
ACCEPT dev[2]:O,0D2h,0D4h,12,2
ACCEPT dev[3]:O,0E2h,0E4h,12,2

ACCEPT dev_buf[1]:08h,0fh
ACCEPT R7:001Eh
ACCEPT R10:03ffh
ACCEPT R15:07h

\Program in OP

DW 001Eh:0011110001110010% \mov [072h],r15
DW 0020h:0001110001010110%  \test [0056h]
DW 0022h:0001010001011010%  \jz [005Ah]
DW 0024h:0010110001010110%  \in r15,[0056h]
DW 0026h:0101110001110010%  \Sum r14,r15
DW 0028h:0011110001100100%  \mov [0064h],r15
DW 002Ah:0001110001010110%  \test [0056h]
DW 002Ch:0001010001011100%  \jz [005Ch]
DW 002Eh:0010110001010110%  \in r15,[0056h]
DW 0030h:0011110001100110%  \mov [0066h],r15
DW 0032h:0100110001100100%  \mul [0064h]
DW 0034h:0001110001011000%  \test [0058h]
DW 0036h:0001010001100000%  \jz [0060h]
DW 0038h:0010010001011000%  \out [0058h]
DW 003Ah:0000110000000000%  \swap r15,r13
DW 003Ch:0001110001011001%  \test [0058h]
DW 003Eh:0001010001100010%  \jz [0062h]
DW 0040h:0010010001011001%  \out [0059h]
DW 0042h:0101010000000000%  \exit

\Date in OP

DW 0056h:006Ah \(IN)
DW 0058h:006Ch \(OUT)
DW 0059h:006Fh \(OUT)

DW 005Ah:0020h \povernenna
DW 005Ch:0028h
DW 0060h:0032h
DW 0062h:003Ah

DW 0064h:006Eh \(X)
DW 0066h:0070h \(Y)

DW 006Ah:0052h \IN
DW 006Ch:00D2h \OUT
DW 006Fh:00E2h \OUT


DW 006Eh:0000h \X
DW 0070h:0000h \Y


\KOP command

ORG 0h                         \first
{cjp nz,go;}
ORG 2h                         \adress  swap r15,r13
{cjp nz,swap;}
ORG 4h                         \  jz [mem]
{cjp nz,zjump;}
ORG 6h                         \ test [mem]
{cjp nz,testdevice;}
ORG 8h                         \ out [mem],r15
{cjp nz,output;}
ORG 0Ah                       \ in r15,[mem]
{cjp nz,input;}
ORG 0Eh                     \ mov [mem],r15
{cjp nz,movToMem;}
ORG 12h                        \ mult
{cjp nz,mul;}
ORG 14h                        \ exit
{cjp nz,exit;}
ORG 16h
{cjp nz,Sum;}

ORG 20h

go

\Read command on Op
{or nil,r7,r7;ewl;oey;}
{xor nil,r7,r7;ewh;oey;}
{r;cjp rdm,cp;or r8,z,bus_d;}

\Analis format command
{and nil,r8,8000h;load rm,flags;}
{cjp not rm_z,exit;}

\Analis type of adress
{and nil,r8,400h;load rm,flags;}
{cjp rm_z,exit;}


{and r14,r8,03ffh;}

\transiyion to microoperation
{or nil,r8,z;oey;JMAP;}

\Load from OP
FromMem
{or nil,r14,z;ewl;oey;}
{r;or r14,bus_d,z;cjp rdm,cp;}
{or nil,r14,z;ewl;oey;}
{r;or r14,bus_d,z;cjp rdm,cp;}
{crtn nz;}

\ Swap r15,r13
swap
{or r11,r15,z;}
{or r15,r13,z;}
{or r13,r11,z;}
{cjp nz,next;}

mul
   {cjs nz,FromMem;}
    {or r11,z,17;}
    {xor nil,r14,r15; load rm,flags;}
    {or nil,r14,r14; cjp  not no ,ll1;}
    {sub r14, 0,r14,nz;}
    ll1 {or nil,r15,r15; cjp not no ,ll2;}
    {xor r15,r15,8000h;}

ll2 {cjp not rm_c,ll3;}
    {add r13,r13,r14,z;}
ll3 {or srl,r13,r13,z;}
    {or sr.9,r15,r15,z;}
    {sub r11,r11,z,z; load rm, flags;cem_c;cem_n;}

    {cjp not rm_z, ll2;}
    {cjp not rm_n,fin;}
    {xor  r15,r15,0FFFFh;}
    {xor  r13,r13,0FFFFh;}
    {add  r15,r15,1,z;}
    {add  r13,r13,0,rm_c;}

fin {cjp nz,next;}


Sum
{cjs nz,FromMem;}
{add r15,r15,r14,z;}
{cjp nz,next;}

\ mov [mem],15
movToMem
{or nil,r14,z;ewl;oey;}
{r;or r14,bus_d,z;cjp rdm,cp;}
{or nil,r14,z;ewl;oey;}
{w;cjp rdm,cp;or nil,r15,z;oey;}
{cjp nz,next;}

\ jz [mem]
zjump
     {cjp not rn_z,no_j;}
     {cjs nz,FromMem;}
     {sub r7,r14,1;}
no_j {cjp nz,next;}

\ in r15,[mem]
input
{cjs nz,FromMem;}
{add r14,r14,2,z;}
{or nil,r14,z;ewl;oey;}
{i;cjp rdd,cp;or r15,bus_d,z;}
{cjp nz,next;}

\ out [mem],r15
output
{cjs nz,FromMem;}
{add r14,r14,2,z;}
{or nil,r14,z;ewl;oey;}
{o;cjp rdd,cp;or nil,r15,z;oey;}
{cjp nz,next;}

\ test [mem]
testdevice
{cjs nz,FromMem;}
{or nil,r14,z;oey;ewl;}
{i;cjp rdd,cp;or r14,bus_d,z;}
{or nil,r14,z;load rn,flags;}
{cjp nz,next;}


Next
{add r7,r7,2,z;}
{cjp nz,go;}

\ exit
exit  {}
