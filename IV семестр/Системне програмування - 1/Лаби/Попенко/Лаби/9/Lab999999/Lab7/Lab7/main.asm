.586
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\comdlg32.inc
option casemap :none
include \masm32\include\windows.inc
include module.inc
include longop.inc
include strdec.inc


includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\comdlg32.lib
includelib \masm32\lib\user32.lib
.const
.data
TextBuf db 1056 dup(?)
TextBuf1 db 1056 dup(?)
FmtBuf db 24	dup(?)
;TextBuf db 10000 dup(?)
Caption db 'Result', 0
ValueB dd 11
Zero dd 14 dup(0)
i		dd ?
ValueD dd  0
ValueY dd 0
ValueM dd 0
Val dd 1
ValueR db 200 dup(0)
ValueR1 db 200 dup(0)
Value dd 2
R dd (0)
R1 dd (0)
shift dd 0
shift1 dd 0
Result1 dd 1,0,0,0,0,0,0,0,0,0, 0, 0 ,0 ,0
Result2 dd 0,0,0,0,0,0,0,0,0,0, 0, 0 ,0 ,0
Result3 dd 0,0,0,0,0,0,0,0,0,0, 0, 0 ,0 ,0
Result4 dd 0,0,0,0,0,0,0,0,0,0, 0, 0 ,0 ,0
Result5 dd 0,0,0,0,0,0,0,0,0,0, 0, 0 ,0 ,0
Result6 dd 1,0,0,0,0,0,0,0,0,0, 0, 0 ,0 ,0
pRes777 dd 1,2,3,4,5,6,7,8,9,10,11,12,13,14
counter dd 0
counter2 dd 0
 
hFile dd 0
pRes dd 0
;szFileName db "File.txt",0
szFileName db 256 dup(0)
pVal		dd	?
tmp			dd  ?
pVal1		dd	?
format1		db  "Hello sdfedfdsfsdfadfssssssssssss", 13, 10, 0
indexVar		dd	?
tmpECX			dd ?
.code


MySaveFileName proc
LOCAL ofn : OPENFILENAME
invoke RtlZeroMemory, ADDR ofn, SIZEOF ofn ; спочатку усі поля обнулюємо
mov ofn.lStructSize, SIZEOF ofn
mov ofn.lpstrFile, OFFSET szFileName
mov ofn.nMaxFile, SIZEOF szFileName
invoke GetSaveFileName, ADDR ofn ; виклик вікна File Save As
ret
MySaveFileName endp

start:

call MySaveFileName


invoke GlobalAlloc, GPTR, 896
mov tmp, eax  
invoke CreateFile, ADDR szFileName,
GENERIC_WRITE,
FILE_SHARE_WRITE,
0, CREATE_ALWAYS,
FILE_ATTRIBUTE_NORMAL,
0
cmp eax, INVALID_HANDLE_VALUE
je @exit ;доступ до файлу неможливий


mov hFile, eax


; LOOOP
mov ecx, 86
mov esi, 86
mov tmpECX, ecx
for0001:    mov tmpECX, ecx
			cmp tmpECX, 0  ; КОЛВ-ВО ВЫВОДОВ
			je endfor00001
			push ecx
			push esi
mov eax, tmp
mov pVal, eax



; обнулення
mov ecx, 14
mov ebx, 0
for001:		nop
			mov [pVal + ebx], 0
			mov edx, [pVal + ebx]
			add ebx, 4
			loop for001
endfor001:	nop
;обнулення 2

mov ecx, 14
mov ebx, 0
for002:		nop
			mov [pVal + 448 + ebx], 0
			mov edx, [pVal + 448 + ebx]
			add ebx, 4
			loop for002
endfor002:	nop

mov [pVal + 448], 1 

mov ecx, 14
mov ebx, 0
for003:		nop
			mov esi, [pVal + 448 + ebx]
			mov edi, [pVal + ebx]
			add ebx, 4
			loop for003
endfor003:	nop


;
pop esi
;mov esi, 86
push esi
mov i, esi
for01: cmp i, 0 ; FACTORIAL
	je endfor01
	push offset pVal + 448
	push offset i
	push offset pVal
	call N32

	push offset pVal
	push offset pVal + 448
	call Copy

	dec i
	jmp for01
endfor01: nop

push offset TextBuf
push offset pVal
push 448
call StrHex_MY
;invoke MessageBox, 0, ADDR TextBuf, ADDR Caption, MB_ICONINFORMATION


invoke lstrlen, ADDR TextBuf
invoke WriteFile, hFile, ADDR TextBuf, eax, ADDR pRes, 0


mov TextBuf1[0], 13
mov TextBuf1[4], 10
mov TextBuf1[8], 0

invoke lstrlen, ADDR TextBuf1
invoke WriteFile, hFile, ADDR TextBuf1, eax, ADDR pRes, 0

;invoke lstrlen, ADDR TextBuf
;invoke WriteFile, hFile, ADDR TextBuf, eax, ADDR pRes, 0

				pop esi 
				dec esi
				pop ecx
				dec ecx
				jmp for0001
endfor00001:		nop
; LOOOP


invoke CloseHandle, hFile

@exit:
invoke GlobalFree, pVal

invoke ExitProcess,0
end start
