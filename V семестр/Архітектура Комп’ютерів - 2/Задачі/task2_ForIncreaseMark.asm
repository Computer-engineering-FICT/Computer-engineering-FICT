; shift of 24 bit word by 4 bits to the right

           MOV R5, #0h
           MOV R6, #0FFh 
           MOV R7, #0FFh
                      
           MOV R2, #4h
loop:      MOV    A, R7
           RRC    A
           MOV    R7, A
           MOV    A, R6
           RRC    A
           MOV    R6, A
           MOV    A, R5
           RRC    A
           MOV    R5, A
           DJNZ   R2, loop
           END