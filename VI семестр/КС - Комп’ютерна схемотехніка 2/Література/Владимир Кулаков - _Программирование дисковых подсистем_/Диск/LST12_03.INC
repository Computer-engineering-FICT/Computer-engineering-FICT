;                     ЛИСТИНГ 12.3
;  Подпрограмма для непосредственного воспроизведения
;     большого участка аудиоданных с компакт-диска
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_03.inc, 10.04.2001.

DATASEG
; Количество подлежащих воспроизведению секторов
LPlaingSectors DD ?
ENDS

CODESEG
;******************************************************
;*    ВОСПРОИЗВЕДЕНИЕ ЗВУКА В РЕЖИМЕ ПРОИГРЫВАТЕЛЯ    *
;*   (воспроизведение большого участка аудиоданных)   *
;* Входные параметры:                                 *
;* ChannelNumber - номер канала;                      *
;* DiskNumber - номер диска на канале;                *
;* CDSectorAddress - адрес первого сектора;           *
;* LPlaingSectors - количество считываемых секторов.  *
;******************************************************
PROC PlayAudio12 near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать пакетную команду
        ; Задать код команды PLAY AUDIO(12)
        mov     [PacketCommand],0A5h
        ; Задать адрес сектора
        mov     AX,[word ptr CDSectorAddress+2]
        xchg    AL,AH
        mov     [word ptr PacketCommand+2],AX
        mov     AX,[word ptr CDSectorAddress]
        xchg    AL,AH
        mov     [word ptr PacketCommand+4],AX
        ; Задать количество подлежащих воспроизведению
        ; секторов
        mov     AX,[word ptr LplaingSectors+2]
        xchg    AL,AH
        mov     [word ptr PacketCommand+6],AX
        mov     AX,[word ptr LPlaingSectors]
        xchg    AL,AH
        mov     [word ptr PacketCommand+8],AX
; Подать команду
        call    SendPacketNoDatCommand
        popa
        ret
ENDP PlayAudio12
ENDS
