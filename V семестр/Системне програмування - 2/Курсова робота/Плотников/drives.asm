;Программа ищет дисководы и определяет их тип 
;(жесткие/гикие/сетевые и т. д.)
;правильность анализа зависит от правильности 
;их установки в системе
;
;Компилируется в com-файл  

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

	dtError		equ 0		;Неверная буква дисковода
	dtFixed		equ 1		;жесткий диск
	dtRemovable	equ 2		;гибкий диск 
	dtRemote	equ 3		;удаленный (сетевой) 
	dtCDROM		equ 4		;CDROM совместимый с MSCDEX v2.0+ 
	dtSUBST		equ 5		;Виртуальный диск 
	dtRAMDrive	equ 6		;Электронный диск

.model tiny

.code					;начало сегмента кода и данных
org	100h				;отступ для PSP

begin:        
	mes	m_devs	
	xor	cl,cl			;Счетчик дисков
cc0:
	inc	cl
	mov	drive,cl
	push	cx
	call	dr_type			;Вызов процедуры классфикации
	pop	cx			;дисковода
	
	cmp	al,3
	jb	c_cmp1
	ja	c_cmp5  

	mes_let	cl			;Диск удаленный
	mes	m_rem
	jmp	cc1
c_cmp1:
	cmp	al,1
	jb	cc1
	ja	c_cmp2

	mes_let	cl
	mes	m_hard			;Диск жесткий
	jmp	cc1

gemor:	jmp	cc0

c_cmp2:					;Дисковод гибких дисков 
	push	cx
	call	Fl_Drs			;Проверяем, не превышает ли 
	pop	cx			;номер текущего флоповода
	cmp	cl,al			;общее количество флоповодов
	ja	cc1			;в системе

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

	mes_let	cl			;Виртуальный диск
	mes	m_subst
	jmp	cc1	
c_cmp6:
	mes_let	cl
	mes	m_ram			;Электронный диск
cc1:
	cmp	cl,26	
	jbe	gemor

	ret


fl_drs	proc			;Функция вычисления количества флоповодов
                                ;Результат - в al
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
	mov	ah,19h    	;Получение номера текущего дисковода в al 
	int	21h
	mov	Drive,al
	inc	Drive
@CDROMcheck:
	mov	ax,1500h  	;Получить количество MSCDEXv2.00+-совместимых
	sub	bx,bx		;CD-ROMов
	int	2Fh
	or	bx,bx
	jz	@@2		;Количество = 0 
	mov	ax,150Bh	;Проверить, является ли текущий дисковод
	sub	ch,ch		;CD-ROMом
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
	mov	bl,Drive	;виртуальным
	int	21h

        jc	@@8
	test	dh,80h

        jz	@@3
	mov	bl,dtSUBST
	jmp	@@7
@@3:    
	and	dh,10h		;-|-|-|-
	jz	@@8             ;сетевым
	mov	bl,dtRemote
	jmp	@@7
@@8:
        mov     ax,4408h     	;-|-|-|-
        mov     bl,Drive	;съемным
        int     21h
        jc      @@5
        or      al,al
        jz      @@6

        push    ds           	;-|-|-|-
        mov     ax,ss		;электронным
        mov     ds,ax
        mov     si,sp
        sub     sp,28h	     	;выделить 28h байт стека под буфер
        mov     dx,sp		;для пакета выходной информации
        mov     ax,440Dh     	;обращение к блочному устройству
        mov     cx,860h      	;со считыванием его параметров
        int     21h          	;т.к. виртуальный и электронный диски
        mov     sp,si		;не поддерживают эту ф., то по CF
        pop     ds		;можно судить о типе диска
        mov     bl,dtRAMDrive
        jc      @@7
        mov     bl,dtfixed
        jmp     @@7
@@5:
	sub	bl,bl		;0=dtError 
	jmp	@@7
@@6:
	mov	bl,dtRemovable	;НГМД 
@@7:
	mov	al,bl		;Результат должен находиться в al
	ret

dr_type	endp

drive	db	0

m_flop	db	':	НГМД',10,13,36
m_hard	db	':	НЖМД',10,13,36
m_cdrom	db	':	CD-ROM',10,13,36
m_rem	db	':	Удаленный',10,13,36
m_ram	db	':	Электронный',10,13,36
m_subst	db	':	Виртуальный (Subst)',10,13,36
m_devs	db	'В системе имеются следующие внешние накопители:',10,13,36

end	begin
