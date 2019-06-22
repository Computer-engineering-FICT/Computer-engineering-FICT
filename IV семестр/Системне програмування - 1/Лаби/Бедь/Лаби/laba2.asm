.386
ASSUME CS:CODE, DS:DATA
DATA SEGMENT USE16 				

	mes db "Ivaniv209variant",0DH,0AH,"$"
	A dd 12h
	B db 0FFh

DATA ENDS

CODE SEGMENT USE16; 				10-ий рядок 

beg:

        mov ax, word ptr mes
        mov ah,09h                                                 
	mov dh,offset mes                            
	int 21h;        		17-ий рядок 
      
	XOR EAX,EAX
	MOV AL,B
	MOV EBX,A
	ADD A, EAX
	NEG A

        MOV	AX,4C00H
	INT	21H   
  
CODE ENDS
END beg
   