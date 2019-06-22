        
     
;Устанавливаем  P2[7,6]=11          
          ANL P2,  #C0h
         

;Вершина 1. Задержки Y1=720мкс; Y5=800мкс.
;Формируем задержку 720 мкс = 80мкс * 9 для Y1, Y5.    
label1a:  MOV  A,  #11110111b; (-9)ДК
          MOV  T,  A
          ORL  P2, #00100010b; Y1Y5 ON
          STRT T
label1b:  JTF  label1c
          JMP  label1b
          
;Формируем задержку 80 мкс = 80мкс * 1 для Y5.   
label1c:  ANL  P2, #11100000b; Y1 OFF
          MOV  A,  #11111111b; (-1)ДК
          MOV  T,  A
          ORL  P2, #00100000b; Y5 ON
          STRT T
label1d:  JTF  label2a
          JMP  label1d
                

      
;Вершина 2. Проверка условия X1, 
; по 1 переход на вершину 5,
; по 0 продолжаем.
label2a:  ANL  P2, #11000000b; Y5 OFF
          IN   A,  P2
          JB6  label5a
          
          
          
;Вершина 3. Задержки Y2=25мкс.
;Формируем задержку 25 мкс = 5мкс * 5 для Y2.  
          ORL  P2, #00000100b; Y2 ON
          MOV  R7, #5
label3a:  DJNZ R7, label3a
          ANL  P2, #11000000b; Y2 OFF
          
          
          
;Вершина 4. Проверка условия X2, 
; по 1 переход на вершину 6,
; по 0 переход на вершину 1.


          IN   A,  P2
          JB7  label6a   
          JMP  label1a

          
          
;Вершина 5. Проверка условия X1, 
; по 1 переход на вершину 7,
; по 0 переход на вершину 6.
label5a:  IN   A,  P2
          JB6  label7a   
          JMP  label6a
          
          
          
;Вершина 6. Задержки Y2=25мкс; Y3=400мкс; Y4=10мкс.
;Формируем задержку 10 мкс = 5мкс * 2 для Y2, Y3, Y4.  
label6a:  ORL  P2, #00011100b; Y2, Y3, Y4 ON
          MOV  R7, #2
label6b:  DJNZ R7, label6b
          ANL  P2, #11001100b; Y4 OFF
          
;Формируем задержку 15 мкс = 5мкс * 3 для Y2, Y3.  
          MOV  R7, #3
label6c:  DJNZ R7, label6c
          ANL  P2, #11001000b; Y2 OFF
          
;Формируем задержку 45 мкс = 5мкс * 9 для Y3.  
          MOV  R7, #9
label6d:  DJNZ R7, label6d

;Формируем задержку 320 мкс = 80мкс * 4 для Y3.   
          MOV  A,  #11111100b; (-4)ДК
          MOV  T,  A
          STRT T
label6e:  JTF  label7a
          JMP  label6e
          
          
          
;Вершина 7. Задержки Y1=720мкс; Y2=25мкс; Y5=800мкс.
;Формируем задержку 25 мкс = 5мкс * 5 для Y1, Y2, Y5.  
label7a:  ANL  P2, #11000000b; Y3 OFF
          ORL  P2, #00100110b; Y1, Y2, Y5 ON
          MOV  R7, #5
label7b:  DJNZ R7, label7b
          ANL  P2, #11100010b; Y2 OFF
          
;Формируем задержку 55мкс = 5мкс * 11 для Y1, Y5.  
          MOV  R7, #11
label7c:  DJNZ R7, label7c

;Формируем задержку 640мкс = 80мкс * 8 для Y1, Y5.   
          MOV  A,  #11111000b; (-8)ДК
          MOV  T,  A
          STRT T
label7d:  JTF  label7e
          JMP  label7d
          
;Формируем задержку 80мкс = 80мкс * 1 для Y5.   
label7e:  ANL  P2, #11100000b; Y1 OFF
          MOV  A,  #11111111b; (-1)ДК
          MOV  T,  A
          STRT T
label7f:  JTF  label8a
          JMP  label7f
          
          
          
label8a:  ANL  P2, #11000000b; Y5 OFF
          NOP
          END