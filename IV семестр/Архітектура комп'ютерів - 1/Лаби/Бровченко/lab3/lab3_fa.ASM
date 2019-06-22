link   l1:rdm
link   ewh:16
link   l2:CT
accept R14:0
dw    0h:0FFF7h
dw    1h:0FFFBh
\dw     0h:00005h
\dw     1h:00007h
equ    data:R0
accept data:0h

\*****************************************************************************
\Read data Y to R1-R2(auto set R1 with sign), X to R5(set marker bit)
\*****************************************************************************
LWX    {and nil, data, Z; oey; ewh;}     \ Load X to R5 from DATA(R0)
       {add nil, data, Z; oey; ewl;}     \ R0 save position in memory
       {R; or r5, BUS_D, Z; cjp rdm, CP;}                    \ where data located
       {add data, data, 1H, Z;}                \ next data

LWY    {and nil, data, Z; oey; ewh;}     \ Load Y to R2 from DATA(R0+1)
       {add nil, data, Z; oey; ewl;}     \
       {R; or r2, BUS_D, Z; cjp rdm, CP;}                    \
       {add data, data, 1H, Z;}                \ next data

       {and R14, 0001h; load RM, FLAGS;} \ Choose what to do func or
       {cjp RM_Z, FUNC;}                 \ multiplication

       {or R5, 8000h;}                   \ set marker bit in r1(X)

       {and nil, R2, 8000h; load RM, FLAGS;}\ set all bit 1 in R1 if -Y
       {cjp RM_Z, MMUL;}                    \ or do nothing
       {or  R1, 0FFFFh;}                    \
\****************************************************************************

MMUL   {and nil, R5, 0001h; load RM, FLAGS;}\ Check if 0 bit X == 0
       {cjp RM_Z, link1;}                   \ and jump link1 if TRUE

       {add R4, R4, R2, RM_C; load RM, FLAGS;}        \ SUM (R3-R4)=(R3-R4)+Y
       {add R3, R3, R1, RM_C;}                  \


link1  {add SRL, R5, Z;}                    \ shift registers
       {add SLL, R2, Z;}                    \ RY<   RX>

       {add SL.25, R1, 0h;}                 \

       {xor R6, R6;}                        \ Check if x = 0
       {or  R6, R5;}                        \ (without sing bits)
       {and R6, 0FFFCh; load RM, FLAGS;}    \

       {cjp not RM_Z, MMUL;}                \ if not repeat  sum

       {and nil, R5, 0001; load RM, FLAGS;}     \ if X.0 = 1
       {cjp RM_Z, Write;}                       \ then add X
       {xor R2, 0FFFFh;}                        \ first need convert it
       {xor R1, 0FFFFh;}                        \ from -X to +X
       {add R2, R2, 0001h; load RM, FLAGS;}     \ then simple ADD
       {add R1, R1, Z, RM_C;}
       {add R4, R4, R2, Z; load RM, FLAGS;}
       {add R3, R3, R1, RM_C;}
       {cjp NZ, Write;}
FUNC
       {add SRA, R5, Z;}                        \ X=X/2

       {add SRA, R2, Z;}                        \ Y=Y/2

       {add SRA, R2, Z;}                        \ Y=Y/2

       {add R4, R4, R2;}                        \ add X+Y
       {add R4, R4, R5; load RM, FLAGS;}

       {and nil, R4, 8000h; load RM, FLAGS;}    \ if res < 0
       {cjp RM_Z, Write;}
       {xor R3, R3, 0FFFFh;}

Write
       {and nil, data, Z; oey; ewh;}            \ Save data
       {xor nil, data, Z; oey; ewl;}            \ Big-end
       {cjp rdm, CP; W; or nil, Z, r4; oey;}

       {add data, data, 00001h, Z;}             \

       {and nil, data, Z; oey; ewh;}            \
       {xor nil, data, Z; oey; ewl;}            \
       {cjp rdm, CP; W; or nil, Z, r3; oey;}                             \

       {}
