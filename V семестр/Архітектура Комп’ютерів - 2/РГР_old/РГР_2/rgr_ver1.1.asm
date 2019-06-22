; X = X2^2 + (X3 * X4) + X5^2 + X6
; спосіб множення - 4, розрядність операндів - 16
; операнди подані в ПК
;
; Результат обчислення функції розміщується за адресою 20h.21h.22h.23h

;--------------------------------------------------------
      X2_high EQU #0FFh
      X2_low  EQU #0FFh
      X3_high EQU #07Fh
      X3_low  EQU #0FFh
      X4_high EQU #0FFh
      X4_low  EQU #0FFh
      X5_high EQU #0FFh
      X5_low  EQU #0FFh
      X6_high EQU #0FFh
      X6_low  EQU #0FFh
;--------------------------------------------------------

; X2^2
      SEL RB1
      MOV R1, X2_high
      MOV R2, X2_high
      SEL RB0
      MOV R1, X2_low
      MOV R2, X2_low
      CALL multiply
; запис результату в 20h.21h.22h.23h
      SEL RB1
      MOV R0, #20h
      MOV A, R4
      MOV @R0, A
      INC R0
      SEL RB0
      MOV A, R4
      SEL RB1
      MOV @R0, A
      SEL RB1
      INC R0
      MOV A, R5
      MOV @R0, A
      INC R0
      SEL RB0
      MOV A, R5
      SEL RB1
      MOV @R0, A
      
; X3 * X4
      SEL RB1
      MOV R1, X3_high
      MOV R2, X4_high
      SEL RB0
      MOV R1, X3_low
      MOV R2, X4_low
      CALL multiply
; запис результату в 24h.25h.26h.27h
      SEL RB1
      MOV R0, #24h
      MOV A, R4
      MOV @R0, A
      INC R0
      SEL RB0
      MOV A, R4
      SEL RB1
      MOV @R0, A
      SEL RB1
      INC R0
      MOV A, R5
      MOV @R0, A
      INC R0
      SEL RB0
      MOV A, R5
      SEL RB1
      MOV @R0, A

; X2^2 + X3 * X4
      
      CALL adding

; X5^2
      SEL RB1
      MOV R1, X5_high
      MOV R2, X5_high
      SEL RB0
      MOV R1, X5_low
      MOV R2, X5_low
      CALL multiply
; запис результату в 24h.25h.26h.27h
      SEL RB1
      MOV R0, #24h
      MOV A, R4
      MOV @R0, A
      INC R0
      SEL RB0
      MOV A, R4
      SEL RB1
      MOV @R0, A
      SEL RB1
      INC R0
      MOV A, R5
      MOV @R0, A
      INC R0
      SEL RB0
      MOV A, R5
      SEL RB1
      MOV @R0, A

; X2^2 + X3 * X4 + X5^2
      CALL adding
      
; X2^2 + X3 * X4 + X5^2 + X6
      SEL RB1
      MOV R0, #24h
      MOV A, #0
      MOV @R0, A
      INC R0
      SEL RB0
      MOV A, #0
      SEL RB1
      MOV @R0, A
      SEL RB1
      INC R0
      MOV A, X6_high
      MOV @R0, A
      INC R0
      SEL RB0
      MOV A, X6_low
      SEL RB1
      MOV @R0, A
      MOV R0, #26h
      
      MOV A, @R0
      JB7 add_minus
      JMP add_plus
add_minus:
      ANL A, #7Fh
      MOV @R0, A
      MOV R0, #24h
      MOV A, @R0
      ORL A, #80h
      MOV @R0, A
add_plus:
      CALL adding
              
      JMP ending
      
;------------------Підпрограма множення------------------
; У вихідному стані операнди знаходяться:
; старша частина першого операнду - R1 RB1
; молодша частина першого операнду - R1 RB0
; старша частина другого операнду - R2 RB1
; молодша частина другого операнду - R2 RB0
; Після виконання операції множення добуток знаходиться:
; старша частина - в R4_RB1.R4_RB0
; молодша частина - в R5_RB1.R5_RB0

multiply:
; Очищення регістрів
      SEL RB0
      MOV A, R3
      XRL A, R3
      MOV R3, A
      MOV A, R4
      XRL A, R4
      MOV R4, A
      MOV A, R5
      XRL A, R5
      MOV R5, A
      SEL RB1
      MOV A, R3
      XRL A, R3
      MOV R3, A
      MOV A, R4
      XRL A, R4
      MOV R4, A
      MOV A, R5
      XRL A, R5
      MOV R5, A
; Визначення знаку результату і подання операндів в ПК
      SEL RB1 ; вибір першого банку регістрів
      CLR F1
      MOV A, R1
      XRL A, R2
      JB7 sign_minus ; визначення знаку результату
      JMP sign_plus
sign_minus:
      CPL F1 ; встановлення ознаки F1
sign_plus:
      MOV A, R1
      ANL A, #7Fh ; встановлення знакового розряду в нуль
      MOV R1, A
      MOV A, R2
      ANL A, #7Fh ; встановлення знакового розряду в нуль
      MOV R2, A

; початковий стан: зсув другого множника вправо на один розряд
      CLR C
      SEL RB1
      MOV A, R2
      RRC A
      MOV R2, A
      SEL RB0
      MOV A, R2
      RRC A
      MOV R2, A
      SEL RB1
      MOV A, R3
      RRC A
      MOV R3, A

loop:
; аналіз старшого розряду першого множника
      SEL RB1
      MOV A, R1
      CPL A
      JB7 zero
      
; Z: R4_RB1.R4_RB0.R5_RB1.R5_RB0
; Y: R2_RB1.R2_RB0.R3_RB1.R3_RB0
; додавання другого множника до суми часткових добутків
      SEL RB0
      CLR C
      MOV A, R5
      ADDC A, R3
      MOV R5, A
      SEL RB1
      MOV A, R5
      ADDC A, R3
      MOV R5, A
      SEL RB0
      MOV A, R4
      ADDC A, R2
      MOV R4, A
      SEL RB1
      MOV A, R4
      ADDC A, R2
      MOV R4, A
      
zero:      
; зсув першого множника вліво
      CLR C
      SEL RB0
      MOV A, R1
      RLC A
      MOV R1, A
      SEL RB1
      MOV A, R1
      RLC A
      MOV R1, A

; зсув другого множника вправо
      CLR C
      SEL RB1
      MOV A, R2
      RRC A
      MOV R2, A
      SEL RB0
      MOV A, R2
      RRC A
      MOV R2, A
      SEL RB1
      MOV A, R3
      RRC A
      MOV R3, A
      SEL RB0
      MOV A, R3
      RRC A
      MOV R3, A
; перевірка, чи перший множник дорівнює нулю
      SEL RB1
      MOV A, R1
      JNZ loop
      
; аналіз знаку результату      
      JF1 rez_minus
      JMP rez_plus
rez_minus:
      SEL RB1
      MOV A, R4
      ORL A, #80h
      MOV R4, A      
rez_plus:
      RET
;--------------------------------------------------------

;------------------Підпрограма додавання-----------------
; У вихідному стані операнди знаходяться:
; старша частина першого операнду - 20h.21h
; молодша частина першого операнду - 22h.23h
; старша частина другого операнду - 24h.25h
; молодша частина другого операнду - 26h.27h
; Результат поміщається на місце першого операнду
; 20h.21h.22h.23h
; 24h.25h.26h.27h
adding:
      SEL RB0
      MOV R0, #20h
      MOV A, @R0
      JB7 sign_add_first_minus
      JMP sign_add_first_plus
sign_add_first_minus:
      ANL A, #7Fh
      MOV @R0, A
      MOV R0, #23h
      MOV A, @R0
      CPL A
      MOV @R0, A
      DEC R0
      MOV A, @R0
      CPL A
      MOV @R0, A
      DEC R0
      MOV A, @R0
      CPL A
      MOV @R0, A
      DEC R0
      MOV A, @R0
      CPL A
      MOV @R0, A
      CLR C
      MOV R0, #23h
      MOV A, @R0
      ADDC A, #1
      MOV @R0, A
      DEC R0
      MOV A, @R0
      ADDC A, #0
      MOV @R0, A
      DEC R0
      MOV A, @R0
      ADDC A, #0
      MOV @R0, A
      DEC R0
      MOV A, @R0
      ADDC A, #0
      MOV @R0, A
      
sign_add_first_plus:
      MOV R0, #24h
      MOV A, @R0
      JB7 sign_add_second_minus
      JMP sign_add_second_plus
sign_add_second_minus:
      ANL A, #7Fh
      MOV @R0, A
      MOV R0, #27h
      MOV A, @R0
      CPL A
      MOV @R0, A
      DEC R0
      MOV A, @R0
      CPL A
      MOV @R0, A
      DEC R0
      MOV A, @R0
      CPL A
      MOV @R0, A
      DEC R0
      MOV A, @R0
      CPL A
      MOV @R0, A
      CLR C
      MOV R0, #27h
      MOV A, @R0
      ADDC A, #1
      MOV @R0, A
      DEC R0
      MOV A, @R0
      ADDC A, #0
      MOV @R0, A
      DEC R0
      MOV A, @R0
      ADDC A, #0
      MOV @R0, A
      DEC R0
      MOV A, @R0
      ADDC A, #0
      MOV @R0, A

sign_add_second_plus:      
      CLR C
      SEL RB1
      MOV R0, #23h
      MOV R1, #27h
      MOV R2, #4h
add_loop:
      MOV A, @R0
      ADDC A, @R1
      MOV @R0, A
      DEC R0
      DEC R1
      DJNZ R2, add_loop
      RET
;--------------------------------------------------------
      
ending:
      END