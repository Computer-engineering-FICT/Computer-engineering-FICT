
           Sel    Rb0


           Mov    R7, #06H   
           Mov    R0, #01H   

Looploadx:

           In     A, P2      
           Mov    @R0, A     

           Inc    R0         

           Djnz   R7, Looploadx

; ---------------------------------------------------

; Calculating 4(X1 - X2)

           Mov    A, R2      ; A = x2
           Cpl    A          ; A = -x2
           Inc    A
           Add    A, R1      ; A = x1-x2
           Mov    R2, A      ; R2 = A

           Mov    R1, #00H   ; R2.R1 <<= 2
           Mov    R7, #02H
Ls:
           Clr    C
           Mov    A, R2
           Rlc    A
           Mov    R2, A
           Mov    A, R1
           Rlc    A
           Mov    R1, A
           Djnz   R7, Ls

; ----------------------

; Calculating - (X3 & X4)

           Mov    A, R3
           Anl    A, R4
           Mov    R4, A
           Mov    R3, #00H

; -----------------------

; Calculating - (X5 - X6 - 1)/16


           Mov    A, R6      ;A = x6
           Cpl    A          ;A = -x6
           Inc    A
           Add    A, R5      ;A = x5-x6
           Clr    C
           Dec    A

           Mov    R6, A
           Mov    R5, #00H
           Mov    A, R5
           Addc   A, #00H
           Mov    R5, A

; dividing by 16
           Mov    R7, #04H
Ld:
           Clr    C
           Mov    A, R5
           Rrc    A
           Mov    R5, A
           Mov    A, R6
           Rrc    A
           Mov    R6, A

           Djnz   R7, Ld


; ---------------------------

; Calculating (X1 + X3 + X5).(X2 + X4 + X6)

           Mov    A, R1      ; R1 = X1 + X3 + X5
           Add    A, R3
           Add    A, R5
           Mov    R1, A

           Mov    A, R2      ; R2 = X2 + X4 + X6
           Add    A, R4      ;
           Add    A, R6      ;
           Mov    R2, A      ;
           Mov    A, R1      ;
           Addc   A, #00H    ;
           Mov    R1, A
; -----------------------------------------

           End