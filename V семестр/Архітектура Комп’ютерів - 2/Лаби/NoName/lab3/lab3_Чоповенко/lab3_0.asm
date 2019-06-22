;reading
           Sel    Rb0
           In     A, P1
           Xch    A, R0
           In     A, P1
           Xch    A, R1
           In     A, P1
           Xch    A, R2
           In     A, P1
           Xch    A, R3
           In     A, P1
           Xch    A, R4
           In     A, P1
           Xch    A, R5
           In     A, P1
           Xch    A, R6
           In     A, P1
           Mov    T, A
           Xch    A, R7
;R1=R2+R3
           Mov    A, R2
           Add    A, R3
           Xch    A, R1

           Call   Checkcarry
;
Cycle:
;R4=(R2-1)*4
           Mov    A, R2
           Dec    A
           Clr    C
           Rlc    A

           Call   Checkcarry

           Rlc    A

           Call   Checkcarry

           Xch    A, R4
;
;call mpp if c=1
           Jc     Notmpp
           Call   Mpp
Notmpp:
;R7=R1-R4-1
           Mov    A, R4
           Cpl    A
           Inc    A
           Add    A, R1
           Dec    A
           Xch    A, R7

           Call   Checkcarry
;
;condition
           Mov    A, T
           Dec    A
           Mov    T, A
           Jnz    Cycle

;R6=R2 xor R7
           Mov    A, R2
           Xrl    A, R7
           Xch    A, R6
;
;R1=R6+R0+1
           Mov    A, R0
           Add    A, R6

           Call   Checkcarry

           Inc    A
           Xch    A, R1
;
           Nop
           Jmp    The_end

Mpp:
;R5=R5-1
           Xch    A, R5
           Dec    A
           Xch    A, R5
;
Mppcycle:
;R0=not(R1 xor R4)
           Mov    A, R1
           Xrl    A, R4
           Cpl    A
           Xch    A, R0
;
           Jf0    Mppcycle
           Mov    A, R0
           Cpl    A
           Inc    A
           Add    A, R5
           Call   Checkcarry
           Clr    C
           Rrc    A
           Call   Checkcarry
           Xch    A, R1
           Retr


Checkcarry:
           Sel    Rb1
           Jnc    No_carry
           Mov    R1, #80H
No_carry:
           Mov    R1, #00H
           Sel    Rb0
           Retr
The_end:
           Nop
           End











