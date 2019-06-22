\Налагодження зв'язків
link l1: ct
link l2: rdm
link ewh: 16
link ra: z, 9, 8, 7
\Визначення затримки формування RDM
equ oper: 7800h
equ type: 0200h

accept rdm_delay: 2
\Завантаження даних в ОП
dw 1234h: comm!!!h
dw 4321h: 0fffbh

accepr r0: 4321h
accept r13: 1234h
accepr r15: 0007h

\Область програми
{or nil, z, z; oey; ewh;}
{or nil, r13, z; oey; ewl;}

cmr
{cjp rdm, cmr; r; or r8, bus_d, z; cjp zo exit;}

{cjp no, bi_address;}

{and nil, r8, oper; cjp zo, other_op;}

{and nil, r8, type; cjp zo, direct;}
{or nil, r8, r8; oey; load ra;}

{or nil, z, z; oey; ewh;}
{or nil, ra, z; oey; ewl;}

omr
{cjp rdm, omr; r; or, r12, bus_d, z; cjp zo, end_mul;}
\МНОЖЕННЯ


direct
{}
oter_op
{}
bi_address
{}
exit
{}