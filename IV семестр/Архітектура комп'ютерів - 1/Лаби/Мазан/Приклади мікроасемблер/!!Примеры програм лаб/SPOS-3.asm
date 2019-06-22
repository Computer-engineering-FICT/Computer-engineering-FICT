

\------------nastroika shemy----------------------------------

link   l3:ct               \ podkluchit vyhod CT k BMU
accept r12:0               \ rezultat Z
accept R15:7fh             \ Y v ml. razr
accept r10:7f00h           \ X v st. razr
accept r11:8               \ schetchik ciklov (n=8)

\----------mikroprogramma-------------------------------------

       {load rm, z;}                    \ sbros RM
label1 {or   sll, r12, r12, z;}         \ sdvig Z
       {or   sll, r10, r10, z;}         \ sdvig X
       {cjp  not rm_c, label2;}         \ perehod po razriadum X
       {add r12, r12, R15, z;}          \ summirovanie Z+Y
label2 {sub r11,r11,z,z;                \ dekrement schetchika
        load rm,flags;cem_c;}           \ sohranit flagi
       {cjp  not rm_z, label1;}         \ perehod na sdvig X
       {} \ konec umnozhenia
