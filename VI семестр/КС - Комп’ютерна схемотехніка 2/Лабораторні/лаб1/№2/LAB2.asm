.386

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
	
	lab_text db 'Laboratory Work #2. Variant #13', 0dh, 0ah, '$'
	author_text db 'Zakhozhyy Ihor, group IO-73', 0dh, 0ah, '$'
	exit_text db 'Press any key to exit...', 0dh, 0ah, '$'
	input_time_text db 'Please, input new time:', 0dh, 0ah, '$'
	input_hours_text db 'Hours > ', '$'
	input_minutes_text db 'Minutes > ', '$'
	input_seconds_text db 'Seconds > ', '$'
	incorrect_input_text db 'Incorrect input! Please, try again:', 0dh, 0ah, '$'
	set_real_time_text db 'The real time was set.', 0dh, 0ah, '$'
	error_read_rtc_text db 'Error! It is not possible to read the real time.', 0dh, 0ah, '$'
	set_system_time_text db 'The system time was set.', 0dh, 0ah, '$'
	show_time_text db 'Press any key to show the system time and the real time...', 0dh, 0ah, '$'
	new_line db 0dh, 0ah, '$'
	buf db 3 dup(?)
	st_divisor dd ?
	h db ?
	m db ?
	s db ?
	rtc_message db 'The real time   :  :  ', 0dh, 0ah
	rtc_messageend db '$'
	st_message db 'The system time            teaks', 0dh, 0ah
	st_messageend db '$'
	
data ends

stk segment use16 stack

	stck db 100 dup(?)
	
stk ends

code segment use16

	begin:
		mov ax, data
		mov ds, ax
		mov ax, 3h
		int 10h
		print_text lab_text
		print_text author_text
		
		call input_time
		call set_real_time
		call set_system_time
		call show_time
		
		mov ax, 4c00h
		int 21h

input_time proc
	
		print_text input_time_text
		
	hours_input:
		print_text input_hours_text
		xor si, si
	hours_get_symbol:
		get_input_symbol buf[si]
		cmp buf[si], 0dh
		jz hours_check
		inc si
		cmp si, 3
		jl hours_get_symbol
		print_text new_line
	incorrect_hours_input:
		print_text incorrect_input_text
		jmp hours_input
	hours_check:
		print_text new_line
		mov cx, si
		lea di, buf
	hours_check_symbol:
		cmp byte ptr [di], 30h
		jl incorrect_hours_input
		cmp byte ptr[di], 39h
		jg incorrect_hours_input
		inc di
		loop hours_check_symbol
		xor ax, ax
		cmp si, 2
		jz hours_two_digits
		mov al, buf
		sub al, 30h
		mov h, al
		jmp minutes_input
	hours_two_digits:
		mov al, buf
		sub al, 30h
		mov bl, 0ah
		mul bl
		xor bx, bx
		mov bl, buf+1
		sub bl, 30h
		add ax, bx
		cmp ax, 18h
		jg incorrect_hours_input
		mov h, al
		
	minutes_input:
		print_text input_minutes_text
		xor si, si
	minutes_get_symbol:
		get_input_symbol buf[si]
		cmp buf[si], 0dh
		jz minutes_check
		inc si
		cmp si, 3
		jl minutes_get_symbol
		print_text new_line
	incorrect_minutes_input:
		print_text incorrect_input_text
		jmp minutes_input
	minutes_check:
		print_text new_line
		mov cx, si
		lea di, buf
	minutes_check_symbol:
		cmp byte ptr [di], 30h
		jl incorrect_minutes_input
		cmp byte ptr [di], 39h
		jg incorrect_minutes_input
		inc di
		loop minutes_check_symbol
		xor ax, ax
		cmp si, 2
		jz minutes_two_digits
		mov al, buf
		sub al, 30h
		mov m, al
		jmp seconds_input
	minutes_two_digits:
		mov al, buf
		sub al, 30h
		mov bl, 0ah
		mul bl
		xor bx, bx
		mov bl, buf+1
		sub bl, 30h
		add ax, bx
		cmp ax, 3bh
		jg incorrect_minutes_input
		mov m, al
	
	seconds_input:
		print_text input_seconds_text
		xor si, si
	seconds_get_symbol:
		get_input_symbol buf[si]
		cmp buf[si], 0dh
		jz seconds_check
		inc si
		cmp si, 3
		jl seconds_get_symbol
		print_text new_line
	incorrect_seconds_input:
		print_text incorrect_input_text
		jmp seconds_input
	seconds_check:
		print_text new_line
		mov cx, si
		lea di, buf
	seconds_check_symbol:
		cmp byte ptr [di], 30h
		jl incorrect_seconds_input
		cmp byte ptr [di], 39h
		jg incorrect_seconds_input
		inc di
		loop seconds_check_symbol
		xor ax, ax
		cmp si, 2
		jz seconds_two_digits
		mov al, buf
		sub al, 30h
		mov s, al
		jmp input_end
	seconds_two_digits:
		mov al, buf
		sub al, 30h
		mov bl, 0ah
		mul bl
		xor bx, bx
		mov bl, buf+1
		sub bl, 30h
		add ax, bx
		cmp ax, 3bh
		jg incorrect_seconds_input
		mov s, al
	input_end:
		ret
		
input_time endp

set_real_time proc
	
		mov ch, h
		mov cl, m
		mov dh, s
		mov ah, 3
		int 1ah
		print_text set_real_time_text
		print_text new_line
		ret
	
set_real_time endp

set_system_time proc
	
		mov ah, 2
		int 1ah
		jc error_read_rtc
		xor ebx, ebx
		xor eax, eax
		mov al, dh
		add ebx, eax
		xor eax, eax
		mov al, cl
		mov dl, 60
		mul dl
		add ebx, eax
		xor eax, eax
		mov al, ch
		mov dl, 60
		mul dl
		mov dx, 60
		mul dx
		shl edx, 16
		add edx, eax
		add ebx, edx
		mov eax, ebx
		mov edx, 18
		mul edx
		mov dx, ax
		shr eax, 16
		mov cx, ax
		mov ah, 1
		int 1ah
		print_text set_system_time_text
		jmp end_set_st
	error_read_rtc:
		print_text error_read_rtc_text
	end_set_st:
		print_text show_time_text
		get_input_symbol buf
		ret
	
set_system_time endp
	
show_time proc
	
		mov ax, 3h
		int 10h
	label1:
		mov ah, 02h
		mov bh, 0
		mov dl, 0
		mov dh, 0
		int 10h
		mov ah, 02h
		int 1ah
		mov al, ch
		mov si, 0fh
		call rtc_symbol
		mov al, cl
		mov si, 12h
		call rtc_symbol
		mov al, dh
		mov si, 15h
		call rtc_symbol
		mov ah, 0
		int 1ah
		mov bx, cx
		shl ebx, 16
		mov bx, dx
		mov si, 10h
		call st_symbol
		mov ah, 86h
		mov cx, 0
		mov dx, 10000
		int 15h
		print_text lab_text
		print_text author_text
		print_text rtc_message
		print_text st_message
		print_text exit_text
		int 21h
		mov ah, 1
		int 16h
		jz label1
		ret
	
show_time endp

rtc_symbol proc

		push cx
		mov cx, 2
	loop1:
		mov bh, 10h
		mov ah, 00h
		div bh
		add ah, 30h
		mov byte ptr ds:[offset rtc_message + si], ah
		dec si
		loop loop1
		pop cx
		ret
		
rtc_symbol endp

st_symbol proc

		mov dword ptr st_divisor, 1000000000
		push cx
		mov cx, 10
	loop2:
		mov eax, ebx
		xor edx, edx
		push ebx
		mov ebx, dword ptr st_divisor
		div ebx
		pop ebx
		add al, 30h
		mov byte ptr ds:[offset st_message + si], al
		mov ebx, edx
		push ebx
		mov ebx, 10
		xor edx, edx
		mov eax, dword ptr st_divisor
		div ebx
		mov dword ptr st_divisor, eax
		pop ebx
		inc si
		loop loop2
		pop cx
		ret

st_symbol endp
	
code ends

end begin