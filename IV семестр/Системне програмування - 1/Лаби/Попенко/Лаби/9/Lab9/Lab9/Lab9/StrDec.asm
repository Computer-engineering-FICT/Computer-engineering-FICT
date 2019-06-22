.586
.model flat, c
option casemap :none 

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc

includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib

.code
	counter dd 0
	regeax dd 0
	reggecx dd 0
	reggedx dd 0
	reggesi dd 0
	reggedi dd 0
	result dd 0
	regecx dd 0
	number dd 0
	count dd 0
	last dd 0


.code
module_div10 proc 
	push ebp 
	mov ebp,esp 
	mov esi, [ebp+20] ; sourse 
	mov edi, [ebp+16] ; n-bit 
	mov ebx, [ebp+12] ; res 
	mov edx, [ebp+8] ; last 
	mov eax, edi
	shr eax, 3 
	mov dword ptr[counter], 0h 
	xor ecx, ecx
	mov cl, byte ptr[esi + eax - 1] 
	shr cl, 4 
	sub edi, 4
again: 
	cmp cl, 10 
	jl little 
	sub cl, 10 
	mov dword ptr[regeax], eax 
	xor eax, eax 
	mov dword ptr[regecx], ecx 
	xor ecx, ecx 
	mov edx, edi 
	mov ecx, edx 
	shr edx, 3 
	and ecx, 07h 
	mov al, 1 
	shl al, cl
	; not al 
	or byte ptr[ebx + edx], al 
	mov eax, dword ptr[regeax] 
	mov edx, [ebp+8] 
	mov ecx, dword ptr[regecx]
little: 
	dec edi 
	cmp edi, 0 
	jl exit 
	shl cl, 1 
	mov dword ptr[regeax], eax 
	xor eax, eax 
	mov dword ptr[regecx], ecx 
	xor ecx, ecx
		mov edx, edi ; Nbit – це номер біту 
	mov ecx, edx 
	shr edx, 3 ; номер байту 
 
	and ecx, 07h ; бітова позиція = вирізаємо 3 молодші біти 
	mov al, 1 
	shl al, cl ; AL = маска вирізання біту Nbit 
 
	mov ah, byte ptr [esi + edx] 
	and ah, al ; результат у регістрі AH 
	mov edx, [ebp+8] 
	mov ecx, dword ptr[regecx] 
	cmp ah, 0 
	je here 
	add cl, 01h
here: 
	mov eax, dword ptr[regeax] 
	jmp again
	exit: 
	mov  byte ptr[edx], cl 
	pop ebp 
	ret 16
module_div10 endp

StrDec proc 
	push ebp 
	mov ebp,esp 
	mov eax, [ebp + 16] ; result 
	mov ebx, [ebp + 12] ; number 
	mov ecx, [ebp + 8] ; n-bit 
	cmp ecx, 0 ; якщо розрядність 0 - на вихід 
	je exit ; 
	xor edi, edi    ; 
cycle1:                                ; 
	add edi, 4                                   ; 
	cmp edi, 544                           ; 
	je again                               ; 
	jmp cycle1
again:
	;-----------------------------------------------------------------------------
	;---------запис залишку в молодші розряди байта--------------------------------
	;----------------------------------------------------------------------------- 
	mov dword ptr[reggecx], ecx                 ; 
	mov dword ptr[reggedx], edx ; зберігаємо стани регістрів 
	mov dword ptr[reggesi], esi ; 
	mov dword ptr[reggedi], edi ; 
	push offset number ; 
	push [ebp + 8] ; 
	push offset result ; викликаємо ділення 
	push offset last ; 
	call module_div10 ; 
	mov ecx, dword ptr[reggecx] ; 
	mov edx, dword ptr[reggedx] ; відновлюємо стани регістрів 
	mov esi, dword ptr[reggesi] ; 
	mov edi, dword ptr[reggedi] ; 
	xor ecx, ecx ; 
	xor edi, edi ; 
cycle2: ; 
nothing: ; 
	add edi, 4 ; 
	cmp edi, 544 ; 
	je next1 ; 
	jmp cycle2 ;
next1: 
	mov eax, [ebp + 16] ; 
	mov dl, byte ptr[last] ;  заносимо залишок від ділення в результат 
	mov esi, dword ptr[count] ; 
	add byte ptr[eax + esi], dl ; 
	cmp ecx, 0 ; якщо результат ділення 0 - на вихід 
	je exit ; 
	xor edi, edi ; 
cycle: ; 
	add edi, 4 ; 
	cmp edi, 544 ; 
	je nexth ; 
	jmp cycle ;
nexth:
	;-----------------------------------------------------------------------------
	;---------запис залишку в старші розряди байта--------------------------------
	;----------------------------------------------------------------------------- 
	mov dword ptr[reggecx], ecx                   ; 
	mov dword ptr[reggedx], edx ; зберігаємо стани регістрів 
	mov dword ptr[reggesi], esi ; 
	mov dword ptr[reggedi], edi ; 
	push offset number ; 
	push [ebp + 8] ; 
	push offset result ; викликаємо ділення 
	push offset last ; 
	call module_div10 ; 
	mov ecx, dword ptr[reggecx] ; 
	mov edx, dword ptr[reggedx] ; відновлюємо стани регістрів 
	mov esi, dword ptr[reggesi] ; 
	mov edi, dword ptr[reggedi] ; 
	xor ecx, ecx ; 
	xor edi, edi ; 
cycle2h: ; 
nothingh: ; 
	add edi, 4 ; 
	cmp edi, 544 ; 
	je next1h ; 
	jmp cycle2h ;
next1h: 
	mov eax, [ebp + 16] ; 
	mov dl, byte ptr[last] ;  заносимо залишок від ділення в результат 
	shl dl, 4 ; 
	mov esi, dword ptr[count] ; 
	add byte ptr[eax + esi], dl ; 
	cmp ecx, 0 ; якщо результат ділення 0 - на вихід 
	je exit ; 
	xor edi, edi ; 
cycleh: ; 
	add edi, 4 ; 
	cmp edi, 544 ; 
	je next ; 
	jmp cycleh ;
next: ; повторюємо процес з початку 
	add dword ptr[count], 01h ; 
	jmp again ;
exit: 
	pop ebp
	ret 12
StrDec endp

end