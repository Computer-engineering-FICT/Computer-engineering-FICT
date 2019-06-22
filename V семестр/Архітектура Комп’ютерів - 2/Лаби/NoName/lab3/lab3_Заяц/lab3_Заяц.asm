           Sel    Rb0

           Mov    A, #0
           Anld   P5, A

           Movd   A, P4
           Jb1    Top2

; top1

Top1:

           Mov    A, #7      ; 5
           Orld   P5, A      ; 5

           Nop
           Nop

           Mov    A, #5
           Anld   P5, A

; y2 delay finished

; delay for y1 222

           Mov    A, #FEH    ; 5
           Mov    T, A       ; 2.5
           Strt   T          ; 2.5
; begin 160
Lbl1:
           Jtf    End1
           Jmp    Lbl1

End1:


; end 160

           Nop

; begin 30
           Mov    R7, #3     ; 5
Lbl2:      Djnz   R7, Lbl2
;end 30

           Mov    A, #4
           Anld   P5, A

; delay for y1 ended

           Mov    A, #FBH
           Mov    T, A
           Strt   T

Lbl4:

           Jtf    End2
           Jmp    Lbl4

End2:

           Mov    R7, #13

Lbl22:     Djnz   R7, Lbl22

           Nop

           Mov    A, #0
           Anld   P5, A

; delay for y3 ended

           Movd   A, P4
           Jb2    Top4

; top3

Top3:

           Mov    A, #9
           Orld   P5, A

           Mov    A, #FEH
           Mov    T, A
           Strt   T

Somelbl0:  Jtf    Somelbl3
           Jmp    Somelbl0

Somelbl3:

           Mov    R7, #6
Somelbl1:  Djnz   R7, Somelbl1

;somelbl2:
           Nop
           Mov    A, #8
           Anld   P5, A

; delay for y1 ended

           Mov    A, #FDH
           Mov    T, A
           Strt   T

Somelbl2:  Jtf    Somelbl4
           Jmp    Somelbl2

Somelbl4:

           Nop
           Nop
           Nop
           Nop
           Nop

           Mov    A, #0
           Anld   P5, A

; delay for y4 ended

           Jmp    Top1

; top2

Top2:

           Mov    A, #2
           Orld   P5, A

           Nop
           Nop

           Mov    A, #0
           Anld   P5, A

; delay for y2 ended

; top4

Top4:

           Mov    A, #4
           Orld   P5, A

           Mov    A, #FBH
           Mov    T, A
           Strt   T

Somelbl5:  Jtf    Somelbl6
           Jmp    Somelbl5

Somelbl6:

           Mov    R7, #14
Somelbl7:  Djnz   R7, Somelbl7

; delay for y4 ended


           Mov    A, #0
           Anld   P5, A

; top11

Top11:

           Mov    A, #7      ; 5
           Orld   P5, A      ; 5

           Nop
           Nop

           Mov    A, #5
           Anld   P5, A

; y2 delay finished

; delay for y1 222

           Mov    A, #FEH    ; 5
           Mov    T, A       ; 2.5
           Strt   T          ; 2.5
; begin 160
Ll1:
           Jtf    En1
           Jmp    Ll1

En1:


; end 160

           Nop

; begin 30
           Mov    R7, #3     ; 5
Ll2:       Djnz   R7, Ll2
;end 30

           Mov    A, #4
           Anld   P5, A

; delay for y1 ended

           Mov    A, #FBH
           Mov    T, A
           Strt   T

Ll4:

           Jtf    En2
           Jmp    Ll4

En2:

           Mov    R7, #13

Ll22:      Djnz   R7, Ll22

           Nop

           Mov    A, #0
           Anld   P5, A

; delay for y3 ended

           End

;-----------------------------

