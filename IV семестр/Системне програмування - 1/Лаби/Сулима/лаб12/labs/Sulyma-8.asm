.686
    .model flat, stdcall
    option casemap :none

.xlist
    include \masm32\include\windows.inc  
    include \masm32\include\masm32.inc
    includelib \masm32\lib\masm32.lib
    include \masm32\include\user32.inc
    includelib \masm32\lib\user32.lib
    include \masm32\include\kernel32.inc
    includelib \masm32\lib\kernel32.lib
    include \masm32\include\dialogs.inc
    include \masm32\macros\macros.asm

.list  

.data
    varA dw 36, 78, 24, 40, 42
    varC dw 9, 1, 2, 4, 3
    varD dw 3, 7, 2, 3, 3 
    res dw 5 DUP(0)
    count dw 0

str_ind db 'Res[%i] = ', 0
str_res db '%i', 10, 0

str_buff db 128 dup(0)
string db 512 dup(0)

.code
    start:
        mov edi, 0
    loops:
        mov si, varC[edi]
        imul si, varD[edi]
        add si, 23

        mov ax, varA[edi]
        mov cx, 2
        cwd
        idiv cx

        mov cx, varD[edi]
        imul cx, 4

        sub ax, cx
        sub ax, 1
        mov cx, ax
        mov ax, si
        cwd
        idiv cx

        mov res[edi], ax

        mov cx, 2
        idiv cx

        .IF dx == 0
            mov res[edi], ax
            .ELSE 
                mov cx, res[edi]
                imul cx, 5
                mov res[edi], cx
        .ENDIF
        
        invoke wsprintf, addr str_buff,addr str_ind, count
        invoke szCatStr,addr string, addr str_buff
        invoke wsprintf, addr str_buff, addr str_res, res[edi]
        invoke szCatStr,addr string, addr str_buff

        inc edi
        inc edi
        inc count

        cmp edi, 10
        jne loops

    invoke MessageBoxA, 0, offset string, offset chr$("Sulyma-8"), 0
    invoke ExitProcess, 0

end start