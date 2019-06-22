;      P4     ;      p5     ;
; 03 02 01 00 ; 03 02 01 00 ;
;---------------------------
; y1 y2 y3 y4   y5    x2 x1

; y1 == 222ms, y2 == 15ms, y3 == 720ms, y4 == 500ms, y5 == 560ms

jmp start

block1:
	; Block 1
	; y1(222ms) y5(560ms)
		mov R7, #FEh ;((not 2) + 1)
		mov R6, #06h
		mov R5, #FCh ; ((not 4) + 1)
		
		mov A, #00001000B
		orld P4, A	; +y1 (y1.d = 222 - 2)
		orld P5, A	; +y5 (y5.d = 560 - 2, y1.d -= 5)
		mov A, R7	; -2.5
		mov T, A	; -2.5
		STRT T		; -2.5
		b1l1:
			jtf b1l2	; //(-5 x n)		
			jmp b1l1	; //(-5 x (n-1))
		b1l2:			; -165

		b1l3:
			djnz R6, b1l3 ; -30

		nop	; -2.5
		nop ; -2.5
			
		mov A, #00000111B	; -5
		anld P4, A		; y1.d -= 3, y5.d -= 5
		
		; y5.d = 340.5

			mov A, R5	; -2.5
			mov T, A	; -2.5
			STRT T		; -2.5
			b1l4:
				jtf b1l5	;
				jmp b1l4	;
			b1l5:			; -325
		mov A, #00000111B	; -5
		anld P5, A		; y5 (-3)
	
	; -------
ret

start: 
movd A, P5 ; + 10t (5mks)
jb0 rightBranch ; +10t (5mks)

leftBranch:

call block1; +10t (5mks)

movd A, P5
jb1 joinRightBranch

; Block 3
	; y2(15) y3(720) y4(500)
	mov R7, #FBh ; ((not 5) + 1)
	mov R6, #0Ch ; 12
	mov R5, #FEh ; ((not 2) + 1)
	mov R4, #07h
	mov A, #00000111B;
	orld P4, A;	+y2, +y3, +y4 : (y2, y3, y4).d -= 2
		nop	; -2.5
		nop	; -2.5
		mov A, #00001011B	; -5
		anld P4, A; -y2	; y2.d -= 3, (y3, y4).d -= 5
		
		; y3.d = 703
		; y4.d = 483
		mov A, R7	; -2.5
		mov T, A	; -2.5
		STRT T		; -2.5
		b3l2:
			jtf b3l3	;
			jmp b3l2	;
		b3l3:			; -405
		; X = 62.5
			b3l4:
				djnz R6, b3l4	; -60
			nop					; -2.5
		mov A, #00001110B	; -5
		anld P4, A	; -y4	; y4.d -= 3, y3 -= 5
		
		; y3.d = 218
		mov A, R5	; -2.5
		mov T, A	; -2.5
		STRT T		; -2.5
		b3l5:
			jtf b3l6	;
			jmp b3l5	;
						;
		b3l6:			; -165		

			djnz R4, b3l6	; -35
		nop	; - 2.5
		
		mov A, #00001101B	; -5
		anld P4, A; -y5		; y5.d -= 3
; -------

jmp leftBranch

rightBranch:

; Block 2
	; y2(15)
	mov A, #00000100B;
	orld P4, A		; +y2 (y2.d -= 2)
	nop	; -2.5
	nop	; -2.5
	mov A, #00001011B;	; -5
	anld P4, A	; -y2	; y2.d -= 3
	
; -------

joinRightBranch:

; Block 4
	; y1(222) y2(15) y5(560)
	mov R7, #FEh	;((not 2) + 1)
	mov R6, #05h
	mov R5, #FDh	;((not 3) + 1)
	mov R4, #0Dh
	
	mov A, #00001000B
	orld P5, A		; +y5	; y5.d -= 2;
	mov A, #00001100B	; -5
	orld P4, A		; +y1, +y2 ; (y1, y2).d -= 2;	y5.d -= 5
	nop	; -2.5
	nop ; -2.5
	mov A, #00001011B	; -5
	anld P4, A		; -y2	; y2.d -= 3;	(y1, y5).d -= 5
	; y5.d = 533
	; y1.d = 195 = 80 * 2 + 5 * 7

		; 80 * 2:
			mov A, R7	; -2.5
			mov T, A	; -2.5
			STRT T		; -2.5
			b4l2:
				jtf b4l3	;
				jmp b4l2	;
			b4l3:			; -165
			
		; X = 25.5
			b4l4:
				djnz R6, b4l4	; -25

		mov A, #00000111B	; -5
		anld P4, A		; -y1	; y1.d -= 3; y5.d -= 5
		
	; y5.d = 325.5 = 240 + 85.5
		; 80 * 3:
			mov A, R5	; -2.5
			mov T, A	; -2.5
			STRT T		; -2.5
			b4l5:
				jtf b4l6	;
				jmp b4l5	;
			b4l6:			; -245
		; X = 65 = 5 * 13
			b4l7:
				djnz R4, b4l7	; -65
				
		mov A, #00000111B	; -5
		anld P5, A		; -y5	; y5.d -= 3
	
; -------

call block1

end
