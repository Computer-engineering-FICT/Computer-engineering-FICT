.586
.xmm
.model flat, c

.data 
	
temp dd 4 dup(0)	
	
.code

VectSSE proc dest:DWORD, pB:DWORD, pA:DWORD, bits:DWORD
	
	mov edx, bits	;[ebp+20] ; n
	mov esi, pA 	;[ebp+16]; a
	mov ebx, pB 	;[ebp+12]; b
	mov edi, dest	;[ebp+8] ; res
	
	
	
	cycle:
		sub edx, 4
		movups xmm0, [esi+edx*4]
		movups xmm1, [ebx+edx*4]
		mulps xmm0, xmm1
		haddps xmm0, xmm0
		haddps xmm0, xmm0
		addps xmm2, xmm0
		
		
		
		cmp edx, 0
		jne cycle
		movups temp, xmm2
		mov eax, dword ptr[temp]
		mov dword ptr[edi], eax


		ret 16
VectSSE endp

end