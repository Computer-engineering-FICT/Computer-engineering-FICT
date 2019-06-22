;                     ЛИСТИНГ 12.5
;      Процедура для чтения данных с компакт-диска
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_05.inc, 10.04.2001.

; Максимальное количество повторений операции чтения
MaxRetr equ 3

DATASEG
; Сообщение об ошибке
ErrS DB LIGHTRED,12,32,"Сектор не найден",0
ENDS

CODESEG
;*************************************************
;*     ЧТЕНИЕ СЕКТОРА ДАННЫХ С КОМПАКТ-ДИСКА     *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале;           *
;* CDSectorAddress - адрес считываемого сектора. *
;* Данные считывается в массив CDDataBuf.        *
;*************************************************
PROC Read10 near
        pusha
; Задать размер сектора
        mov     [CDBlockSize],2048
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать пакетную команду для считывания
; сектора данных
        ; Задать код команды Read(10)
        mov     [PacketCommand],28h
        ; Задать адрес сектора
        mov     AX,[word ptr CDSectorAddress+2]
        xchg    AL,AH
        mov     [word ptr PacketCommand+2],AX
        mov     AX,[word ptr CDSectorAddress]
        xchg    AL,AH
        mov     [word ptr PacketCommand+4],AX
        ; Задать количество считываемых секторов
        mov     [word ptr PacketCommand+8],1
; Подать команду
        call    SendPacketDatCommand
        popa
        ret
ENDP Read10


;********************************************
;*        ЧТЕНИЕ СЕКТОРА С ПОВТОРАМИ        *
;* Многократное повторение чтения при сбоях *
;********************************************
PROC Read10WRetr near
        pusha
; Цикл, пока команда не выполнена успешно или не
; исчерпано количество попыток
        mov     CX,MaxRetr
@@NextRetr:
; Подать команду
        call    Read10
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
ENDP Read10WRetr
ENDS
