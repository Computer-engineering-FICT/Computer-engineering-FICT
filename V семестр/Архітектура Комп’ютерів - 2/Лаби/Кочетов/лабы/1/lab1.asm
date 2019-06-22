;F = 4*(X1&X2) - (X3-X4+1) - (X5VX6 - 1) / 2

SEL RB0
MOV R0, #01h
MOV R7, #06h
INPUT:
	IN A, P2
	MOV @R0, A
	INC R0
	DJNZ R7, INPUT

MOV A, R1 ; X1
ANL A, R2 ; X1&X2
RLC A ; (X1&X2)*2
RLC A ; (X1&X2)*4
MOV R1, A

MOV A, R4 ; X4
CPL A ; -X4
INC A ; -X4 (ДК)
ADD A, R3 ; X3-X4
INC A ; X3-X4+1

MOV R7, A ; R7 := X3-X4+1
CLR A
ADDC A, #00h; A := C
MOV R2, A ; R2 := C
MOV A, R7 ; A := X3-X4+1
RL A ; A[0] = знаковый разряд
ANL A, R2 ; сравниваем знаковый разряд и бит переноса
XCH A, R7 ; A := X3-X4+1, R7 := C

CPL A
INC A ; -(X3-X4+1) (ДК)
MOV R3, A

MOV A, R7 ; A := C
ADD A, #11111111b ; C := C
MOV A, R1 ; (X1&X2)*4
ADDC A, R3 ; (X1&X2)*4-(X3-X4+1)
MOV R1, A

MOV A, #00h
ADDC A, #00h; A := C
MOV R2, A ; R2 := C
MOV A, R1 ; A := (X1&X2)*4-(X3-X4+1)
RL A ; A[0] = знаковый разряд
ANL A, R2 ; сравниваем знаковый разряд и бит переноса
MOV R7, A ; R7 := C

MOV A, R5 ; X5
ORL A, R6 ; X5VX6
DEC A ; X5VX6-1
JB7 NEG
; A>0
CLR C
RRC A ; (X5VX6-1)/2
JMP AFTER
NEG: ; A<0
CLR C
CPL C ; C := 1
RRC A ; (X5VX6-1)/2
AFTER:
CPL A
INC A ; -(X5VX6-1)/2 (ДК)
MOV R5, A

MOV A, R7
ADD A, #11111111b ; возвращаем бит переноса

MOV A, R1 ; (X1&X2)*4-(X3-X4+1)
ADDC A, R5 ; (X1&X2)*4-(X3-X4+1)-(X5VX6-1)/2

MOV R0, A

MOV A, #00h
ADDC A, #00h
MOV R7, A

END