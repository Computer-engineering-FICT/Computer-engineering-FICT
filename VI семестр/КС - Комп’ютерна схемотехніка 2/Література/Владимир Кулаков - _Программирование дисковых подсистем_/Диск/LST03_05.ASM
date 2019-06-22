;                     ЛИСТИНГ 3.5
;   Просмотр секторов диска "C:" при помощи функций BIOS
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst03_06.asm, 30.01.2001.

IDEAL
P386
LOCALS
MODEL MEDIUM

; Подключить файл мнемонических обозначений
; кодов управляющих клавиш и цветовых кодов
include "lst03_01.inc"
; Подключить файл макросов
include "lst03_04.inc"

SEGMENT sseg para stack 'STACK'
DB 400h DUP(?)
ENDS

DATASEG
; Текстовые сообщения
Text0 DB LIGHTBLUE,0,25
      DB "Тестирование функций EDD BIOS",0
Text1 DB WHITE,3,21
      DB "Диск C поддерживает набор функций EDD",0
      DB YELLOW,6,0
      DB "Наличие поддержки отдельных групп функций:",0
      DB LIGHTGREEN,8,0
      DB "Функции, использующие пакетный адрес:",0
      DB LIGHTGREEN,9,0
      DB "Функции запирания и извлечения носителя:",0
      DB LIGHTGREEN,10,0,"Специальные функции EDD:",0
      DB LIGHTGREEN,11,0
      DB "Использование 64-разрядной адресации:",0
Text2 DB YELLOW,13,0
      DB "Содержимое таблицы параметров устройства:",0
      DB LIGHTGREEN,15,0,"Размер буфера, байт:",0
      DB LIGHTGREEN,16,0,"Информационные флаги:",0
      DB LIGHTGREEN,17,0
      DB "Количество физических цилиндров:",0
      DB LIGHTGREEN,18,0
      DB "Количество физических головок:",0
      DB LIGHTGREEN,19,0
      DB "Количество секторов на дорожке:",0
      DB LIGHTGREEN,20,0
      DB "Общее количество секторов на диске:",0
      DB LIGHTGREEN,21,0
      DB "Количество байтов в сектоке:",0
Text3 DB LIGHTBLUE,0,23
      DB "Тестирование функции 42h EDD BIOS",0
Text4 DB YELLOW,5,8,"Содержимое сектора XXXXXXXXh:",0
      DB YELLOW,17,8,"Управляющие клавиши:",0
      DB LIGHTGREEN,19,8
      DB "Стрелка вниз - следующий сектор;",0
      DB LIGHTGREEN,20,8
      DB "Стрелка вверх - предыдущий сектор;",0
      DB LIGHTGREEN,21,8,"Esc - выход.",0
      DB YELLOW,24,27,"Нажмите управляющую клавишу",0
AnyK  DB YELLOW,24,29,"Нажмите любую клавишу",0
; Сообщения об ошибках
Err0 DB LIGHTRED,12,19
     DB "Диск C не поддерживает набор функций EDD",0
Err1 DB LIGHTRED,12,18
     DB "Система не поддерживает функцию 42h EDD BIOS",0

; Блок параметров дисковода
DParameters DB 64 DUP(?)
; Параметры интерфейса
InterfaceBitMap DW ?
; Адресный пакет
APacket DB 16 DUP(0)
; Буфер для хранения содержимого сектора
SectorBuffer DB 512 DUP(?)
ENDS

CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC Test_EDD_Functions
        mov     AX,DGROUP
        mov     DS,AX
; Установить текстовый режим и очистить экран
        mov     AX,3
        int     10h
; Скрыть курсор - убрать за нижнюю границу экрана
        mov     [ScreenString],25
        mov     [ScreenColumn],0
        call    SetCursorPosition

; ПРОВЕРКА НАЛИЧИЯ EDD BIOS
; Вывести основной заголовок на экран
        MShowColorText 1,Text0
; Протестировать дисковод "C:"
        mov     AH,41h
        mov     BX,55AAh
        mov     DL,80h ;тестировать жесткий диск 0
        int     13h
; Проверить правильность выполнения функции
        jc      @@NoEDDSupport
        cmp     BX,0AA55h
        jne     @@NoEDDSupport
; Сохранить параметры интерфейса
        mov     [InterfaceBitMap],CX
; Показать результат опроса EDD BIOS
        call    EDDSupport
; СЧИТЫВАНИЕ ПАРАМЕТРОВ ПЕРВОГО ЖЕСТКОГО ДИСКА (ДИСКА С)
; Получить параметры дисковода
        ; Задать предельный размер блока параметров
        mov     [word ptr DParameters],30
        ; Задать номер диска
        mov     AH,48h
        mov     DL,80h
        mov     SI,offset DParameters
        int     13h
; Отобразить полученные параметры дисковода
        call    ShowDiskParameters
; Ожидать нажатия любой клавиши
        call    GetChar

; ПОСЛЕДОВАТЕЛЬНЫЙ ПРОСМОТР СЕКТОРОВ ДИСКА
; Очистить экран
        call    ClearScreen
; Вывести заголовок
        mov     SI,offset Text3
        call    ShowColorString
; Проверить наличие поддержки пакетных функций 
        test    [InterfaceBitMap],1b
        jz      @@EDDError
; Вывести названия выходных параметров функции 42h
        MShowColorText 6,Text4
; Сформировать адресный пакет
        ; Задать размер адресного пакета
        mov     [APacket],16
        ; Задать количество передаваемых блоков
        mov     [APacket+2],1
        ; Задать адрес буфера сектора
        mov     [word ptr APacket+4],offset SectorBuffer
        mov     AX,DS
        mov     [word ptr APacket+6],AX
        ; Задать начальный 64-разрядный LBA-адрес сектора
        mov     [dword ptr APacket+8],0
        mov     [dword ptr APacket+12],0

; ЦИКЛ ПО СЕКТОРАМ
@@ReadSector:
; Выполнить чтение пакета
        mov     AH,42h
        mov     DL,80h
        mov     SI,offset APacket
        int     13h
; Вывести адрес сектора в шестнадцатеричном коде
        MShowHexDWord 5,27,<[dword ptr APacket+8]>
; Отобразить содержимое сектора
        mov     SI,offset SectorBuffer
        call    ShowSector512

; Ожидать нажатие управляющей клавиши
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
        ; Увеличить на 1 номер сектора
        inc     [dword ptr APacket+8]
        jmp     @@ReadSector
@@TestUp:
        cmp     AH,B_UP         ;"Стрелка вверх"
        jne     @@CommandError
        cmp     [dword ptr APacket+8],0
        je      @@CommandError
        ; Уменьшить на 1 номер сектора
        dec     [dword ptr APacket+8]
        jmp     @@ReadSector
@@CommandError:
        call    Beep
        jmp     @@GetCommand

; Переустановить текстовый режим и очистить экран
@@Exit: mov     AX,3
        int     10h
; Выход в DOS
        mov     AH,4Ch
        int     21h

; Выдача сообщений об ошибках
@@NoEDDSupport:
        mov     SI,offset Err0
        call    FatalError
@@EDDError:
        mov     SI,offset Err1
        call    FatalError
ENDP Test_EDD_Functions 


;**********************************************
;* ВЫВОД РЕЗУЛЬТАТА ПРОВЕРКИ НАЛИЧИЯ EDD BIOS *
;**********************************************
PROC EDDSupport near
        pusha
; Вывести названия выходных параметров функции 41h
        MShowColorText 6,Text1
; Вывести указание оператору
        MShowColorText 1,AnyK
; Задать начальные координаты для вывода символов Y/N
        mov     [ScreenString],8
        mov     [ScreenColumn],41
; Проверить наличие поддержки пакета дискового адреса
        mov     AL,'N'
        test    [InterfaceBitMap],1b
        jz      @@NoDiskPacket
        mov     AL,'Y'
@@NoDiskPacket:
        call    ShowChar
        inc     [ScreenString]
; Проверить наличие поддержки запирания носителя
        mov     AL,'N'
        test    [InterfaceBitMap],10b
        jz      @@NoLocking
        mov     AL,'Y'
@@NoLocking:
        call    ShowChar
        inc     [ScreenString]
; Проверить наличие поддержки специальных функций EDD
        mov     AL,'N'
        test    [InterfaceBitMap],100b
        jz      @@NoEDDFunc
        mov     AL,'Y'
@@NoEDDFunc:
        call    ShowChar
        inc     [ScreenString]
; Проверить наличие поддержки 64-разрядной адресации
        mov     AL,'N'
        test    [InterfaceBitMap],1000b
        jz      @@No64Addr
        mov     AL,'Y'
@@No64Addr:
        call    ShowChar
        popa
        ret
ENDP EDDSupport


;******************************
;* ВЫВОД ПАРАМЕТРОВ ДИСКОВОДА *
;******************************
PROC ShowDiskParameters near
        pusha
; Вывести наименования полей
        MShowColorText 8,Text2
; Отобразить полученные параметры дисковода
        ; Размер буфера, байт
        MShowDecWord 15,41,<[word ptr DParameters]>
        ; Информационные флаги
        MShowBinWord 16,41,<[word ptr DParameters+2]>
        ; Количество физических цилиндров
        MShowDecDWord 17,41,<[dword ptr DParameters+4]>
        ; Количество физических головок
        MShowDecDWord 18,41,<[dword ptr DParameters+8]>
        ; Количество секторов на дорожке
        MShowDecDWord 19,41,<[dword ptr DParameters+12]>
        ; Общее количество секторов на диске
        MShowDecDWord 20,41,<[dword ptr DParameters+16]>
        ; Количество байтов в секторе
        MShowDecWord 21,41,<[word ptr DParameters+24]>
        popa
        ret
ENDP ShowDiskParameters
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуры для перевода чисел из двоичного
; кода в десятичный
include "lst03_03.inc"
END
