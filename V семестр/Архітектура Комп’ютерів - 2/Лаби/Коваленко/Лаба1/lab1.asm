Sel Rb0

Mov R0, #01h

Mov R7, #06h

input:   
      In A, P1
      Mov @R0, A
      Inc R0
      DJNZ R7, input
      
Mov A, R2   ; DK(X2)
XRL A, #FFh
Inc A

Mov R0, #0h

Add A, R1
Clr C
Rlc A
Mov R1, A
Mov A, R0
Rlc A
Mov R0, A

DJNZ R0, negativ

negativ:
     Mov R0, #FFh

Mov A, R1
Clr C
Rlc A
Clr C
Mov R1, A
;--
Mov A, R3
Anl A, R4

Mov R3, A

;--

Mov A, R1
Add A, R3
Mov R1, A

;--

Mov A, R6
Xrl A, #FFh
Inc A
Dec R5

Add A, R5

Mov R7, #4h

ccc:
    Clr C
    Rrc A
    DJNZ R7, ccc

Add A, R1
Mov R1, A


