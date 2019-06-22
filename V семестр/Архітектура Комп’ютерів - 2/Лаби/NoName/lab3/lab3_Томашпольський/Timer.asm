          SEL RB0
          
          ANL P1, #C0h
          IN A, P1
          JB6 X2
          JMP notX2
X2:
          JB7 X1
          JMP notX1
X1:  
          MOV A, #FFh
          MOV T, A
          MOV A, #0Ch
          ORL P1, #0Ch
          OUTL P1, A
          STRT T
          ll1: 
          JTF ll2
          JMP ll1
          ll2:
          ANL P1,#08h
          MOV A, #F8h
          MOV T, A
          STRT T
          ll3: 
          JTF ll4
          JMP ll3
          ll4:          
          JMP happyEnding 
notX2:
          ORL P1, #10h
          MOV A, #10h
          OUTL P1, A
          MOV R0, #0Ch
          here: DJNZ R0, here
          ANL P1, #FFh
notX1:
          ORL P1, #0Dh
          MOV A, #0Dh
          OUTL P1, A
          MOV R0, #03h
          here1: DJNZ R0, here1
          NOP
          ANL P1, #0Ch
          MOV A, #FFh
          MOV T, A
          MOV A, #0Ch
          OUTL P1, A
          STRT T
          ll5: 
          JTF ll6
          JMP ll5
          ll6:
          ANL P1,#08h
          MOV A, #F8h
          MOV T, A
          STRT T
          ll7: 
          JTF ll8
          JMP ll7
          ll8:
          ORL P1, #01h
          MOV A, #01h
          OUTL P1, A
          MOV R0, #03h
          here2: DJNZ R0, here2
          NOP
          ANL P1, #00h

happyEnding:
          END     
