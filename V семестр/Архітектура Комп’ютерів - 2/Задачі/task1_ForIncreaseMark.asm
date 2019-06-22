;
; R7.R6 = (R5-1)/4 + K
; if (C = 1)  K = R2 + 50h/4
; else  K = 4(R1 + R2)
;
; Author: Redko Alexander
; Date: 21.12.2012
;

      SEL RB0
      MOV R5, #0FFh
      MOV R1, #0FFh
      MOV R2, #0FFh
      
      CLR C
      MOV A, R5
      ADD A, #FFh  ; A := R5 - 1
      CLR C
      RRC A
      CLR C
      RRC A
      MOV R6, A ; R6 := (R5 - 1)/4
      
      CLR C
      JC flag_c_1
      MOV A, #50h
      CLR C
      RRC A
      CLR C
      RRC A
      CLR C
      ADDC A, R2
      MOV R3, A
      MOV A, R4
      ADDC A, #0h
      MOV R4, A   ; R4.R3 = R2 + 50h/4
      JMP addition
      
flag_c_1:
      CLR C
      MOV A, R1
      ADDC A, R2
      MOV R3, A
      CLR A
      ADDC A, #0h
      MOV R4, A   ; R4.R3 = R1 + R2
      
      CLR C
      MOV A, R3
      RLC A
      MOV R3, A
      MOV A, R4
      RLC A
      MOV R4, A

      CLR C      
      MOV A, R3
      RLC A
      MOV R3, A
      MOV A, R4
      RLC A
      MOV R4, A

addition:
     MOV A, R6
     ADD A, R3
     MOV R6, A
     MOV A, R4
     ADDC A, #00h
     MOV R7, A       ; R7.R6 = R4.R3 + R6
     
     NOP
     END