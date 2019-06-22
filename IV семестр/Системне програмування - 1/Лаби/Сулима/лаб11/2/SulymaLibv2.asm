.386
.model flat,stdcall
option casemap:none
;include \masm32\include\windows.inc
include \masm32\include\masm32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\user32.lib
.data
	mbTitle db "Sulyma-11",0
	const1 dd 2
    const2 dd 51
    const3 dd 1
.data?
	res dq ?
	res1 dq ?
	res2 dq ?
	buffer db 15 dup (?)
.code
myFunc proc varA:DWORD,varB:DWORD,varC:DWORD,varD:DWORD
	    finit

        fild const1
        fld varC
        fmul

        fstp res1

        fild const3
        fld varB
        
        FYL2X
        FLDL2T
        fdivp st(1), st(0)
        fild const2
        fmul

        fstp res2

        fld res1
        fld res2
        fadd

        fstp res1

        fld varD
        fld varA
        fsub
        fild const3
        fsub

        fstp res2

        fld res1
        fld res2
        fdiv

        fstp res

	invoke FloatToStr, res, addr buffer
	invoke MessageBoxA, 0, addr buffer, addr mbTitle, 0
	ret
myFunc endp
End
