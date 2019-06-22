           Sel    Rb0
           Mov    R7, #06H   
           Mov    R0, #01H   
Looploadx:
           Movd   A, P4      ; load senior 4 bits
           Rl     A
           Rl     A
           Rl     A
           Rl     A
           Mov    @R0, A     ;
           Movd   A, P5
           Orl    A, @R0
           Mov    @R0, A
           Inc    R0         

           Djnz   R7, Looploadx
           Mov    R7, #01H
     
           Movd   A, P4      
           Rl     A
           Rl     A
           Rl     A
           Rl     A
           Mov    R0, A     
           Movd   A, P5
           Orl    A, R0
           Mov    R0, A
           
           Movd   A, P4      
           Rl     A
           Rl     A
           Rl     A
           Rl     A
           Mov    R7, A     
           Movd   A, P5
           Orl    A, R7
           Mov    R7, A
; -------------------1

           Mov    A, R2      ;
           Xrl    A, R3      ; A = r2 xor r3	
           Cpl    A
           Mov    R0, A      ; R2 = A
;---------------------2
           Mov    A, R4
           Cpl    A
           Inc    A
           Add    A, R0
           Dec    A
           Clr    C
           Rlc    A
           Mov    R3, A
;-------------------------------------------------
Lll1:
           Mov    A, R1
           Dec    A
           Clr    C
           Rrc    A
           Mov    R2, A
;----------------4
           Jc     Lll3
;----------------7
           Mov    A, R2
           Cpl    A
           Inc    A
           Add    A, R5
           Dec    A
           Clr    C
           Rlc    A
           Mov    R6, A
;---------------8
           Jf1    Lll2
;---------------9
           Mov    A, R6
           Add    A, #77H
           Mov    R1, A
Lll2:
;---------------10
           Mov    A, R0
           Dec    A
           Clr    C
           Rrc    A
           Mov    R6, A


; ---------------11

           Mov    A, R6
           Inc    A
           Mov    R5, A


; ----------------5
Lll3:
           Djnz   R7, Lll1
;-----------------6
           Mov    A, R6      ;A = x6
           Cpl    A          ;A = -x6
           Anl    A, R3
           Mov    R0, A

           End