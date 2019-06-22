;                     ЛИСТИНГ 11.8
;   Универсальные процедуры, обеспечивающие выполнение
;             пакетных команд в режиме PIO
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst11_08.inc, 5.02.2001.

; Максимально допустимое время ожидания реакции
; устройства на пакетную команду (в тиках)
MaxCDWaitTime equ 200 ;10 секунд

DATASEG
; Область памяти для формирования пакетной команды
PacketCommand   DB 12 DUP (?)
; Область памяти для приема данных от дисковода
CDDataBuf       DB 4096 DUP (0)
; Размер принимаемого блока данных в байтах
CDBlockSize     DW ?
; Адрес считываемого сектора данных
CDSectorAddress DD ?
ENDS

CODESEG
;****************************************************
;*    ПОСЛАТЬ УСТРОЙСТВУ ATAPI ПАКЕТНУЮ КОМАНДУ,    *
;* ПРЕДУСМАТРИВАЮЩУЮ ПЕРЕДАЧУ ОДНОГО СЕКТОРА ДАННЫХ *
;*     РАЗМЕРОМ 2048 БАЙТ ОТ УСТРОЙСТВА К ХОСТУ     *
;* Входные параметры передаются через глобальные    *
;* перменные:                                       *
;* ChannelNumber - номер канала;                    *
;* DiskNumber - номер диска на канале;              *
;* PacketCommand - 12-байтный командный пакет;      *
;* CDBlockSize - размер принимаемого блока данных.  *
;****************************************************
PROC SendPacketDatCommand near
        pushad
        push    ES
; Задать режим CHS
        mov     [ATAAddressMode],0
; Послать ATA-команду передачи пакетной команды
        mov     [ATAFeatures],0
        mov     [ATASectorCount],0
        mov     [ATASectorNumber],0
        ; Загрузить размер передаваемого блока
        mov     AX,[CDBlockSize]
        mov     [ATACylinder],AX
        mov     [ATAHead],0
        mov     [ATACommand],0A0h
        call    SendCommandToHDD
        cmp     [DevErrorCode],0 ;проверить код ошибки
        jne     @@End    ;закончить, сохранив код ошибки

; Ожидание готовности дисковода к приему
; пакетной команды
        mov     DX,[ATABasePortAddr]
        add     DX,7     ;порт 1х7h
@@WaitDevice0:
        ; Проверить время выполнения команды
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,BSYWaitTime
        ja      @@Err1   ;ошибка тайм-аута
        ; Проверить готовность
        in      AL,DX
        test    AL,80h   ;состояние сигнала BSY
        jnz     @@WaitDevice0
        test    AL,1     ;состояние сигнала ERR
        jnz     @@Err6
        test    AL,08h   ;состояние сигнала DRQ
        jz      @@WaitDevice0
; Послать пакетную команду
        mov     DX,[ATABasePortAddr]
        mov     AX,[word ptr PacketCommand]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+2]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+4]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+6]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+8]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+10]
        out     DX,AX

; Ожидание готовности данных
        mov     DX,[ATABasePortAddr]
        add     DX,7   ;порт 1х7h
@@WaitDevice1:
        ; Проверить время выполнения команды
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,MaxCDWaitTime
        ja      @@Err1   ;ошибка тайм-аута
        ; Проверить готовность
        in      AL,DX
        test    AL,80h   ;состояние сигнала BSY
        jnz     @@WaitDevice1
        test    AL,1     ;состояние сигнала ERR
        jnz     @@Err6
        test    AL,08h   ;состояние сигнала DRQ
        jz      @@WaitDevice1

; Принять блок данных от контроллера
        ; Установить указатель ES:DI на буфер данных
        mov     AX,DS
        mov     ES,AX
        mov     DI,offset CDDataBuf
        ; Загрузить адрес регистра данных контроллера
        mov     DX,[ATABasePortAddr] ;порт 1x0h
        ; Загрузить в счетчик размер блока в байтах
        mov     CX,[CDBlockSize]
        ; Вычислить размер блока в 16-разрядных словах
        shr     CX,1 ;разделить размер блока на 2
        ; Принять блок данных
        rep     insw
        ; Успешное завершение приема данных
        jmp short @@End

; Записать код ошибки
@@Err1: mov     [DevErrorCode],1
        jmp short @@End
@@Err6: mov     [DevErrorCode],6

@@End:  pop     ES
        popad
        ret
ENDP SendPacketDatCommand


;***********************************************
;*  ПОСЛАТЬ УСТРОЙСТВУ ATAPI ПАКЕТНУЮ КОМАНДУ, *
;*     НЕ ПРЕДУСМАТРИВАЮЩУЮ ПЕРЕДАЧИ ДАННЫХ    *
;* Входные параметры передаются через          *
;* глобальные перменные:                       *
;* ChannelNumber - номер канала;               *
;* DiskNumber - номер диска на канале;         *
;* PacketCommand - 12-байтный командный пакет. *
;***********************************************
PROC SendPacketNoDatCommand near
        pushad
        push    ES
; Задать режим CHS
        mov     [ATAAddressMode],0
; Послать ATA-команду передачи пакетной команды
        mov     [ATAFeatures],0
        mov     [ATASectorCount],0
        mov     [ATASectorNumber],0
        mov     [ATACylinder],0
        mov     [ATAHead],0
        mov     [ATACommand],0A0h
        call    SendCommandToHDD
        cmp     [DevErrorCode],0 ;проверить код ошибки
        jne     @@End  ;закончить, сохранив код ошибки
; Ожидание готовности дисковода к приему
; пакетной команды
        mov     DX,[ATABasePortAddr]
        add     DX,7   ;порт 1х7h
@@WaitDevice0:
        ; Проверить время ожидания
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,BSYWaitTime
        ja      @@Err1   ;ошибка тайм-аута
        ; Проверить готовность
        in      AL,DX
        test    AL,80h   ;состояние сигнала BSY
        jnz     @@WaitDevice0
        test    AL,1     ;состояние сигнала ERR
        jnz     @@Err6
        test    AL,08h   ;состояние сигнала DRQ
        jz      @@WaitDevice0
; Послать пакетную команду
        mov     DX,[ATABasePortAddr]
        mov     AX,[word ptr PacketCommand]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+2]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+4]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+6]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+8]
        out     DX,AX
        mov     AX,[word ptr PacketCommand+10]
        out     DX,AX

; Ожидание подтверждения приема команды
        mov     DX,[ATABasePortAddr]
        add     DX,7   ;порт 1х7h
@@WaitDevice1:
        ; Проверить время выполнения команды
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,MaxCDWaitTime
        ja      @@Err1   ;ошибка тайм-аута
        ; Ожидать освобождения устройства
        in      AL,DX
        test    AL,80h   ;состояние сигнала BSY
        jnz     @@WaitDevice1
        test    AL,1     ;состояние сигнала ERR
        jnz     @@Err6
        test    AL,40h   ;состояние сигнала DRDY
        jz      @@WaitDevice1
        jmp short @@End

; Записать код ошибки
@@Err1: mov     [DevErrorCode],1
        jmp short @@End
@@Err6: mov     [DevErrorCode],6
@@End:  pop     ES
        popad
        ret
ENDP SendPacketNoDatCommand
ENDS
