;7315
           ANL P1, #11000000b
           IN A, P1

        JB7 begin 		; по х1 =1 идем на ветку begin-llend
	JMP ll0			; по х1 =1 идем на ветку ll0-
begin:
			      	; x1 = 1
				; [2] y1,2,3, 240ms
	;ANL P1, #11000000b
        ;MOV R5, #47
        ;ORL P1, #00111000b
        ;llc1: DJNZ R5, llc1
	
	MOV A, #11111101b
	MOV T, A
	ORL P1, #00111000b
	STRT T
tm:	JTF llend
	JMP tm

	JMP llend
;/////////////////////////////////////////////////////////
ll0:	
				; [1] y5,  40ms
	ANL P1, #11000000b
        MOV R5, #7
        ORL P1, #00000010b
        llc5: DJNZ R5, llc5

ll1:    
	IN A, P1
	JB6 llend		; if x2 = 1   ===> llend	
	
				; [3] y2,  100ms
	ANL P1, #11000000b
        MOV R5, #19
        ORL P1, #00010000b
        llc4: DJNZ R5, llc4

	;ORL P1, #01000000b	; чтобы избежать зацикливания
	JMP ll0
;//////////////////////////////////////////////////////////////
llend:
				; [4] y4,5,  50ms
	ANL P1, #11000000b
        MOV R5, #9
        ORL P1, #00000110b
        llc2: DJNZ R5, llc2	
				; [1] y5,  40ms
	ANL P1, #11000000b
        MOV R5, #7
        ORL P1, #00000010b
        llc3: DJNZ R5, llc3

        ANL P1, #00000000b
        End
