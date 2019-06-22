           Sel    Rb1

           In     A, P1
           Mov    R3, A
           In     A, P1
           Mov    R5, A
           Sel    Rb0

           In     A, P1
           Mov    R3, A
           In     A, P1
           Mov    R5, A

; r1 = (r5-r3)/2

           Clr    C
           Sel    Rb1
           Mov    A, R3
           Cpl    A
           Add    A, #1
           Add    A, R5
           Mov    R1, A
           Sel    Rb0
           Mov    A, R3
           Cpl    A
           Addc    A, R5
           Mov    R1, A

           Clr    C
           Sel    Rb0
           Mov    A, R1
           Rrc    A
           Mov    R1, A
           Sel    Rb1
           Mov    A, R1
           Rrc    A
           Mov    R1, A

