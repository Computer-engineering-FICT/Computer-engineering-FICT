assume cs: code, ds: data

point struc
	x dw ?
	y dw ?
point ends

triangle struc method {
	draw_triangle: dword = show_triangle}
	a point <10, 10>
	b point <100, 10>
	c point <10, 100>
	color db 2
triangle ends

draw_line macro reg1, reg2, p1, p2, c1, c2
	local cont, cycle
	mov &reg1, [(triangle ptr si).&p1.&c1]
	mov &reg2, [(triangle ptr si).&p2.&c1]
	sub &reg1, &reg2
	jz cont
	mov cx, &reg1
	mov &reg1, [(triangle ptr si).&p2.&c2]
	cycle:
		show_p
		inc &reg2
	loop cycle
	cont:
endm

show_p macro
	pusha
	mov cx, ax
	mov ah, 0ch
	mov al, [(triangle ptr si).color]
	mov dx, bx
	xor bx, bx
	int 10h
	popa
endm

data segment use16
	t triangle <>
	p point <1, 109h>
data ends

code segment
beg:
	.386
	mov ax, data
	mov ds, ax

	lea si, t
	call si method triangle:draw_triangle
	
	mov ax, 0
	int 16h
	
	mov ax, 4c00h
	int 21h
	
proc show_triangle
	pusha
	mov ax, 0dh
	int 10h
	
	draw_line bx, ax, b, a, x, y
	draw_line ax, bx, c, a, y, x
	
	cont2:
	mov ax, [(triangle ptr si).c.x]
	mov bx, [(triangle ptr si).c.y]
	cycle3:
		show_p
		inc ax
		dec bx
		cmp ax, [(triangle ptr si).b.x]
	jle cycle3
	
	popa
	ret
endp

code ends
end beg