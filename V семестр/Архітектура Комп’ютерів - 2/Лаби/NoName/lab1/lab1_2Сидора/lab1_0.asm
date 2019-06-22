;F = 4*(X1&X2) - (X3-X4+1) - (X5VX6 - 1) / 2

mov	R0,#0 ;this will be the result

in 	A,p1         
mov	R1,A ; <- x1

in 	A,p1
mov	R2,A ; <- x2

in 	A,p1
mov	R3,A ; <- x3

in 	A,p1
mov	R4,A ; <- x4

in 	A,p1
mov	R5,A ; <- x5

in 	A,p1
mov	R6,A ; <- x6

;start computing

mov A,R1 ; X1...
anl A,R2 ; &X2
rl A  ; *2 (циклічний зсув вліво)
rl A  ; ...*4
mov R1,A ; 4*(X1&X2)

mov A,R4 ; X4...
cpl A ; (інвертування)
inc A ; -X4(дк)
add A,R3 ; +X3
inc A ; +1
cpl A
inc A ; -A(дк)
mov R3,A ; -(X3-X4+1)

mov A,R5 ; X5...
orl A,R6 ; VX2...
dec A ; -1...
jb7 neg
rr A ; /2
anl A,#01111111b ; "+" -> A
jmp pos ; A>0
neg: ; A<0
rr A ; /2
orl A,#10000000b ; "-" -> A
pos:
cpl A
inc A ; -A(дк)
mov R5,A ; -(X5VX6-1) / 2

mov A,R1 ; 4*(X1&X2)...
add A,R3 ; -(X3-X4+1)...
add A,R5 ; -(X5VX6-1) / 2

mov R0,A ;the end
END