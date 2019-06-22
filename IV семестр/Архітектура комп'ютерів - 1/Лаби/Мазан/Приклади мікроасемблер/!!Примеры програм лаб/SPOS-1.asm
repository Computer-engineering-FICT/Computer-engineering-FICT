

\----------sposob umnozhenia 1--------------------------------
\------------nastroika shemy----------------------------------

link   l3:ct               \ podkluchit vyhod CT k BMU
accept r12:0               \ rezultat Zÿ
accept R15:7fffh           \ Y
accept r10:7fffh           \ X
accept r11:17              \ schetchik ciklov (n+1=16+1)

\----------mikroprogramma-------------------------------------

       {load rm, z;}                  \ sbros RM
label1 {cjp  not rm_c, label2;}       \ perehod po razriadum X
       {add r12, r12, R15, z;}        \ summirovanie Z+Y
label2 {or   srl, r12, r12, z;}       \ sdvig Z
       {or   sr.9, r10, r10, z;}      \ sdvig X
       {sub r11,r11,z,z;              \ dekrement schetchika
       load rm,flags;cem_c;}          \ sohranit flagi
       {cjp  not rm_z, label1;}       \ perehod na sdvig X
       {} \ konec umnozhenia
