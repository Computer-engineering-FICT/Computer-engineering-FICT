Org 0      
	Jmp    Program_start ; program start
Org 3      
    Jmp    External_inthandler ; external interupt
Org 7      
    Jmp    Timer_inthandler ; timer interupt
    
    External_inthandler:
    	RET
    	
    Timer_inthandler:
    	RET
    
    ;MPP
    MPP:
    	;R5=R1-1
    	SEL RB0
    	MOV A,R1
    	DEC A
    	MOV R5,A
    	JC carry
  		JMP cont_MPP
carry:
		SEL RB1
		MOV A,R1
		DEC A
		MOV R5,A
		SEL RB0		
cont_MPP:
		;R0=not(R1xorR4)
		MOV A,R1
		XRL A,R4
		CPL A
		MOV R0,A
		SEL RB1
		MOV A,R1
		XRL A,R4
		CPL A
		MOV R0,A
		SEL RB0
		JF0 cont_MPP
		;R1=(R5-R0)/2
		MOV A,R0
		CPL A
		INC A
		MOV R0,A
		SEL RB1
		MOV A,R0
		CPL A
		ADDC A,0
		MOV R0,A
		SEL RB0
		MOV A,R0
		ADD A,R5
		MOV R1,A
		SEL RB1
		MOV A,R0
		ADDC A,R5
		CLR C
		RRC A
		MOV R1,A
		SEL RB0
		MOV A,R1
		RRC A
		MOV R1,A					
    	RET
    
    Program_start:
    	;Read from port
    	IN A,P1
    	MOV R0,A
    	IN A,P1
    	MOV R1,A
    	IN A,P1
    	MOV R2,A
    	IN A,P1
    	MOV R3,A
    	IN A,P1
    	MOV R4,A
    	IN A,P1
    	MOV R5,A
    	IN A,P1
    	MOV R6,A
    	IN A,P1
    	MOV R7,A
    	;R1=R2+R3
    	MOV A,R2
    	ADD A,R3
    	MOV R1,A
    	SEL RB1
    	MOV A,R1
    	ADDC A,0
    	MOV R1,A
    	SEL RB0
cycle:
    	;R4=(R2-1)*4
    	MOV A,R2
    	DEC A
    	CLR C
    	RLC A
    	MOV R4,A
    	SEL RB1
    	MOV A,R4
    	RLC A
    	MOV R4,A
    	SEL RB0
    	CLR C
    	MOV A,R4
    	RLC A
    	MOV R4,A
    	SEL RB1
    	MOV A,R4
    	RLC A
    	MOV R4,A
    	;C=1?
    	JC cont
    	call MPP
cont:
    	;R7=R1-R4-1
    	SEL RB0
    	MOV A,R4
    	CPL A
    	ADD A,R1
    	MOV R7,A
    	SEL RB1
    	MOV A,R4
    	CPL A
    	ADDC A,R1
    	MOV R7,A
    	;cycle?	
		JZ highiszero
		JMP cycle
highiszero:
		SEL RB0
		MOV A,R7
		JZ lowiszero
		JMP cycle
lowiszero:
		;R6=R2
		MOV A,R2
		MOV R6,A
		;R1=R6+R0+1
		CLR C
		CPL C
		MOV A,R6
		ADDC A,R0
		MOV R1,A
		SEL RB1
		MOV A,R6
		ADDC A,R0
		MOV R1,A
end