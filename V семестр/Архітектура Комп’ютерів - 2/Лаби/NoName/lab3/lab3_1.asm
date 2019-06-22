

; ---------------------------------------------------
           Mov    R1, #01H
           mov    r2, #00h
           Anl    P2, #00H
;------------------1
L1:
           Orl    P2, #11H
           Mov    R7, #04H
Ll1:
;------------- y1, y5
           Nop
           Djnz   R7, Ll1
           Nop
           Nop
           Anl    P2, #10H

           Mov    R7, #06H
Ll2:
;--------------y1
           Nop
           Djnz   R7, Ll2
           Anl    P2, #00H
;-------------x1.1
           Mov    A, R1
           Jb0    Llx1_2
;-----------------------2
;-----------------------y2
           Orl    P2, #08H
           Mov    A, #F8H
           Mov    T, A
           Strt   T
Ll21:
           Jtf    Ll22
           Jmp    Ll21
Ll22:
           Mov    R7, #08H
Ll23:
           Nop
           Djnz   R7, Ll23
           Anl    P2, #00H

;-------------------x2
           Mov    A, R2
           Jb0    Ll3
           Jmp    L1

Llx1_2:
;-------------x1.2
           Jb0    Ll4
Ll3:
;--------------------3
;--------------------y2,y3,y4
           Mov    R7, #01H
           Orl    P2, #0EH
Ll31:
           Nop
           Djnz   R7, Ll31
           Nop
           Anl    P2, #0AH
;--------------------y2, y4
           Nop
           Anl    P2, #08H
;--------------------y2
           Orl    P2, #08H
           Mov    A, #F8H
           Mov    T, A
           Strt   T
Ll32:
           Jtf    Ll33
           Jmp    Ll32
Ll33:
           Mov    R7, #04H
Ll34:
           Nop
           Djnz   R7, Ll34
           Nop
           Anl    P2, #00H

Ll4:
;----------------4
;------------- y1, y2, y5
           Orl    P2, #19H
           Mov    R7, #04H
Ll41:
           Nop
           Djnz   R7, Ll41
           Nop
           Nop
           Anl    P2, #18H

           Mov    R7, #06H
;--------------y1, y2         
Ll42:
           Nop
           Djnz   R7, Ll42
           Anl    P2, #08H
           
           Mov    A, #F9H
           Mov    T, A
           Strt   T
Ll43:
           Jtf    Ll44
           Jmp    Ll43
Ll44:
           Mov    R7, #05H
Ll45:
           Nop
           Djnz   R7, Ll45
           Nop
           Anl    P2, #00H

           End