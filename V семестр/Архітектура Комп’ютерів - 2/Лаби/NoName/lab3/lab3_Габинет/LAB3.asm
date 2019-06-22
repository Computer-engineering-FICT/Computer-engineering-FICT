;загрузка значений в регистры
IN A,P2
MOV R0,A   ;R0<-X0
IN A,P2
MOV R1,A   ;R1<-X1
IN A,P2
MOV R2,A   ;R2<-X2
IN A,P2
MOV R3,A   ;R3<-X3
IN A,P2
MOV R4,A   ;R4<-X4
IN A,P2
MOV R5,A   ;R5<-X5
IN A,P2
MOV R6,A   ;R6<-X6
IN A,P2
MOV R7,A   ;R7<-X7
;выполнение алгоритма
;блок 1
MOV A,R2
XRL A,R3   ;R2 xor R3
CPL A      ;not(R2 xor R3)
MOV R0,A
;блок 2
MOV A,R4
CPL A
CLR C
ADDC A,1
MOV R4,A
MOV A,R0
ADD A,R4  ;R0-R4
DEC A     ;R0-R4-1
CLR C
RLC A     ;2*(R0-R4-1)
;блок 3 
ll3:
MOV A,R1
DEC A     ;R1-1
CLR C
RRC A     ;(R1-1)/2
MOV R2,A  ;R2<-(R1-1)/2
;установка флага 
CLR C      ;C=0 
CPL C      ;C=1
JC ll5     ;если C=1
;блок 7
MOV A,R1
CPL A
CLR C
ADDC A,1
MOV R1,A
MOV A,R5
ADD A,R1  ;R5-R1
DEC A     ;R5-R1-1
RLC A     ;2*(R5-R1-1)
MOV R6,A
;блок 8
;установка флага 
CLR F1     ;F1=0
;CPL F1     ;F1=1
JF1 ll9    ;если F1=0
ll10:
;блок 10
MOV A,R1
DEC A
RRC A     ;(R1-1)/2
MOV R6,A
;блок 11
MOV A,R6
INC A
MOV R5,A
JMP ll5

ll9:
;блок 9
MOV A,#77H
ADD A,R2   ;77H+R2
MOV R1,A
JMP ll10

ll5:
;блок 5
DJNZ R7, ll3
;блок 6
MOV A,R6
CPL A
ANL A,R5

END


