.586
.model flat, c
option casemap: none

.data
	Dst dd 0
	Src dd 0
	size_arr dd 0

.code

_memcpy proc
	push        ebp  
	mov         ebp,esp

	mov 		eax, dword ptr [ebp + 16]
	mov 		dword ptr [size_arr], eax

	mov 		eax, dword ptr [ebp + 12]
	mov 		dword ptr [Src], eax

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
	mov         eax,dword ptr [Dst]  
	add         eax,dword ptr [ebp-8]  
	mov         ecx,dword ptr [Src]  
	add         ecx,dword ptr [ebp-8]  
	mov         dl,byte ptr [ecx]  
	mov         byte ptr [eax],dl  
	jmp         cond_j_3   
cond_j_2: 
	pop         edi  
	pop         esi  
	pop         ebx  
	mov         esp,ebp  
	pop         ebp   
	ret  

_memcpy endp

end