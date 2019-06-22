.386

track equ 79
sector_size equ 512

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

	new_line db 0dh, 0ah, '$'
	lab_text db 'Laboratory Work #3. Variant #21', 0dh, 0ah, '$'
	author_text db 'Zakhozhyy Ihor, group IO-73', 0dh, 0ah, '$'
	input_file_name_text db 'Please, input the name of the file:', 0dh, 0ah, '$'
	active_line_text db '>', '$'
	incorrect_file_name_text db 'Unable to open the file!', 0dh, 0ah, '$'
	error_text db 'Some error has occured! The program is closing.', 0dh, 0ah, '$'
	file_written_text db 'The file was writted to 79 cylinder successfully.', 0dh, 0ah, '$'
	file_output_text db 'The content of file:', 0dh, 0ah, '$'
	exit_text db 0dh, 0ah, 'Press any button to exit...', 0dh, 0ah, '$'
	status_byte_text db ' - system status', 0dh, 0ah, '$'
	file_name db 256 dup(?)
	buf db ?
	file_buf db sector_size dup(?), '$'
	file_sectors_count db 0
	file dw ?
	sector db ?
	read_bytes dw ?

data ends

stk segment use16 stack

	stck db 100 dup(?)

stk ends

code segment use16

	begin:
		mov ax, data
		mov ds, ax
		mov es, ax
		print_text lab_text
		print_text author_text
		call get_file_name
		call write_file
		call read_file
		jmp exit
	error_label:
		print_text error_text
	exit:
		print_text exit_text
		get_input_symbol buf
		mov ax, 4c00h
		int 21h
		
proc get_file_name
	
		print_text input_file_name_text
		print_text active_line_text
		xor si, si
	input_symbol:
		get_input_symbol buf
		cmp buf, 08h
		jnz check_enter
		dec si
		jmp input_symbol
	check_enter:
		cmp buf, 0dh
		jz end_input
		mov al, buf
		mov byte ptr file_name[si], al
		inc si
		jmp input_symbol
	end_input:
		mov byte ptr file_name[si], '$'
		print_text new_line
		ret
	
endp get_file_name

proc write_file
	
		mov ah, 3dh
		mov al, 1
		lea dx, file_name
		xor cl, cl
		int 21h
		jnc read_input_file
		print_text incorrect_file_name_text
		jmp error_label
	read_input_file:
		mov file, ax
		mov al, 0
		mov sector, al
	read_next_label:
		mov ah, 3fh
		mov bx, file
		mov cx, sector_size
		lea dx, file_buf
		int 21h
		mov read_bytes, ax
		mov ah, 3
		mov al, 1
		mov ch, track
		mov cl, sector
		mov dh, 0
		mov dl, 0
		lea bx, file_buf
		int 13h
		add ah, 30h
		mov status_byte_text, ah
		print_text status_byte_text
		inc si
		mov al, sector
		inc al
		mov sector, al
		mov ax, read_bytes
		cmp ax, sector_size
		je read_next_label
		mov ax, si 
		mov file_sectors_count, al
		print_text file_written_text
		ret
	
endp write_file

proc read_file
		
		print_text file_output_text
		mov al, 0
		mov sector, al
		xor ah, ah
		mov al, file_sectors_count
		mov si, ax
	repeat_label:
		lea bx, file_buf
		mov ah, 2
		mov al, 1
		mov ch, track
		mov cl, sector
		mov dh, 0
		mov dl, 0
		int 13h
		jz error_label
		print_text file_buf
		mov al, sector
		inc al
		mov sector, al
		dec si
		cmp si, 0
		jne repeat_label
		ret
	
endp read_file
		
code ends

end begin