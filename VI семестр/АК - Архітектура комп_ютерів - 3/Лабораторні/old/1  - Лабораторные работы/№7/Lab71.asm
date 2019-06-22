R1 equ 20h
R2 equ 21h
R3 equ 22h
R4 equ 23h

start:

	movlw 76h 
	movwf R2
	movlw 35h
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
finish: goto finish
	END
