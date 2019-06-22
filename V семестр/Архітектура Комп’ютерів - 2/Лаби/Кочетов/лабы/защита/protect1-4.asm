; Задание: считать первое число из портов Р4 и Р5, второе с BUS. Если первое больше второго, выполнить МРР1 - умножение этих чисел первым способом и записать результат по адресу 29h и 2Ah. Иначе выполнить MPP2 - деление первого числа на второе и записать результат по адресу 28h.

; R1 = X1
MOVD A, P4
SWAP A
MOV R1, A
MOVD A, P5
ORL A, R1
MOV R1, A

; R2 = X2
INS A, BUS
MOV R2, A

; R3 = -X2
CPL A
INC A
MOV R3, A

MOV A, R1
ADD A, R3
JB7 LESS
CALL MPP1
JMP ENDPROG
LESS:
	CALL MPP2
	JMP ENDPROG

MPP1:
	;x1, x2, -x2 to RB1
	MOV A, R1
	SEL RB1
	MOV R1, A
	SEL RB0
	MOV A, R2
	SEL RB1
	MOV R2, A
	SEL RB0
	MOV A, R3
	SEL RB1
	MOV R3, A

	MOV R6, #8

	MULT_LOOP:
		MOV A, R2
		JB0 MULT_SUM
		JMP AFTER_MULT_SUM
		; Y = Y + X1
		MULT_SUM:
			MOV R0, #2AH
			MOV A, @R0
			ADD A, R1
			MOV @R0, A
			MOV R0, #29H
			MOV A, @R0
			ADDC A, #0
			MOV @R0, A
		AFTER_MULT_SUM:
		; Y = Y / 2
		CLR C
		MOV R0, #29H
		MOV A, @R0
		RRC A
		MOV @R0, A
		MOV R0, #2AH
		MOV A, @R0
		RRC A
		MOV @R0, A

		; X2 = X2 / 2
		MOV A, R2
		RR A
		ANL A, #01111111B
		MOV R2, A
		JNZ MULT_LOOP
	RET

MPP2:
	MOV A, R1
	ADD A, R3
	JB7 DIV_LESS_0
	MOV R0, #28H
	MOV @R0, #1
	DIV_LESS_0:
	MOV R6, #7
	DIV_LOOP:
		MOV A, R7
		RL A
		ANL A, #11111110B
		MOV R7, A
		JB7 REM_LESS
		MOV R0, #28H
		MOV A, @R0
		ADD A, R3
		MOV @R0, A
		JMP AFTER_REM_CHECK
		REM_LESS:
			MOV R0, #28H
			MOV A, @R0
			ADD A, R2
			MOV @R0, A
			AFTER_REM_CHECK:
			JB7 RES_LESS
			RR A
			ORL A, #00000001B
			MOV @R0, A
			JMP AFTER_RES_CHECK
			RES_LESS:
				RR A
				ANL A, #11111110B
				MOV @R0, A
			AFTER_RES_CHECK:
			DJNZ R6, DIV_LOOP
			
	RET

ENDPROG:
END