;                     ЛИСТИНГ 12.13
;       Просмотр секторов данных на компакт-диске
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst12_13.asm, 10.04.2001.
               
IDEAL
P386
LOCALS
MODEL MEDIUM

; Максимальное количество повторений операции чтения
MaxRetr equ 5

; Подключить файл мнемонических обозначений
; кодов управляющих клавиш и цветовых кодов
include "lst03_01.inc"
; Подключить файл макросов
include "lst03_04.inc"

DATASEG
; Заголовок экрана при выполнении поиска устройства 
Txt1 DB LIGHTCYAN,0,31,"ПОИСК CD-ДИСКОВОДА",0
; Запрос на установку носителя
Txt2 DB YELLOW,12,9,"Установите в CD-дисковод "
     DB "диск данных и нажмите любую клавишу",0
; Заголовок экрана и инструкции для оператора в режиме
; просмотра секторов
Txt3 DB LIGHTCYAN,0,23,"СЧИТЫВАНИЕ ДАННЫХ С КОМПАКТ-ДИСКА",0
     DB YELLOW,20,8,"Управляющие клавиши:",0
     DB LIGHTGREEN,21,8,"Стрелка вниз - вперед;",0
     DB LIGHTGREEN,22,8,"Стрелка вверх - назад;",0
     DB LIGHTGREEN,23,8,"Esc - выход.",0
     DB YELLOW,24,27,"Нажмите управляющую клавишу",0
Txt4 DB LIGHTGREEN,2,8
     DB "Сектор XXXXXXXX, байты 0-1023   ",0
Txt5 DB LIGHTGREEN,2,8
     DB "Сектор XXXXXXXX, байты 1024-2047",0
; Указания оператору, отображаемые в нижней
; строке экрана
TxtW DB YELLOW,24,35,"Ждите ...",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Сообщения об ошибках
ErrC DB LIGHTRED,12,25,"Ошибка при выполнении команды",0
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
PROC CDData 
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
        cmp     [DevErrorCode],0
        jne     @@MediumUloaded
; Извлечь носитель
        call    UnloadMedium
@@MediumUloaded:
; Очистить экран
        call    ClearScreen
; Вывести текстовые сообщения
        MShowColorText 1,Txt2
; Ожидать нажатия любой клавиши
        call    GetChar

; Загрузить носитель
        call    LoadMedium
; Очистить экран
        call    ClearScreen
; Вывести текстовые сообщения
        MShowColorText 1,TxtW
; Ожидание готовности устройства
        call    WaitUnitReady

; ЦИКЛ ЧТЕНИЯ СЕКТОРОВ
; Выполнить чтение нулевого сектора
        mov     [dword ptr CDSectorAddress],0
        mov     [PartOfSector],0
        call    Read10WRetr
; Вывести текстовые сообщения на экран
        MShowColorText 6,Txt3
@@ReadSector:
; Отобразить содержимое сектора в ASCII-кодах
@@ShowSector:
        cmp     [PartOfSector],0
        jne     @@Part1
; Показать первую половину сектора
        ; Вывести заголовок
        MShowColorText 1,Txt4
        ; Вывести номер сектора
        MShowHexDWord 2,15,<[dword ptr CDSectorAddress]>
        ; Вывести первую половину сектора
        mov     SI,offset CDDataBuf
        call    ShowSector1024
        jmp short @@GetCommand
@@Part1:
; Показать вторую половину сектора
        ; Вывести заголовок
        MShowColorText 1,Txt5
        ; Вывести номер сектора
        MShowHexDWord 2,15,<[dword ptr CDSectorAddress]>
        ; Вывести вторую половину сектора
        mov     SI,offset CDDataBuf
        add     SI,1024
        call    ShowSector1024

; Ожидать нажатия клавиши
@@GetCommand:
        call    GetChar
        cmp     AL,0
        je      @@TestCommandByte
        ; Клавиша не является управляющей
        call    Beep
        jmp short @@GetCommand

; Обработка команды
@@TestCommandByte:
        cmp     AH,B_Esc        ;"Выход"
        je      @@Exit
@@TestDn:
        cmp     AH,B_DN         ;"Стрелка вниз"
        jne     @@TestUp
        cmp     [PartOfSector],0
        jne     @@IncAddr
        mov     [PartOfSector],1
        jmp     @@ShowSector
@@IncAddr:
        ; Увеличить на 1 номер сектора
        inc     [dword ptr CDSectorAddress]
        call    Read10WRetr
        ; Обнулить номер отображаемой части сектора
        mov     [PartOfSector],0
        jmp     @@ReadSector
@@TestUp:
        cmp     AH,B_UP         ;"Стрелка вверх"
        jne     @@CommandError
        cmp     [PartOfSector],1
        jne     @@DecAddr
        ; Обнулить номер отображаемой части сектора
        mov     [PartOfSector],0
        jmp     @@ShowSector
@@DecAddr:
        ; Проверить значение адреса
        cmp     [dword ptr CDSectorAddress],0
        je      @@CommandError
        ; Уменьшить на 1 номер сектора
        dec     [dword ptr CDSectorAddress]
        call    Read10WRetr
        mov     [PartOfSector],1
        jmp     @@ReadSector
@@CommandError:
        call    Beep
        jmp     @@GetCommand

@@Exit:
; Переустановить текстовый режим
        mov     ax,3
        int     10h
; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP CDData 
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
; Подключить процедуру считывания сектора данных
; с компакт-диска
include "lst12_05.inc"
; Подключить процедуры загрузки и извлечения носителя
include "lst12_08.inc"
; Подключить процедуру проверки готовности устройства
include "lst12_10.inc"
END
