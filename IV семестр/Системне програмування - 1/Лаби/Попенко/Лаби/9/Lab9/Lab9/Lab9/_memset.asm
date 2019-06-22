.586
.model flat, c
option casemap :none

.data
	Dst dd 0
	value db 0
	size_arr dd 0
.code

_memset proc

	push        ebp  
	mov         ebp,esp  

	mov 		eax, dword ptr [ebp + 16]
	mov 		dword ptr [size_arr], eax

	mov 		al, byte ptr [ebp + 12]
	mov 		byte ptr [value], al

	mov 		eax, dword ptr [ebp + 8]
	mov 		dword ptr [Dst], eax

	mov         dword ptr [ebp-8],0  
	jmp         cond_j_1    
cond_j_3:
	mov         eax,dword ptr [ebp-8]  
	add         eax,1  
	mov         dword ptr [ebp-8],eax  
cond_j_1:
	mov         eax,dword ptr [ebp-8]  
	cmp         eax,dword ptr [size_arr]  
	jge         cond_j_2    
	
	;((char*)Dst)[i] = value;

	mov         eax,dword ptr [Dst]  
	add         eax,dword ptr [ebp-8]  
	mov         cl,byte ptr [value]  
	mov         byte ptr [eax],cl  
	
	jmp         cond_j_3    
cond_j_2:  
	;pop         edi  
	;pop         esi  
	;pop         ebx  
	mov         esp,ebp  
	pop         ebp  

	ret 

_memset endp

end