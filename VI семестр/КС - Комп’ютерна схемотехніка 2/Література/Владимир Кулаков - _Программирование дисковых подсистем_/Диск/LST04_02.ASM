;                     ЛИСТИНГ 4.2
; Поиск контроллера PCI IDE и считывание его параметров
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst04_02.asm, 07.02.2001.

IDEAL
P386
LOCALS
MODEL MEDIUM

; Подключить файл мнемонических обозначений
; кодов управляющих клавиш и цветовых кодов
include "lst03_01.inc"
; Подключить файл макросов
include "lst03_04.inc"

DATASEG
; Текстовые сообщения
Txt0 DB LIGHTCYAN,0,10,"ОПРЕДЕЛЕНИЕ ПАРАМЕТРОВ "
     DB "КОНТРОЛЛЕРА IDE ПРИ ПОМОЩИ PCI BIOS",0
Txt1 DB 2,27,"Параметры контроллера IDE",0
     DB 4,28,"Номер шины:",0
     DB 5,22,"Номер устройства:",0
     DB 6,25,"Номер функции:",0
     DB 7,12,"Идентификатор изготовителя:",0
     DB 8,14,"Идентификатор устройства:",0
     DB 9,8,"Базовый адрес набора регистров:",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
ENDS


SEGMENT sseg para stack 'STACK'
DB 400h DUP(?)
ENDS


CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC TestIDEContr
        mov     AX,DGROUP
        mov     DS,AX
; Установить текстовый режим и очистить экран
        mov     AX,3
        int     10h
; Скрыть курсор - убрать за нижнюю границу экрана
        mov     [ScreenString],25
        mov     [ScreenColumn],0
        call    SetCursorPosition
; Вывести заголовок
        MShowColorText 1,Txt0
; Установить зеленый цвет символов и черный фон
        mov     [TextColorAndBackground],LIGHTGREEN
; Найти контроллер PCI IDE
        call    SearchBusMasterIDEContr
; Вывести заголовки полей
        MShowText 7,Txt1
; Установить желтый цвет символов и черный фон
        mov     [TextColorAndBackground],YELLOW
; Вывести полученные данные на экран
        MShowHexByte 4,40,[BusNumber]
        mov     BL,[DeviceNumber]
        shr     BL,3
        MShowHexByte 5,40,BL
        mov     BL,[DeviceNumber]
        and     BL,111b
        MShowHexByte 6,40,BL
        MShowHexWord 7,40,[VendorID]
        MShowHexWord 8,40,[DeviceID]
        MShowHexWord 9,40,[IDEContrRegsBaseAddr]
; Вывести указание оператору
        MShowColorText 1,AnyK
; Ожидать нажатия клавиши
        call    GetChar
; Переустановить текстовый режим и очистить экран
        mov     AX,3
        int     10h
; Выход в DOS
        mov     AH,4Ch
        int     21h

; Обработка ошибок
@@BadRegisterNumber:
        ; Неверный номер регистра
        mov     SI,offset BadReg
        call    FatalError
ENDP TestIDEContr 
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуру поиска контроллера PCI IDE
include "lst04_01.inc"
END
