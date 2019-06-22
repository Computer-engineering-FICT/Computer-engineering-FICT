.686
.xmm
.model flat, c
.data

	null dd 4 dup(0)
	res dd 0

.code

vectorSSE proc dest: dword, K: dword, L: dword, num: dword
	
	mov ecx, num
	mov edx, L
	mov eax, K
	mov edi, dest

	movups xmm2, [null]
	
	@cycle:
		
		sub ecx, 16
		movups xmm0, [eax + ecx] 
		movups xmm1, [edx + ecx]

		mulps xmm0, xmm1
		addps xmm2, xmm0

		cmp ecx, 0

		jne @cycle

	haddps xmm2,xmm2
	haddps xmm2,xmm2

	movss dword ptr[edi], xmm2

	;add esp, 12  
	ret

vectorSSE endp


vectorFPU proc dest: dword, K: dword, L: dword, num: dword

	mov ecx, num
	mov edi, dest
	mov eax, K
	mov edx, L

	fld res
	@cycle:

		sub ecx, 4
		fld dword ptr[eax + ecx]
		fmul dword ptr[edx + ecx]
		faddp st(1), st(0)

		cmp ecx, 0

		jne @cycle

	fstp dword ptr[edi]

	ret

vectorFPU endp

end
