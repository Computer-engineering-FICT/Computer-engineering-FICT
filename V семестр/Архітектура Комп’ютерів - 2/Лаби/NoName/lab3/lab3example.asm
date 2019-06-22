; Example on lection 3. Time delay on MK48
;
; y1 - 50, y2 - 400, y3 - 600, y4 - 12, y5 - 47.5, y6 - 890; eps < 2.5
; 
; Author: Redko Alexander
; Date:   04.10.12
;

           Anl    P2, #C0H

; y1                      
           Mov    R7, #9H
           Orl    P2, #1h
loop1:     Djnz   R7, loop1
           Anl    P2, #C0H

           In     A, P2
           Jb7    x1

; y2y4
           Mov    A, #FBH
           Mov    T, A
           Strt   T
           Mov    R7, #1
           Orl    P2, #11001010b
loop2:     Djnz   R7, loop2
           Anl    P2, #11000010b
label2:    Jtf    label1
           Jmp    label2
label1:    Anl    P2, #C0H
           Jmp    x2
           
x1:
; y3
           Mov    A, #F9H
           Mov    T, A
           Mov    R6, #5H
           Orl    P2, #11000100b
           Strt   T
label4:    Jtf    label3
           Jmp    label4
label3:    Nop
loop3:     Djnz   R6, loop3
           Anl    P2, #C0H


x2:
; y5
           Mov    R7, #8H
           Orl    P2, #11010000b
loop4:     Djnz   R7, loop4
           Nop
           Anl    P2, #C0H
   
           In     A, P2
           Jb6    x2
           
; y5
           Mov    R7, #8H
           Orl    P2, #11010000b
loop5:     Djnz   R7, loop5
           Nop
           Anl    P2, #C0H
           
; y6
           Orl    P2, #11100000b
           Mov    A, #F6H
           Mov    T, A
           Strt   T
label6:    Jtf    label5
           Jmp    label6
label5:    Mov    R7, #DH
loop6:     Djnz   R7, loop6
           Anl    P2, #C0H

           Nop
           End