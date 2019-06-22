ANL P2, #40h
IN A, P2
JB7 X1
ll1:
;X1(0)
;y1,y5 - 40mks
 MOV R5, #8
 ORL P2, #22h     ;y1,y5
count1: DJNZ R5, count1
 ANL P2, #40h
 JMP ll4
;X1(1)
;y2 - 240mks
X1:
 MOV A, #FDh ; -3
 MOV T, A
 ORL P2, 8h       ;y2
 STRT T
ll2: JTF ll3
 JMP ll2
ll3: ANL P2, #40h
JMP ll5

ll4:
JB6 X2
;X2(0)
;y2,y3,y4 - 100mks
 MOV R5, #4
count2: DJNZ R5, count2 ;20mks
 MOV A, #FAh ; -1
 MOV T, A
 ORL P2, 1Ch       ;y2,y3,y4
 STRT T
count_2: JTF count3
 JMP count_2
count3: ANL P2, #40h
JMP ll1

;y1,y2,y5 - 50mks
;X2(1)
X2:
ll5:
 MOV R5, #10
 ORL P2, #26h     ;y1,y2,y5
count4: DJNZ R5, count4
 ANL P2, #40h
 
;y1,y5 - 40mks
 MOV R5, #8
 ORL P2, #22h     ;y1,y5
count5: DJNZ R5, count5
 ANL P2, #40h

end

 
     
