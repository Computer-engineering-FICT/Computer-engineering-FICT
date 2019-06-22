           Sel    Rb0
; init parameters
;---------------
; r0 - l bits of x1
; r1 - h bits of x1
; r2 - l bits of x2
; r3 - h bits of x2
           Mov    R0, #7
           Mov    R1, #3
           Mov    R2, #4
           Mov    R3, #2

; (x1&x2)
; put result into x1
; for l bits
           Mov    A, R0
           Anl    A, R2
           Mov    R0, A
; for h bits
           Mov    A, R1
           Anl    A, R3
           Mov    R1, A

; 4*(x1&x2)
; put result into x1
           Mov    A, R0
           Rlc    A
           Mov    R0, A

           Mov    A, R1
           Rlc    A
           Mov    R1, A

           Mov    A, R0
           Rlc    A
           Mov    R0, A

           Mov    A, R1
           Rlc    A
           Mov    R1, A

; r2 - l bits of x5
; r3 - h bits of x5
; r4 - l bits of x6
; r5 - h bits of x7

           Mov    R2, #7
           Mov    R3, #0
           Mov    R4, #0

; (x5vx6)
; put result into x5
           Mov    A, R2
           Orl    A, R4
           Mov    R2, A

           Mov    A, R3
           Orl    A, R5
           Mov    R3, A

; (x5vx6)-1
; put result into x5
           Clr    C
           Mov    A, #FFH

           Add    A, R2
           Mov    R2, A
           Mov    A, R3

           Addc   A, #FFH
           Mov    R3, A

; (x5vx6)/2
; put result into x5
           Clr    C
           Mov    A, R3
           Rrc    A
           Mov    R3, A
           Mov    A, R2
           Rrc    A
           Mov    R2, A

; r4 - l bits of x4
; r5 - h bits of x4
; r6 - l bils of x3
; r7 - h bits of x3

           Mov    R4, #0
           Mov    R5, #1

           Mov    R6, #0
           Mov    R7, #FFH

; (x3-x4)
; put result into x3

; make x4 negative
           Clr    C
           Mov    A, R4
           Cpl    A
           Add    A, #1
           Mov    R4, A
           Mov    A, R5
           Cpl    A
           Addc   A, #0
           Mov    R5, A

; subtraction
           Clr    C
           Mov    A, R6
           Add    A, R4
           Mov    R6, A
           Mov    A, R7
           Addc   A, R5
           Mov    R7, A

; (x3-x4)+1
; put result into x3

           Clr    C
           Mov    A, R6
           Add    A, #1
           Mov    R6, A

           Mov    A, R7
           Addc   A, #0
           Mov    R7, A

; 4(x1&x2)-(x3-x4+1)
; put result into x1
; make x3 negative
           Clr    C
           Mov    A, R6
           Cpl    A
           Add    A, #1
           Mov    R6, A

           Mov    A, R7
           Cpl    A
           Addc   A, #0
           Mov    R7, A

; subtraction
           Clr    C
           Mov    A, R0
           Add    A, R6
           Mov    R0, A

           Mov    A, R1
           Addc   A, R7
           Mov    R1, A

; 4(x1&x2)-(x3-x4+1) - (x5vx6-1)/2
; put result into x1
; make negative
           Clr    C
           Mov    A, R2
           Cpl    A
           Add    A, #1
           Mov    R2, A

           Mov    A, R3
           Cpl    A
           Addc   A, #0
           Mov    R3, A

; subtraction

           Clr    C
           Mov    A, R0
           Add    A, R2
           Mov    R0, A

           Mov    A, R1
           Addc   A, R3
           Mov    R3, A