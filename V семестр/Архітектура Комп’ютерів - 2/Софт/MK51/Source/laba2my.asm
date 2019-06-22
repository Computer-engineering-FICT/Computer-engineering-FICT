
           jmp    start
mpp:
;SEVEN R1 = 2(R6-1) (R5=R1-1)
           mov    a, r6
           dec    a
           rlc    a
	     mov    r1, a
		   
           jc     f
           sel    rb1
           mov    a, r6
           mov    r1, #FFh
           add    a, r1
           mov    r1, a
           sel    rb0
           clr    c          
 
;END SEVEN
f:
;MPP if F0=1 then next if no then ELEVEN

;EIGHT
		  jf0  go1
		  
;NINE		  
		  mov	a, R4
		  ANL   A ,R1
		  mov   R2, A
;END NINE

;TEN
		  ; R5=R2-R0-1
           mov    a, r0
           cpl    a
           ;inc    a
           add    a, r2
           ;mov    r5, #FFh
           ;inc    a
           mov    r5, a
           jnc    go
           sel    rb1
           mov    a, r0
           cpl    a
           inc    a
           add    a, r2
           mov    r5, a
           sel    rb0
           jmp    go1


go:	       sel    rb1
           mov    a, r0
           cpl    a
           add    a, r2
           mov    r5, a
           sel    rb0	
;TEN END		   
go1:	   
;ELEVEN
		   mov a, R3
		   add a,r5
		   mov r3, a
               mov a, 0
                             addc a, 0
                             sel    rb1
                             mov R3,a
                             sel rb0
           
 endcall:
			ret        

;ELEVEN END
;MPP END
;START OF PROGRAM
start:
		   Movd   A, P4
		   Swap   A
		   Mov    R0, A
		   Movd   A, P5
		   Add    A, R0
		   MOV    R0, A
		  

		   Movd   A, P4
		   Swap   A
		   Mov    R1, A
		   Movd   A, P5
		   Add    A, R1
		   MOV    R1, A
		   
		   Movd   A, P4
		   Swap   A
		   Mov    R2, A
		   Movd   A, P5
		   Add    A, R2
		   MOV    R2, A
		   
		   Movd   A, P4
		   Swap   A
		   Mov    R3, A
		   Movd   A, P5
		   Add    A, R3
		   MOV    R3, A
		   
		   Movd   A, P4
		   Swap   A
		   Mov    R4, A
		   Movd   A, P5
		   Add    A, R4
		   MOV    R4, A
		   
		   Movd   A, P4
		   Swap   A
		   Mov    R5, A
		   Movd   A, P5
		   Add    A, R5
		   MOV    R5, A
		   
		   Movd   A, P4
		   Swap   A
		   Mov    R6, A
		   Movd   A, P5
		   Add    A, R6
		   MOV    R6, A

		   Movd   A, P4
		   Swap   A
		   Mov    R7, A
		   Movd   A, P5
		   Add    A, R7
		   MOV    R7, A

		   
;FIRST R3=R2-R1-1
           mov    a, r1
           cpl    a
           inc    a
           add    a, r2
           mov    r3, #FFh
           add    a, r3
           mov    r3, a
           jnc    go2
           sel    rb1
           mov    a, r1
           cpl    a
           inc    a
           add    a, r2
           mov    r3, a
           sel    rb0
           jmp    go3


go2:       sel    rb1
           mov    a, r0
           cpl    a
           add    a, r2
           mov    r3, a
           sel    rb0	
;FIRST END			   
;SECOND
			
second:
go3:
		   ;if C=0 then mpp
           jnc    cmpp
           jmp    nompp
cmpp:
           clr    c
           call   mpp
nompp:
;START THIRD	
               clr c	   
		   mov  a,r3
		   add  a,r1
               mov  r1,a
               addc a, 0
               sel   rb1
               mov a, r3
               ;mv r4,a
               ;mv a,r3
               rrc A
               sel rb0
               mov a,r1
		   inc  a
               
		   rrc  a
		   mov  r4, a
;END THIRD		   
;START FOURTH
		   mov	a, r4
		   orl	a, r3
               mov  r6,a
               mov a, 0
                             addc a, 0
                             sel    rb1
                             mov R3,a
                             sel rb0

               		   
;END  FOURTH
;FIVE		
			
		   djnz   r7, second 
;SIX

		   mov a, R6
		   add a, 25h
		   mov r3, a
          
          
		   
end		   