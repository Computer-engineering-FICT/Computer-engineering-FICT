.586

.model flat, stdcall

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc

include longop.inc
include module.inc


includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib

.data

	TextBuf db 256 dup(?)
	Caption db "result",0

	FactorTemp dd 8 dup(0)
	Factor dd 8 dup(0)
	 
    FactorSq dd 16 dup(0)

.code

SWAP proc

	push ebp
	push eax
	push ebx
	push ecx
	push edx
	mov ebp, esp
	mov esi, [ebp+32] ; ESI = A
	mov edx, [ebp+28] ; EDX = B
	mov ecx, [ebp+24] ; розрядность

	
	mov eax, 0

cycle:
	push dword ptr[esi+eax*4]
	push dword ptr[edx+eax*4]
	pop dword ptr[esi+eax*4]
	pop dword ptr[edx+eax*4]

	inc eax
	cmp eax, ecx
	jl cycle

	pop edx
	pop ecx
	pop ebx
	pop eax	
	pop ebp
	ret 12
SWAP endp

start:

	mov dword ptr[Factor], 1
	mov ebx, 1
	cycle:
		push offset Factor
		push ebx
		push offset FactorTemp
		push 32
		call MUL_LONG_OP_N32
		
		push offset FactorTemp
		push offset Factor
		push 8
		call SWAP



		inc ebx
		cmp ebx, 49
		jl cycle

	push offset TextBuf
	push offset Factor
	push 256
	call StrHex_MY

	invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

	push offset Factor
	push offset Factor
	push offset FactorSq
	push 32
	call MUL_LONG_OP_NN

	push offset TextBuf
	push offset FactorSq
	push 512
	call StrHex_MY

	invoke MessageBoxA, 0, ADDR TextBuf, ADDR Caption, 0

	invoke ExitProcess,0

end start