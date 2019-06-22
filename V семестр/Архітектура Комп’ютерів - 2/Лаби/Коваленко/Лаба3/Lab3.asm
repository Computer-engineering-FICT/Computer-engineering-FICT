           Sel    Rb0
           Ins    A, Bus
           Mov    R0, A

           Anl    A, #40H
           Rlc    A
           Rlc    A

           Jc     X1p
           Mov    A, R0      ;2.5
           Orl    A, #3H     ;5
           Mov    R0, A      ; 7.5

;y1
           Mov    R1, #4H    ; 10
Cyc1:
           Djnz   R1, Cyc1   ;30

;y2
           Mov    A, #FDH    ; A = -3
           Mov    T, A
           Strt   T
Ll1:
           Jtf    Ll2
           Jmp    Ll1        ;e240

Ll2:
           Mov    A, R0
           Anl    A, #1H
           Orl    A, #4H
           Mov    R0, A      ; e40

;2
;y1
           Mov    R1, #8H    ;s2.5
Cyc2:
           Djnz   R1, Cyc2   ; e42.5  

;y3
           Mov    A, #FFH    ; A = -1
           Mov    T, A
           Strt   T
Ll3:
           Jtf    Ll4
           Jmp    Ll3        ;s80

Ll4:
           Mov    R1, #2H    ; 82.5
Cyc3:
           Djnz   R1, Cyc3   ; 92,5

           Mov    A, R0      ;+95
           Anl    A, #F0H    ;+97.5
           Mov    R0, A      ; e100

X2n:
           Mov    A, R0      ;s2.5
           Orl    A, #18H    ;5
           Mov    R0, A      ;7.5

;3
;y4
           Mov    R1, #8H    ;10
Cyc4:
           Djnz   R1, Cyc4   ;e50

;y5
           Mov    A, #FFH    ; A = -1, s2.5
           Mov    T, A
           Strt   T
Ll5:
           Jtf    Ll6
           Jmp    Ll5        ; 82.5
Ll6:
           Mov    R1, #CH    ; 85
Cyc5:
           Djnz   R1, Cyc5   ; 145

           Mov    A, R0
           Xrl    A, #18H
           Mov    R0, A      ;e152.5

           Jmp    Endz

X1p:
           Mov    A, R0      ;s2.5
           Orl    A, #5H     ;5
           Mov    R0, A      ; 7.5

;4
;y1
           Mov    R1, #6H    ; 10
Cyc6:
           Djnz   R1, Cyc6   ; e40

;y3
           Mov    A, #FFH    ; A = -1
           Mov    T, A
           Strt   T
Ll7:
           Jtf    Ll8
           Jmp    Ll7        ;s80

Ll8:
           Mov    R1, #2H    ; 82.5
Cyc7:
           Djnz   R1, Cyc7   ; 92,5

           Mov    A, R0
           Anl    A, #F0H
           Mov    R0, A      ; e100
           Rlc    A
           Jc     X2p
           Jmp    X2n

X2p:
           Mov    A, R0      ;s2.5
           Orl    A, #4H     ;5
           Mov    R0, A      ;7.5

;y3
           Mov    A, #FFH    ; A = -1
           Mov    T, A
           Strt   T
Ll9:
           Jtf    Ll10
           Jmp    Ll9        ;87.5   

Ll10:
           Mov    R1, #2H    ; 90
           Mov    R1, #3H    ; 92,5

           Mov    A, R0      ; ;e100
           Anl    A, #F0H
           Mov    R0, A
           Jmp    Endz

Endz:
