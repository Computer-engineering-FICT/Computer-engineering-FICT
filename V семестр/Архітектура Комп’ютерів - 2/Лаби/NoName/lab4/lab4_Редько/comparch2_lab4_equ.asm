; Computer architecture
; Lab4
; Variant: 103D = 01100111B
; Author: Redko Alexander, IO-01
; Data: 21.10.12
;
; Task:
;     Z5.Z4.Z3.Z2.Z1.Z0 = X2.X1.X0 * Y2.Y1.Y0
;     1 mul, 24
;     X: CF, Y: TF, Z: TF

	Xhigh 	EQU #0Fh
	Xmean 	EQU #FFh
	Xlow	EQU #FFh
	Yhigh 	EQU #0Fh
	Ymean 	EQU #FFh
	Ylow	EQU #FFh

	Adr_Xhigh	EQU 20h
	Adr_Xmean	EQU 21h
	Adr_Xlow 	EQU 22h
	Adr_Yhigh	EQU 23h
	Adr_Ymean 	EQU 24h
	Adr_Ylow  	EQU 25h
	Adr_Zhigh_high 	EQU 28h
	Adr_Zmean_high 	EQU 29h
	Adr_Zlow_high 	EQU 2Ah
	Adr_Zhigh_low 	EQU 2Bh
	Adr_Zmean_low 	EQU 2Ch
	Adr_Zlow_low 	EQU 2Dh


	Size		EQU #24

; load operands
	MOV Adr_Xhigh, Xhigh
	MOV Adr_Xmean, Xmean
	MOV Adr_Xlow, Xlow
	MOV Adr_Yhigh, Yhigh
	MOV Adr_Ymean, Ymean
	MOV Adr_Ylow, Ylow

	
	JNB 0h.7, X_positive
; convert to true form
	MOV A, Adr_Xlow
	CPL A
	MOV Adr_Xlow, A
	MOV A, Adr_Xmean
	CPL A
	MOV Adr_Xmean, A
	MOV A, Adr_Xhigh
	CPL A
	MOV Adr_Xhigh, A

	CLR C
	MOV A, Adr_Xlow
	ADDC A, #1
	MOV Adr_Xlow, A
	MOV A, Adr_Xmean
	ADDC A, #0
	MOV Adr_Xmean, A
	MOV A, Adr_Xhigh
	ADDC A, #0
	MOV Adr_Xhigh, A

	SETB 0h.7

X_positive:

; analyse sign
	MOV A, Adr_Xhigh
	XRL A, Adr_Yhigh
	JNB ACC.7, nosign
; save sign
	SETB PSW.1

nosign:
	CLR 0h.7
	CLR 18h.7
	
	MOV R0, Size
loop:
; shift X to the right
	CLR C
	MOV A, Adr_Xhigh
	RRC A
	MOV Adr_Xhigh, A
	MOV A, Adr_Xmean
	RRC A
	MOV Adr_Xmean, A
	MOV A, Adr_Xlow
	RRC A
	MOV Adr_Xlow, A

	JNC C0

; add X and Z
	CLR C
	MOV A, Adr_Ylow
      ADDC A, Adr_Zlow_high
	MOV Adr_Zlow_high, A
	MOV A, Adr_Ymean
	ADDC A, Adr_Zmean_high
	MOV Adr_Zmean_high, A
	MOV A, Adr_Yhigh
	ADDC A, Adr_Zhigh_high
	MOV Adr_Zhigh_high, A

C0:
; shift Z to the right
	CLR C
	MOV A, Adr_Zhigh_high
	RRC A
	MOV Adr_Zhigh_high, A
	MOV A, Adr_Zmean_high
	RRC A
	MOV Adr_Zmean_high, A
	MOV A, Adr_Zlow_high
	RRC A
	MOV Adr_Zlow_high, A

	MOV A, Adr_Zhigh_low
	RRC A
	MOV Adr_Zhigh_low, A
	MOV A, Adr_Zmean_low
	RRC A
	MOV Adr_Zmean_low, A
	MOV A, Adr_Zlow_low
	RRC A
	MOV Adr_Zlow_low, A


	DJNZ R0, loop

	JNB PSW.1, nosign_z

	SETB 40h.7
	
nosign_z:
	NOP