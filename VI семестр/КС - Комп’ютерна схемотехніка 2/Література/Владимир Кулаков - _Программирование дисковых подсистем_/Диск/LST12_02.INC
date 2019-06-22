;                     ЛИСТИНГ 12.2
;  Подпрограмма для непосредственного воспроизведения
;    небольшого участка аудиоданных с компакт-диска
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_02.inc, 10.04.2001.

DATASEG
; Количество подлежащих воспроизведению секторов
SPlaingSectors DW ?
ENDS

CODESEG
;******************************************************
;*    ВОСПРОИЗВЕДЕНИЕ ЗВУКА В РЕЖИМЕ ПРОИГРЫВАТЕЛЯ    *
;*  (воспроизведение небольшого участка аудиоданных)  *
;* Входные параметры:                                 *
;* ChannelNumber - номер канала;                      *
;* DiskNumber - номер диска на канале;                *
;* CDSectorAddress - адрес первого сектора;           *
;* SPlaingSectors - количество считываемых секторов.  *
;******************************************************
PROC PlayAudio10 near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать пакетную команду
        ; Задать код команды PLAY AUDIO(10)
        mov     [PacketCommand],45h
        ; Задать адрес сектора
        mov     AX,[word ptr CDSectorAddress+2]
        xchg    AL,AH
        mov     [word ptr PacketCommand+2],AX
        mov     AX,[word ptr CDSectorAddress]
        xchg    AL,AH
        mov     [word ptr PacketCommand+4],AX
        ; Задать количество подлежащих воспроизведению
        ; секторов
        mov     AX,[SPlaingSectors]
        xchg    AL,AH
        mov     [word ptr PacketCommand+7],AX
; Подать команду
        call    SendPacketNoDatCommand
        popa
        ret
ENDP PlayAudio10
ENDS
