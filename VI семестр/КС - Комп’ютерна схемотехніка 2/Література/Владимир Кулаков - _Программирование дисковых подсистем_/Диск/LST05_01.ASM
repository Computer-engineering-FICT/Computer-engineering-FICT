;                     ЛИСТИНГ 5.1
;  Использование функций считывания даты и времени BIOS
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst05_01.asm, 26.03.2001.

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
Txt1 DB LIGHTCYAN,0,15,"СЧИТЫВАНИЕ ДАТЫ И ВРЕМЕНИ "
     DB "ПРИ ПОМОЩИ ФУНКЦИЙ BIOS",0
     DB LIGHTGREEN,5,10
     DB "ТЕКУЩАЯ ДАТА И ВРЕМЯ ИЗ CMOS:",0
     DB LIGHTGREEN,10,23,"СИСТЕМНОЕ ВРЕМЯ:",0
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
; Значение времени системного таймера
Sys_Time     DD ?
Sys_Hour     DB ?
Sys_Minute   DB ?
Sys_Second   DB ?
ENDS

SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS

CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC BIOS_CMOS_Func
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
        MShowColorText 3,Txt1

; Чтение времени из CMOS
        mov     AH,02h
        int     1Ah
        mov     [CMOS_Hour],CH
        mov     [CMOS_Minute],CL
        mov     [CMOS_Second],DH
; Чтение даты из CMOS
        mov     AH,04h
        int     1Ah
        mov     [CMOS_Century],CH
        mov     [CMOS_Year],CL
        mov     [CMOS_Month],DH
        mov     [CMOS_Day],DL
; Вывести заполненный нулями шаблон даты и времени
        mov     SI,offset ZeroDate
        MShowASCIIField 5,40,0,20
; Вывести дату
        ; Вывести номер дня
        MShowHexByte 5,40,[CMOS_Day]
        ; Вывести номер месяца
        MShowHexByte 5,43,[CMOS_Month]
        ; Вывести номер года
        MShowHexByte 5,46,[CMOS_Century]
        MShowHexByte 5,48,[CMOS_Year]
; Вывести время
        ; Вывести час
        MShowHexByte 5,52,[CMOS_Hour]
        ; Вывести минуту
        MShowHexByte 5,55,[CMOS_Minute]
        ; Вывести секунду
        MShowHexByte 5,58,[CMOS_Second]

; Получить значение системного таймера
        mov     AH,00h
        int     1Ah
        mov     [word ptr Sys_Time],DX
        mov     [word ptr Sys_Time+2],CX
; Вычислить время по системному таймеру
        ; Вычислить время в секундах
        mov     EAX,[Sys_Time]
        mov     EDX,5
        mul     EDX
        xor     EDX,EDX
        mov     EBX,91
        div     EBX
        ; Выделить секунды
        xor     EDX,EDX
        mov     EBX,60
        div     EBX
        mov     [Sys_Second],DL
        ; Выделить минуты и часы
        xor     EDX,EDX
        div     EBX
        mov     [Sys_Minute],DL
        mov     [Sys_Hour],AL
; Вывести системное время
        ; Вывести заполненный нулями шаблон времени
        mov     SI,offset ZeroDate
        MShowASCIIField 10,40,12,8
        ; Вывести час
        mov     [ScreenString],10
        mov     [ScreenColumn],40
        mov     AL,[Sys_Hour]
        cmp     AL,9
        ja      @@H
        inc     [ScreenColumn]
@@H:    call    ShowDecByte
        ; Вывести минуту
        mov     [ScreenColumn],43
        mov     AL,[Sys_Minute]
        cmp     AL,9
        ja      @@M
        inc     [ScreenColumn]
@@M:    call    ShowDecByte
        ; Вывести секунду
        mov     [ScreenColumn],46
        mov     AL,[Sys_Second]
        cmp     AL,9
        ja      @@S
        inc     [ScreenColumn]
@@S:    call    ShowDecByte

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
ENDP BIOS_CMOS_Func 
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуры для перевода чисел из двоичного
; кода в десятичный
include "lst03_03.inc"
END
