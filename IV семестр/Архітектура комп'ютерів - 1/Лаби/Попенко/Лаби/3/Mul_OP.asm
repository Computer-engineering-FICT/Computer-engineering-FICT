link l1: ct
link l2: rdm
link ewh: 16
dw 0h: 0 \Z ml
dw 1h: 0 \Z st
dw 2h: 0fffbh \X ml
dw 3h: 0ffffh \X st
dw 4h: 0007h \Y

accept r7:0

{xor nil, r0, r0; oey; ewh;}
{or nil, r7, z; oey; ewl;} \ ml RAD = r7 start addr
nr {cjp rdm, nr; r; or r0, bus_d, z;}

{add r7, r7, 1, z;}
{or nil, r7, z; oey; ewl;}
nr1 {cjp rdm, nr1; r; or r1, bus_d, z;}

{add r7, r7, 1, z;}
{or nil, r7, z; oey; ewl;}
nr2 {cjp rdm, nr2; r; or r2, bus_d, z;}

{add r7, r7, 1, z;}
{or nil, r7, z; oey; ewl;}
nr3 {cjp rdm, nr3; r; or r3, bus_d, z;}

{add r7, r7, 1, z;}
{or nil, r7, z; oey; ewl;}
nr4 {cjp rdm, nr4; r; or r4, bus_d, z;}

start

{and nil, r4, 0001h; load rm, flags;}
{cjp rm_z, shift;}
{add r0, r0, r2, z; load rm, flags;}
{add r1, r1, r3, rm_c;}

shift
{or sll, r2, r2, z;}
{or sl.25, r3, r3, z;}

{or srl, r4, r4, z;}

{or nil, r4, r4; load rm, flags;}
{cjp not rm_z, start;}

{and nil, r1, 8000h; load rm, flags;}
{cjp rm_z, end;}
{xor r1, r1, 0ffffh;}
{xor r0, r0, 0ffffh;}
{add r0, r0, 1, z; load rm, flags;}
{add r1, r1, 0, rm_c;}
{or r1, r1, 8000h;}

end {}
