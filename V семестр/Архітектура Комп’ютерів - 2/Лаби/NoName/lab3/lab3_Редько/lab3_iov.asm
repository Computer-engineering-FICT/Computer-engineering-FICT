
          Mov A, #C0H
           Outl   Bus, A
;y1y2
           Mov    R5, #11
           Ins    A, Bus
           Jb7    L11
           Orl    Bus, #6H
           Mov    A, #FAH
           Mov    T, A
           Anl    Bus, #C2H
           Strt   T
L1:        Jtf    L2
           Jmp    L1
L2:        Djnz   R5, L2
           Anl    Bus, #C0H

;y1y3
           Mov    A, #F9H
           Mov    T, A
           Orl    Bus, #AH
           Strt   T
L3:        Jtf    L4
           Jmp    L3
L4:        Mov    R5, #12
L5:        Djnz   R5, L5
           Nop
           Anl    Bus, #C8H
           Mov    R5, #25
L6:        Djnz   R5, L6
           Nop
           Nop
           Anl    Bus, #C0H

;y4y5 
           Mov    A, #FDH
           Mov    T, A
           Orl    Bus, #30H
           Strt   T
L7:        Jtf    L8
           Jmp    L7
L8:        Mov    R5, #4
L9:        Djnz   R5, L9
           Nop
           Anl    Bus, #D0H
           Mov    R5, #8
L10:       Djnz   R5, L10
           Anl    Bus, #E0H
           Jmp    Lend


;y1y3
L11:       Mov    A, #FAH
           Mov    T, A
           Orl    Bus, #AH
           Strt   T
L12:       Jtf    L13
           Jmp    L12
L13:       Mov    R5, #12
L14:       Djnz   R5, L14
           Nop
           Anl    Bus, #C8H
           Mov    R5, #25
L15:       Djnz   R5, L15
           Nop
           Nop
           Anl    Bus, #C0H

;x2
           Ins    A, Bus
           Jb6    L20

;y4y5
           Mov    A, #FCH
           Mov    T, A
           Orl    Bus, #30H
           Strt   T
L16:       Jtf    L17
           Jmp    L16
L17:       Mov    R5, #4
L18:       Djnz   R5, L18
           Nop
           Anl    Bus, #D0H
           Mov    R5, #8
L19:       Djnz   R5, L19
           Anl    Bus, #E0H
           Jmp    Lend

;y3
L20:       Mov    A, #F9H
           Mov    T, A
           Orl    Bus, #8H
           Strt   T
L21:       Jtf    L22
           Jmp    L21
L22:       Mov    R5, #27
L23:       Nop
           Djnz   R5, L23
           Anl    Bus, #C0H

Lend:      Nop
           End
