        
     
;�������������  P2[7,6]=11          
          ANL P2,  #C0h
         

;������� 1. �������� Y1=720���; Y5=800���.
;��������� �������� 720 ��� = 80��� * 9 ��� Y1, Y5.    
label1a:  MOV  A,  #11110111b; (-9)��
          MOV  T,  A
          ORL  P2, #00100010b; Y1Y5 ON
          STRT T
label1b:  JTF  label1c
          JMP  label1b
          
;��������� �������� 80 ��� = 80��� * 1 ��� Y5.   
label1c:  ANL  P2, #11100000b; Y1 OFF
          MOV  A,  #11111111b; (-1)��
          MOV  T,  A
          ORL  P2, #00100000b; Y5 ON
          STRT T
label1d:  JTF  label2a
          JMP  label1d
                

      
;������� 2. �������� ������� X1, 
; �� 1 ������� �� ������� 5,
; �� 0 ����������.
label2a:  ANL  P2, #11000000b; Y5 OFF
          IN   A,  P2
          JB6  label5a
          
          
          
;������� 3. �������� Y2=25���.
;��������� �������� 25 ��� = 5��� * 5 ��� Y2.  
          ORL  P2, #00000100b; Y2 ON
          MOV  R7, #5
label3a:  DJNZ R7, label3a
          ANL  P2, #11000000b; Y2 OFF
          
          
          
;������� 4. �������� ������� X2, 
; �� 1 ������� �� ������� 6,
; �� 0 ������� �� ������� 1.


          IN   A,  P2
          JB7  label6a   
          JMP  label1a

          
          
;������� 5. �������� ������� X1, 
; �� 1 ������� �� ������� 7,
; �� 0 ������� �� ������� 6.
label5a:  IN   A,  P2
          JB6  label7a   
          JMP  label6a
          
          
          
;������� 6. �������� Y2=25���; Y3=400���; Y4=10���.
;��������� �������� 10 ��� = 5��� * 2 ��� Y2, Y3, Y4.  
label6a:  ORL  P2, #00011100b; Y2, Y3, Y4 ON
          MOV  R7, #2
label6b:  DJNZ R7, label6b
          ANL  P2, #11001100b; Y4 OFF
          
;��������� �������� 15 ��� = 5��� * 3 ��� Y2, Y3.  
          MOV  R7, #3
label6c:  DJNZ R7, label6c
          ANL  P2, #11001000b; Y2 OFF
          
;��������� �������� 45 ��� = 5��� * 9 ��� Y3.  
          MOV  R7, #9
label6d:  DJNZ R7, label6d

;��������� �������� 320 ��� = 80��� * 4 ��� Y3.   
          MOV  A,  #11111100b; (-4)��
          MOV  T,  A
          STRT T
label6e:  JTF  label7a
          JMP  label6e
          
          
          
;������� 7. �������� Y1=720���; Y2=25���; Y5=800���.
;��������� �������� 25 ��� = 5��� * 5 ��� Y1, Y2, Y5.  
label7a:  ANL  P2, #11000000b; Y3 OFF
          ORL  P2, #00100110b; Y1, Y2, Y5 ON
          MOV  R7, #5
label7b:  DJNZ R7, label7b
          ANL  P2, #11100010b; Y2 OFF
          
;��������� �������� 55��� = 5��� * 11 ��� Y1, Y5.  
          MOV  R7, #11
label7c:  DJNZ R7, label7c

;��������� �������� 640��� = 80��� * 8 ��� Y1, Y5.   
          MOV  A,  #11111000b; (-8)��
          MOV  T,  A
          STRT T
label7d:  JTF  label7e
          JMP  label7d
          
;��������� �������� 80��� = 80��� * 1 ��� Y5.   
label7e:  ANL  P2, #11100000b; Y1 OFF
          MOV  A,  #11111111b; (-1)��
          MOV  T,  A
          STRT T
label7f:  JTF  label8a
          JMP  label7f
          
          
          
label8a:  ANL  P2, #11000000b; Y5 OFF
          NOP
          END