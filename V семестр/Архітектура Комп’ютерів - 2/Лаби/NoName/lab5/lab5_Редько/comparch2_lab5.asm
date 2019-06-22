/* 
 * Computer architecture
 * Lab5
 * Variant: 103D = 01100111B
 * Author: Redko Alexander, IO-01
 * Date: 31.10.12
 *
 * Task:
 *    F = (X1 - X2)/4 + X1/X2
 *    1 div
 *    X1 - TF, X2 - TF, F - CF
 *    X1 < X2
 */

	Convert_To_CF MACRO ADR
	MOV A, ADR
	CPL A
	ADD A, #1
	MOV ADR, A
	ENDM

	Convert_To_TF MACRO ADR
		Convert_To_CF ADR
	ENDM

	X1 		   EQU 042//0C1h
	X2		   EQU 064h//0E4h

	Adr_F	   EQU 28h

// For subtraction
	Adr_Rez_Sub 	EQU 27h	
// For division							 
	Bit_s1_X1  		EQU 0h
	Bit_s1_X2  		EQU 10h
	Bit_s1_Rez_Div  EQU 20h
	Sign_div   		EQU 30h
	Adr_s_X1   		EQU 20h
	Adr_X1 	   		EQU 21h	
	Adr_s_X2   		EQU 20h
	Adr_X2	   		EQU 23h	
	Adr_s_Rez_Div  	EQU 24h
	Adr_Rez_Div    	EQU 25h

	Acc0	   		EQU 0E0h
	
	
	MOV R0, #0h
	MOV A, #X1
	MOVX @R0, A
	INC R0
	MOV A, #X2
	MOVX @R0, A

	MOV R0, #0h
	MOVX A, @R0
	MOV Adr_X1, A
	INC R0
	MOVX A, @R0
	MOV Adr_X2, A
	

	
	
	ACALL Subtraction
	MOV P1, Adr_Rez_Sub
	ACALL Division
	MOV P1, Adr_Rez_Div
	MOV A, Adr_Rez_Div
	ADD A, Adr_Rez_Sub
	MOV Adr_F, A
	MOV P1, Adr_F

	MOV R0, #10h
	MOV A, Adr_Rez_Sub
	MOVX @R0, A
	INC R0
	MOV A, Adr_Rez_Div
	MOVX @R0, A
	INC R0
	MOV A, Adr_F
	MOVX @R0, A
	INC R0
	JMP Ended


Division:
	PUSH Adr_X2
	PUSH Adr_X1
	MOV Adr_Rez_Div, #1h

	JNB 0Fh, X1_positive
	SETB Sign_div
	CLR 0Fh
X1_positive:

	JNB 1Fh, X2_positive
	JB Sign_div, sign_plus
	SETB Sign_div
	JMP label0
sign_plus:
	CLR Sign_div
label0:
	CLR 1Fh
X2_positive:
	

	CLR C
	JB Bit_s1_X1, X1_1

// X1 := X1 - X2
	
	MOV A, Adr_X1
	SUBB A, Adr_X2
	MOV Adr_X1, A

	
	MOV A, Adr_s_X1
	SUBB A, Adr_s_X2
	ANL A, #00000001b
	MOV Adr_s_X1, A

	JMP shifting

X1_1:
// X1 := X1 + X2
	MOV A, Adr_X1
	ADD A, Adr_X2
	MOV Adr_X1, A

	
	MOV A, Adr_s_X1
	ADD A, Adr_s_X2
	ANL A, #00000001b
	MOV Adr_s_X1, A
	

shifting:	
	CLR C
// X1 := l(X1).0
	MOV A, Adr_X1
	RLC A
	CLR Acc0
	MOV Adr_X1, A
	
	JC c1
	CLR Bit_s1_X1
	CLR PSW.1
	JMP label1
c1:
    SETB Bit_s1_X1
	SETB PSW.1
label1:

; REZ := l(REZ).NOT RGX[1]
	CPL C
	MOV A, Adr_Rez_Div
	RLC A
	JB PSW.1, c0
	SETB Acc0
	JMP label2
c0:
    CLR Acc0
label2:
	MOV Adr_Rez_Div, A

	
	MOV A, Adr_s_Rez_Div
	RLC A
	ANL Adr_s_Rez_Div, #00000001b
	MOV Adr_s_Rez_Div, A


	JNB Bit_s1_Rez_Div, X2_positive
	
	POP Adr_X1
	POP Adr_X2
	JNB Sign_div, end_div
	Convert_To_CF Adr_Rez_Div
end_div:
	RET

Subtraction:
	PUSH Adr_X2
	PUSH Adr_X1
	JNB 0Fh, X1_positiv
	CLR 0Fh
	Convert_To_CF Adr_X1	
X1_positiv:
	JNB 1Fh, X2_positiv
	CLR 1Fh
	Convert_To_CF Adr_X2
	
X2_positiv:

	MOV A, Adr_X1
	SUBB A, Adr_X2
	MOV Adr_Rez_Sub, A

	JNB 3Fh, plus
	Convert_To_TF Adr_Rez_Sub
	SETB PSW.1
plus:
	CLR C
	RRC A
	CLR C
	RRC A
	MOV Adr_Rez_Sub, A

	JNB PSW.1, end_sub
	Convert_To_CF Adr_Rez_Sub
end_sub:

	POP Adr_X1
	POP Adr_X2
	RET	

Ended:
	NOP
	END