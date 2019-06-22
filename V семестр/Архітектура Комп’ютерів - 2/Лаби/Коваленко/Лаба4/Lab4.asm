           Sel    Rb0

; read x in SB0 R1, R2, R3

           Movd   A, P4
           Mov    R1, A
           Movd   A, P5
           Swap   A
           Orl    A, R1
           Mov    R1, A

           Movd   A, P4
           Mov    R2, A
           Movd   A, P5
           Swap   A
           Orl    A, R2
           Mov    R2, A

           Movd   A, P4
           Mov    R3, A
           Movd   A, P5
           Swap   A
           Orl    A, R3
           Mov    R3, A

; read y in SB0 R4, R5, R6

           Movd   A, P4
           Mov    R4, A
           Movd   A, P5
           Swap   A
           Orl    A, R4
           Mov    R4, A

           Movd   A, P4
           Mov    R5, A
           Movd   A, P5
           Swap   A
           Orl    A, R5
           Mov    R5, A

           Movd   A, P4
           Mov    R6, A
           Movd   A, P5
           Swap   A
           Orl    A, R6
           Mov    R6, A

; X and Y to DK
           Mov    R0, 1h
           Mov    R7, 6h

Inv:
           Mov    A, @R0
           Cpl    A
           Mov    @R0, A
           Inc    R0
           Djnz   R7, Inv

           Mov    A, R1
           Add    A, 1h
           Mov    R1, A
           Jnc    C1

           Mov    A, R2
           Add    A, 1h
           Mov    R2, A
           Jnc    C1

           Mov    A, R3
           Add    A, 1h
           Mov    R3, A

C1:
           Mov    A, R4
           Add    A, 1h
           Mov    R4, A
           Jnc    C2

           Mov    A, R5
           Add    A, 1h
           Mov    R5, A
           Jnc    C2

           Mov    A, R6
           Add    A, 1h
           Mov    R6, A

C2:

; X*Y
           Mov    R7, 0h

St:
           Sel    Rb0
           Clr    C
           Mov    A, R7
           Rrc    A
           Jc     Preend
           Mov    A, R4
           Add    A, 1h
           Mov    R4, A
           Jnc    Ad1
           Mov    R4, 255
           Mov    A, R5
           Add    A, 1h
           Mov    R5, A
           Jnc    Ad1
           Mov    R5, 254
           Mov    A, R6
           Add    A, 1h
           Mov    R6, A
           Jnc    Ad1
           Mov    R7, 1h

Ad1:
           Clr    C
           Sel    Rb0
           Mov    A, R1
           Sel    Rb1
           Add    A, R1
           Mov    R1, A
           Jnc    Ad2
           Mov    R0, 2h
           Jmp    Fr1
Ad2:
           Clr    C
           Sel    Rb0
           Mov    A, R2
           Sel    Rb1
           Add    A, R2
           Mov    R2, A
           Jnc    Ad3
           Mov    R0, 4h
           Jmp    Fr2

Ad3:
           Clr    C
           Sel    Rb0
           Mov    A, R3
           Sel    Rb1
           Add    A, R3
           Mov    R3, A
           Jnc    St
           Mov    R0, 8h
           Jmp    Fr3

Fr1:
           Sel    Rb1
           Clr    C
           Mov    A, R2
           Add    A, 1h
           Mov    R2, A
           Jnc    Check
           Jmp    Fr2
Fr2:
           Sel    Rb1
           Clr    C
           Mov    A, R3
           Add    A, 1h
           Mov    R3, A
           Jnc    Check
           Jmp    Fr3

Fr3:
           Sel    Rb1
           Clr    C
           Mov    A, R4
           Add    A, 1h
           Mov    R4, A
           Jnc    Check
           Clr    C
           Mov    A, R5
           Add    A, 1h
           Mov    R5, A
           Jnc    Check
           Clr    C
           Mov    A, R6
           Add    A, 1h
           Mov    R6, A
           Jmp    Check


Check:
           Clr    C
           Mov    A, R0
           RRc    A
           RRc    A
           Jc     Ad2
           RRc    A
           Jc     Ad3
           RRc    A
           Jc     St

Preend:
           Sel    Rb1
           Clr    C
           Mov    A, R1
           Cpl    A
           Inc    A
           Mov    R1, A
           Mov    A, R2
           Cpl    A
           Mov    R2, A
           Mov    A, R3
           Cpl    A
           Mov    R3, A
           End
