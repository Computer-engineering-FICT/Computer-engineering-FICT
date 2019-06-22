          SEL RB1
          CLR F1
          
;-------input first operand--------
          
          INS A, BUS
          XCH A, R1
          INS A, BUS
          XCH A, R2
          MOV A, R1
          ANL A, #80h
          JB7 firstMinus
          JMP firstChecked
firstMinus:
          CPL F1
          MOV A, R1
          XRL A, #80h
          MOV R1, A
firstChecked:

;-------input second operand-------

          SEL RB0
          INS A, BUS
          XCH A, R2
          INS A, BUS
          XCH A, R3
          MOV A, R2
          ANL A, #80h
          JB7 secondMinus
          JMP secondChecked
secondMinus:
          CPL F1
          MOV A, R3
          ADD A, #FFh
          MOV R3, A
          MOV A, R2
          ADDC A, #FFh
          XRL A, #FFh
          MOV R2, A
          MOV A, R3
          XRL A, #FFh
          MOV R3, A    
secondChecked:

;-------------Multiply-------------

checkAdding:
          SEL RB1
          MOV A, R2
          JB0 add
          JMP noAdd
add:
          SEL RB0
          CLR C;
          
          MOV A, R7
          ADD A, R3
          MOV R7, A
          
          MOV A, R6 
          ADDC A, R2
          MOV R6, A
          
          MOV A, R5
          ADDC A, R1
          MOV R5, A
          
          MOV A, R4
          ADDC A, R0
          MOV R4, A
          
noAdd:
;---------Y shift----------
          CLR C
          XCH A, R3
          RLC A
          XCH A, R3
          
          XCH A, R2
          RLC A
          XCH A, R2
          
          XCH A, R1
          RLC A
          XCH A, R1
          
          XCH A, R0
          RLC A
          XCH A, R0
          
;---------X shift----------                  
          SEL RB1          
          MOV A, R1
          CLR C;
          RRC A
          XCH A, R1
          XCH A, R2
          RRC A
          XCH A, R2
          MOV A, R1
          ORL A, R2
          JNZ checkAdding
;---------Sign handle------
          JF1 changeSign
          JMP happyEnding
changeSign:
          SEL RB0
          CLR F1
          MOV A, R4
          ADD A, #80h
          MOV R4, A
happyEnding:
          END