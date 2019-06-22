.386
.model flat,stdcall
option casemap:none

include e:\masm32\include\windows.inc
include e:\masm32\include\kernel32.inc
include e:\masm32\include\user32.inc
include e:\masm32\include\ole32.inc
include e:\masm32\include\netapi32.inc

includelib e:\masm32\lib\kernel32.lib
includelib e:\masm32\lib\user32.lib
includelib e:\masm32\lib\ole32.lib
includelib e:\masm32\lib\netapi32.lib

; .const
 .data
                                           
	Message  		db 	'Input Message: ',0
	MesIP	 	db 	'Input IP or Computer Name of Network: ',0

	ConsoleTitle 	db 	'Send message for PC in VT536',0
	menu1		db	'1. Send message to PC...',10,13,0
	menu2		db	'2. Send message to All PC.',10,13,0
	menu3		db	'3. Send Message to IP...',10,13
			db	'0. Exit',10,13
			db	'Please input digit of your choise: ',0
	pc1		db	'pm-01',0
	pc2		db 	'pm-02',0
	pc3		db	'pm-03',0
	pc4		db	'pm-04',0
	pc5		db	'pm-05',0
	pc6		db	'pm-06',0
	pc7		db	'pm-07',0
	pc8		db	'pm-08',0
	pc9		db	'pm-09',0
	pc10		db	'pm-10',0
	pc11		db	'pm-11',0
	pc12		db	'pm-12',0
	pc13		db	'pm-13',0
	pc14		db	'pm-14',0
	pc15		db	'pm-15',0
	pc16		db	'10.18.56.255',0; May be VT536 need poprobyvat!!!	    

	hOutPut		dd 	?
	hInput		dd 	?
	nRead		dd	?
	nWriten		dd	?
	entry		db	5 dup(0),0
	
    	PC		db	64  dup(0)
    	mess		db  	256 dup(0),0
    	mPC		db	'Please input number PC: ',0
    	Merror		db	'Your choise is bad!!! Please Try again : ',0

 .code
;======================================================================================================
_FillMemoryOfSymbol	proc 	Mem:DWORD,SizeMem:WORD,Symbol:WORD
	pusha
	mov	ebx,Mem
	xor	eax,eax
lclear:	inc	eax
	push	word ptr Symbol
	pop	word ptr [ebx+eax-1]
	cmp	ax,SizeMem
	jne	lclear
	popa
	ret
_FillMemoryOfSymbol	endp

_len 		proc param1:DWORD
	invoke lstrlen,param1
	inc eax
	ret
_len 		endp

sizem 		proc Source:DWORD,Param: BYTE
	LOCAL len: DWORD

	invoke lstrlen,Source
	inc eax
	add eax,eax
	cmp Param,1
	je @F
	mov len,eax
	invoke CoTaskMemAlloc,len
@@: ret
sizem 		endp

NetSend 		proc sTo,sMessage:DWORD
	LOCAL wTo,wMessage:DWORD

	invoke sizem,sMessage,0
	mov wMessage,eax

	invoke sizem,sTo,0
	mov wTo,eax

	invoke _len,sMessage
	invoke MultiByteToWideChar,CP_ACP, 0, sMessage, -1, wMessage,eax

	invoke _len,sTo
	invoke MultiByteToWideChar,CP_ACP, 0, sTo, -1, wTo,eax

	invoke sizem,sMessage,1
	invoke NetMessageBufferSend,NULL, wTo, NULL, wMessage,eax
	cmp eax,0
	je @F
;Message about of Error
	invoke MessageBox,0,sTo,0,MB_ICONERROR

@@:
	invoke CoTaskMemFree,wTo
	invoke CoTaskMemFree,wMessage

ret
NetSend 		endp

_NetSend 		proc comp:DWORD
	LOCAL 	ntemp            :DWORD ;Readen bytes
	pusha

   	invoke 	lstrlen,addr Message
   	invoke 	WriteConsole, hOutPut, addr Message, eax, addr nWriten,NULL

	invoke 	_FillMemoryOfSymbol,addr mess,256,00h

   	invoke 	ReadConsole, hInput, addr mess, 256, addr ntemp, NULL

	invoke	OemToChar,addr mess,addr mess

	invoke 	NetSend,comp,addr mess   
	popa
	ret

_NetSend 		endp

_NetSendIP  	proc
	LOCAL 	ntemp            :DWORD ;Readen bytes
	
	invoke	lstrlen,addr MesIP
	invoke	WriteConsole,hOutPut,addr MesIP,eax,addr nWriten,NULL
	
	mov	ebx,offset PC
	invoke 	_FillMemoryOfSymbol,addr PC,64,00h
	
   	invoke 	ReadConsole, hInput, offset PC, 64, ADDR nRead, NULL
	
	mov	eax,offset PC
	add	eax,nRead
	sub	eax,2
	invoke 	_FillMemoryOfSymbol,eax,2,00h
	
   	invoke 	lstrlen,addr Message
   	invoke 	WriteConsole, hOutPut, addr Message, eax, addr nWriten,NULL
   	
   	;Query Message sending PC
   	invoke 	ReadConsole, hInput, addr mess, 256, ADDR ntemp, NULL
	invoke	OemToChar,addr mess,addr mess
	
	invoke 	NetSend,addr PC,addr mess      



	ret
_NetSendIP  	endp

Main 		proc
	LOCAL 	ntemp            :DWORD ;Readen bytes

; Set title console window
   	invoke 	SetConsoleTitle, addr ConsoleTitle 
	
;Get Handle of output data
   	invoke 	GetStdHandle, STD_OUTPUT_HANDLE
  	mov 	hOutPut, eax

;Get Handle of input data
   	invoke 	GetStdHandle,STD_INPUT_HANDLE
   	mov 	hInput, eax

menu:    
    ;============================================================
    invoke 	lstrlen,addr menu1
    invoke 	WriteConsole, hOutPut, addr menu1, eax,addr nWriten, NULL
    
    invoke 	lstrlen,addr menu2
    invoke 	WriteConsole, hOutPut, addr menu2, eax,addr nWriten, NULL

    invoke 	lstrlen,addr menu3
    invoke 	WriteConsole, hOutPut, addr menu3, eax,addr nWriten, NULL
    ;============================================================
input1:  	invoke 	ReadConsole, hInput, addr entry, 3, addr ntemp, NULL
	cmp  	entry,30h
   	je	exit
	cmp	entry,31h
	je	_pc
	cmp	entry,32h
	je	_all
	cmp	entry,33h
	je	_IP
	
	invoke 	lstrlen,addr Merror
	invoke 	WriteConsole,hOutPut,addr Merror,eax,addr nWriten,NULL
	jmp	input1
_IP:	invoke	_NetSendIP
	jmp	menu	
_pc:
	invoke	lstrlen,addr mPC
	invoke  	WriteConsole,hOutPut,addr mPC,eax,addr nWriten,NULL
input2:  	invoke 	ReadConsole, hInput, addr entry, 4, addr ntemp, NULL
	cmp	word ptr entry,0d31h
	je	l1
	cmp	word ptr entry,0d32h
	je	l2	
	cmp	word ptr entry,0d33h
	je	l3	
	cmp	word ptr entry,0d34h
	je	l4	
	cmp	word ptr entry,0d35h
	je	l5	
	cmp	word ptr entry,0d36h
	je	l6	
	cmp	word ptr entry,0d37h
	je	l7	
	cmp	word ptr entry,0d38h
	je	l8	
	cmp	word ptr entry,0d39h
	je	l9	
	cmp	word ptr entry,3031h
	je	l10
	cmp	word ptr entry,3131h
	je	l11
	cmp	word ptr entry,3231h
	je	l12	
	cmp	word ptr entry,3331h
	je	l13	
	cmp	word ptr entry,3431h
	je	l14	
	cmp	word ptr entry,3531h
	je	l15	

	invoke 	lstrlen,addr Merror
	invoke 	WriteConsole,hOutPut,addr Merror,eax,addr nWriten,NULL
	jmp	input2
	
l1:	invoke 	_NetSend,addr pc1
	jmp	menu
l2:	invoke 	_NetSend,addr pc2
	jmp	menu
l3:	invoke 	_NetSend,addr pc3
	jmp	menu
l4:	invoke 	_NetSend,addr pc4
	jmp	menu
l5:	invoke 	_NetSend,addr pc5
	jmp	menu
l6:	invoke 	_NetSend,addr pc6
	jmp	menu
l7:	invoke 	_NetSend,addr pc7
	jmp	menu
l8:	invoke 	_NetSend,addr pc8
	jmp	menu
l9:	invoke 	_NetSend,addr pc9
	jmp	menu
l10:	invoke 	_NetSend,addr pc10
	jmp	menu
l11:	invoke 	_NetSend,addr pc11
	jmp	menu
l12:	invoke 	_NetSend,addr pc12
	jmp	menu
l13:	invoke 	_NetSend,addr pc13
	jmp	menu
l14:	invoke 	_NetSend,addr pc14
	jmp	menu
l15:	invoke 	_NetSend,addr pc15
	jmp	menu
_all:
	invoke	_NetSend,addr pc16
	jmp	menu
exit:   
   	;Exit
   	invoke 	ExitProcess,0
Main 		endp

end Main