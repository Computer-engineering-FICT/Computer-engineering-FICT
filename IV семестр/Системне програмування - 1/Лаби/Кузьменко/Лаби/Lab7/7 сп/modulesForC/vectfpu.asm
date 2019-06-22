.586
.xmm
.model flat, c

.data 
	
temp dd 4 dup(0)	
	
.code

VectFPU proc dest:DWORD, pB:DWORD, pA:DWORD, bits:DWORD
	

	mov edx, bits	;[ebp+20] ; n
	mov esi, pA 	;[ebp+16]; a
	mov ebx, pB 	;[ebp+12]; b
	mov edi, dest	;[ebp+8] ; res
	
	fld dword ptr[temp]
	cycle:
		dec edx
		
		
		fld dword ptr[esi+edx*4]
		fmul dword ptr[ebx+edx*4]
		faddp st(1), st(0)


		cmp edx, 0
		jne cycle
		fstp dword ptr[edi]


		ret 16
VectFPU endp

end