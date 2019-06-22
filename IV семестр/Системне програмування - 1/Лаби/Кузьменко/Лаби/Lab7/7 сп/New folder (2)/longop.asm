.586 
.model flat, c 

.data
c1 dd 0
c2 dd 0
.code 
Add_128_LONGOP proc 
   push ebp 
   mov ebp,esp 
    
   mov esi, [ebp+16]           ;ESI = адреса A 
   mov ebx, [ebp+12]           ;EBX = адреса B 
   mov edi, [ebp+8]            ;EDI = адреса результату  
     
   mov ecx, 92   ; ECX = потрібна кількість повторень 
   mov edx,0
   clc            ; обнулює біт CF регістру EFLAGS 
   cycle: 
   mov eax, dword ptr[esi+4*edx]  
   adc eax, dword ptr[ebx+4*edx]     ; додавання групи з 32 бітів 
   mov dword ptr[edi+4*edx], eax   
   
   inc edx
   dec ecx        ; лічильник зменшуємо на 1 
   jnz cycle 
   pop ebp
   ret 12
Add_128_LONGOP endp

Sub_128_LONGOP proc 
   push ebp 
   mov ebp,esp 
    
   mov esi, [ebp+16]           ;ESI = адреса A 
   mov ebx, [ebp+12]           ;EBX = адреса B 
   mov edi, [ebp+8]            ;EDI = адреса результату  
     
   mov ecx, 48   ; ECX = потрібна кількість повторень 
   mov edx,0
   clc            ; обнулює біт CF регістру EFLAGS 
 cycle: 
   mov eax, dword ptr[esi+4*edx]  
   sbb eax, dword ptr[ebx+4*edx]     ; віднімання групи з 32 бітів 
   mov dword ptr[edi+4*edx], eax   
   
   inc edx
   dec ecx        ; лічильник зменшуємо на 1 
   jnz cycle 
   pop ebp
   ret 12
Sub_128_LONGOP endp

Mul_N32_LONGOP proc
	push ebp 
	mov ebp,esp 
    
	mov esi, [ebp+16]          
	mov ebx, [ebp+12]          
	mov edi, [ebp+8]       
	
	mov ecx, 0
@cycle:
	mov eax, dword ptr[esi+4*ecx] 
	mul ebx
	add dword ptr[edi+4*ecx], eax
	add dword ptr[edi+4*ecx+4], edx 
	inc ecx
	cmp ecx, 10
jb @cycle

	pop ebp
	ret 12
Mul_N32_LONGOP endp
 
Mul_NN_LONGOP proc
	push ebp
	mov ebp,esp
	mov esi, [ebp+16] ; 
	mov edi, [ebp+8] ; 
	mov ebp, [ebp+12] ;

mov c1, 0
@cycle: 
	mov c2, -10
	@cycle2:
		mov ecx, c1
		mov eax, dword ptr[esi+4*ecx]
		mov ecx, c2
		mov ebx, dword ptr[ebp+40+4*ecx]
		mul ebx
		
		mov ebx, c1
		shl ebx, 2
		add ebx, edi
		add dword ptr[40+4*ecx+ebx], eax
		add dword ptr[44+4*ecx+ebx], edx 
		
		inc c2

		jnz @cycle2
	inc c1 
	cmp c1, 10
	jb @cycle
	

	pop ebp ;відновлення стеку
	ret 12
Mul_NN_LONGOP endp

 
end 