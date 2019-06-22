
\Umnogenie 4 sposob

\
\  _______
\  |     |
\  | __________        __________
\  | | R0      |      |   R2     |
\  | __________        __________
\  | 2n  |    1        n        1
\  |   _____
\  |   |SM |         
\  |__>|   |          
\      |___|          
\        | 
\    ___________
\   | R1 -->    |
\    ___________
\   2n         1

\Nastroyka shemy

link l1:ct
accept r2:0111111100000000% \X
accept r1:0011111110000000% \Y
accept r0:0000000000000000% \Z



\Umnogenie celyh chisel

shift_r{or r2,r2,z;cjp zo,end;}  \Проверка множителя Х на 0
       {or sll,r2,r2,z;}         \Сдвиг Х влево
       {cjp not rm_c,shift_l;}   \Проверка старшей цифры Х
       {add r0,r0,r1,z;}         \Х + сумма частичных произведений
shift_l{or srl,r1,r1,z;}         \Сдвиг множимого У
       {cjp nz,shift_r;}         \На начало циклов 

end    {}                        \Конец операции
