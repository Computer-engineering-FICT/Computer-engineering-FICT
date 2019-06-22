.386
public _sum
_text segment word public 'code'
assume cs:_text
_sum proc

	push ebp
 	mov ebp, esp
	
    mov eax, [ebp + 8]
	add eax, [ebp + 12]
	
	pop ebp
	ret
_sum endp
_text ends
end
