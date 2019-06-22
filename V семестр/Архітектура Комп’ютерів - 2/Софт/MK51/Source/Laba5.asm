
;Пересылка массива байтов в РПД
MOV R0, #48h
MOV R7,#30
send: MOV A, P0
MOV @R0, A
INC R0
DJNZ R7, send

;Пересылка 6 байтов в БР3
MOV PSW, #00000000b  ;
MOV R7, #6
MOV R0, #18h
MOV R1, #48h
label2:
MOV A, @R1
MOV @R0, A
INC R0
INC R1
DJNZ R7, label2

Mov PSW, #00011000b  ;Выбор БР3
;R2 = R2 XRL R3 = X2 XRL X3
MOV    A, R2
XRL    A, R3 
MOV    R2, A
;R4 = - R4 = -X4
MOV    A, R4
CPL    A 
ADD    A, #1h
MOV    R4, A

;R2 = R2 + R4 = (X2 XRL X3) - X4
MOV    A, R2
ADD    A, R4
MOV    R2, A

;R2 = R2 / R5 = ((X2 XRL X3) - X4) / X5
MOV	 A, R2
MOV    B, R5
DIV 	AB
MOV R2,A
;R2 = RRC(R2) = ((X2 XRL X3) - X4) / X5 / 2
CLR C
MOV    A, R2
RRC    A 
MOV    R2, A



;R6.R7 = RRC(R1) = 2 * X1
CLR    C
MOV    A, 19h
RLC    A 
MOV    R7, A
MOV    A, #0
RLC    A 
MOV    R6, A

;R6.R7 =  RRC(R6.R7) = 4 * X1
CLR    C
MOV    A, R7
RLC    A 
MOV    R7, A
MOV    A, R6
RLC    A 
MOV    R6, A

;R6.R7 = - RRC(R6.R7) = - 4 * X1
MOV    A, R7
CPL    A 
MOV    R7, A
MOV    A, R6
CPL    A 
MOV    R6, A

CLR    C
MOV    A, R7
ADDC   A, #1h 
MOV    R7, A
MOV    A, R6
ADDC   A, #0h 
MOV    R6, A

;R6.R7 = R6.R7 + R0 = X0 - 4 * X1
CLR    C
MOV    A, R7
ADDC   A, R0 
MOV    R7, A
MOV    A, R6
ADDC   A, #0h 
MOV    R6, A

;R6.R7 =  RRC(R6.R7) = 2 * (X0 - 4 * X1)
CLR    C
MOV    A, R7
RLC    A 
MOV    R7, A
MOV    A, R6
RLC    A 
MOV    R6, A

;R6.R7 =  RRC(R6.R7) = 4 * (X0 - 4 * X1)
CLR    C
MOV    A, R7
RLC    A 
MOV    R7, A
MOV    A, R6
RLC    A 
MOV    R6, A

;R6.R7 =  RRC(R6.R7) = 8 * (X0 - 4 * X1)
CLR    C
MOV    A, R7
RLC    A 
MOV    R7, A
MOV    A, R6
RLC    A 
MOV    R6, A

;R5.R7 = R6.R7 = 8 * (X0 - 4 * X1)
MOV    A, R6
MOV    R5, A

;R5.R7 = R5.R7 + R2 = 8 * (X0 - 4 * X1) + ((X2 XRL X3) - X4) / X5 / 2
CLR    C
MOV    A, R7
ADDC   A, R2 
MOV    R6, A
MOV    A, R5
ADDC   A, #0h 
MOV    R5, A

NOP
END

