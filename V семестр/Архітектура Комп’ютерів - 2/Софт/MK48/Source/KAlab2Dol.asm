; LOAD OPERANDS

           SEL    RB1
           MOV    R0, #00H
           MOV    R7, #07H
LOAD_LOOP:
           IN     A, P2
           MOV    @R0, A
           INC    R0
           DJNZ   R7, LOAD_LOOP

           CLR    A
           XCH    A, R0

           NOP
;Blok 1 -------------------------
; R3 = R2-R1-1

          SEL RB0
          MOV A ,R1
          CPL A
          ADDC A, #1
          MOV R1, A
          
          SEL RB1
          MOV A ,R1
          CPL A
          ADDC A, #0
          MOV R1, A
          
          CLR C
          
          SEL RB0
          MOV A ,R2
          ADDC A, R1
          MOV R3, A
          
          SEL RB1
          MOV A ,R2
          ADDC A, R1
          MOV R3, A
          
     CLR    C
       SEL    RB0
       MOV    A, R3
       ADDC   A, #FFH
       MOV    R3, A

       SEL    RB1
       MOV    A, R3
       ADDC   A, #FFH
       MOV    R3, A
       NOP
       
;------------------------------
;Blok 2
;CYCLE:

      MOV R7, #3H  
      CYCLE:
; C=1?
     
     JC COUNT
     CALL MPP
          
;Blok 3 --------------------          
     COUNT:
     ;R4=(R3+R1+1)/2
     
     CLR C
     SEL RB0
     MOV A,R1
     INC A
     MOV R4, A
     
     SEL RB1
     
     MOV  A, R1
     ADDC A , #0H
     MOV R4, A
     
     CLR C
     
     SEL RB0
     MOV A,R4
     ADDC A , R3
     MOV R4 , A
     
     SEL RB1
     MOV A , R4
     ADDC A , R3
     MOV R4 , A
     
      CLR    C
      SEL    RB1
      MOV    A, R4
      RRC    A 
      MOV    R4, A

      SEL    RB0 
      MOV    A, R4
      RRC    A
      MOV    R4, A
;------------------------------
;Blok 4
;R6 = R4VR3
    CLR C
    
    MOV A , R4
    ORL A ,R3
    MOV R6 , A
    
    SEL RB1
    MOV A, R4
    ORL A , R3
    MOV R6 , A
;-------------------------------
;Blok 5    
    SEL RB1
    DJNZ R7 , CYCLE
;-------------------------------
;Blok 6-----------------------     
;R3=R6+25H

       CLR C
       SEL RB0
       MOV A, R6
       ADDC A , #25H
       MOV R3 , A
       
       SEL RB1
       
       MOV A, R6
       ADDC A, #0H
       MOV R3, A
       NOP
       
       JMP ENDED  
;--------------------------------       
       MPP:
;Blok 7----------------------------------------       
;R6-1
       CLR    C
       SEL    RB0
       MOV    A, R0
       ADDC   A, #FFH
       MOV    R1, A
    
       SEL    RB1
    MOV    A, R6
    ADDC   A, #FFH
    MOV    R1, A
    
    CLR C
    
    SEL RB0
    MOV A , R1
    RLC A
    MOV R1 , A
    
    SEL RB1
    MOV A , R1
    RLC A
    MOV R1 , A
;---------------------------------------------  
;Blok 8 ---------------------------  
 ;F0 =1 ?
 
    CLR F0
    CPL F0
    JC CONT_MPP
    
;Blok 9  -------------------------------------- 
;R2 = R4&R1
    
    SEL RB0
    MOV A , R4
    ANL A, R1
    MOV R2,A
    
    SEL RB1
    MOV A , R4
    ANL A, R1
    MOV R2,A
;Blok 10 ---------------------       
;R5 = R2-R0-1
  
           CLR    C
           SEL    RB0
           MOV    A, R0
           CPL    A
           ADDC   A, #1
           MOV    R0, A

           SEL    RB1
           MOV    A, R0
           CPL    A
           ADDC   A, #0
           MOV    R0, A

           CLR    C
           SEL    RB0
           MOV    A, R2
           ADDC   A, R0
           MOV    R5, A

           SEL    RB1
           MOV    A, R2
           ADDC   A, R0
           MOV    R5, A

           CLR    C
           SEL    RB0
           MOV    A, R0
           ADDC   A, #FFH
           
           MOV    R0, A
           SEL    RB1
           MOV    A, R0
           ADDC   A, #FFH
           MOV    R0, A
           
    CONT_MPP:
;----------------------------------------
;Blok 11    
    ;R3=R3+R5
    
    CLR C
    
    SEL RB0 
    MOV A , R3
    ADDC A , R5
    MOV R3, A
    
    SEL RB1 
    MOV A , R3
    ADDC A , R5
    MOV R3, A
  
       NOP
       RET
;----------------------------       
       ENDED:
       
       NOP
        END   
 
          
          
                   
          
          
          
                 
            

