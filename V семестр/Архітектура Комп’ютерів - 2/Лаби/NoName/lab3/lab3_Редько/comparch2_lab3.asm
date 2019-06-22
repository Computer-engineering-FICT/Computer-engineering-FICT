; Computer architecture
; Lab3
; Variant: 103D = 01100111B
; Author: Redko Alexander, IO-01
; Date: 03.10.12
;
; Task:
;     1:y1y5, 2:y2, 3:y2y3y4, 4:y1y2y5
;	P2
;     pic. 7.1, d
;	y1 - 560, y2 - 12, y3 - 700, y4 - 330, y5 - 280
;

           Anl	P2, #C0H
           
           In     A, P2
           Jb7    X1

Notx1:
	     call	mpp
           In     A, P2
           Jb6    X2
           
; y2y3y4
           Orl    P2, #1CH	     
           Mov    A, #FDH
           Mov    T, A
           Anl	P2, #D8H ; y2           
           Strt   T
Label6:    Jtf    Label5
           Jmp    Label6
Label5:    Mov	R7, #CH
LoopR7:    Djnz	R7, LoopR7
	     Anl	P2, #C8H ; y4
           Mov	A, #FCH
           Mov	T, A
           Strt	T
Label8:    Jtf	Label7
	     Jmp	Label8
Label7:    Mov	R5, #5H
LoopR5_2:  Djnz	R5, LoopR5_2
	     Anl	P2, #C0H ; y3
           Jmp    Notx1

X2:
; y1y2y5	
           Orl    P2, #E6H
           Mov    A, #FDH
           Mov    T, A
           Anl	P2, #E2H ;y2
           Strt   T           
Label10:   Jtf    Label9
           Jmp    Label10
Label9:    Mov    R6, #2H
LoopR6_2:  Djnz	R6, LoopR6_2
	     Anl	P2, #C2H ; y5
      
           Mov    A, #FDH
           Mov    T, A
           Strt	T
Label12:   Jtf    Label11
           Jmp    Label12
Label11:   Mov    R7, #3H
LoopR7_2:  Djnz	R7, LoopR7_2
	     Anl	P2, #C0H ;y1
           

	     Call	Mpp
           Jmp    Ended

X1:
           Orl    P2, #C4H
; y2      
           Nop
           Nop
           Nop
           Anl    P2, #C0H
           Jmp    X2

mpp:           
; y1y5	
           Mov    A, #FDH
           Mov    T, A
           Orl    P2, #E2H
           Strt   T
Label2:    Jtf    Label1
           Jmp    Label2
Label1:    Mov    R5, #4H
LoopR5:    Djnz	R5, LoopR5
	     Nop
	     Anl	P2, #C2H ; y5
      
           Mov    A, #FDH
           Mov    T, A
           Strt	T
Label4:    Jtf    Label3
           Jmp    Label4
Label3:    Mov    R6, #3H
LoopR6:    Djnz	R6, LoopR6
	     Anl	P2, #C0H ;y1
	     Ret

                      
Ended:
	     Nop           
           End

