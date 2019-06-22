;**** A P P L I C A T I O N   N O T E   A V R 4 0 1 ************************
;* 
;* Title:		8-bit precision A/D converter
;* Version:		1.03
;* Last Updated:	97.07.17
;* Target:		AT90Sxxxx (All AVR Devices with analog comparator)
;*
;* Support E-mail:	avr@atmel.com
;*
;* DESCRIPTION
;* This Application note shows how to perform dual-slope-alike
;* A/D conversion utilizing the on-chip analog comparator and a few
;* external components. Included is a test program that performs
;* conversions in a eternal loop, outputting the result to eight LEDs.
;* 
;***************************************************************************

;***** Registers used by mpy9u multiplication routine

.def	mc9u	=r0	;multiplicand used by multiplication routine
.def	mp9u	=r1	;multiplier used by multiplication routine
.def	m9uL	=r1	;result Low byte
.def	m9uH	=r2	;result High byte

;***** Registers used by div17u division routine

.def	didL	=r1	;Dividend
.def	didH	=r2
.def	dresL	=r1	;Holds the result of the division
.def	dresH	=r2
.def	divL	=r3	;Divisor
.def	divH	=r4
.def	remL	=r5	;Reminder variables used by division routine
.def	remH	=r6

.def	TinH	=r14	;Time to reach input voltage
.def	TinL	=r15
.def	Tref	=r16	;Time to reach reference voltage
.def	TH	=r17	;Timer variable

.def	Vref	=r18	;Computed Vref

.def	temp	=r19
.def	temp2	=r20


;Port B pins
.equ	AIN0	=0
.equ	AIN1	=1
.equ	Ref1	=2
.equ	Ref2	=3
.equ	LED	=4
.equ	T	=7

.equ	PRESC	=2	;Timer clocked at CK/8
.equ	VrefAddr=0	;EEPROM Address holding Vref


.include "1200def.inc"

.cseg
.org 0
		rjmp reset		;Reset handler
		reti		

.org OVF0addr
;** Timer/counter 0 overflow interrupt ******************************
T0_int:		inc TH			;Increase timer high-byte
		reti


;*** Reset handler **************************************************
reset:		sbi DDRB,LED		;PB4 and
		ser temp		;Port D as output, used to
		out DDRD,temp		;drive LEDs

		ldi temp,(1<<TOIE0)	;Enable timer interrupt
		out TIMSK,temp

		sei			;Enable global interrupt

		sbi PORTB,T		;Turn on pull-up on T-pin
		rcall delay

		sbic PINB,T		;If pin not pulled low
		rjmp main		;	jump to main
					;else
calibrate:	sbis PINB,T		;	wait for pin release
		rjmp calibrate 

		cbi PORTB,T		;Turn off pull-up on T-pin
		rcall delay		;Let calibration voltage stabilize

		rcall reference		;Measure Tref
		rcall delay
		rcall input		;Measure Tcal

		clc
		mov mp9u,Tref		;Tref -> multiplier
		ldi temp,128		;128  -> multiplicand ( = 2.5 volts)
		mov mc9u,temp
		rcall mpy9u		;Tref x 128

		clr divH		;(Tref x 128)
		mov divL,TinL		; -----------
		rcall div17u		;    Tcal

		ldi temp,VrefAddr	;Store Vref
		out EEAR,temp
		out EEDR,dresL
		sbi EECR,EEWE

calibrate1:	sbic EECR,EEWE
		rjmp calibrate1



;Main program
main:		cbi PORTB,T		;Turn off pull-up on T-pin

		ldi temp,VrefAddr	;Read Vref from EEPROM
		out EEAR,temp
		sbi EECR,EERE
		in Vref,EEDR


loop:		rcall reference		;Measure Tref
		rcall delay		;A small delay to let
					;     the capacitor discharge,
		rcall input		;Measure Tin

		brts error		;If Vin > Vcc
		

calc:		lsr TinH                ;TinH -> C (multiplier)
		mov mp9u,TinL           ;TinL -> multiplier
		mov mc9u,Vref           ;Tref -> multiplicand
		rcall mpy9u             ;Tin x Tref

		clr divH                ;(Tin x Vref)
		mov divL,Tref           ;------------
		rcall div17u            ;    Tref

		tst dresH
		breq write

error:		ldi temp,255		;	Vin = 255
		mov dresL,temp


write:		com dresL		;Show the value on the LEDs
		rcall long_delay
		rcall long_delay
		rcall long_delay

		out PORTD,dresL
		rol dresL
		brcs wr1
		cbi PORTB,LED
		rjmp loop

wr1:		sbi PORTB,LED
		rjmp loop

;*** Subroutine delay ******************************************************
delay:		ldi temp,$FF
d1:		dec temp
		brne d1
		ret


long_delay:	ser temp2
ld1:		rcall delay
		dec temp2
		brne ld1
		ret


;*** Subroutine reference **************************************************
;* Measures Tref

reference:	sbi DDRB,AIN0		;Discharge the capacitor

		sbi DDRB,Ref1		;Turn on Vref
		sbi PORTB,Ref1		
		sbi DDRB,Ref2

		rcall delay		;Let the capacitor discharge completely

		clr TH			;Reset timer
		out TCNT0,TH

		cbi DDRB,AIN0		;AIN0 as input

		ldi temp,PRESC		;Start timer
		out TCCR0,temp

		sbi DDRB,T		;Turn on the transistor


ref_wait:	sbic ACSR,ACO 		;If Capacitor voltage > reference voltage
		rjmp ref_ok		;	conversion conplete
		cpi TH,1		;Continue if timer overflow
		brlo ref_wait

ref_ok:		in Tref,TCNT0		;Store Tref

		clr temp		;Stop timer
		out TCCR0,temp

		cbi DDRB,T		;Turn off transistor
		sbi DDRB,AIN0		;Discharge capacitor

		cbi PORTB,Ref1		;Turn off Vref
		cbi DDRB,Ref1		
		cbi DDRB,Ref2

		ret




;*** subroutine input **************************************************
;* Measures Tin
;* Returns with the T-flag set if timer overflow (i.e. Vin > Vcc)

input:		cbi DDRB,AIN0		;Tri-state AIN0

		clt			;Clear error flag
		clr TH			;Clear timer
		out TCNT0,TH

		ldi temp,PRESC		;Start timer
		out TCCR0,temp

		sbi DDRB,T		;Turn on transistor

input_wait:	sbic ACSR,ACO 		;If Capacitor voltage > Vin
		rjmp input_ok		;	charging complete
		cpi TH,2
		brlo input_wait
		set			;T=1 indicates Vin > Vcc

input_ok:	in TinL,TCNT0		;Store Tin
		mov TinH,TH

input_exit:	clr temp		;Stop timer
		out TCCR0,temp

		cbi DDRB,T		;Turn off transistor
		sbi DDRB,AIN0		;Discharge capacitor

		ret



;********************************************************************
;*
;* This routine divides a 17 bit number (carry:didH:didLL) on
;* a 16 bit number (divH:divL). 
;* The result is placed in (dresH:dresL)
;*
;* The carry flag must contain the 17th bit of the divident before
;* the routine is executed.
;*
;* The routine is based on the div16u - 16/16 Bit Unsigned Division
;* routine found in the avr200.asm application note file
;*
;********************************************************************


div17u:		clr remL		;clear remainder Low byte
		clr remH		;clear remainder High byte
		ldi temp,17		;init loop counter

d17u_1:		rol remL		;shift dividend into remainder
		rol remH
		sub remL,divL	;remainder = remainder - divisor
		sbc remH,divH	;
		brcc d17u_2		;if result negative
		add remL,divL	;    restore remainder
		adc remH,divH
		clc			;    clear carry to be shifted into result
		rjmp d17u_3		;else

d17u_2:		sec
d17u_3:		rol didL		;shift left dividend
		rol didH
		dec temp		;decrement counter
		brne d17u_1		;if done
		ret			;    return with value in didL



;***************************************************************************
;*
;* "mpy9u" - 9x8 Bit Unsigned Multiplication
;*
;* This subroutine multiplies the two register variables (carry:mp9u) and mc9u.
;* The result is placed (carry:m8uH:m8uL)
;*  
;* Number of words	:11 (return included)
;* Number of cycles	:   (return included)
;* Low registers used	:3 (mp9u,mc9/m9uL,m9uH)	
;* High registers used  :1 (temp)
;*
;* Note: Result Low byte and the multiplier share the same register.
;* This causes the multiplier to be overwritten by the result.
;*
;***************************************************************************

mpy9u:		clr m9uH		;clear result High byte
		ldi temp,9		;init loop counter
		ror mp9u

m9u_1:		brcc m9u_2		;if bit 0 of multiplier set
		add m9uH,mc9u		;    add multiplicand to result High byte

m9u_2:		dec temp		;decrement loop counter
		brne m9u_3		;if not done, loop more
		ret

m9u_3:		ror m9uH		;shift right result High byte 
		ror m9uL		;rotate right result L byte and multiplier
		rjmp m9u_1


