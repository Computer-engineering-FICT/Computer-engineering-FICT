;                     ЛИСТИНГ 12.1
;     Подпрограммы для приостановки и возобновления
;         воспроизведения звука с компакт-диска
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_01.asm, 10.04.2001.

CODESEG
;*************************************************
;*                     ПАУЗА                     *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале.           *
;*************************************************
PROC PauseON near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать пакетную команду
        ; Задать код команды
        mov     [PacketCommand],4Bh
; Подать команду
        call    SendPacketNoDatCommand
        popa
        ret
ENDP PauseON

;*************************************************
;*   ВОЗОБНОВЛЕНИЕ ВОСПРОИЗВЕДЕНИЯ ПОСЛЕ ПАУЗЫ   *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале.           *
;*************************************************
PROC PauseOFF near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать пакетную команду
        ; Задать код команды
        mov     [PacketCommand],4Bh
        ; Установить бит возобновления воспроизведения
        mov     [PacketCommand+8],00000001b
; Подать команду
        call    SendPacketNoDatCommand
        popa
        ret
ENDP PauseOFF
ENDS
