ANL BUS, #0
INS A, BUS
JB0 X1_1

X1_0:
	CALL SUB_1
	CALL SUB_2
	JMP X2_0

X2_0:
	CALL SUB_3
	JMP _END

X1_1:
	CALL SUB_2
	INS A, BUS
	JB0 X2_1
	JMP X2_0

X2_1:
	CALL SUB_4
	JMP _END

SUB_1:
	; Y5 = 150 мс
	; 150 - 5 (MOV) - 5 (ANL) = 140 = 28 * 5
	ORL BUS, #00100000b ; включаем Y5
	MOV R0, #28
	TIME_1: DJNZ R0, TIME_1
	ANL BUS, #11011111b ; выключаем Y5
	RET

SUB_2:
	; 1) 0 - 40 мс: Y1 Y3 Y4 ; 40 - 5 (MOV) - 5 (ANL) = 30 = 6 * 5
	; 2) 40 - 50 мс: Y3 Y4 ; 10 - 5 (ANL) = 5 = 2 * 2.5
	; 3) 50 - 100 мс: Y3 ; 50 - 5 (MOV) - 5 (ANL) = 40 = 8 * 5
	ORL BUS, #00011010b ; включаем Y1 Y3 Y4
	MOV R0, #6
	TIME_2: DJNZ R0, TIME_2
	ANL BUS, #11111101b ; выключаем Y1
	NOP
	NOP
	ANL BUS, #11101111b ; выключаем Y4
	MOV R0, #8
	TIME_3: DJNZ R0, TIME_3
	ANL BUS, #11110111b ; выключаем Y3
	RET

SUB_3:
	; Y1 = 40 мс
	; 40 - 5 (MOV) - 5 (ANL) = 30 = 6 * 5
	ORL BUS, #00000010b ; включаем Y1
	MOV R0, #6
	TIME_4: DJNZ R0, TIME_4
	ANL BUS, #11111101b ; выключаем Y1
	RET

SUB_4:
	; 1) 0 - 50 мс: Y3 Y4 ; 50 - 5 (MOV) - 5 (ANL) = 40 = 8 * 5
	; 2) 50 - 100 мс: Y3 ; 50 - 5 (MOV) - 5 (ANL) = 40 = 8 * 5
	ORL BUS, #00011000b ; включаем Y3 Y4
	MOV R0, #8
	TIME_5: DJNZ R0, TIME_5
	ANL BUS, #11101111b ; выключаем Y4
	MOV R0, #8
	TIME_6: DJNZ R0, TIME_6
	ANL BUS, #11110111b ; выключаем Y3
	RET

_END:
	END