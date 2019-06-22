;                     ЛИСТИНГ 4.1
;  Процедура для считывания параметров контроллера IDE
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst04_01.inc, 07.02.2001.

DATASEG
; Сообщения об отсутствии компонентов системы,
; необходимых для запуска примера
NoPCI  DB LIGHTRED,12,18
       DB "Система не поддерживает интерфейс PCI BIOS",0
NoIDEC DB LIGHTRED,12,26
       DB "Контроллер PCI IDE не найден",0
BadReg DB LIGHTRED,12,28,"Неверный номер регистра",0
; Координаты устройства PCI
BusNumber      DB ? ;номер шины
DeviceNumber   DB ? ;номер устройства и номер функции
; Идентификаторы устройства PCI
VendorID       DW ? ;идентификатор изготовителя
DeviceID       DW ? ;идентификатор устройства
; Адрес блока регистров контроллера PCI IDE
IDEContrRegsBaseAddr DW ?
ENDS

CODESEG
;***************************************************
;* НАЙТИ КОНТРОЛЛЕР IDE И ОПРЕДЕЛИТЬ ЕГО ПАРАМЕТРЫ *
;* Процедура не имеет входных параметров.          *
;* В случае успешного завершения операции поиска   *
;* параметры контроллера сохраняются в глобальных  *
;* переменных BusNumber, DeviceNumber, VendorID,   *
;* DeviceID и IDEContrRegsBaseAddr.                *
;***************************************************
PROC SearchBusMasterIDEContr near
        pushad
; Проверить наличие PCI BIOS
        mov     AX,0B101h
        int     1Ah
        jc      @@PCIBIOSNotFound
        cmp     EDX,20494350h
        jne     @@PCIBIOSNotFound
; Найти контроллер Bus Master IDE по коду класса
        mov     AX,0B103h
        mov     ECX,010180h  ;первый вариант кода
        mov     SI,0
        int     1Ah
        jnc     @@ReadPCIRegisters ;устройство найдено
        mov     AX,0B103h
        mov     ECX,010185h  ;второй вариант кода
        mov     SI,0
        int     1Ah
        jnc     @@ReadPCIRegisters ;устройство найдено
        mov     AX,0B103h
        mov     ECX,01018Ah  ;третий вариант кода
        mov     SI,0
        int     1Ah
        jnc     @@ReadPCIRegisters ;устройство найдено
; Контроллер IDE не найден
        mov     SI,offset NoIDEC
        call    FatalError
; Устройство обнаружено, его координаты на шине PCI
; находятся в регистре BX
@@ReadPCIRegisters:
; Запомнить координаты контроллера
        mov     [BusNumber],BH
        mov     [DeviceNumber],BL
; Получить идентификатор изготовителя
        mov     AX,0B109h ;читать слово
        mov     DI,0      ;смещение слова
        int     1Ah
        jc      @@BadRegisterNumber
        mov     [VendorID],CX
; Получить идентификатор устройства
        mov     AX,0B109h ;читать слово
        mov     DI,2      ;смещение слова
        int     1Ah
        jc      @@BadRegisterNumber
        mov     [DeviceID],CX
; Получить базовый адрес блока регистров контроллера IDE
        mov     AX,0B10Ah ;читать двойное слово
        mov     DI,20h    ;смещение слова
        int     1Ah
        jc      @@BadRegisterNumber
        and     CX,0FFF0h ;сбросить младшие 4 разряда
        mov     [IDEContrRegsBaseAddr],CX
        popad
        ret

; Обработка ошибок
@@PCIBIOSNotFound:
        ; Не поддерживается PCI BIOS
        mov     SI,offset NoPCI
        call    FatalError
@@BadRegisterNumber:
        ; Неверный номер регистра
        mov     SI,offset BadReg
        call    FatalError
ENDP SearchBusMasterIDEContr
ENDS
