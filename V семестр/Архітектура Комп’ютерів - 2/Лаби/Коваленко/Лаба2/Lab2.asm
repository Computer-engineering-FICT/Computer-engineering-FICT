; load data
           Sel Rb0
           Mov R0, #0H
           Mov R7, #06H
load:
           Inc R0
           Ins A, Bus
           Mov @R0, A
           Djnz R7, load
           Mov R7, #4H
;-------------1--------------
           Mov A, R3
           Dec A
           Rrc A
           Mov R2, A
;-------------2-------------
; in A R2
           Anl A, R3
           Mov R4, A
;-------------3---------------      
main:
           Mov A, R4
           Inc A
           Clr C
           Rlc A
           Mov R1, A
; c=0 => next
           Jnc next

           Call Mpp

next:
           Djnz R7, main
;-------------6--------------
           Mov A, R5
           Anl A, #80H
           Rlc A
           Mov A, R5
           
           Jc plus
; c=1 => plus     
           Cpl A
           Inc A      
           
plus:           
           Add A, R6
           Dec A
           Clr C
           Rrc A
           Mov R7, A
                               
           Jmp endz
;-----------7----------------
Mpp:
           Mov A, R5
           Add A, #77H
           Mov R6, A
;-----------8-----------------
           Jf0 aaa
           Jmp bbb
;-----------9-----------------
aaa:
           Mov A, R6
           Dec A
           Rlc A
           Rlc A
           
           Jnc, ccc

           Sel Rb1
           Inc R0
           Sel Rb0
           
ccc:
           Mov R0, A
;-------------10------------
bbb:
           Mov A, 1
           Cpl A
           Inc A
           Add A, R4
           Clr C
           Rlc A
           Mov R5, A
           Ret
;------------the end !----------------------
endz: