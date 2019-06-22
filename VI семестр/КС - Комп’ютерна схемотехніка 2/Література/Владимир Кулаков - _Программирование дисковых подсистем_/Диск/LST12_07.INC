;                     ЛИСТИНГ 12.7
;        Подпрограмма для определения количества
;                   секторов на диске
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_07.asm, 10.04.2001.

CODESEG
;*************************************************
;* ОПРЕДЕЛИТЬ ОБЩЕЕ КОЛИЧЕСТВО СЕКТОРОВ НА ДИСКЕ *
;* Входные параметры передаются через глобальные *
;* переменные:                                   *
;* ChannelNumber - номер канала;                 *
;* DiskNumber - номер диска на канале.           *
;*************************************************
PROC ReadCapacity near
        pusha
; Очистить буфер пакетной команды
        mov     [dword ptr PacketCommand],0
        mov     [dword ptr PacketCommand+4],0
        mov     [dword ptr PacketCommand+8],0
; Задать размер буфера в байтах
        mov     [CDBlockSize],8
; Сформировать команду READ CAPACITY
        mov     [PacketCommand],25h
; Подать команду
        call    SendPacketDatCommand
        popa
        ret
ENDP ReadCapacity
ENDS
