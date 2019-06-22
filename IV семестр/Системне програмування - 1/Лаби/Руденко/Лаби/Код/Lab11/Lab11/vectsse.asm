.686
.xmm
.model flat, C
.data 

temp dd 4 dup(0) 

.code

VectSSE proc dest:DWORD, pB:DWORD, pA:DWORD, bits:DWORD 

	mov edx, bits  ; n 
	mov esi, pA ; a 
	mov ebx, pB ; b 
	mov edi, dest ; res

	
	 
	cycle:

		sub edx, 4 
		movups xmm0, [esi+edx*4] 
		movups xmm1, [ebx+edx*4] 
		mulps xmm0, xmm1 
		addps xmm2, xmm0 
		cmp edx, 0 

	jne cycle 
	haddps xmm2, xmm2
	haddps xmm2, xmm2

	movups temp, xmm2 
	mov eax, dword ptr[temp] 
	mov dword ptr[edi], eax

	ret 

VectSSE endp
end