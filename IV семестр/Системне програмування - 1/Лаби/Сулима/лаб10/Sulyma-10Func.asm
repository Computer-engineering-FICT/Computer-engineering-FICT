.386
.model flat, stdcall
public trd_proc
extrn a_:dword, b_:dword ;зовнішні змінні (масиви)
.data
	four dd 4 ; тут також можна оголошувати змінні
.code
third_proced proc 
	fld a_[ebx]
	fild four
	fdiv ; a/4
	fld b_[ebx]
	fsub ; a/4 -b
	fptan ; tg(a/4-b) в st(1)
	fxch st(1) ; tg(a/4-b) в st(0)
	ret
third_proced endp
end
