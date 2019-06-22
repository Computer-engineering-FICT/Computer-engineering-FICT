.386
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\Comctl32.inc

includelib \masm32\lib\Comctl32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
 
WinMain proto :DWORD
FileOpen proto :DWORD, :DWORD

MEMSIZE equ 65535
bHeigth equ 17
bWigth equ 70
 
.data 
	info db "Author: Sulyma Aleksandr", 10, "IP-53", 10, "5318",0
	about db "About",0
	ClassName db "Class",0 
	AppName db "Sulyma-12",0 
	MenuName db "Menu",0 
	EditClass db "Edit",0
	BtnClass db "Button",0
	lab1 db "1",0
	lab2 db "2",0
	lab3 db "3",0
	lab4 db "4",0
	lab5 db "5",0
	lab6 db "6",0
	lab7 db "7",0
	lab8 db "8",0
	lab9 db "9",0
	lab10 db "10",0
	lab11 db "11",0
	lab12 db "12",0
	File1 db "labs/Sulyma-1.asm",0
	ttp1 db "Sulyma-1.asm",0
	File2 db "labs/Sulyma-2.asm",0
	ttp2 db "Sulyma-2.asm",0
	File3 db "labs/Sulyma-3.asm",0
	ttp3 db "Sulyma-3.asm",0
	File4 db "labs/Sulyma-4.asm",0
	ttp4 db "Sulyma-4.asm",0
	File5 db "labs/Sulyma-5.asm",0
	ttp5 db "Sulyma-5.asm",0
	File6 db "labs/Sulyma-6.asm",0
	ttp6 db "Sulyma-6.asm",0
	File7 db "labs/Sulyma-7.asm",0
	ttp7 db "Sulyma-7.asm",0
	File8 db "labs/Sulyma-8.asm",0
	ttp8 db "Sulyma-8.asm",0
	File9 db "labs/Sulyma-9.asm",0
	ttp9 db "Sulyma-9.asm",0
	File10 db "labs/Sulyma-10.asm",0
	ttp10 db "Sulyma-10.asm",0
	File11 db "labs/Sulyma-11.asm",0
	ttp11 db "Sulyma-11.asm",0
	File12 db "labs/Sulyma-12.asm",0
	ttp12 db "Sulyma-12.asm",0
	check dw 0
	hInstance HINSTANCE ? 
	hStatus HWND ?
	hEdit HWND ?
	hFile HANDLE ? 
	hMemory HANDLE ?
	pMemory DWORD ? 
	SizeReadWrite DWORD ?
	hlab1 HWND ?
	hlab2 HWND ?
	hlab3 HWND ?
	hlab4 HWND ?
	hlab5 HWND ?
	hlab6 HWND ?
	hlab7 HWND ?
	hlab8 HWND ?
	hlab9 HWND ?
	hlab10 HWND ?
	hlab11 HWND ?
	hlab12 HWND ?
	
.code
start: 
	invoke GetModuleHandle, NULL 
	mov hInstance,eax     
	invoke WinMain, hInstance
	invoke ExitProcess, eax
 
WinMain proc hInst:HINSTANCE
    LOCAL wc:WNDCLASSEX
    LOCAL msg:MSG
 
    mov   wc.cbSize,sizeof WNDCLASSEX  
    mov   wc.style, CS_HREDRAW or CS_VREDRAW
    mov   wc.lpfnWndProc, offset WndProc
    mov   wc.cbClsExtra,NULL
    mov   wc.cbWndExtra,NULL
    push  hInstance
    pop   wc.hInstance
    mov   wc.hbrBackground,COLOR_WINDOW
    mov   wc.lpszMenuName,offset MenuName
    mov   wc.lpszClassName,offset ClassName
    invoke LoadIcon,hInstance,100
    mov   wc.hIcon,eax
    mov   wc.hIconSm,eax
    invoke LoadCursor,NULL,IDC_ARROW
    mov   wc.hCursor,eax
    invoke RegisterClassEx, addr wc 
    invoke CreateWindowEx,0, ADDR ClassName, ADDR AppName, WS_OVERLAPPEDWINDOW or WS_VISIBLE, 100, 100, 755, 600, NULL, NULL, hInst, NULL
    .WHILE TRUE 
       invoke GetMessage, ADDR msg,NULL,0,0
    .BREAK .IF (!eax)
       invoke DispatchMessage, ADDR msg
    .ENDW
     mov     eax,msg.wParam
     ret
WinMain endp
WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM
		

		local pos

	.IF uMsg==WM_CREATE
		invoke CreateStatusWindow,WS_CHILD or WS_VISIBLE,NULL, hWnd, 200
        mov hStatus, eax
		INVOKE CreateWindowEx,NULL, ADDR EditClass, NULL,\
            WS_VISIBLE or WS_CHILD or ES_MULTILINE or WS_VSCROLL or ES_AUTOVSCROLL or WS_HSCROLL or ES_AUTOHSCROLL,\
            0,\
            0,\
			0,\
			0,\
			hWnd,\
			75,\
            hInstance,\
			NULL
		mov ecx, 0
		mov hEdit,eax
		invoke CreateWindowEx,0, ADDR BtnClass,ADDR lab1,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,1,hInstance,0
		mov hlab1, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab2,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,2,hInstance,0
		mov hlab2, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab3,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,3,hInstance,0
		mov hlab3, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab4,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,4,hInstance,0
		mov hlab4, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab5,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,5,hInstance,0
		mov hlab5, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab6,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,6,hInstance,0
		mov hlab6, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab7,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,7,hInstance,0
		mov hlab7, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab8,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,8,hInstance,0
		mov hlab8, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab9,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,9,hInstance,0
		mov hlab9, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab10,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,10,hInstance,0
		mov hlab10, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab11,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,11,hInstance,0
		mov hlab11, eax
		add ecx, bWigth
		invoke CreateWindowEx,0,ADDR BtnClass,ADDR lab12,WS_CHILD  or WS_VISIBLE,ecx,0,bWigth,bHeigth,hWnd,12,hInstance,0
		mov hlab12, eax
	.ELSEIF uMsg==WM_COMMAND
        mov eax,wParam
		.IF ax==1
			invoke FileOpen, offset File1,offset ttp1
		.ELSEIF ax==2
			invoke FileOpen, offset File2,offset ttp2
		.ELSEIF ax==3
			invoke FileOpen, offset File3,offset ttp3
		.ELSEIF ax==4
			invoke FileOpen, offset File4,offset ttp4
		.ELSEIF ax==5
			invoke FileOpen, offset File5,offset ttp5
		.ELSEIF ax==6
			invoke FileOpen, offset File6,offset ttp6
		.ELSEIF ax==7
			invoke FileOpen, offset File7,offset ttp7
		.ELSEIF ax==8
			invoke FileOpen, offset File8,offset ttp8
		.ELSEIF ax==9
			invoke FileOpen, offset File9,offset ttp9
		.ELSEIF ax==10
			invoke FileOpen, offset File10,offset ttp10
		.ELSEIF ax==11
			invoke FileOpen, offset File11,offset ttp11
		.ELSEIF ax==12
			invoke FileOpen, offset File12,offset ttp12
		.ELSEIF ax==13
			invoke MessageBoxA,0, offset info, offset about,0
		.ELSEIF ax==90
			invoke DestroyWindow,hWnd
		.ELSE
			invoke DefWindowProc,hWnd,uMsg,wParam,lParam
			ret
        .ENDIF
		
	.ELSEIF uMsg == WM_SIZE
		mov eax,lParam
		mov edx,eax
		shr edx,16
		and eax,0ffffh
		sub edx, 40
		sub eax, 0

		mov pos, 0

		invoke MoveWindow,hEdit,0,20,eax,edx,TRUE
		mov pos, 0
		invoke MoveWindow,hlab1,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab2,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab3,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab4,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab5,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab6,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab7,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab8,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab9,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab10,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab11,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hlab12,pos,0,bWigth,bHeigth,TRUE
		add pos, bWigth
		invoke MoveWindow,hStatus,0,0,0,0,TRUE
		
	.ELSEIF uMsg==WM_DESTROY           
        invoke PostQuitMessage,NULL
		
	.ELSE
        invoke DefWindowProc,hWnd,uMsg,wParam,lParam
        ret
    .ENDIF
    xor eax,eax
    ret
WndProc endp
FileOpen proc filename:DWORD, message:DWORD
	.IF check==ax
		invoke SendMessage,hEdit,WM_SETTEXT,NULL,NULL
		invoke SendMessage,hStatus,WM_SETTEXT,NULL, NULL
		mov check, 0
	.ELSE
		mov check, ax
	invoke CreateFile,filename,GENERIC_READ,FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_READONLY,NULL
	mov hFile,eax
	invoke GlobalAlloc,GMEM_MOVEABLE or GMEM_ZEROINIT,MEMSIZE
	mov  hMemory,eax
	invoke GlobalLock,hMemory
	mov  pMemory,eax
	invoke ReadFile,hFile,pMemory,MEMSIZE-1,ADDR SizeReadWrite,NULL
	invoke SendMessage,hEdit,WM_SETTEXT,NULL,pMemory
	invoke SendMessage,hStatus,WM_SETTEXT,NULL, message
	invoke CloseHandle,hFile
	invoke GlobalUnlock,pMemory
	invoke GlobalFree,hMemory
	.ENDIF
	ret 8
FileOpen endp
end start

