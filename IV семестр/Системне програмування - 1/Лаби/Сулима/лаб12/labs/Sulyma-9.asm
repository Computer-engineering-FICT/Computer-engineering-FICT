.686
    .model flat, stdcall
    option casemap :none

.xlist

    include \masm32\include\masm32rt.inc

.list  

.data
    varA dd 6.0, 2.0, 4.4, 2.5, -2.0
    varB dd 5.0, 10.0, 17.6, 9.7, 0.5
    varC dd 9.4, 2.5, 4.1, 3.8, -1.0
    varD dd 3.0, 2.0, 3.9, 3.2, 3.5
    res dq 5 DUP(?)
    tan dq 5 DUP(?)
    res1 dq ?
    res2 dq ?
    count dw 0
    const1 dd 2
    const2 dd 51
    const3 dd 1

str_ind db 'Res[%i] = ', 0
str_res db '%i', 10, 0

str_buff db 128 dup(0)
string db 512 dup(0)
str_buff1 db 128 dup(0)
string1 db 512 dup(0)

.code
    start:
        mov edi, 0
    loops:
    ;(2*c - lg(b)*51)/(d - a - 1)
        finit

        fild const1
        fld varC[edi]
        fmul

        fstp res1

        fild const3
        fld varB[edi]
        FYL2X
        FLDL2T
        fdivp st(1), st(0)
        fstp tan[edi]
        fld tan[edi]
        fild const2
        fmul

        fstp res2

        fld res1
        fld res2
        fadd

        fstp res1

        fld varD[edi]
        fld varA[edi]
        fsub
        fild const3
        fsub

        fstp res2

        fld res1
        fld res2
        fdiv

        fstp res[edi]

        invoke wsprintf, addr str_buff,addr str_ind, count
        invoke szCatStr, addr string, addr str_buff

        invoke FloatToStr2, res[edi], addr str_buff
        invoke szCatStr, addr string, addr str_buff
        invoke szCatStr, addr string, offset chr$(10)

        invoke wsprintf, addr str_buff1,addr str_ind, count
        invoke szCatStr, addr string1, addr str_buff1

        invoke FloatToStr2, tan[edi], addr str_buff1
        invoke szCatStr, addr string1, addr str_buff1
        invoke szCatStr, addr string1, offset chr$(10)

        add edi, 4
        inc count

        cmp count, 5
        jne loops

        invoke MessageBoxA, 0, offset string, offset chr$("Sulyma-9"), 0

        invoke MessageBoxA, 0, offset string1, offset chr$("Tan"), 0
        invoke ExitProcess, 0

end start