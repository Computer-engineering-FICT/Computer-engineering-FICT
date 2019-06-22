.586
.model flat, c
option casemap: none 

.data
	Dst dd 0
	arr_size dd 0
	new_size dd 0

.code
swap proc
	push        ebp  
	mov         ebp,esp

	mov			eax, dword ptr [ebp+12]
	mov			dword ptr [arr_size], eax

	mov			eax, dword ptr [ebp+8]
	mov			dword ptr [Dst], eax
 
	mov         eax,dword ptr [arr_size]  
	sar         eax,1  
	mov         dword ptr [new_size], eax  
	mov         dword ptr [ebp-14h],0  
	jmp         jump_1 
loop1:
	mov         eax,dword ptr [ebp-14h]  
	add         eax,1  
	mov         dword ptr [ebp-14h],eax
jump_1:  
	mov         eax,dword ptr [ebp-14h]  
	cmp         eax,dword ptr [new_size]  
	jge         jump_ret
	mov         eax,dword ptr [Dst]  
	add         eax,dword ptr [ebp-14h]  
	mov         cl,byte ptr [eax]  
	mov         byte ptr [ebp-1Dh],cl  
	mov         eax,dword ptr [arr_size]  
	sub         eax,dword ptr [ebp-14h]  
	mov         ecx,dword ptr [Dst]  
	add         ecx,dword ptr [ebp-14h]  
	mov         edx,dword ptr [Dst]  
	mov         al,byte ptr [edx+eax-1]  
	mov         byte ptr [ecx],al  

	mov         eax,dword ptr [arr_size]  
	sub         eax,dword ptr [ebp-14h]  
	mov         ecx,dword ptr [Dst]  
	mov         dl,byte ptr [ebp-1Dh]  
	mov         byte ptr [ecx+eax-1],dl  

	jmp         loop1  

jump_ret:
	mov         esp,ebp  
	pop         ebp  
	ret 
swap endp
end