;Function= 4*(X1+X2-1)-(X3+X4)-(X5&X6)/4

           Sel    Rb0
           Mov    R0, #01H
           Mov    R7, #06H
Input:
           Ins     A,BUS
           Mov   @R0, A
           Inc    R0 
           Djnz   R7, Input


;R1=X1+X2-1
           Clr    C
           Sel    Rb0
           Mov    A, R1
           Addc   A, R2      
           Dec    A          
           Mov    R1, A

           Sel    Rb1
           Mov    A, R1
           Addc   A, R2      
           Mov    R1, A

;R1=2*R1=2*(X1+X2-1)
           Clr    C
           Sel    Rb0
           Mov    A, R1
           Rlc    A          
           Mov    R1, A

           Sel    Rb1
           Mov    A, R1
           Rlc    A          
           Mov    R1, A

;R1=2*R1=4*(X1+X2-1)
           Clr    C
           Sel    Rb0
           Mov    A, R1
           Rlc    A          
           Mov    R1, A

           Sel    Rb1
           Mov    A, R1
           Rlc    A          
           Mov    R1, A

;R3=X3+X4
           Clr    C
           Sel    Rb0
           Mov    A, R3
           Addc   A, R4      
           Mov    R3, A

           Sel    Rb1
           Mov    A, R3
           Addc   A, R4      
           Mov    R3, A

;R5=X5&X6
           Clr    C
           Sel    Rb0
           Mov    A, R5
           Anl    A, R6
           Mov    R5, A

           Sel    Rb1
           Mov    A, R5
           Anl    A, R6
           Mov    R5, A

; R5=R5/2=(X5&X6)/2
           Clr    C
           Sel    Rb1
           Mov    A, R5
           Rrc    A         
           Mov    R5, A

           Sel    Rb0
           Mov    A, R5
           Rrc    A          
           Mov    R5, A

; R5=R5/2=(X5&X6)/4
           Clr    C
           Sel    Rb1
           Mov    A, R5
           Rrc    A          
           Mov    R5, A

           Sel    Rb0
           Mov    A, R5
           Rrc    A          
           Mov    R5, A

;R3=-R3=-(X3+X4) 
           Clr    C
           Sel    Rb0
           Mov    A, R3
           Cpl    A
           Addc   A, #1
           Mov    R3, A

           Sel    Rb1
           Mov    A, R3
           Cpl    A
           Addc   A, #0
           Mov    R3, A

;R5=-R5=-((X5&X6)/4)
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

           
;R1=R1+R3 = 4*(X1+X2-1)-(X3+X4)     
	   Clr    C    
           Sel    Rb0
           Mov    A, R1
           Addc   A, R3
           Mov    R1, A

           Sel    Rb1
           Mov    A, R1
           Addc   A, R3
           Mov    R1, A

;R1=R1+R5 = 4*(X1+X2-1)-(X3+X4)-(X5&X6)/4         
           Clr    C
           Sel    Rb0
           Mov    A, R1
           Addc   A, R5
           Mov    R1, A

           Sel    Rb1
           Mov    A, R1
           Addc   A, R5
           Mov    R1, A

           Nop
           End
