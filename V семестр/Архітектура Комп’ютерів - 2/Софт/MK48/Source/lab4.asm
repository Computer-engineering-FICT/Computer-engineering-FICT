        
           
;Ввод

          
           SEL    RB0
           IN     A, P1
           MOV    R3, A
           IN     A, P1
           MOV    R4, A
           IN     A, P1
           MOV    R5, A
           MOV    R6, #24
           
           SEL    RB1
           IN     A, P1
           MOV    R0, A
           IN     A, P1
           MOV    R1, A
           IN     A, P1
           MOV    R2, A
; Блок 1
; Перевод Х
           SEL    RB0
           MOV    A, R3
           JB7    label1a
           JMP    label2
           
label1a:   MOV    R7, #80h
           MOV    A, R3
           ANL    A, #7Fh
           MOV    R3, A
           
; Блок 2
; Перевод Y
label2:    SEL    RB1
           MOV    A, R0
           JB7    label2a
           JMP    label3
           
label2a:   MOV    A, R0
           ANL    A, #7Fh
           MOV    R0, A   
           SEL    RB0
           MOV    A, #80h
           XRL    A, R7
           MOV    R7, A                 
           
; Блок 3
; Проверка младшего бита Y
label3:    SEL    RB1
           MOV    A, R2
           JB0    label4
           JMP    label5 
      
          
; Блок 4
; Суммирование Z=Z+X
label4:    SEL    RB0
           CLR    C
           MOV    A, R2
           ADDC   A, R5
           MOV    R2, A 
           MOV    A, R1
           ADDC   A, R4
           MOV    R1, A 
           MOV    A, R0
           ADDC   A, R3
           MOV    R0, A 
            
; Блок 5
; Сдвиг Z, Dec счетчика
label5:    SEL    RB0
           CLR    C
           MOV    A, R0
           RRC    A
           MOV    R0, A 
           MOV    A, R1
           RRC    A
           MOV    R1, A 
           MOV    A, R2
           RRC    A
           MOV    R2, A 
           
           SEL    RB1
           MOV    A, R0
           RRC    A
           MOV    R0, A 
           MOV    A, R1
           RRC    A
           MOV    R1, A 
           MOV    A, R2
           RRC    A
           MOV    R2, A 
           
           SEL    RB0
           DJNZ R6, label3
           
; Блок 6
; Перевод Z
           SEL    RB0
           MOV    A, R7
           JB7    label6a
           JMP    ending
           
label6a:   MOV    A, R0
           CPL    A
           MOV    R0, A
           MOV    A, R1
           CPL    A
           MOV    R1, A
           MOV    A, R2
           CPL    A
           MOV    R2, A
           
           SEL    RB1        
           MOV    A, R0
           CPL    A
           MOV    R0, A
           MOV    A, R1
           CPL    A
           MOV    R1, A
           MOV    A, R2
           CPL    A
           MOV    R2, A
           
           CLR    C
           MOV    A, R2
           ADDC   A, #1
           MOV    R2, A
           MOV    A, R1
           ADDC   A, #0
           MOV    R1, A
           MOV    A, R0
           ADDC   A, #0
           MOV    R0, A
           
           SEL    RB0
           MOV    A, R2
           ADDC   A, #0
           MOV    R2, A
           MOV    A, R1
           ADDC   A, #0
           MOV    R1, A
           MOV    A, R0
           ADDC   A, #0
           MOV    R0, A
           
           
  

ending:
           Nop
           End