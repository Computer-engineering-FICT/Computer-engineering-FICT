		sel rb0

; r0 - l bits of x1
; r1 - h bits of x1
; r2 - l bits of x2
; r3 - h bits of x2

; (x1+x2)   result in r0,r1

        In A, P2
		Mov    R0, A
		In A, P2
        Mov    R1, A
		In A, P2
        Mov    R2, A
		In A, P2
        Mov    R3, A

		Clr    C
        Mov    A, R0
        Add    A, R2
        Mov    R0, A
		Mov    A, R1
        Addc   A, R3
        Mov    R1, A

; r2 - l bits of x3
; r3 - h bits of x3
; r4 - l bits of x4
; r5 - h bits of x4
		
;  (x3-x4)   result in r2,r3

		In A, P2
		Mov    R2, A
        In A, P2
		Mov    R3, A
        In A, P2
		Mov    R4, A
        In A, P2
		Mov    R5, A

		Clr    C
        Mov    A, R4
        Cpl    A
        Add    A, #1
        Mov    R4, A
        Mov    A, R5
        Cpl    A
        Addc   A, #0
        Mov    R5, A

        Clr    C
        Mov    A, R2
        Add    A, R4
        Mov    R2, A
        Mov    A, R3
        Addc   A, R5
        Mov    R3, A

;  ((x3-x4)-1)   result in r2,r3
		
		Clr    C
        Mov    A, #FFH
        Add    A, R2
        Mov    R2, A
        Mov    A, R3
        Addc   A, #FFH
        Mov    R3, A

;  (x1+x2)&(x3-x4-1)   result in r0,r1
        Mov    A, R0
        Anl    A, R2
        Mov    R0, A
        Mov    A, R1
        Anl    A, R3
        Mov    R1, A

; 4*((x1+x2)&(x3-x4-1))/2		result in r0,r1
        Mov    A, R0
        Rlc    A
        Mov    R0, A
        Mov    A, R1
        Rlc    A
        Mov    R1, A

; r2 - l bits of x5
; r3 - h bits of x5
; r4 - l bits of x6
; r5 - h bits of x6

; (x5vx6)   result in r2,r3
        
		In A, P2
		Mov    R2, A
        In A, P2
		Mov    R3, A
        In A, P2
		Mov    R4, A
        In A, P2
		Mov    R5, A
		
		Mov    A, R2
        Orl    A, R4
        Mov    R2, A
        Mov    A, R3
        Orl    A, R5
        Mov    R3, A
		
; 8*(x5vx6)   result in r2,r3

		Mov    R6, #3
	loop:	
		Mov    A, R2
        Rlc    A
        Mov    R2, A
        Mov    A, R3
        Rlc    A
        Mov    R3, A
		djnz r6, loop
		
; 4*((x1+x2)&(x3-x4-1))/2 - 8*(x5vx6)   result in r0,r1
		
		Clr    C
        Mov    A, R2
        Cpl    A
        Add    A, #1
        Mov    R2, A
        Mov    A, R3
        Cpl    A
        Addc   A, #0
        Mov    R3, A

        Clr    C
        Mov    A, R0
        Add    A, R2
        Mov    R0, A
        Mov    A, R1
        Addc   A, R3
        Mov    R1, A