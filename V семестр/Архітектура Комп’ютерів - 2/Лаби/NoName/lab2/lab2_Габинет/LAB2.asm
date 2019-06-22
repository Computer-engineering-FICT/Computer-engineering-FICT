IN A,P2   
MOV R1,A  ;R1<-X1
IN A,P2   ;A<-X2
ANL A,R1  ;X1&X2
CLR C
RLC A
RLC A     ;4*(X1&X2)
MOV R2, A

IN A,P2
MOV R1,A  ;R1<-X3
IN A,P2   ;A<-X4
CPL A
CLR C
ADDC A,1  ;dop kod A
ADD A,R1  ;X3-X4
INC A
MOV R3,A  ;(X3-X4+1)

IN A,P2
MOV R1,A  ;R1<-X5
IN A,P2   ;A<-X6
ORL A,R1  ;X5 and X6 
DEC A     ;(X5 and X6)-1
CLR C
RRC A     ;((X5 and X6)-1)/2

ADD A,R3
ADD A,R2

SEL RB0
MOV R0,#20
MOV @R0,A