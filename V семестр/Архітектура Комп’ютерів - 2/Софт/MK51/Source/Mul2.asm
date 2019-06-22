Mov r1,#7fh
Mov r2,#7fh
Mov R3,#8H
Clr    A
Clr    C
Xch    A,R2
Rrc    A
Xch    A,R2
Begc: Jnc    Nul
Add    A,R1
Nul:  Rrc    A
Xch    A,R2
Rrc    A
Xch    A,R2
Djnz   R3,Begc
Mov    R1,A
End