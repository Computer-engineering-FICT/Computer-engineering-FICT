\--------------

link l1:CT
link l2:RDM
link EWH : 16
link M : z,z,z,z,14,13,12,11,z,z,z,z


dw 0010h : 0c0h

\---------------
\---------------

accept r7 : 030h
accept r15 : 06728h

\---------------
\---------------

dw 30h : 0000100000000000%
dw 32h : 0001000000010000%
dw 34h : 0001100000000000%

\---------------
\---------------

org 000h
{cjp nz, UNPACK; }
org 010h
{cjp nz, CALC; }
org 020h
{cjp nz, OUTPUT; }
org 030h
{cjp nz, END; }

\---------------
\---------------

UNPACK
 {or nil, r7, r7; oey; ewl;}
 ReadComand {r; cjp RDM, ReadComand; or r8, z, BUS_D; }

 {add nil, r8, z, z; cjp NO, END; }

 {and r14, r8, 03ffh; }
 {and nil, r8, 0400h; load RM, flags; }
 {cjp RM_Z, DIRECT; }

 INDIRECT
  {xor nil, r14, z; oey; ewl; }
  ID1 {r; cjp RDM, ID1; add r14, BUS_D, z; }

 DIRECT
  {xor nil, r14, z; oey; ewl; }
  D1 {r; cjp RDM, D1; add r14, BUS_D, z; }

 COMMAND
  {or nil, r8, z; oey; jmap; }

\---------------
CALC
 {or r12, 0001h, z; }
 {or r13, 8000h, z; }

 TESTREG
 {and nil, r15, r13; load RM, flags; }
 {cjs not RM_Z, PLUS; }
 {or srl, r13, r13, z; }
 {and nil, r13, r12; load RM, flags; }
 {cjp RM_Z, TESTREG; }
 {cjp nz, NEXTCOMAND; }

 PLUS
 {add r10, r10, 0001h; }
 {crtn nz; }

\---------------

OUTPUT
 {or nil, r14, z; oey; ewl;}
 Write {o; cjp RDM, Write; or nil, r15, z; oey;}

 {cjp nz, NEXTCOMAND;}

\---------------

NEXTCOMAND
 {add r7, r7, 02H; }
 {cjp nz, UNPACK;}

\---------------

END {}
