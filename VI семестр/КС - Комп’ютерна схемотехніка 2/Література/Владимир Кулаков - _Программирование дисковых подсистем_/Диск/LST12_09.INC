;                     ЛИСТИНГ 12.9
;  Подпрограмма, прекращающая операцию воспроизведения
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_09.asm, 10.04.2001.

CODESEG
;*************************************************
;*   ПРЕКРАТИТЬ ВОСПРОИЗВЕДЕНИЕ АУДИОФРАГМЕНТА   *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале.           *
;*************************************************
PROC StopPlay near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать команду STOP PLAY/SCAN
        ; Задать код команды
        mov     [PacketCommand],4Eh
; Подать команду
        call    SendPacketNoDatCommand
        popa
        ret
ENDP StopPlay 
ENDS
