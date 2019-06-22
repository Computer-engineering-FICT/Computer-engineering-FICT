;                     ЛИСТИНГ 12.10
;          Подпрограмма для проверки готовности
;                  устройства к работе
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_10.asm, 09.04.2001.

DATASEG
; Сообщения об ошибках
UnitNotReady DB LIGHTRED,12,25
             DB "Устройство не готово к работе",0
; Время начала ожидания готовности устройства
WURStartTime DD ?
ENDS

CODESEG
;*************************************************
;*    ОЖИДАНИЕ ГОТОВНОСТИ УСТРОЙСТВА К РАБОТЕ    *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале.           *
;*************************************************
PROC WaitUnitReady near
        pusha
        push    ES
        mov     AX,0
        mov     ES,AX
; Запомнить время начала операции
        mov     EAX,[ES:046Ch]
        mov     [WURStartTime],EAX
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать команду TEST UNIT READY
        mov     [PacketCommand],00h
; ЦИКЛ ОЖИДАНИЯ ГОТОВНОСТИ УСТРОЙСТВА
@@SendCommand:
        ; Подать команду проверки готовности
        call    SendPacketNoDatCommand
        ; Проверить код ошибки
        cmp     [DevErrorCode],0
        je      @@End
        ; Проверить время ожидания готовности
        mov     EAX,[ES:046Ch]
        sub     EAX,[WURStartTime]
        cmp     EAX,MaxCDWaitTime
        jb      @@SendCommand
        ; Ошибка тайм-аута
        mov     [DevErrorCode],1
@@End:  pop     ES
        popa
        ret
ENDP WaitUnitReady
ENDS
