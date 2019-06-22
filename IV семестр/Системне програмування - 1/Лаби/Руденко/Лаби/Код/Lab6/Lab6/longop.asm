.586
.model flat, c

.data 
	x dd 32 dup(?)
	m dd 0
	n dd 0

.code

Write1_LONGOP proc

	push ebp
	mov ebp,esp
	
	mov x [ebp+8] 
	mov n [ebp+12] 
	mov m [ebp+16] 

	@cycle
	mov ebx, n
	mov ecx, ebx
	shr ebx, 3
	and ecx, 07h
	mov al, 1
	sh a1, cl

	or byte ptr [x+ebx]

	dec n
	dec m
	jnz @cycle

	pop ebp
	ret 12
Write1_LONGOP endp


end

