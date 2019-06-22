;                     ЛИСТИНГ 12.12
; Непосредственное воспроизведение звука с компакт-диска
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_12.asm, 10.04.2001.

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
Txt4 DB YELLOW,12,27,"Воспроизведение прервано",0
Txt5 DB LIGHTGREEN,12,25
     DB "Воспроизведение возобновлено",0
Txt6 DB LIGHTGREEN,12,21
     DB "Воспроизведение полностью прекращено",0
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
PROC PlayCDMusic
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
; Ожидание готовности устройства к работе
        call    WaitUnitReady
; Извлечь носитель
        call    UnloadMedium
; Очистить экран
        call    ClearScreen
; Вывести текстовые сообщения
        MShowColorText 2,Txt2
; Ожидать нажатия любой клавиши
        call    GetChar

; Загрузить носитель
        call    LoadMedium
; Очистить экран
        call    ClearScreen
; Вывести текстовые сообщения
        MShowColorText 1,Txt2
        MShowColorText 1,TxtW
; Ожидание готовности устройства
        call    WaitUnitReady
; Начать воспроизведение звука
        ; Начать с нулевого сектора
        mov     [dword ptr CDSectorAddress],0
        ; Воспроизвести 5000 секторов
        mov     [SPlaingSectors],5000
        call    PlayAudio10
        cmp     [DevErrorCode],0
        jne     @@Err
; Вывести сообщение о начале выполнения операции
        MShowColorText 1,Txt3

; Выполнять воспроизведение в течение 10 секунд
        ; Запомнить начальное время
        xor     AX,AX
        mov     ES,AX
        mov     EAX,[ES:046Ch]
        add     EAX,180 ;задержка на 10 секунд
        ; Проверить время
@@Play: cmp     EAX,[ES:046Ch]
        ja      @@Play
; Прервать воспроизвеление
        call    PauseON
        cmp     [DevErrorCode],0
        jne     @@Err
; Вывести текстовые сообщения
        MShowColorText 1,Txt4
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar

; Возобновить воспроизведение
        call    PauseOFF
        cmp     [DevErrorCode],0
        jne     @@Err
; Вывести текстовые сообщения
        MShowColorText 1,Txt5
; Ожидать нажатия любой клавиши
        call    GetChar

; Прервать воспроизведение
        call    StopPlay
; Вывести текстовые сообщения
        MShowColorText 1,Txt6
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar
; Переустановить текстовый режим
        mov     ax,3
        int     10h
; Выход в DOS
        mov     AH,4Ch
        int     21h

; Сообщение об ошибке
@@Err:  mov     SI,offset AudioError
        call    FatalError
ENDP PlayCDMusic
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
; Подключить процедуры активации, приостановки, 
; возобновления и прекращения звуковоспроизведения
include "lst12_01.inc"
include "lst12_02.inc"
include "lst12_09.inc"
; Подключить процедуры загрузки и извлечения носителя
include "lst12_08.inc"
; Подключить процедуру проверки готовности устройства
include "lst12_10.inc"
END
