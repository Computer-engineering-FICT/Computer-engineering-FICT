.686
.xmm
.model flat, c

.data 

temp dd 4 dup(0) 

.code

VectFPU proc dest:DWORD, pB:DWORD, pA:DWORD, bits:DWORD 

	mov edx, bits  ; n 
	mov esi, pA ; a 
	mov ebx, pB ; b 
	mov edi, dest ; res 

	fld dword ptr[temp] 

	cycle: 

		dec edx 
		fld dword ptr[esi+edx*4]
		fmul dword ptr[ebx+edx*4] 
		faddp st(1), st(0) 
		cmp edx, 0 

	jne cycle 

	fstp dword ptr[edi] 
	ret 

VectFPU endp

end