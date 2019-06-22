.686
    .model flat, stdcall
    option casemap :none
	
	
    include \masm32\include\windows.inc
    include \masm32\include\masm32.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc
    include \masm32\include\dialogs.inc
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib
    include \masm32\macros\macros.asm
    include Sulyma.inc
	
	
    Dlgue_Proc   PROTO :DWORD,:DWORD,:DWORD,:DWORD
    Edit_Proc  PROTO :DWORD,:DWORD,:DWORD,:DWORD
	
;	encrypte macro arrg1, arrg2
;		xor arrg1, arrg2 ;;arrg1 - inputed char, arrg2 - key
;	endm
;	enter_show macro arrg1, arrg2
;		invoke MessageBoxA, 0, arrg1, arrg2, 0 ;;arrg1 - massage, arrg2 - title
;	endm
;	compare_me macro arrg1, arrg2, arrg3
;	local index
;		index equ arrg3 ;;index equivalent arrg3
;			cmp arrg1, arrg2 [index] ;;compare
;	endm   
 .data
	  flg db 0
         correct db "Sulyma Oleksandr", 10, "IP-53", 10, "04.04.1998", 0
         errors  db "Uncorrect", 10,"Next try", 0
         headTitle1 db "Congratulations!!!",0
         headTitle2 db "INVALID KOD",0
		 KODE db "______",0 
         key db "0",0
         quantity dd 6
         hInstance   dd 0
         temp_buf db 50 dup (0)	
         oldEditProc dd 0
    .code
start:
    mov hInstance, rv(GetModuleHandle,NULL)
    call main
    invoke ExitProcess, eax
main proc
    Dialog " Sulyma-7 ", "Calibri", 13, WS_OVERLAPPED or WS_SYSMENU or DS_CENTER, 3, 5,5,120,50, 1024
    DlgEdit WS_BORDER or ES_AUTOVSCROLL or ES_MULTILINE or WS_TABSTOP,15,20,50,10,1000
    DlgButton "EXIT", WS_TABSTOP,70,15,30,20,IDCANCEL
    DlgStatic "Enter password: ",SS_CENTER,10,5,60,9,100
    CallModalDialog hInstance,0,Dlgue_Proc,NULL
    ret
main endp
Dlgue_Proc proc hWin:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
    .IF uMsg == WM_INITDIALOG
      invoke GetDlgItem,hWin,1000
      invoke SetWindowLong,eax,GWL_WNDPROC,Edit_Proc
      mov oldEditProc, eax
    .ELSEIF uMsg == WM_COMMAND
      .IF wParam == IDCANCEL
        invoke EndDialog, hWin, 0
      .ENDIF
    .ELSEIF uMsg == WM_CLOSE
       invoke EndDialog, hWin, 0
    .ENDIF
    return 0
Dlgue_Proc endp
Edit_Proc proc hCtl:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
    .IF uMsg == WM_KEYDOWN
      .IF wParam == VK_RETURN
		invoke GetWindowText,hCtl,ADDR temp_buf,512
		call compare 
		cmp flg, 1
             je Right
             call bd
             jmp e1
Right:       call gd
e1:
      .ENDIF
    .ENDIF
    invoke CallWindowProc,oldEditProc,hCtl,uMsg,wParam,lParam
    ret
Edit_Proc endp
gd proc
enter_show addr correct, addr headTitle1
invoke ExitProcess,NULL
ret
gd endp
bd proc
enter_show addr errors, addr headTitle2
ret
bd endp
compare proc 
        mov ebx, 0
          mov flg, 0
 next: 	cmp ebx, quantity
		je right
        mov al, temp_buf [ebx]
		encrypte al, key
		compare_me al, KODE, ebx
        jne endcmp
        inc ebx
        jmp next
 right:	mov quantity, 0
		inc flg	
 endcmp:    ret
compare endp
end start 
