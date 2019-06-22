	X3high 			EQU 0h
	X3mean 			EQU 0FFh
	X3low			EQU 0FFh
	X4high 			EQU 0h
	X4mean 			EQU 0FFh
	X4low			EQU 0FFh
	X9high 			EQU 0h
	X9mean 			EQU 0h
	X9low			EQU 0FFh
	X10high 		EQU 0h
	X10mean 		EQU 0h
	X10low			EQU 0FFh

	Adr_X3high		EQU 020h
	Adr_X3mean		EQU 021h
	Adr_X3low 		EQU 022h
	Adr_X4high		EQU 023h
	Adr_X4mean 		EQU 024h
	Adr_X4low 	 	EQU 025h
	Adr_Zhigh_high 	EQU 028h
	Adr_Zmean_high 	EQU 029h
	Adr_Zlow_high 	EQU 02Ah
	Adr_Zhigh_low 	EQU 02Bh
	Adr_Zmean_low 	EQU 02Ch
	Adr_Zlow_low 	EQU 02Dh
	Adr_X9high		EQU 030h
	Adr_X9mean		EQU 031h
	Adr_X9low 		EQU 032h
	Adr_X91high		EQU 033h
	Adr_X91mean		EQU 034h
	Adr_X91low 		EQU 035h
	Adr_Yhigh_high 	EQU 038h
	Adr_Ymean_high 	EQU 039h
	Adr_Ylow_high 	EQU 03Ah
	Adr_Yhigh_low 	EQU 03Bh
	Adr_Ymean_low 	EQU 03Ch
	Adr_Ylow_low 	EQU 03Dh
	Adr_X10high		EQU 040h
	Adr_X10mean 	EQU 041h
	Adr_X10low 	 	EQU 042h
	Adr_X101high	EQU 043h
	Adr_X101mean 	EQU 044h
	Adr_X101low  	EQU 045h
	Adr_Whigh_high 	EQU 048h
	Adr_Wmean_high 	EQU 049h
	Adr_Wlow_high 	EQU 04Ah
	Adr_Whigh_low 	EQU 04Bh
	Adr_Wmean_low 	EQU 04Ch
	Adr_Wlow_low 	EQU 04Dh

	Size			EQU 24

; load operands
	MOV Adr_X3high, #X3high
	MOV Adr_X3mean, #X3mean
	MOV Adr_X3low, #X3low
	MOV Adr_X4high, #X4high
	MOV Adr_X4mean, #X4mean
	MOV Adr_X4low, #X4low

; analyse sign
	MOV A, Adr_X3high
	XRL A, Adr_X4high
	JNB ACC.7, nosign1
	
; save sign
	SETB PSW.1

nosign1:
	CLR 07h
	CLR 01Fh
	
	MOV R0, #Size
	
multiplying1:
; shift X3 to the right
	CLR C
	MOV A, Adr_X3high
	RRC A
	MOV Adr_X3high, A
	MOV A, Adr_X3mean
	RRC A
	MOV Adr_X3mean, A
	MOV A, Adr_X3low
	RRC A
	MOV Adr_X3low, A
	JNC C01

; add X4 and Z
	CLR C
	MOV A, Adr_X4low
    ADDC A, Adr_Zlow_high
	MOV Adr_Zlow_high, A
	MOV A, Adr_X4mean
	ADDC A, Adr_Zmean_high
	MOV Adr_Zmean_high, A
	MOV A, Adr_X4high
	ADDC A, Adr_Zhigh_high
	MOV Adr_Zhigh_high, A

C01:
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

	DJNZ R0, multiplying1

	JNB PSW.1, nosign_z

	SETB 047h
	
nosign_z:
; load operands
	MOV Adr_X9high, #X9high
	MOV Adr_X9mean, #X9mean
	MOV Adr_X9low, #X9low
	MOV Adr_X91high, #X9high
	MOV Adr_X91mean, #X9mean
	MOV Adr_X91low, #X9low

; analyse sign
	MOV A, Adr_X9high
	XRL A, Adr_X91high
	JNB ACC.7, nosign2
	
; save sign
	SETB PSW.1

nosign2:
	CLR 07h
	CLR 01Fh
	
	MOV R0, #Size
	
multiplying2:
; shift X9 to the right
	CLR C
	MOV A, Adr_X9high
	RRC A
	MOV Adr_X9high, A
	MOV A, Adr_X9mean
	RRC A
	MOV Adr_X9mean, A
	MOV A, Adr_X9low
	RRC A
	MOV Adr_X9low, A
	JNC C02

; add X91 and Y
	CLR C
	MOV A, Adr_X91low
    ADDC A, Adr_Ylow_high
	MOV Adr_Ylow_high, A
	MOV A, Adr_X91mean
	ADDC A, Adr_Ymean_high
	MOV Adr_Ymean_high, A
	MOV A, Adr_X91high
	ADDC A, Adr_Yhigh_high
	MOV Adr_Yhigh_high, A

C02:
; shift Y to the right
	CLR C
	MOV A, Adr_Yhigh_high
	RRC A
	MOV Adr_Yhigh_high, A
	MOV A, Adr_Ymean_high
	RRC A
	MOV Adr_Ymean_high, A
	MOV A, Adr_Ylow_high
	RRC A
	MOV Adr_Ylow_high, A

	MOV A, Adr_Yhigh_low
	RRC A
	MOV Adr_Yhigh_low, A
	MOV A, Adr_Ymean_low
	RRC A
	MOV Adr_Ymean_low, A
	MOV A, Adr_Ylow_low
	RRC A
	MOV Adr_Ylow_low, A

	DJNZ R0, multiplying2

	JNB PSW.1, nosign_y

	SETB 047h
	
nosign_y:
; load operands
	MOV Adr_X10high, #X10high
	MOV Adr_X10mean, #X10mean
	MOV Adr_X10low, #X10low
	MOV Adr_X101high, #X10high
	MOV Adr_X101mean, #X10mean
	MOV Adr_X101low, #X10low

; analyse sign
	MOV A, Adr_X10high
	XRL A, Adr_X101high
	JNB ACC.7, nosign3
	
; save sign
	SETB PSW.1

nosign3:
	CLR 07h
	CLR 01Fh
	
	MOV R0, #Size
	
multiplying3:
; shift X10 to the right
	CLR C
	MOV A, Adr_X10high
	RRC A
	MOV Adr_X10high, A
	MOV A, Adr_X10mean
	RRC A
	MOV Adr_X10mean, A
	MOV A, Adr_X10low
	RRC A
	MOV Adr_X10low, A
	JNC C03

; add X101 and W
	CLR C
	MOV A, Adr_X101low
    ADDC A, Adr_Wlow_high
	MOV Adr_Wlow_high, A
	MOV A, Adr_X101mean
	ADDC A, Adr_Wmean_high
	MOV Adr_Wmean_high, A
	MOV A, Adr_X101high
	ADDC A, Adr_Whigh_high
	MOV Adr_Whigh_high, A

C03:
; shift W to the right
	CLR C
	MOV A, Adr_Whigh_high
	RRC A
	MOV Adr_Whigh_high, A
	MOV A, Adr_Wmean_high
	RRC A
	MOV Adr_Wmean_high, A
	MOV A, Adr_Wlow_high
	RRC A
	MOV Adr_Wlow_high, A

	MOV A, Adr_Whigh_low
	RRC A
	MOV Adr_Whigh_low, A
	MOV A, Adr_Wmean_low
	RRC A
	MOV Adr_Wmean_low, A
	MOV A, Adr_Wlow_low
	RRC A
	MOV Adr_Wlow_low, A

	DJNZ R0, multiplying3

	JNB PSW.1, nosign_w

	SETB 047h
	
nosign_w:
; analyse sign
	MOV A, Adr_Zhigh_high
	XRL A, Adr_Yhigh_high
	JNB ACC.7, nosign4
	
; save sign
	SETB PSW.1

nosign4:
	CLR 07h
	CLR 01Fh
	
; add Z and Y
	CLR C
	MOV A, Adr_Zlow_low
    ADDC A, Adr_Ylow_low
	MOV Adr_Ylow_low, A
	MOV A, Adr_Zmean_low
	ADDC A, Adr_Ymean_low
	MOV Adr_Ymean_low, A
	MOV A, Adr_Zhigh_low
	ADDC A, Adr_Yhigh_low
	MOV Adr_Yhigh_low, A
	MOV A, Adr_Zlow_high
    ADDC A, Adr_Ylow_high
	MOV Adr_Ylow_high, A
	MOV A, Adr_Zmean_high
	ADDC A, Adr_Ymean_high
	MOV Adr_Ymean_high, A
	MOV A, Adr_Zhigh_high
	ADDC A, Adr_Yhigh_high
	MOV Adr_Yhigh_high, A

	JNB PSW.1, nosign_t

	SETB 047h
	
nosign_t:
; analyse sign
	MOV A, Adr_Whigh_high
	XRL A, Adr_Yhigh_high
	JNB ACC.7, nosign5
	
; save sign
	SETB PSW.1

nosign5:
	CLR 07h
	CLR 01Fh
	
; add W and Y
	CLR C
	MOV A, Adr_Wlow_low
    ADDC A, Adr_Ylow_low
	MOV Adr_Ylow_low, A
	MOV A, Adr_Wmean_low
	ADDC A, Adr_Ymean_low
	MOV Adr_Ymean_low, A
	MOV A, Adr_Whigh_low
	ADDC A, Adr_Yhigh_low
	MOV Adr_Yhigh_low, A
	MOV A, Adr_Wlow_high
    ADDC A, Adr_Ylow_high
	MOV Adr_Ylow_high, A
	MOV A, Adr_Wmean_high
	ADDC A, Adr_Ymean_high
	MOV Adr_Ymean_high, A
	MOV A, Adr_Whigh_high
	ADDC A, Adr_Yhigh_high
	MOV Adr_Yhigh_high, A

	JNB PSW.1, nosign_r

	SETB 047h
	
nosign_r:
	
	END