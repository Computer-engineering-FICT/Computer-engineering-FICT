.586
.model flat, c
option casemap: none 

.data
	sum dw 0
	number_size dd 0
	result dd 0
	a dd 0
	b dd 0

.code
longMultiply proc
	push        ebp  
	mov         ebp,esp

	mov			eax, dword ptr [ebp+20]
	mov			dword ptr [number_size], eax

	mov			eax, dword ptr [ebp+16]
	mov			dword ptr [result], eax

	mov			eax, dword ptr [ebp+12]
	mov			dword ptr [b], eax

	mov			eax, dword ptr [ebp+8]
	mov			dword ptr [a], eax
 
	;sub         esp,0E4h  
	;push        ebx  
	;push        esi  
	;push        edi  
	;lea         edi,[ebp-0E4h]  
	;mov         ecx,39h  
	;mov         eax,0CCCCCCCCh  
	;rep stos    dword ptr es:[edi]
 
	;for (int i = size - 1; i >= 0; --i)
	mov         eax,dword ptr [number_size]  
	sub         eax,1  
	mov         dword ptr [ebp-8],eax  
	jmp         jump_1 
jump_5:
	mov         eax,dword ptr [ebp-8]  
	sub         eax,1  
	mov         dword ptr [ebp-8],eax
jump_1:  
	cmp         dword ptr [ebp-8],0  
	jl          ret_jump  
	;{
		;uint16_t int_mult = 0;
	xor         eax,eax  
	mov         word ptr [ebp-14h],ax  
		;for (int j = size - 1; j >= 0; --j)
	mov         eax,dword ptr [number_size]  
	sub         eax,1  
	mov         dword ptr [ebp-20h],eax  
	jmp         jump_2
jump_4: 
	mov         eax,dword ptr [ebp-20h]  
	sub         eax,1  
	mov         dword ptr [ebp-20h],eax 
jump_2: 
	cmp         dword ptr [ebp-20h],0  
	jl          jump_3 
		;{
			;int_mult = a[i] * b[j] + result[i + j + 1] + int_mult;
	mov         eax,dword ptr [a]  
	add         eax,dword ptr [ebp-8]  
	movzx       ecx,byte ptr [eax]  
	mov         edx,dword ptr [b]  
	add         edx,dword ptr [ebp-20h]  
	movzx       eax,byte ptr [edx]  
	imul        ecx,eax  
	mov         edx,dword ptr [ebp-8]  
	add         edx,dword ptr [ebp-20h]  
	mov         eax,dword ptr [result]  
	movzx       edx,byte ptr [eax+edx+1]  
	add         ecx,edx  
	movzx       eax,word ptr [ebp-14h]  
	add         ecx,eax  
	mov         word ptr [ebp-14h],cx  
			;result[i + j + 1] = int_mult;
	mov         eax,dword ptr [ebp-8]  
	add         eax,dword ptr [ebp-20h]  
	mov         ecx,dword ptr [result]  
	mov         dl,byte ptr [ebp-14h]  
	mov         byte ptr [ecx+eax+1],dl  
			;int_mult >>= 8;
	mov         ax,word ptr [ebp-14h]  
	shr         ax,8  
	mov         word ptr [ebp-14h],ax  
		;}
	jmp         jump_4 
		;result[i] = int_mult;
jump_3:
	mov         eax,dword ptr [result]  
	add         eax,dword ptr [ebp-8]  
	mov         cl,byte ptr [ebp-14h]  
	mov         byte ptr [eax],cl  
	;}
jmp         jump_5 
;}
ret_jump:
	;pop         edi  
	;pop         esi  
	;pop         ebx  
	;mov         esp,ebp  
	pop         ebp  
	ret  
longMultiply endp
end

