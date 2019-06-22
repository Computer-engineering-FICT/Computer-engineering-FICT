;/* 
; * Computer architecture
; * Lab5
; * Date: 10.12.12
; *
; * Task:
; *    F = X2/X1 + (X2 + X1)/2
; *    X1 - CF, X2 - TF, F - TF
; */

	Convert_To_CF MACRO ADR
	MOV A, ADR
	CPL A
	ADD A, #1
	MOV ADR, A
	ENDM

	Convert_To_TF MACRO ADR
		Convert_To_CF ADR
	ENDM

	X2 		   EQU 81
	X1		   EQU 09

	Adr_F	   EQU 28h

; For addition
	Adr_Rez_Add 	EQU 27h	
; For division
	Sign_div   		EQU 30h
	Adr_s_X1   		EQU 20h
	Adr_X1 	   		EQU 21h	
	Adr_s_X2   		EQU 20h
	Adr_X2	   		EQU 23h	
	Adr_s_Rez_Div  	EQU 24h
	Adr_Rez_Div    	EQU 25h
	
; Write to external memory	
	MOV R0, #0h
	MOV A, #X1
	MOVX @R0, A
	INC R0
	MOV A, #X2
	MOVX @R0, A
; Read from external memory
	MOV R0, #0h
	MOVX A, @R0
	MOV Adr_X1, A
	INC R0
	MOVX A, @R0
	MOV Adr_X2, A
	
	ACALL Division
        ACALL Addition
        
        MOV A, Adr_Rez_Div
        ADD A, Adr_Rez_Add
        MOV Adr_F, A

	MOV R0, #10h
	MOV A, Adr_Rez_Div
	MOVX @R0, A
	INC R0
	MOV A, Adr_Rez_Add
	MOVX @R0, A
	INC R0
	MOV A, Adr_F
	MOVX @R0, A
	INC R0
	JMP Ended


Division:
	PUSH Adr_X2
	PUSH Adr_X1

	JNB 1Fh, X2_positive
	SETB Sign_div	
	CLR 1Fh
X2_positive:

	JNB 0Fh, X1_positive
	Convert_to_TF Adr_X1
	JB Sign_div, sign_plus
	SETB Sign_div
	JMP label10
sign_plus:
	CLR Sign_div
label10:
	CLR 0Fh
X1_positive:
	
	MOV A, Adr_X2
	MOV B, Adr_X1
	DIV AB
	MOV Adr_Rez_Div, A
	
	POP Adr_X1
	POP Adr_X2
	JNB Sign_div, end_div
	Convert_To_TF Adr_Rez_Div
end_div:
	RET

Addition:
	PUSH Adr_X2
	PUSH Adr_X1
	JNB 0Fh, X1_positiv
	CLR 0Fh
X1_positiv:
	JNB 1Fh, X2_positiv
	CLR 1Fh
	Convert_To_CF Adr_X2
	
X2_positiv:
	CLR C
	MOV A, Adr_X1
	ADDC A, Adr_X2
	MOV Adr_Rez_Add, A

	JNB 3Fh, plus
	Convert_To_CF Adr_Rez_Add
	SETB PSW.1
plus:
	CLR C
	RRC A
	MOV Adr_Rez_Add, A

	JNB PSW.1, end_add
	Convert_To_CF Adr_Rez_Add
end_add:

	POP Adr_X1
	POP Adr_X2
	RET	

Ended:
	NOP
	END