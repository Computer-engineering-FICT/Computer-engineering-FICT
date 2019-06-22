           Sel    Rb0

           Movd   A, P5
           Swap   A
           Mov    R0, A
           Movd   A, P4
           Add    A, R0
           Mov    R0, A

           Movd   A, P5
           Swap   A
           Mov    R1, A
           Movd   A, P4
           Add    A, R1
           Mov    R1, A

           Movd   A, P5
           Swap   A
           Mov    R2, A
           Movd   A, P4
           Add    A, R2
           Mov    R2, A

           Movd   A, P5
           Swap   A
           Mov    R3, A
           Movd   A, P4
           Add    A, R3
           Mov    R3, A

           Movd   A, P5
           Swap   A
           Mov    R4, A
           Movd   A, P4
           Add    A, R4
           Mov    R4, A

           Movd   A, P5
           Swap   A
           Mov    R5, A
           Movd   A, P4
           Add    A, R5
           Mov    R5, A

           Movd   A, P5
           Swap   A
           Mov    R6, A
           Movd   A, P4
           Add    A, R6
           Mov    R6, A

           Movd   A, P5
           Swap   A
           Mov    R7, A
           Movd   A, P4
           Add    A, R7
           Mov    R7, A

; r3 = r2 - r1 - 1

           Mov    A, R1
           Cpl    A
           Add    A, #1
           Add    A, R2
           Add    A, #FFH
           Mov    R3, A


Loop:
; if c = 1

           Jc     Nompp

; mpp

; r1 = 2(r6 - 1)

           Mov    A, R6
           Dec    A
           Clr    C
           Rlc    A
           Mov    R1, A
           Sel    Rb1
           Mov    A, R1
           Addc   A, #0
           Mov    R1, A
           Sel    Rb0

           Cpl    F0

           Jf0    Nof

; r2 = r4 & r1

           Mov    A, R4
           Anl    A, R1
           Mov    R2, A

; r5 = r2 - r0 - 1

           Mov    A, R0
           Cpl    A
           Add    A, #1
           Add    A, R2
           Dec    A
           Mov    R5, A

Nof:

           Cpl    F0
; r3 = r3 + r5

           Mov    A, R3
           Add    A, R5
           Mov    R5, A
           Sel    Rb1
           Mov    A, R3
           Addc   A, #0
           Mov    R3, A
           Sel    Rb0

Nompp:

; r4 = (r3+r1+1)/2

           Clr    C
           Mov    A, R3
           Add    A, R1

           Inc    A
           Rrc    A

           Mov    R4, A

; (r6 = r4 v r3)

           Mov    A, R4
           Orl    A, R3
           Mov    R6, A

           Djnz   R7, Loop

; r3 = r6 + 25h

           Mov    A, R6
           Add    A, #25H
           Mov    R3, A

           Sel    Rb1
           Mov    A, R3
           Addc   A, #0
           Mov    R3, A

           Sel    Rb0
