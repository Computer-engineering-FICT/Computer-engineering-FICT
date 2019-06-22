;                     ЛИСТИНГ 12.11
; Непосредственное воспроизведение звука с компакт-диска
;        с использованием MSF-адресации секторов
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_11.asm, 10.04.2001.

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
Txt1 DB LIGHTCYAN,0,31,"ПОИСК CD-ДИСКОВОДА",0
Txt2 DB LIGHTCYAN,0,23
     DB "ВОСПРОИЗВЕДЕНИЕ ЗВУКА С АУДИО-CD",0
     DB YELLOW,12,10,"Установите в CD-дисковод "
     DB "аудиодиск и нажмите любую клавишу",0
Txt3 DB LIGHTGREEN,12,28,"Воспроизведение начато",0
; Указания для оператора
TxtW DB YELLOW,24,35,"Ждите ...",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Сообщения об ошибках
AudioError DB LIGHTRED,12,22
           DB "Ошибка при выполнении аудиокоманды",0
ENDS

SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS

CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC PlayCDMusicMSF
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

; Очистить экран
        call    ClearScreen
; Вывести текстовые сообщения
        MShowColorText 2,Txt2
; Ожидать нажатия любой клавиши
        call    GetChar

; Ожидание готовности устройства
        call    WaitUnitReady
; Начать воспроизведение звука
        ; Начать со второй секунды нулевой минуты
        mov     [MSFStartMinute],0
        mov     [MSFStartSecond],2
        mov     [MSFStartFrame],0
        ; Продолжать до начала первой минуты
        mov     [MSFEndMinute],1
        mov     [MSFEndSecond],0
        mov     [MSFEndFrame],0
        ; Начать воспроизведение
        call    PlayAudioMSF
        cmp     [DevErrorCode],0
        jne     @@Err
; Очистить экран
        call    ClearScreen
; Вывести сообщение о начале выполнения операции
        MShowColorText 1,Txt3
; Выход в DOS
        mov     AH,4Ch
        int     21h
; Сообщение об ошибке
@@Err:  mov     SI,offset AudioError
        call    FatalError
ENDP PlayCDMusicMSF
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуры для перевода чисел из двоичного
; кода в десятичный
include "lst03_03.inc"
; Подключить процедуру для подачи ATA-команды
include "lst11_01.inc"
; Подключить процедуры для поиска CD-дисковода
; и считывания его параметров
include "lst11_04.inc"
; Подключить процедуры для подачи пакетных команд
include "lst11_08.inc"
; Подключить процедуру активации звуковоспроизведения,
; использующую MSF-адресацию 
include "lst12_04.inc"
; Подключить процедуру проверки готовности устройства
include "lst12_10.inc"
END
