mov R3, #12h         
mov R5, #21h
mov R6, #1h          
continue:
mov A, R6
anl A, #1h
jz  second

mov R6,#0h        

mov A,#00001110b     
mov DPTR,#0A004h
movx @DPTR,A         

mov DPTR,#0A000h      
                               
mov A, R3           
acall trans
anl A, #11110000b  
movx @DPTR,A          
             
mov A,#00001101b     
mov DPTR,#0A004h
movx @DPTR,A       

mov DPTR,#0A000h     
                               
mov A, R3           
acall trans
anl A, #00001111b    
movx @DPTR,A          
          
ljmp pause

second:
mov A,#00001011b     
mov DPTR,#0A004h
movx @DPTR,A          

mov DPTR,#0B000h     
                               
mov A, R5           
acall trans
anl A, #11110000b    
movx @DPTR,A          

mov A,#00000111b     
mov DPTR,#0A004h
movx @DPTR,A        

mov DPTR,#0B000h     
                              
mov A, R5         
acall trans
anl A, #00001111b  
movx @DPTR,A        
          
          
mov R6,#1h          

pause:
acall delay           

mov A,#00001111b
mov DPTR,#0A004h
movx @DPTR,A        
ljmp continue                    

delay:                          
mov R1,#0FFh
a2:       
mov R2,#0FFh
a4:       
djnz R2, a4
djnz R1, a2
ret                  

trans:
mov B, #10
div ab
clr c
rlc a
clr c
rlc a
clr c
rlc a
clr c
rlc a
orl a, b
ret          
END
