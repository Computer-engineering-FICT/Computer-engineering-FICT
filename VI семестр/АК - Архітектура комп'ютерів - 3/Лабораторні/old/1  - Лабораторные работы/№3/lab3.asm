ORG 0H

MOV   R5, #5H
MOV   R3, #9H

MOV  A, R5
ADD A, R3
MOV  R4, A

LOOP:
  MOV A, R4
  LCALL DECHA
  MOV DPTR, #8001H
  MOVX @DPTR, A

  MOV A, #00H
  MOV DPTR, #8002H
  MOVX @DPTR, A

  LCALL TIME

  MOV A, R4
  LCALL DECLA
  MOV DPTR, #8001H
  MOVX @DPTR, A

  MOV A, #01H
  MOV DPTR, #8002H
  MOVX @DPTR, A

  LCALL TIME  
AJMP LOOP

TIME:
;  MOV R1, 0FFH
;  C2:
    MOV R0, 0FFH
    C1: DJNZ R0, C1
;  DJNZ R1, C2
RET

DECHA:
  SWAP A;
  LCALL DECLA;
RET

DECLA:
  ANL A, #0FH
  INC A
  MOVC A, @A+PC
RET

DB 00111111b; 0
DB 00000110b; 1
DB 01011011b; 2
DB 01001111b; 3
DB 01100110b; 4
DB 01101101b; 5
DB 01111101b; 6
DB 00000111b; 7
DB 01111111b; 8
DB 01101111b; 9
DB 01110111b; A
DB 01111100b; B
DB 00111001b; C
DB 01011110b; D
DB 01111001b; E
DB 01110001b; F

END