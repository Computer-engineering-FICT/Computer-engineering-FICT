;                     ЛИСТИНГ 8.1
;  Считывание даты и времени напрямую из регистров CMOS
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst08_01.asm, 2.04.2001.

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
Txt1 DB LIGHTMAGENTA,0,23
     DB "СЧИТЫВАНИЕ ДАТЫ И ВРЕМЕНИ ИЗ CMOS",0
     DB LIGHTGREEN,12,18,"ТЕКУЩАЯ ДАТА И ВРЕМЯ:",0
; Указания оператору
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Шаблон даты и времени
ZeroDate DB "00.00.0000  00:00:00",0
; Значение даты в CMOS
CMOS_Century DB ?
CMOS_Year    DB ?
CMOS_Month   DB ?
CMOS_Day     DB ?
; Значение времени в CMOS
CMOS_Hour    DB ?
CMOS_Minute  DB ?
CMOS_Second  DB ?
ENDS

SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS

CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC IdentifyDevices
        mov     AX,DGROUP
        mov     DS,AX
; Установить текстовый режим и очистить экран
        mov     AX,3
        int     10h
; Скрыть курсор - убрать за нижнюю границу экрана
        mov     [ScreenString],25
        mov     [ScreenColumn],0
        call    SetCursorPosition
; Вывести заголовок на экран
        MShowColorText 2,Txt1
; Запретить прерывания
        cli
; Проверить флаг обновления состояния
@@TestUIP:
        mov     AL,0Ah    ;регистр состояния A
        out     70h,AL
        in      AL,71h
        test    AL,80h
        jnz     @@TestUIP ;повторить опрос
; Чтение времени из CMOS
        mov     AL,00h    ;регистр секунд
        out     70h,AL
        nop
        in      AL,71h
        mov     [CMOS_Second],AL
        mov     AL,02h    ;регистр минут
        out     70h,AL
        nop
        in      AL,71h
        mov     [CMOS_Minute],AL
        mov     AL,04h    ;регистр часов
        out     70h,AL
        nop
        in      AL,71h
        mov     [CMOS_Hour],AL
; Проверить флаг обновления состояния
        mov     AL,0Ah    ;регистр состояния A
        out     70h,AL
        in      AL,71h
        test    AL,80h
        jnz     @@TestUIP ;повторить опрос
; Чтение даты из CMOS
        mov     AL,07h    ;регистр номера дня месяца
        out     70h,AL
        nop
        in      AL,71h
        mov     [CMOS_Day],AL
        mov     AL,08h    ;регистр номера месяца
        out     70h,AL
        nop
        in      AL,71h
        mov     [CMOS_Month],AL
        mov     AL,09h    ;регистр номера года
        out     70h,AL
        nop
        in      AL,71h
        mov     [CMOS_Year],AL
; Проверить флаг обновления состояния
        mov     AL,0Ah    ;регистр состояния A
        out     70h,AL
        in      AL,71h
        test    AL,80h
        jnz     @@TestUIP ;повторить опрос
; Разрешить прерывания
        sti
; Определить номер столетия
        mov     [CMOS_Century],19h ;столетие в коде BCD
        cmp     [CMOS_Year],80h    ;год в коде BCD
        jae     @@19
        mov     [CMOS_Century],20h
@@19:
; Вывести заполненный нулями шаблон даты и времени
        mov     SI,offset ZeroDate
        MShowASCIIField 12,40,0,20
; Вывести дату
        ; Вывести номер дня
        MShowHexByte 12,40,[CMOS_Day]
        ; Вывести номер месяца
        MShowHexByte 12,43,[CMOS_Month]
        ; Вывести номер года
        MShowHexByte 12,46,[CMOS_Century]
        MShowHexByte 12,48,[CMOS_Year]
; Вывести время
        ; Вывести час
        MShowHexByte 12,52,[CMOS_Hour]
        ; Вывести минуту
        MShowHexByte 12,55,[CMOS_Minute]
        ; Вывести секунду
        MShowHexByte 12,58,[CMOS_Second]
; Вывести указание оператору
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar
; Переустановить текстовый режим (очистить экран)
        mov     ax,3
        int     10h
; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP IdentifyDevices
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуры для перевода чисел из двоичного
; кода в десятичный
include "lst03_03.inc"
END

