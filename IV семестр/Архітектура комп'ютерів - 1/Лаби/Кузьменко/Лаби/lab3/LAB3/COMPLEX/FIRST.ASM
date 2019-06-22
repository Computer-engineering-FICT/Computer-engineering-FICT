link l3:ct
accept r1: 0fffdh
accept r2: 0fff7h
accept r3: 0000bh
lable {add r2,r2,r1,z;}
       {sub r3,r2,r3,nz;}
       {add r3,r3,8000h;load rm,flags;}
       {cjp not rm_c,lable;}
notadd {or srl,r3,r3,z;}
 {}
