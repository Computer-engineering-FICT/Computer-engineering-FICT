; Computer architecture
; Lab2
; Variant: 103D = 01100111B
; Author: Redko Alexander, IO-01
; Date: 23.09.12
;
; Task:
;       X0(R0) = 2B, X1(R1) = 05, X2(R2) = 27,
;       X3(R3) = 22, X4(R4) = 1A, X5(R5) = 04,
;       X6(R6) = 6E, R7 = 4
;       P2
;       pic. 7.1, d
;

; load operands

           Sel    Rb1

           Mov    R0, #00H
           Mov    R7, #07H
Load_loop:
           In     A, P2
           Mov    @R0, A
           Inc    R0
           Djnz   R7, Load_loop

           Clr    A
           Xch    A, R0

           Nop


; R0 := NOT (R2 XOR R3)
           Sel    Rb0
           Mov    A, R2
           Xrl    A, R3
           Cpl    A
           Mov    R0, A

           Sel    Rb1
           Mov    A, R2
           Xrl    A, R3
           Cpl    A
           Mov    R0, A
           
           Nop

; R3 := 2(R0 - R4 - 1)                      
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
           Mov    A, R0
           Addc   A, R4
           Mov    R3, A

           Sel    Rb1
           Mov    A, R0
           Addc   A, R4
           Mov    R3, A

           Clr    C
           Sel    Rb0
           Mov    A, R3
           Addc   A, #FFH
           Mov    R3, A

           Sel    Rb1
           Mov    A, R3
           Addc   A, #FFH
           Mov    R3, A

           Clr    C
           Sel    Rb0
           Mov    A, R3
           Rlc    A
           Mov    R3, A

           Sel    Rb1
           Mov    A, R3
           Rlc    A
           Mov    R3, A

           Nop

; Cycle
           Mov    R7, #4H
Cycle:
; R2 := (R1 - 1)/2
           Clr    C
           Sel    Rb0
           Mov    A, R1
           Addc   A, #FFH
           Mov    R2, A

           Sel    Rb1
           Mov    A, R1
           Addc   A, #FFH
           Mov    R2, A

           Clr    C
           Sel    Rb1
           Mov    A, R2
           Rrc    A
           Mov    R2, A

           Sel    Rb0
           Mov    A, R2
           Rrc    A
           Mov    R2, A
           
           Nop

; C = 1 ?
           Jc     Cont
           Call   Mpp

Cont:
           Sel    Rb1
           Djnz   R7, Cycle

; R0 := (NOT R6) AND R3
           Sel    Rb0
           Mov    A, R6
           Cpl    A
           Anl    A, R3
           Mov    R0, A

           Sel    Rb1
           Mov    A, R6
           Cpl    A
           Anl    A, R3
           Mov    R0, A
           
           Nop
           
           Jmp    Ended

Mpp:
; R6 := 2(R5 - R2 - 1)
           Clr    C
           Sel    Rb0
           Mov    A, R2
           Cpl    A
           Addc   A, #1
           Mov    R2, A

           Sel    Rb1
           Mov    A, R2
           Cpl    A
           Addc   A, #0
           Mov    R2, A

           Clr    C
           Sel    Rb0
           Mov    A, R5
           Addc   A, R2
           Mov    R6, A

           Sel    Rb1
           Mov    A, R5
           Addc   A, R2
           Mov    R6, A

           Clr    C
           Sel    Rb0
           Mov    A, R6
           Addc   A, #FFH
           Mov    R6, A

           Sel    Rb1
           Mov    A, R6
           Addc   A, #FFH
           Mov    R6, A

           Clr    C
           Sel    Rb0
           Mov    A, R6
           Rlc    A
           Mov    R6, A

           Sel    Rb1
           Mov    A, R6
           Rlc    A
           Mov    R6, A
           
           Nop

; F1 = 0 ?
           Clr    F1
           Cpl    F1
           JF1     Cont_mpp
; R1 := 77h + R6
           Sel    Rb0
           Clr    C
           Mov    A, #77H
           Addc   A, R6
           Mov    R1, A

           Sel    Rb1
           Mov    A, R6
           Addc   A, #0H
           Mov    R1, A
           
           Nop

Cont_mpp:
; R6 := (R0 - 1)/2
           Clr    C
           Sel    Rb0
           Mov    A, R0
           Addc   A, #FFH
           Mov    R6, A

           Sel    Rb1
           Mov    A, R0
           Addc   A, #FFH
           Mov    R6, A

           Clr    C
           Sel    Rb1
           Mov    A, R6
           Rrc    A
           Mov    R6, A

           Sel    Rb0
           Mov    A, R6
           Rrc    A
           Mov    R6, A
           
           Nop

; R5 := R6 + 1
           Clr    C
           Sel    Rb0
           Mov    A, R6
           Addc   A, #1H
           Mov    R5, A

           Sel    Rb1
           Mov    A, R6
           Addc   A, #0H
           Mov    R5, A
           
           Nop

           Ret

Ended:
           Nop
           End

