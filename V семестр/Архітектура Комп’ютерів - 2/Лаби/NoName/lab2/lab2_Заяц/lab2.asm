		sel rb1

		In A, P1
        Mov    R1, A
		In A, P1
        Mov    R2, A
		In A, P1
        Mov    R3, A
		In A, P1
        Mov    R4, A
		In A, P1
        Mov    R5, A
		In A, P1
        Mov    R6, A
		In A, P1
        Mov    R7, A
		Sel    Rb0
		In     A, P1
        Mov    R3, A

; r1 = r2+r3
		Sel    Rb1
		Clr    C
        Mov    A, R2
        Add    A, R3
        Mov    R1, A
		Sel    Rb0
	    Mov    A, R1
		addc   A, #0
		mov    R1, A

	Loop:		
; r4 = (r2-1)*4
		Sel    Rb1
        Mov    A, R2
        Dec    A
        Clr    C
        Rlc    A
        Mov    R4, A
        Sel    Rb0
        Mov    A, R4
        Addc   A, #0
        Mov    R4, A
		Sel    Rb1
		Mov    A, R4
		Rlc    A
		Mov    R4, A
		Sel    Rb0
		Mov    A, R4
		Rl     A
        Addc   A, #0
        Mov    R4, A
		

; if c = 1
        Jc     No_MPP
; MPP
; r5 = r1-1
		Sel    Rb1
		Mov    A, R1
        Dec    A
		Mov    R5, A
		Sel    Rb0	
		Mov    A, R1
		Addc   A, #0
		Mov    R5, A
		
		
; r0 = not(r1 xor r4)
	No_F:

		Sel    Rb1
		Mov    A, R1
        Orl    A, R4
		Cpl    A
        Mov    R0, A	
		Sel    Rb0		
		Mov    A, R1
        Orl    A, R4
		Cpl    A
        Mov    R0, A

        Jf0    No_F
		
; r1 = (r5-r0)/2
		Clr    C
		Sel    Rb1
		Mov    A, R0
        Cpl    A
        Inc    A
        Add    A, R5
		Mov    R1, A
		Sel    Rb0
		Mov    A, R0
        Cpl    A
        Addc   A, R5
		Mov    R1, A
		
		Clr    C
		Mov    A, R1
		Rrc    A
		Mov    R1, A
		Sel    Rb1
		Mov    A, R1
		Rrc    A
		Mov    R1, A
		
;No MPP
	No_MPP:
; r7 = r1-r4-1	
		Sel    Rb1
		Clr    C
		Mov    A, R4
        Cpl    A
        Inc    A
        Add    A, R1
        Add    A, #FFH
		Mov    R7, A
		Sel    Rb0
		Mov    A, R4
        Cpl    A
        Addc   A, R1
		Mov    R7, A

		Sel Rb0
		Djnz   R3, Loop

; r6 = r2 xor r7
		Sel    Rb1
		Mov    A, R2
        Orl    A, R7
        Mov    R6, A	
		Sel    Rb0		
		Mov    A, R2
        Orl    A, R7
        Mov    R6, A
		
; r1 = r6+r0+1
		Sel    Rb1
		Clr    C
        Mov    A, R6
        Add    A, R0
		Inc    A
        Mov    R1, A
		Sel    Rb0
	    Mov    A, R6
		addc   A, R0
		mov    R1, A
		
	end