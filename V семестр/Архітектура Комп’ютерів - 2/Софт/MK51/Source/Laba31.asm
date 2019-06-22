; Alex Natalenko
;#8307 1110011
	         
		   In     A, P2						
               Mov    R1, A
               Anl    P2, #11000000B
               mov    A, R1  ; Ввод Значения Х1
		   JNZ     odin ; Если 1
		   jmp    nol ; если 0
		
odin:
	     Mov    A, #11111110B ; 
           Orl    P2, #00000100B ; Вершина y2
           Mov    T, A
           Strt   T          
D2:        Jtf    D3
           Jmp    D2
	
D3:        Mov    R5, #12
D4:        Djnz   R5, D4
           Anl    P2, #11000000B
           
           Orl    P2, #00010000B
y4:        Mov    R6, #8            ; Вершина у4
y42:       Djnz   R6, y42 
           Anl    P2, #11000000B
           
y123:     
         
           Orl    P2, #00001110B
y1:        Mov    R6, #6            ; Вершина у1
y11:       Djnz   R6, y11 
           Anl    P2, #11001100B

y3:        Mov    R5, #10
y33:        Djnz   R5, y33
           Anl    P2, #11000100B  
            
           Mov    A, #11111111B ; 
           ; Вершина y2
           Mov    T, A
           Strt   T          
D24:        Jtf    D34
           Jmp    D24
	     
D34:        Mov    R5, #7
D44:        Djnz   R5, D44
           Anl P2, #11000000B
           
           Anl    P2, #11000000B
           Orl    P2, #00001000B
          
      
           jmp exit                    

nol:      ;Сюда прыгает если в начале Х1=0
y123q:     
         Mov    A, #11111111B ;
           Orl    P2, #00001110B
y1q:        Mov    R6, #6            ; Вершина у1
y11q:       Djnz   R6, y11q 
           Anl    P2, #11001100B

y3q:        Mov    R5, #10
y33q:        Djnz   R5, y33q
             Anl    P2, #11000100B           
            

	     Mov    A, #11111111B ; 
           Mov    T, A
           Strt   T          
D2ee:        Jtf    D3ee
           Jmp    D2ee


                      	
D3ee:        Mov    R5, #7
D4ee:        Djnz   R5, D4ee
           Anl    P2, #11000000B
                          
       
          
           In     A, P2
           Mov    R2, A
           mov    A, R2 ;Загружаем Х2
           JZ    y411 ;Если Х2=0
           ;если 1 идем дальше
           Orl    P2, #00010000B
 
y4w:       Mov    R6, #8;обрабатываем у4 по Х2=1
y42w:      Djnz   R6, y42w 
           Anl    P2, #11000000B
           jmp    y123w
           
           Orl    P2, #00010000B
y411:      Mov    R5, #10; Обработка у4у1 по Х2=0
D22:        Djnz  R5, D22

           Anl    P2, #11000000B 
           Orl    P2, #11000010B
y1111:     Mov    R5, #8; Обработка у4у1 по Х2=0
D1111:     Djnz  R5, D1111
           Anl    P2, #11000000B
                     
           jmp    y123q

           
y123w:     
         
           Orl    P2, #00001110B
y1e:        Mov    R6, #6            ; Вершина у1
y11e:       Djnz   R6, y11e 
           Anl    P2, #11001100B

           y3e:        Mov    R5, #10
y33e:       Djnz   R5, y33e
            Anl    P2, #11000100B
            
           Mov    A, #11111110B ; -2 d дк
           ; Вершина y2
           Mov    T, A
           Strt   T          
D24e:        Jtf    D34e
           Jmp    D24e
	   
           
D34e:         Mov    R5, #7
D44e:        Djnz   R5, D44e
            Anl P2, #11000000B
 
                
exit:
end
		  
