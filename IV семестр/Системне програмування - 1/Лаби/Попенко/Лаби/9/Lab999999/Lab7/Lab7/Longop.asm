.586
.model flat, c
.data
r dd ?
a dd ?
b dd ?
n dd ?
d dd ?
n1 dd ?
Q db 1 dup(0)
data dd ?
counter dd ?
cc dd ?
bit dd ?
shift dd 0
dwordShift dd 0

Result2 dd 0,0,0,0,0,0,0,0,0,0
amount dd 0
ValueAddr dd 0
RestAddr dd 0
TR dd 0
Zero dd 10 dup(0)


.code

Write proc
push ebp
mov ebp,esp 
mov ebx, [ebp+8]
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
cmp ah, 0
jz @set0
or byte ptr [edi+ebx], al
jmp @goon
@set0:
not al 
and byte ptr [edi+ebx], al
@goon:
mov eax,eax
pop ebp 
ret 4
Write endp


Write2 proc
push ebp
mov ebp,esp 
mov ebx, [ebp+8]
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
cmp ah, 0
jz @set0
or byte ptr [edx+ebx], al
jmp @goon
@set0:
not al 
and byte ptr [edx+ebx], al
@goon: 
pop ebp 
ret 4
Write2 endp




Read proc
push ebp
mov ebp,esp 
mov ebx, [ebp+8]
mov ecx, ebx
shr ebx, 3 
and ecx, 07h 
mov al, 1
shl al, cl 
mov ah, byte ptr [esi+ebx]
and ah, al 
pop ebp ;
ret 4
Read endp


Div_10 proc
push ebp
mov ebp,esp
mov ebx,[ebp+20];кількість бітів
mov esi,[ebp+16];число
mov edx, [ebp+12] ;результат
mov edi, [ebp+8] ;остача


mov n,ebx
mov r,edi
mov a,esi
mov d,edx
mov b,1010b
;записуємо чотири старші біти
mov counter,4

mov ebx,n
mov n1,ebx
mov cc,4
dec cc
dec n1
@cycle:
  mov ebx,a
  mov data,ebx
  push n1
  call Read
  mov ebx,r
  mov data,ebx
  push cc
  call Write
  dec n1
  dec cc 
  dec counter
jnz @cycle
;---------------------------
mov ebx,n
mov cc,ebx
sub cc,4
mov counter,ebx
sub counter,4
inc counter
@cycle1:
mov ecx, dword ptr[edi]
cmp ecx,1010b
jnl @label
jmp @next
@label:
mov ah,1
push cc
call Write2
mov ecx,dword ptr[edi]
sub ecx,1010b
mov dword ptr[edi],ecx
@next:
mov ecx,dword ptr[edi]
shl ecx,1
mov dword ptr[edi],ecx
dec cc
cmp cc,0
jl @final
push cc
call Read
cmp ah,0
je @label1
mov ecx,dword ptr[edi]
inc ecx
mov dword ptr[edi],ecx
@label1:
dec counter
jnz @cycle1
@final:
mov ecx,dword ptr[edi]
shr ecx,1
mov dword ptr[edi],ecx
mov ebx,ebx
pop ebp 
ret 20
Div_10 endp


Copy proc
push ebp
mov ebp,esp
mov ebx, [ebp+12] 
mov edi,[ebp+8] 
mov ecx,16
mov edx, 0
cycle:
mov eax,dword ptr[ebx+4*edx]
mov dword ptr[edi+4*edx],eax
inc edx
dec ecx ; 
jnz cycle
pop ebp 
ret 8
Copy endp



Zero_Longop proc
push ebp
mov ebp,esp
mov ebx, [ebp+8]
mov ah,0
mov ecx,0
mov counter,14
cycle:
cmp dword ptr[ebx+4*ecx],0
je @next
mov ah,1
@next:
mov ah,ah
inc ecx
dec counter
jnz cycle
pop ebp 
ret 4
Zero_Longop endp


FinalP proc var1:DWORD, bits:DWORD, Rest:DWORD
mov ecx, var1
mov esi, bits 
mov ebx, Rest 

mov RestAddr,ebx
mov amount,esi
mov ValueAddr,ecx

cycle:
push 448
push ValueAddr
push offset Result2
push offset TR
call Div_10

mov ecx,shift
mov ebx,RestAddr
mov eax,dword ptr [TR]
mov dword ptr[ebx+4*ecx],eax
xor ecx,ecx
xor eax,eax

push offset Result2
push  ValueAddr
call Copy

push offset Zero
push offset Result2
call Copy




inc shift
push ValueAddr
call Zero_Longop
cmp ah,0
jnz cycle
ret
FinalP endp


ToText proc
push ebp
mov ebp,esp
mov edx,[ebp+16];
mov esi, [ebp+12];
mov edi,[ebp+8];Textbuf
mov ah,48
shr edx,3
mov counter,edx
cycle1:
mov ecx,counter
mov byte ptr[edi+ecx],ah
dec counter
jnz cycle1
mov counter,edx
mov shift,0
cycle:
mov ebx,shift
mov ah,byte ptr[esi+4*ebx]
add ah,48
mov ebx,counter
mov byte ptr[edi+ebx],ah
inc shift
dec counter
jnz cycle
pop ebp 
ret 8
ToText endp


N32 proc
push ebp
mov ebp,esp
mov esi, [ebp+16] 
mov ebx, [ebp+12] 
mov edi,[ebp+8] 
mov counter,8
mov ecx,0
mov edx,0
mov eax,0
cycle:
mov eax, dword ptr[esi+8*ecx]
mul dword ptr[ebx]
mov dword ptr[edi+ecx*8],eax
mov dword ptr[edi+ecx*8+4],edx
inc ecx
dec counter 
jnz cycle
clc;
mov edx,0
mov eax,0
mov counter,7
mov ecx,0
cycle1:
mov eax, dword ptr[esi+8*ecx+4]
mul dword ptr[ebx]
add Q, 0ffh
adc eax,dword ptr[edi+8*ecx+4]
mov dword ptr[edi+8*ecx+4],eax
adc edx,dword ptr[edi+8*ecx+8]
mov dword ptr[edi+8*ecx+8],edx
mov Q, 0
adc Q, 0
inc ecx
dec counter 
jnz cycle1
pop ebp 
ret 12
N32 endp

; число, результат, остачка, кількусть бітіків
;Я приймаю число , а даю результат, а також даю остачу 
Div_group proc
push ebp
mov ebp, esp
mov esi, [ebp + 8];число
mov edi, [ebp + 12];результат
mov eax, [ebp + 16];остача
; bits
;13 * 4 (14 груп по 32 ) потрібно для циклу 52

push eax

mov eax, [ebp + 20]
mov ebx, 32
cdq 
idiv ebx
mov ecx, eax
dec eax 
mov ebx, 4
imul ebx
mov ebx, eax
pop eax

mov edx, 0
;mov ecx, 14
for01:		nop
			push eax
			push ebx
			;
			mov eax, [esi + ebx]
			mov ebx, 10
			div ebx
			pop ebx
			mov [edi + ebx], eax
			pop eax
			mov [eax], edx
			;
			
			sub ebx, 4
			loop for01
endfor01:	nop


pop ebp
ret 16
Div_group endp

end