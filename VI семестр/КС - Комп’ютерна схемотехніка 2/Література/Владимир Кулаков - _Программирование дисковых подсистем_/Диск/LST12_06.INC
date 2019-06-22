;                     ЛИСТИНГ 12.6
;        Процедура для полного считывания всех
;           данных из сектора компакт-диска
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_06.inc, 10.04.2001.

; Максимальное количество повторений операции чтения
MaxRetr equ 3

DATASEG
; Сообщение об ошибке
ErrS DB LIGHTRED,12,32,"Сектор не найден",0
ENDS

CODESEG
;*************************************************
;*      ПОЛНОЕ ЧТЕНИЕ СЕКТОРА КОМПАКТ-ДИСКА      *
;* Считываются данные пользователя, информация   *
;* субканала и контрольная информация            *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале;           *
;* CDSectorAddress - адрес считываемого сектора. *
;* Данные считывается в массив CDDataBuf.        *
;*************************************************
PROC ReadCD near
        pusha
; Задать размер сектора
        mov     [CDBlockSize],2352
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать пакетную команду для считывания
; сектора данных
        ; Задать код команды Read CD
        mov     [PacketCommand],0BEh
        ; Задать адрес сектора
        mov     AX,[word ptr CDSectorAddress+2]
        xchg    AL,AH
        mov     [word ptr PacketCommand+2],AX
        mov     AX,[word ptr CDSectorAddress]
        xchg    AL,AH
        mov     [word ptr PacketCommand+4],AX
        ; Задать количество считываемых секторов
        mov     [PacketCommand+8],1
        ; Задать считывание данных в полном объеме
        mov     [PacketCommand+9],0F8h
; Подать команду
        call    SendPacketDatCommand
        popa
        ret
ENDP ReadCD


;********************************************
;*        ЧТЕНИЕ СЕКТОРА С ПОВТОРАМИ        *
;* Многократное повторение чтения при сбоях *
;********************************************
PROC ReadCDWRetr near
        pusha
; Цикл, пока команда не выполнена успешно или не
; исчерпано количество попыток
        mov     CX,MaxRetr
@@NextRetr:
; Подать команду
        call    ReadCD
        cmp     [DevErrorCode],0
        je      @@End
; Задержка на 2,5 секунды
        push    ES
        xor     AX,AX
        mov     ES,AX
        mov     EAX,[ES:046Ch]
        add     EAX,50
@@Wait: cmp     EAX,[ES:046Ch]
        ja      @@Wait
        pop     ES
        loop    @@NextRetr
; Сообщение об ошибке
        mov     SI,offset ErrS
        call    FatalError
@@End:  popa
        ret
ENDP ReadCDWRetr
ENDS
