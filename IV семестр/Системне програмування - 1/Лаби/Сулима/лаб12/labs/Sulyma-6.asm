
    .486
    .model flat, stdcall
    option casemap :none

    include \masm32\include\windows.inc
    include \masm32\include\masm32.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc
    include \masm32\include\dialogs.inc
    include \masm32\macros\macros.asm
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib

    DlgProc   PROTO :DWORD,:DWORD,:DWORD,:DWORD
    EditProc  PROTO :DWORD,:DWORD,:DWORD,:DWORD

    .data
	Access db 0
		pass db "masm32",0
		passLen=$-pass
		InputLen db 0
		rig db "Right password",0
		no  db "Password is false!",0
		par db "Parol",0
		buf db 0
		res db "Result: ", 0
		inform db "Sulyma Aleksandr", 10, "5318", 10, "IP-5318", 0
		format db "%d", 0
        hInstance   dd 0
		buffer db 50 dup (0)	
        oldEditProc dd 0 
    .code
start:
    mov hInstance, rv(GetModuleHandle,NULL)
    call Main
    invoke ExitProcess, eax
	
Main proc
    Dialog "Sulyma-6","Arial",10,WS_OVERLAPPEDWINDOW, 1,5,5,180,100,1024
    DlgEdit WS_BORDER or ES_AUTOVSCROLL or ES_MULTILINE or WS_TABSTOP,30,20,100,20,1000

    ;DlgButton "OK",WS_TABSTOP,150,50,60,20,IDOK
    CallModalDialog hInstance,0,DlgProc,NULL
    ret
Main endp

DlgProc proc hWin:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
    .IF uMsg == WM_INITDIALOG
      invoke GetDlgItem,hWin,1000
      invoke SetWindowLong,eax,GWL_WNDPROC,EditProc
      mov oldEditProc, eax
    .ELSEIF uMsg == WM_COMMAND
    .ELSEIF uMsg == WM_CLOSE
       invoke EndDialog, hWin, 0
    .ENDIF
    return 0
DlgProc endp

EditProc proc hCtl:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
    .IF uMsg == WM_KEYDOWN
      .IF wParam == VK_RETURN
		invoke GetWindowText,hCtl,ADDR buffer,512
		call comp 
		cmp Access, 1
		invoke MessageBoxA, 0 , addr no, addr par, 0
      .ENDIF
    .ENDIF
    invoke CallWindowProc,oldEditProc,hCtl,uMsg,wParam,lParam
    ret
EditProc endp

good proc
invoke MessageBoxA, 0, offset inform, offset res,  0
invoke ExitProcess, 0
good endp

comp proc 
		mov esi, offset pass
        mov edi, offset buffer
        mov ecx, 6 ; длина строки
        cld		; сравнение пока не конец или пока элементы равны
		repe cmpsb
        jnz  equal_words   
        mov Access, 0
		call good
		equal_words: 
		
		ret
comp endp

end start

