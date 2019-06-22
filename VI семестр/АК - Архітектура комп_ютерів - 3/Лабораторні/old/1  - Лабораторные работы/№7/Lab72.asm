R1 equ 20h
R2 equ 21h
R3 equ 22h
R4 equ 23h
R5 equ 24h
R6 equ 25h
start:
        movlw 06h
        movwf R5
        btfss R5, 7
        goto pol1 
        movwf R6
        comf R6, f
        incf R6, f
        clrw
        iorwf R6, w
pol1:
        movwf R2
        movlw 05h
        movwf R3
        xorwf R5,f
        btfss R3, 7
        goto pol2 
        movwf R6
        comf R6, f
        incf R6, f
        clrw
        iorwf R6, w
pol2:
	movwf R3
	movlw 0h
	movwf R1
	movlw 8h
	movwf R4
begin:

	btfss R2, c
	goto afteradd
	clrw
	addwf r3,w
	addwf r1,f
afteradd:
	bcf status, c
	rrf R1,f
	rrf R2,f
	decf R4,f
	btfss status, z
	goto begin
	nop
            btfss R5,7
            goto finish
        
        bcf status, c
        comf R2, f
        movlw 1h
        addwf R2, f
        
        comf R1, f
        btfsc status, c
        addwf R1,f

finish: goto finish
	END
