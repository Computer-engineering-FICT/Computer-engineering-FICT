;                     ЛИСТИНГ 12.8
;    Подпрограммы для загрузки и извлечения носителя
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_08.asm, 10.04.2001.

CODESEG
;*************************************************
;*         ЗАГРУЗИТЬ НОСИТЕЛЬ В ДИСКОВОД         *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале.           *
;*************************************************
PROC LoadMedium near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать команду START/STOP UNIT
        ; Задать код команды
        mov     [PacketCommand],1Bh
        ; Задать операцию загрузки носителя
        mov     [word ptr PacketCommand+4],00000011b
; Подать команду
        call    SendPacketNoDatCommand
        popa
        ret
ENDP LoadMedium

;*************************************************
;*         ИЗВЛЕЧЬ НОСИТЕЛЬ ИЗ ДИСКОВОДА         *
;* Входные параметры передаются через глобальные *
;* перменные:                                    *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале.           *
;*************************************************
PROC UnloadMedium near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать команду START/STOP UNIT
        ; Задать код команды
        mov     [PacketCommand],1Bh
        ; Задать операцию извлечения носителя
        mov     [word ptr PacketCommand+4],00000010b
; Подать команду
        call    SendPacketNoDatCommand
        popa
        ret
ENDP UnloadMedium
ENDS
