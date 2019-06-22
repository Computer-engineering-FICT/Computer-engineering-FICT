        
           
;Input

          
           Sel    RB0
           In     A, P2
           Mov    R0, A
           In     A, P2
           Mov    R1, A          
           In     A, P2
           Mov    R2, A
           In     A, P2
           Mov    R3, A
           In     A, P2
           Mov    R4, A
           In     A, P2
           Mov    R5, A          
           In     A, P2
           Mov    R6, A
           In     A, P2
           Mov    R7, A


; Block 1
; R1=R2+R3

           Clr    C
           Sel    Rb0
           Mov    A, R2
           Addc   A, R3               
           Mov    R1, A

           Sel    Rb1
           Mov    A, R2
           Addc   A, R3      
           Mov    R1, A

; Block 2
; R4=(R2-1)*4
Cycle:
           Clr    C
           Sel    Rb0
           Mov    A, R2    
           Addc   A, #FFh           
           Mov    R4, A
           
           Sel    Rb1
           Mov    A, R2
           Addc   A, #FFh      
           Mov    R4, A
           
           Clr    C
           Sel    Rb0
           Mov    A, R4
           Rlc    A          
           Mov    R4, A

           Sel    Rb1
           Mov    A, R4
           Rlc    A          
           Mov    R4, A
           
           Clr    C
           Sel    Rb0
           Mov    A, R4
           Rlc    A          
           Mov    R4, A

           Sel    Rb1
           Mov    A, R4
           Rlc    A          
           Mov    R4, A
           
           
; Block 3
; IF (C=1)
           Jc     Block4 
           Call   Mpp
;Block 4
; R5=R1-R4-1
Block4:
           Clr    C
           Sel    Rb0
           Mov    A, R4
           Cpl    A
           Addc   A, #1h
           Mov    R5, A

           Sel    Rb1
           Mov    A, R4
           Cpl    A
           Addc   A, #0
           Mov    R5, A
           
           
           Clr    C
           Sel    Rb0
           Mov    A, R5
           Addc   A, R1              
           Mov    R5, A

           Sel    Rb1
           Mov    A, R5
           Addc   A, R1      
           Mov    R5, A

           Clr    C
           Sel    Rb0
           Mov    A, R5    
           Addc   A, #FFh           
           Mov    R5, A

           Sel    Rb1
           Mov    A, R5
           Addc   A, #FFh      
           Mov    R5, A

; Block 5
; Cycle

           Sel    Rb0
           DJNZ R7, Cycle

           
; Block 6
; R6=R2 XOR R7

           Sel    Rb0
           Mov    A, R2
           Xrl    A, R7
           Mov    R6, A

           Sel    Rb1
           Mov    A, R2
           Xrl    A, R7
           Mov    R6, A
           
; Block 7
; R1=R6+R5+1

           Clr    C
           Sel    Rb0
           Mov    A, R5
           Addc   A, R6              
           Mov    R1, A

           Sel    Rb1
           Mov    A, R5
           Addc   A, R6      
           Mov    R1, A

           Clr    C
           Sel    Rb0
           Mov    A, R1    
           Addc   A, #1           
           Mov    R1, A

           Sel    Rb1
           Mov    A, R1
           Addc   A, #0      
           Mov    R1, A
           
           Jmp    Ending



; Block 8
; R5=R1-1
MPP:
           Clr    C
           Sel    Rb0
           Mov    A, R1    
           Addc   A, #FFh           
           Mov    R5, A

           Sel    Rb1
           Mov    A, R1
           Addc   A, #FFh      
           Mov    R5, A


; Block 9 
; R0=NOT(R3 XOR R2)
MPP_cont:
           Sel    Rb0
           Mov    A, R3
           Xrl    A, R2
           Mov    R0, A

           Sel    Rb1
           Mov    A, R3
           Xrl    A, R2
           Mov    R0, A
           
           Sel    Rb0
           Mov    A, R0
           Cpl    A
           Mov    R0, A

           Sel    Rb1
           Mov    A, R3
           Cpl    A
           Mov    R0, A
           
           Clr    F0


; Block 10
; IF (F0=1)

           Clr    F0
           Cpl    F0
           Jc     MPP_cont
; Block 11
; R4=(R3-R2)/2

           Clr    C
           Sel    Rb0
           Mov    A, R2
           Cpl    A
           Addc   A, #1h
           Mov    R4, A

           Sel    Rb1
           Mov    A, R2
           Cpl    A
           Addc   A, #0
           Mov    R4, A
           
           
           Clr    C
           Sel    Rb0
           Mov    A, R4
           Addc   A, R3           
           Mov    R4, A

           Sel    Rb1
           Mov    A, R4
           Addc   A, R3      
           Mov    R4, A
           
           Clr    C
           Sel    Rb1
           Mov    A, R4
           Rrc    A         
           Mov    R4, A

           Sel    Rb0
           Mov    A, R4
           Rrc    A          
           Mov    R4, A
           
           Nop
           Ret


Ending:
           Nop
           End