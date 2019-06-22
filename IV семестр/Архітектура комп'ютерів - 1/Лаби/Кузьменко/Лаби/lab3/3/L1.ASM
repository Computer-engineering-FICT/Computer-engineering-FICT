link l1:ct
accept r1:0h           \ RZ(8-15) добуток
accept r2:0h           \ RZ(0-7)
accept r3:02h           \ RX   множник
accept r4:8011%          \ RY(0-7)  множене
accept r5:0

       {or r5,r5,r3;}
       {xor r5,r5,r4;}		\ збер?гаємо в r5 знак результату
	   
c3     {or sll,r4,r4,z; load rn, flags;}
       {or srl,r4,r4,z; cjp not rn_n, c2;}
       {sub r4,z,r4,nz;}

c2     {or srl,r3,r3,z;}      \ зсув множника(RX) вправо
       {cjp not rm_c, c1;}    \ якщо молодший розряд RX '0', перейти на м?тку с1
       {add r2,r2,r4,z; cjp not co, c1;}      \ RZ(0-7):=RZ(0-7)+RY(0-7)+CI
       {add r1,r1,z,z;}         \ RZ(8-15):=RZ(8-15)+CI
c1     {or sll,r4,r4,z;}         \ зсув множеного вл?во з врахуванням переносу
       {or r3,r3,z; cjp not zo, c2;}    \ якщо RX!=0, перейти на м?тку с2

       {or sll,r5,r5,z;}		\ задаємо знак результату
       {cjp not rm_c, exit;}
       {sub r1,z,r1,z;}
exit   {}
