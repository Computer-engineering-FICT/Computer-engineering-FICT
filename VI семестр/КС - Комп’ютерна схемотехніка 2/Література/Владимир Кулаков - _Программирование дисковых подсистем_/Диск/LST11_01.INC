;                     ЛИСТИНГ 11.1
;     Процедура сброса и универсальная процедура
;                для подачи ATA-команды
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst11_01.inc, 4.02.2001.

; Предельное время ожидания готовности к приему команды
; (в тиках)
BSYWaitTime equ 2
; Предельное время ожидания завершения операции
MaxHDDWaitTime equ 10

DATASEG
; Стандартные базовые адреса каналов 1 и 2
StandardATABases DW 1F0h, 170h
; Номер канала
ChannelNumber   DW ?
; Номер диска
DiskNumber      DB ?
; Базовый адрес группы портов контроллера ATA
ATABasePortAddr DW ?
; Параметры ATA-команды
ATAFeatures     DB ? ;особенности
ATASectorCount  DB ? ;количество обрабатываемых секторов
ATASectorNumber DB ? ;номер начального сектора
ATACylinder     DW ? ;номер начального цилиндра
ATAHead         DB ? ;номер начальной головки
ATAAddressMode  DB ? ;режим адресации (0 - CHS, 1 - LBA)
ATACommand      DB ? ;код команды, подлежащей выполнению
; Код ошибки (0 - нет ошибок, 1 - превышен допустимый
; интервал ожидания, 2 - неверный код режима адресации,
; 3 - неверный номер канала, 4 - неверный номер диска,
; 5 - неверный номер головки, 6 - ошибка при выполнении
; команды)
DevErrorCode DB ?
; Время начала очередной операции с диском
OpTime DD ?
ENDS

CODESEG
;****************************************************
;*          ПОСЛАТЬ КОМАНДУ ЗАДАННОМУ ДИСКУ         *
;* Входные параметры передаются через глобальные    *
;* переменные:                                      *
;* ChannelNumber - номер канала (1 или 2);          *
;* DiskNumber - номер диска (0 или 1);              *
;* ATAFeatures - "особенности";                     *
;* ATASectorCount - количество секторов;            *
;* ATASectorNumber - номер начального сектора;      *
;* ATACylinder - номер начального цилиндра;         *
;* ATAHead - номер начальной головки;               *
;* ATAAddressMode - режим адресации (0-CHS, 1-LBA); *
;* ATACommand - код команды.                        *
;* После успешного выполнения функции:              *
;* в ATABasePortAddr - базовый адрес HDD;           *
;* в OpTime - момент начала выполнения команды;     *
;* в DevErrorCode - ноль.                           *
;* При возникновении ошибки в DevErrorCode будет    *
;* возвращен код ошибки.                            *
;****************************************************
PROC SendCommandToHDD near
        pushad
; Запомнить время начала операции с диском
        ; Загрузить в ES сегмент данных BIOS
        mov     AX,0
        mov     ES,AX
        ; Запомнить текущее время
        mov     EAX,[ES:046Ch]
        mov     [OpTime],EAX
; Проверить значение кода режима
        cmp     [ATAAddressMode],1
        ja      @@Err2
; Проверить корректность номера канала
        mov     BX,[ChannelNumber]
        cmp     BX,1
        jb      @@Err3
        cmp     BX,2
        ja      @@Err3
; Установить базовый адрес
        dec     BX
        shl     BX,1
        mov     AX,[BX+StandardATABases]
        mov     [ATABasePortAddr],AX

; Ожидание готовности HDD к приему команды
        ; Выбрать нужный диск
        mov     DX,[ATABasePortAddr]
        add     DX,6    ;адрес регистра головок
        mov     AL,[DiskNumber]
        cmp     AL,1    ;проверить номера диска
        ja      @@Err4
        shl     AL,4
        or      AL,10100000b
        out     DX,AL
        ; Ожидать, пока диск не будет готов
        inc     DX
@@WaitHDReady:
        ; Проверить время ожидания
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,BSYWaitTime
        ja      @@Err1 ;ошибка тайм-аута
        ; Прочитать регистр состояния
        in      AL,DX
        ; Проверить состояние сигнала BSY
        test    AL,80h
        jnz     @@WaitHDReady
        ; Проверить состояние сигнала DRQ
        test    AL,08h
        jnz     @@WaitHDReady

; Загрузить команду в регистры контроллера
        mov     DX,[ATABasePortAddr]
        inc     DX      ;регистр "особенностей"
        mov     AL,[ATAFeatures]
        out     DX,AL
        inc     DX      ;счетчик секторов
        mov     AL,[ATASectorCount]
        out     DX,AL
        inc     DX      ;регистр номера сектора
        mov     AL,[ATASectorNumber]
        out     DX,AL
        inc     DX      ;номер цилиндра (младший байт)
        mov     AX,[ATACylinder]
        out     DX,AL
        inc     DX      ;номер цилиндра (старший байт)
        mov     AL,AH
        out     DX,AL
        inc     DX      ;номер головки/номер диска
        mov     AL,[DiskNumber]
        shl     AL,4
        cmp     [ATAHead],0Fh ;проверить номер головки
        ja      @@Err5
        or      AL,[ATAHead]
        or      AL,10100000b
        mov     AH,[ATAAddressMode]
        shl     AH,6
        or      AL,AH
        out     DX,AL
; Послать команду
        mov     AL,[ATACommand]
        inc     DX      ;регистр команд
        out     DX,AL
; Сбросить признак ошибки
        mov     [DevErrorCode],0
        jmp short @@End
; Записать код ошибки
@@Err1: mov     [DevErrorCode],1
        jmp short @@End
@@Err2: mov     [DevErrorCode],2
        jmp short @@End
@@Err3: mov     [DevErrorCode],3
        jmp short @@End
@@Err4: mov     [DevErrorCode],4
        jmp short @@End
@@Err5: mov     [DevErrorCode],5
; Завершение работы программы
@@End:  popad
        ret
ENDP SendCommandToHDD


;*************************************************
;*                СБРОС УСТРОЙСТВА               *
;* Входные параметры передаются через глобальные *
;* переменные:                                   *
;* ChannelNumber - номер канала (1 или 2);       *
;* DiskNumber - номер диска (0 или 1).           *
;*************************************************
PROC DeviceReset near
        pusha
        push    ES
; Запомнить текущее время
        mov     AX,0
        mov     ES,AX
        mov     EAX,[ES:046Ch]
        mov     [OpTime],EAX
; Проверить корректность номера канала
        mov     BX,[ChannelNumber]
        cmp     BX,1
        jb      @@Err3
        cmp     BX,2
        ja      @@Err3
; Установить базовый адрес
        dec     BX
        shl     BX,1
        mov     DX,[BX+StandardATABases]
; Выбрать нужный диск
        add     DX,6    ;адрес регистра головок
        mov     AL,[DiskNumber]
        cmp     AL,1    ;проверить номера диска
        ja      @@Err4
        shl     AL,4
        or      AL,10100000b
        out     DX,AL
; Послать команду "Сброс"
        mov     AL,08h
        inc     DX      ;регистр команд
        out     DX,AL
@@WaitHDReady:
        ; Проверить время ожидания
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,MaxHDDWaitTime
        ja      @@Err1 ;ошибка тайм-аута
        ; Прочитать регистр состояния
        in      AL,DX
        ; Проверить состояние сигнала BSY
        test    AL,80h
        jnz     @@WaitHDReady
; Сбросить признак ошибки
        mov     [DevErrorCode],0
        jmp short @@End
; Обработка ошибок
@@Err1: mov     [DevErrorCode],1
        jmp short @@End
@@Err3: mov     [DevErrorCode],3
        jmp short @@End
@@Err4: mov     [DevErrorCode],4
; Записать код ошибки
@@End:  pop     ES
        popa
        ret
ENDP DeviceReset
ENDS
