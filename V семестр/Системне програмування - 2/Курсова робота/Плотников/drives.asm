;�ணࠬ�� ��� ��᪮���� � ��।���� �� ⨯ 
;(���⪨�/�����/�⥢� � �. �.)
;�ࠢ��쭮��� ������� ������ �� �ࠢ��쭮�� 
;�� ��⠭���� � ��⥬�
;
;������������ � com-䠩�  

mes_let	macro	var
	mov	dl,var
	add	dl,'@'
	mov	ah,2
	int	21h
endm

mes	macro	text		
	lea	dx,text
	mov	ah,9
	int	21h		
endm

	dtError		equ 0		;����ୠ� �㪢� ��᪮����
	dtFixed		equ 1		;���⪨� ���
	dtRemovable	equ 2		;������ ��� 
	dtRemote	equ 3		;㤠����� (�⥢��) 
	dtCDROM		equ 4		;CDROM ᮢ���⨬� � MSCDEX v2.0+ 
	dtSUBST		equ 5		;����㠫�� ��� 
	dtRAMDrive	equ 6		;�����஭�� ���

.model tiny

.code					;��砫� ᥣ���� ���� � ������
org	100h				;����� ��� PSP

begin:        
	mes	m_devs	
	xor	cl,cl			;���稪 ��᪮�
cc0:
	inc	cl
	mov	drive,cl
	push	cx
	call	dr_type			;�맮� ��楤��� �����䨪�樨
	pop	cx			;��᪮����
	
	cmp	al,3
	jb	c_cmp1
	ja	c_cmp5  

	mes_let	cl			;��� 㤠�����
	mes	m_rem
	jmp	cc1
c_cmp1:
	cmp	al,1
	jb	cc1
	ja	c_cmp2

	mes_let	cl
	mes	m_hard			;��� ���⪨�
	jmp	cc1

gemor:	jmp	cc0

c_cmp2:					;��᪮��� ������ ��᪮� 
	push	cx
	call	Fl_Drs			;�஢��塞, �� �ॢ�蠥� �� 
	pop	cx			;����� ⥪�饣� 䫮������
	cmp	cl,al			;��饥 ������⢮ 䫮�������
	ja	cc1			;� ��⥬�

	mes_let	cl
	mes	m_flop
	jmp	cc1
c_cmp4:
	mes_let	cl			;CDROM
	mes	m_cdrom
	jmp	cc1	
c_cmp5:
	cmp	al,5
	jb	c_cmp4
	ja	c_cmp6

	mes_let	cl			;����㠫�� ���
	mes	m_subst
	jmp	cc1	
c_cmp6:
	mes_let	cl
	mes	m_ram			;�����஭�� ���
cc1:
	cmp	cl,26	
	jbe	gemor

	ret


fl_drs	proc			;�㭪�� ���᫥��� ������⢠ 䫮�������
                                ;������� - � al
        int 11h			
        test al,00000001b
        jz  @@1
        mov cl,6
        shr al,cl
        and al,3
        inc al
        ret
@@1:
        xor al,al
        ret 

fl_drs	endp



dr_type	proc

	cmp	Drive,0
        jne     @CDROMcheck
	mov	ah,19h    	;����祭�� ����� ⥪�饣� ��᪮���� � al 
	int	21h
	mov	Drive,al
	inc	Drive
@CDROMcheck:
	mov	ax,1500h  	;������� ������⢮ MSCDEXv2.00+-ᮢ���⨬��
	sub	bx,bx		;CD-ROM��
	int	2Fh
	or	bx,bx
	jz	@@2		;������⢮ = 0 
	mov	ax,150Bh	;�஢����, ���� �� ⥪�騩 ��᪮���
	sub	ch,ch		;CD-ROM��
	mov	cl,Drive
        dec     cl      
	int	2Fh     
	cmp	bx,0ADADh
	jne	@@2
	or	ax,ax
	jz	@@2
	mov	bl,dtCDROM
	jmp	@@7
@@2:
	mov	ax,4409h     	;-|-|-|-
	mov	bl,Drive	;����㠫��
	int	21h

        jc	@@8
	test	dh,80h

        jz	@@3
	mov	bl,dtSUBST
	jmp	@@7
@@3:    
	and	dh,10h		;-|-|-|-
	jz	@@8             ;�⥢�
	mov	bl,dtRemote
	jmp	@@7
@@8:
        mov     ax,4408h     	;-|-|-|-
        mov     bl,Drive	;�ꥬ��
        int     21h
        jc      @@5
        or      al,al
        jz      @@6

        push    ds           	;-|-|-|-
        mov     ax,ss		;���஭��
        mov     ds,ax
        mov     si,sp
        sub     sp,28h	     	;�뤥���� 28h ���� �⥪� ��� ����
        mov     dx,sp		;��� ����� ��室��� ���ଠ樨
        mov     ax,440Dh     	;���饭�� � ���筮�� ���ன���
        mov     cx,860h      	;� ���뢠���� ��� ��ࠬ��஢
        int     21h          	;�.�. ����㠫�� � ���஭�� ��᪨
        mov     sp,si		;�� �����ন���� ��� �., � �� CF
        pop     ds		;����� �㤨�� � ⨯� ��᪠
        mov     bl,dtRAMDrive
        jc      @@7
        mov     bl,dtfixed
        jmp     @@7
@@5:
	sub	bl,bl		;0=dtError 
	jmp	@@7
@@6:
	mov	bl,dtRemovable	;���� 
@@7:
	mov	al,bl		;������� ������ ��室����� � al
	ret

dr_type	endp

drive	db	0

m_flop	db	':	����',10,13,36
m_hard	db	':	����',10,13,36
m_cdrom	db	':	CD-ROM',10,13,36
m_rem	db	':	��������',10,13,36
m_ram	db	':	�����஭��',10,13,36
m_subst	db	':	����㠫�� (Subst)',10,13,36
m_devs	db	'� ��⥬� ������� ᫥���騥 ���譨� ������⥫�:',10,13,36

end	begin
