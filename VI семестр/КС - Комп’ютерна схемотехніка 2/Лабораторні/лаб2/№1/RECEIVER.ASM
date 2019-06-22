.386

com1 equ 3f8h
com2 equ 2f8h

base equ com1

print_text macro text
	push ax
	mov ah, 09h
	mov dx, offset text
	int 21h
	pop ax
endm

get_input_symbol macro symbol
	xor ax, ax
	mov ah, 1
	int 21h
	mov symbol, al
endm

assume cs:code, ds:data, ss:stk

data segment use16
	
	program_text db 'Laboratory Work 1. COM port', 0dh, 0ah, '$'
	author_text db 'Zakhozhyy Ihor, group IO-73', 0dh, 0ah, '$'
	press_enter_text db 'Press <Enter> to set ready signal or <Esc> to exit...', 0dh, 0ah, '$'
	send_ready_text db 'Ready signal was set.', 0dh, 0ah, '$'
	choose_speed_text db 'Choose speed:', 0dh, 0ah, '$'
	speed1_text db '<A> 110 baud', 0dh, 0ah, '$'
    speed2_text db '<B> 150 baud', 0dh, 0ah, '$'
    speed3_text db '<C> 300 baud', 0dh, 0ah, '$'
    speed4_text db '<D> 600 baud', 0dh, 0ah, '$'
    speed5_text db '<E> 1200 baud', 0dh, 0ah, '$'
    speed6_text db '<F> 2400 baud', 0dh, 0ah, '$'
    speed7_text db '<G> 4800 baud', 0dh, 0ah, '$'
    speed8_text db '<H> 9600 baud', 0dh, 0ah, '$'
    speed9_text db '<I> 14400 baud', 0dh, 0ah, '$'
    speed10_text db '<J> 19200 baud', 0dh, 0ah, '$'
    speed11_text db '<K> 38400 baud', 0dh, 0ah, '$'
    speed12_text db '<L> 57600 baud', 0dh, 0ah, '$'
    speed13_text db '<M> 115200 baud', 0dh, 0ah, '$'
	speedh db 4, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	speedl db 17h, 0, 80h, 0c0h, 60h, 30h, 18h, 0ch, 8, 6, 3, 2, 1
	stop_bit_text db 'Choose the count of stop bits:', 0dh, 0ah, '$'
	stop_bit1_text db '<A> 1', 0dh, 0ah, '$'
	stop_bit2_text db '<B> 2', 0dh, 0ah, '$'
	message_text db 'Message:', 0dh, 0ah, '$'
	break_text db 'Break on line was received.', 0dh, 0ah, '$'
	new_line db 0dh, 0ah, '$'
	buf db ?
	speed_lb db ?
	speed_hb db ?
	stop_bits db ?
	
data ends

stk segment stack use16

	stck db 100 dup(?)

stk ends

code segment use16

	begin:
		mov ax, data
		mov ds, ax
		mov es, ax
		mov ah, 3h
		int 10h
		
		print_text program_text
		print_text author_text
		
		;Initializing port
		call initialize_port
		
		;Receiving of message
		call receive_message
	
	exit:
		mov ax, 4c00h
		int 21h

initialize_port proc

		;Dialog to set ready signal
		print_text press_enter_text
	ready_dialog:
		get_input_symbol buf
		cmp buf, 1bh
		jz exit
		cmp buf, 0dh
		jnz ready_dialog
		;Set signal
		mov dx, base+4
		mov al, 1
		out dx, al
		print_text send_ready_text
		
		;Dialog to choose speed
		print_text choose_speed_text
		print_text speed1_text
		print_text speed2_text
		print_text speed3_text
		print_text speed4_text
		print_text speed5_text
		print_text speed6_text
		print_text speed7_text
		print_text speed8_text
		print_text speed9_text
		print_text speed10_text
		print_text speed11_text
		print_text speed12_text
		print_text speed13_text
	speed_dialog:
		get_input_symbol buf
		print_text new_line
		mov al, 41h
		mov cx, 13
		xor bx, bx
	next_speed1:
		cmp buf, al
		jz set_speed
		inc al
		inc bx
		loop next_speed1	
		mov al, 61h
		mov cx, 13
		xor bx, bx
	next_speed2:
		cmp buf, al
		jz set_speed
		inc al
		inc bx
		loop next_speed2
		jmp speed_dialog
	set_speed:
		mov al, speedh[bx]
		mov speed_hb, al
		mov al, speedl[bx]
		mov speed_lb, al
		
		;Dialog to choose count of stop bits
		print_text stop_bit_text
		print_text stop_bit1_text
		print_text stop_bit2_text
	stop_bit_dialog:
		get_input_symbol buf
		print_text new_line
		cmp buf, 41h
		jz stop_bit1
		cmp buf, 42h
		jz stop_bit2
		cmp buf, 61h
		jz stop_bit1
		cmp buf, 62h
		jz stop_bit2
		jmp stop_bit_dialog
	stop_bit1:
		mov stop_bits, 3
		jmp customizing
	stop_bit2:
		mov stop_bits, 7
		
		;Customizing port
	customizing:
		;Set 7 bit to set divisor of frequency
		mov dx, base+3
		mov al, 80h
		out dx, al
		;Set low byte of divisor
		mov dx, base
		mov al, speed_lb
		out dx, al
		;Set high byte of divisor
		mov dx, base+1
		mov al, speed_hb
		out dx, al
		;Set the count of stop bits
		mov dx, base+3
		mov al, stop_bits
		out dx, al
		;Ban the interruptions
		mov dx, base+1
		xor ax, ax
		out dx, al
		
		ret

initialize_port endp
		
receive_message proc

	print_text message_text
		
	received_test:
		;Break test
		mov dx, base+5
		in al, dx
		bt ax, 4
		jc break_received
		
		;Coming byte test
		mov dx, base+5
		in al, dx
		bt ax, 0
		jnc received_test
		
		;Get incoming byte
		mov dx, base
		in al, dx
		mov buf, al
		
		;Sending echo byte
		mov dx, base
		out dx, al
	echo_send_wait:
		;Going out byte test
		mov dx, base+5
		in al, dx
		bt ax, 5
		jnc echo_send_wait
		
	echo_received_wait:
		;Break test
		mov dx, base+5
		in al, dx
		bt ax, 4
		jc break_received
		
		;Coming byte test
		mov dx, base+5
		in al, dx
		bt ax, 0
		jnc echo_received_wait
		
		;Correct byte test
		mov dx, base
		in al, dx
		cmp al, 1
		jne received_test
		
		;New line test
		cmp buf, 0dh
		jnz print_symbol
		print_text new_line
		jmp received_test
		
	print_symbol:	
		;Show byte on the screen
		mov dl, buf
		mov ah, 2
		int 21h
		jmp received_test
		
	break_received:
		print_text new_line
		print_text break_text
		ret
		
receive_message endp
		
code ends

end begin