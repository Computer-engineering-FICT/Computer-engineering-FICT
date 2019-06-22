DATA SECTION
;
KEEP DD 0               ;temporary place to keep things
;
CODE SECTION
;
START:
PUSH -11                ;STD_OUTPUT_HANDLE
CALL GetStdHandle       ;get, in eax, handle to active screen buffer
PUSH 0,ADDR KEEP        ;KEEP receives output from API
PUSH 7,<'Done!',0Dh,0Ah>	;7=length of string
PUSH EAX                ;handle to active screen buffer
CALL WriteFile
XOR EAX,EAX             ;return eax=0 as preferred by Windows
RET