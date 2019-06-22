; Computer architecture
; Lab1
; Variant: 103D = 01100111B
; Author: Redko Alexander, IO-01
; Date: 20.09.12
;
; Task:
;       X1 = 2C, X2 = 03, X3 = 71, X4 = CA, X5 = 11, X6 = FF
;       F = 4((X1+X2)&(X3-X4-1))/2-8(X5 v X6) = F854
;       P2
;

           Sel    Rb0
           Mov    R0, #01H
           Mov    R7, #06H
Load_loop:
           In     A, P2
           Mov    @R0, A
           Inc    R0
           Djnz   R7, Load_loop

; Calculating (X1 + X2)
; lower bite
           Clr    C
                
           Mov    A, R1
           Addc   A, R2
           Mov    R1, A
; senior bite           
           Sel    Rb1
           Mov    A, R1
           Addc   A, R2
           Mov    R1, A

                    
; Calculating (X3 - X4 - 1)
	     Clr    C
           Sel    Rb0
           Mov    A, R4
           Cpl    A
           Addc   A, #1
           Mov    R4, A
           
           Sel    Rb1
           Mov    A, R4
           Cpl    A
           Addc   A, #0
           Mov    R4, A
           
           Clr    C           
           Sel    Rb0
           Mov    A, R3
           Addc   A, R4
           Mov    R4, A
           
           Sel    Rb1
           Mov    A, R3
           Addc   A, R4
           Mov    R4, A
           
           Sel    Rb0
           Mov    A, R4
           Dec    A
           Mov    R4, A
           
           Sel    Rb1
           Mov    A, R4
           Dec    A
           Mov    R4, A


; Calculating (X1 + X2) & (X3 - X4 - 1)
           Clr    C
           Sel    Rb0
           Mov    A, R1
           Anl    A, R4
           Mov    R3, A
           
           Sel    Rb1
           Mov    A, R1
           Anl    A, R4
           Mov    R3, A

; Calculating 4((X1 + X2) & (X3 - X4 - 1))
           Clr    C
           Sel    Rb0
           Mov    A, R3
           Rlc    A
           Mov    R3, A
           
           Sel    Rb1
           Mov    A, R3
           Rlc    A
           Mov    R3, A
           
           Sel    Rb0
           Mov    A, R3
           Rlc    A
           Mov    R3, A
           
           Sel    Rb1
           Mov    A, R3
           Rlc    A
           Mov    R3, A



; Calculating 4((X1 + X2)&(X3 - X4 - 1))/2
           Clr    C
           Sel    Rb1
           Mov    A, R3
           Rrc     A
           Mov    R3, A
           
           Sel    Rb0
           Mov    A, R3
           Rrc    A
           Mov    R3, A

; Calculating (X5 v X6)
           Clr    C
	     Sel    Rb0
           Mov    A, R5
           Orl    A, R6
           Mov    R5, A
           
           Sel    Rb1
           Mov    A, R5
           Orl    A, R6
           Mov    R5, A

; Calculating 8(X5 v X6)
           Clr    C
           
           Sel    Rb0
           Mov    A, R5
           Rlc    A
           Mov    R5, A           
           
           Sel    Rb1
           Mov    A, R5
           Rlc    A
           Mov    R5, A
           
           Sel    Rb0
           Mov    A, R5
           Rlc    A
           Mov    R5, A
           
           Sel    Rb1
           Mov    A, R5
           Rlc    A
           Mov    R5, A
           
           Sel    Rb0
           Mov    A, R5
           Rlc    A
           Mov    R5, A           
           
           Sel    Rb1
           Mov    A, R5
           Rlc    A
           Mov    R5, A


; Calculating F
           
           Clr    C
           Sel    Rb0
           Mov    A, R5
           Cpl    A
           Addc   A, #1
           Mov    R5, A
           
           Sel    Rb1
           Mov    A, R5
           Cpl    A
           Addc   A, #0
           Mov    R5, A
           
           Clr    C           
           Sel    Rb0
           Mov    A, R3
           Addc   A, R5
           Mov    R6, A
           
           Sel    Rb1
           Mov    A, R3
           Addc   A, R5
           Mov    R6, A


           Nop
           End

