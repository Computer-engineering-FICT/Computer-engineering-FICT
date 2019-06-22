;                     ЛИСТИНГ 12.4
;  Подпрограмма для непосредственного воспроизведения
; звука с компакт-диска с использованием MSF-адресации
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_04.asm, 10.04.2001.

DATASEG
; MSF-адрес начального сектора
MSFStartMinute DB ?
MSFStartSecond DB ?
MSFStartFrame  DB ?
; MSF-адрес начального сектора
MSFEndMinute   DB ?
MSFEndSecond   DB ?
MSFEndFrame    DB ?
ENDS

CODESEG
;************************************************
;* ВОСПРОИЗВЕДЕНИЕ ЗВУКА В РЕЖИМЕ ПРОИГРЫВАТЕЛЯ *
;*          С ИСПОЛЬЗОВАНИЕМ MSF-АДРЕСАЦИИ      *
;* Входные параметры:                           *
;* ChannelNumber  - номер канала;               *
;* DiskNumber     - номер диска на канале;      *
;* MSFStartMinute - минута начального сектора;  *
;* MSFStartSecond - секунда начального сектора; *
;* MSFStartFrame  - кадр начального сектора;    *
;* MSFEndMinute   - минута начального сектора;  *
;* MSFEndSecond   - секунда начального сектора; *
;* MSFEndFrame    - кадр начального сектора;    *
;************************************************
PROC PlayAudioMSF near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Сформировать пакетную команду
        ; Задать код команды
        mov     [PacketCommand],47h
        ; Задать начальный адрес
        mov     AL,[MSFStartMinute]
        mov     [PacketCommand+3],AL
        mov     AL,[MSFStartSecond]
        mov     [PacketCommand+4],AL
        mov     AL,[MSFStartFrame]
        mov     [PacketCommand+5],AL
        ; Задать конечный адрес 
        mov     AL,[MSFEndMinute]
        mov     [PacketCommand+6],AL
        mov     AL,[MSFEndSecond]
        mov     [PacketCommand+7],AL
        mov     AL,[MSFEndFrame]
        mov     [PacketCommand+8],AL
; Подать команду
        call    SendPacketNoDatCommand
        popa
        ret
ENDP PlayAudioMSF
ENDS
