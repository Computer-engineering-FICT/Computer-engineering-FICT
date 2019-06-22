;                     ЛИСТИНГ 11.5
;  Поиск дисковода с интерфейсом ATAPI по каналам 1 и 2
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst11_05.asm, 04.02.2001.

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
; Заголовок экрана при выполнении поиска устройства 
Txt1 DB LIGHTCYAN,0,31,"ПОИСК CD-ДИСКОВОДА",0
; Указания оператору
TxtW DB YELLOW,24,35,"Ждите ...",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Номер отображаемой части сектора
; (0 - байты 0-1023, 1 - байты 1024-2047)
PartOfSector DB 0
ENDS

SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS

CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC IdentifyPacketDevice
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
        MShowColorText 1,Txt1
; Вывести указание оператору ожидать завершения поиска
        MShowColorText 1,TxtW
; Найти устройство ATAPI
        call    FindATAPIDevice
; Показать параметры найденного устройства
        call    ShowCD_ID
; Переустановить текстовый режим
	mov     ax,3
	int     10h
; Выход в DOS
	mov     AH,4Ch
	int     21h
ENDP IdentifyPacketDevice
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуры для перевода чисел из двоичного
; кода в десятичный
include "lst03_03.inc"
; Подключить процедуру для подачи ATA-команды
include "lst11_01.inc"
; Подключить процедуры для поиска CD-дисковода,
; считывания и отображения его параметров
include "lst11_04.inc"
END
