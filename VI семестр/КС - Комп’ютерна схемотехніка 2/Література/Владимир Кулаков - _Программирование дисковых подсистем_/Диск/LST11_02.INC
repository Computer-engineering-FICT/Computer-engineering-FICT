;                     ЛИСТИНГ 11.2
;   Процедуры для поиска жесткого диска, определения
;          его параметров и считывания данных
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst11_02.inc, 4.02.2001.

DATASEG
; Сообщение о неудачном завершении поиска
DiskNotFoundTxt DB LIGHTRED,12,33,"Диск не найден",0
; Адрес считываемого сектора в режиме LBA
SectorAddress   DD ?
; Выравнивание массива данных по четным адресам
; (необходимо только для режима DMA)
EVEN 
; Область памяти для приема информации от диска
Sector512 DB 512 DUP (?)
ENDS

CODESEG
;*************************************************
;*     ЧТЕНИЕ ИДЕНТИФИКАТОРА ЖЕСТКОГО ДИСКА      *
;* Входные параметры передаются через глобальные *
;* переменные:                                   *
;* ChannelNumber - номер канала (1 или 2);       *
;* DiskNumber - номер диска на канале (0 или 1). *
;* Идентификационный блок данных считывается     *
;* в массив Sector512.                           *
;*************************************************
PROC ReadHDD_ID near
        pushad
        push    ES
; Задать режим CHS
        mov     [ATAAddressMode],0
; Послать команду идентификации устройства
        mov     [ATAFeatures],0
        mov     [ATAHead],0
        mov     [ATACommand],0ECh
        call    SendCommandToHDD
        cmp     [DevErrorCode],0 ;проверить код ошибки
        jne     @@End  ;закончить, сохранив код ошибки
; Ожидать готовность данных HDD
        mov     AX,0
        mov     ES,AX
        mov     DX,[ATABasePortAddr]
        add     DX,7     ;адрес регистра состояния
@@WaitCompleet:
        ; Проверить время выполнения команды
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,MaxHDDWaitTime
        ja      @@Error1 ;ошибка тайм-аута
        ; Проверить готовность
        in      AL,DX
        test    AL,80h   ;состояние сигнала BSY
        jnz     @@WaitCompleet
        test    AL,1     ;состояние сигнала ERR
        jnz     @@Error6
        test    AL,08h   ;состояние сигнала DRQ
        jz      @@WaitCompleet
; Принять блок данных от контроллера
        mov     AX,DS
        mov     ES,AX
        mov     DI,offset Sector512
        mov     DX,[ATABasePortAddr] ;регистр данных
        mov     CX,256   ;число считываемых слов
        rep     insw     ;принять блок данных
        jmp short @@End
; Записать код ошибки
@@Error1:
        mov     [DevErrorCode],1
        jmp short @@End
@@Error6:
        mov     [DevErrorCode],6
@@End:  pop     ES
        popad
        ret
ENDP ReadHDD_ID


;****************************************************
;*                 ПОИСК ДИСКОВОДА                  *
;* Поиск производится только по каналам 1 и 2, пока *
;* не будет обнаружен первый диск (диск C:) или не  *
;* будут опрошены оба канала.                       *
;* Входных параметров процедура не имеет.           *
;* В случае успешного завершения поиска:            *
;* - адрес порта найденного устройства сохраняется  *
;*   в ATABasePortAddr;                             *
;* - номер канала сохраняется в ChannelNumber;      *
;* - номер устройства сохраняется в DiskNumber.     *
;* В случае, если устройство не найдено,            *
;* производится аварийный выход из программы.       *
;****************************************************
PROC FindHDD near
        pusha
; Установить начальный номер канала
        mov     [ChannelNumber],1
; Цикл опроса каналов
@@AskMaster:
        ; Опросить Master-диск
        mov     [DiskNumber],0
        call    ReadHDD_ID
        cmp     [DevErrorCode],0
        je      @@DiskFound    ;выход из цикла поиска
@@AskSlave:
        ; Опросить Slave-диск
        mov     [DiskNumber],1
        call    ReadHDD_ID
        cmp     [DevErrorCode],0
        je      @@DiskFound    ;выход из цикла поиска
@@NextCannel:
        inc     [ChannelNumber]
        cmp     [ChannelNumber],3
        jb      @@AskMaster    ;опросить следующий канал
; Дисковод не найден - аварийный выход в DOS
        call    ClearScreen
        mov     SI,offset DiskNotFoundTxt
        call    ShowColorString
        mov     AH,4Ch ;выход в DOS
	int     21h
; Дисковод найден
@@DiskFound:
        popa
        ret
ENDP FindHDD


;*************************************************
;*  ЧТЕНИЕ СЕКТОРА ЖЕСТКОГО ДИСКА В РЕЖИМЕ LBA   *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала (1 или 2);       *
;* DiskNumber - номер диска на канале (0 или 1); *
;* SectorAddress - номер считываемого сектора.   *
;* Сектор считывается основной сегмент данных,   *
;* в массив Sector512.                           *
;*************************************************
PROC ReadHDDSector NEAR
        pushad
        push    ES
; Задать режим LBA
        mov     [ATAAddressMode],1
; Послать команду чтения сектора (с повторами)
        mov     [ATAFeatures],0
        mov     [ATASectorCount],1
        mov     EAX,[SectorAddress]
        mov     [dword ptr ATASectorNumber],EAX
        mov     [ATACommand],20h
        call    SendCommandToHDD
        cmp     [DevErrorCode],0
        jne     @@End    ;закончить, сохранив код ошибки
; Ожидать готовность данных HDD
        mov     AX,0
        mov     ES,AX
        mov     DX,[ATABasePortAddr]
        add     DX,7     ;адрес регистра состояния
@@WaitCompleet:
        ; Проверить время выполнения команды
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,MaxHDDWaitTime
        ja      @@Error1 ;ошибка тайм-аута
        ; Проверить готовность
        in      AL,DX
        test    AL,80h   ;состояние сигнала BSY
        jnz     @@WaitCompleet
        test    AL,08h   ;состояние сигнала DRQ
        jz      @@WaitCompleet
; Принять сектор
        mov     AX,DS
        mov     ES,AX
        mov     DI,offset Sector512
        mov     DX,[ATABasePortAddr] ;регистр данных
        mov     CX,256   ;число считываемых слов
        rep     insw     ;принять блок данных
; Сбросить признак ошибки
        mov     [DevErrorCode],0
        jmp short @@End
; Записать номер ошибки
@@Error1:
        mov     [DevErrorCode],1 ;ошибка тайм-аута
        jmp short @@End
@@End:  pop     ES
        popad
        ret
ENDP ReadHDDSector
ENDS
