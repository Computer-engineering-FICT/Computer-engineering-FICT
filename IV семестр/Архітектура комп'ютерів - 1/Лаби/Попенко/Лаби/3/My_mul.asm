link l1:ct
accept r0: 0 \Z ml
accept r1: 0 \Z st
accept r2: 0fffbh \X ml
accept r3: 0ffffh \X st
accept r4: 0007h \Y

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

