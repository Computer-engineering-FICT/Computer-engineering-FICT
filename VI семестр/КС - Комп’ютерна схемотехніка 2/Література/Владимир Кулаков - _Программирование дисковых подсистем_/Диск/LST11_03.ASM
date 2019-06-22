;                     ЛИСТИНГ 11.3
;   Просмотр секторов жесткого диска "C:" в режиме LBA
;            с использованием протокола PIO
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst11_03.asm, 04.02.2001.

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
; Заголовок экрана
Txt1 DB LIGHTCYAN,0,30,"ПОИСК ЖЕСТКОГО ДИСКА",0
; Заголовки полей параметров жесткого диска
Txt2 DB 2,27,"На канале   найден диск  .",0
     DB 4,25,"Параметры обнаруженного диска:",0
     DB 6,22,"Общая информация:",0
     DB 7,12,"Число логических цилиндров:",0
     DB 8,14,"Число логических головок:",0
     DB 9,13,"Число логических секторов:",0
     DB 10,24,"Серийный номер:",0
     DB 11,32,"Модель:",0
     DB 12,8,"Макс. кол-во секторов за сеанс:",0
     DB 13,27,"Возможности:",0
     DB 14,10,"Текущее число лог. цилиндров:",0
     DB 15,12,"Текущее число лог. головок:",0
     DB 16,11,"Текущее число лог. секторов:",0
     DB 17,13,"Текущая емкость, секторов:",0
     DB 18,11,"Число секторов в режиме LBA:",0
     DB 19,13,"Поддерживаемые режимы DMA:",0
     DB 20,17,"Улучшенные режимы PIO:",0
; Указания для оператора
Txt3 DB LIGHTCYAN,0,17,"Просмотр секторов "
     DB "жесткого диска в ASCII-кодах",0
     DB LIGHTGREEN,5,8,"Сектор N XXXXXXXXh",0
     DB LIGHTCYAN,17,8,"Управляющие клавиши:",0
     DB LIGHTGREEN,19,8
     DB "Стрелка вниз - следующий сектор;",0
     DB LIGHTGREEN,20,8
     DB "Стрелка вверх - предыдущий сектор;",0
     DB LIGHTGREEN,21,8,"Esc - выход.",0
     DB YELLOW,24,27,"Нажмите управляющую клавишу",0
TxtW DB YELLOW,24,35,"Ждите ...",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Сообщение об ошибке
NoLBA DB LIGHTRED,12,24
      DB "Диск не поддерживает режим LBA.",0
ENDS

SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS

CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC DumpHDD
        mov     AX,DGROUP
        mov     DS,AX
; Установить текстовый режим и очистить экран
        mov     AX,3
        int     10h
; Скрыть курсор - убрать за нижнюю границу экрана
        mov     [ScreenString],25
        mov     [ScreenColumn],0
        call    SetCursorPosition
; ПОИСК ДИСКОВОДА
; Вывести текстовые сообщения на экран
        mov     SI,offset Txt1
        call    ShowColorString
        mov     SI,offset TxtW
        call    ShowColorString
; Найти жесткий диск "C:"
        call    FindHDD
; Показать параметры обнаруженного диска
        call    ShowHDD_ID

; ПРОСМОТР СОДЕРЖИМОГО СЕКТОРОВ
; Очистить экран
        call    ClearScreen
; Проверить наличие поддержки режима LBA
        cmp     [dword ptr Sector512+60*2],0
        je      @@LBANotSupported
; Вывести указания для оператора
        MShowColorText 7,Txt3
; ЦИКЛ ПО СЕКТОРАМ
        mov     [dword ptr SectorAddress],0
@@ReadSector:
; Прочитать сектор
        call    ReadHDDSector
; Показать номер сектора
        MShowHexDword 5,17,[SectorAddress]
; Показать содержимое сектора
        mov     SI,offset Sector512
        call    ShowSector512

; Ожидать ввода следующей команды
@@GetCommand:
        call    GetChar
        cmp     AL,0
        je      @@TestCommandByte
        call    Beep
        jmp short @@GetCommand
; Расшифровать команду
@@TestCommandByte:
        cmp     AH,B_Esc        ;"Выход"
        je      @@Exit
@@TestDn:
        cmp     AH,B_DN         ;"Стрелка вниз"
        jne     @@TestUp
        ; Увеличить на 1 номер сектора
        inc     [dword ptr SectorAddress]
        jmp     @@ReadSector
@@TestUp:
        cmp     AH,B_UP         ;"Стрелка вверх"
        jne     @@CommandError
        cmp     [dword ptr SectorAddress],0
        je      @@CommandError
        ; Уменьшить на 1 номер сектора
        dec     [dword ptr SectorAddress]
        jmp     @@ReadSector
; При нажатии любых других клавиш выдать звуковой сигнал
@@CommandError:
        call    Beep
        jmp     @@GetCommand

; Выдать сообщение "Диск не поддерживает LBA"
@@LBANotSupported:
        MShowColorText 1,NoLBA
        ; Экстренный выход в DOS
        mov     AH,4Ch
        int     21h
@@Exit:
; Переустановить текстовый режим
        mov     ax,3
        int     10h
; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP DumpHDD


;*****************************************************
;*         РАСШИФРОВКА ИДЕНТИФИКАТОРА ДИСКА          *
;* Расшифровывается информация из 512-байтного блока *
;* данных, размещенного в массиве Sector512.         *
;*****************************************************
PROC ShowHDD_ID near
        pushad
; Установить зеленый цвет и черный фон
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести заголовки полей
        MShowText 17,Txt2
        MShowColorText 1,AnyK
; Установить белый цвет и черный фон
        mov     [TextColorAndBackground],WHITE
; Вывести номер канала и номер диска
        MShowDecWord 2,37,[ChannelNumber]
        MShowDecByte 2,51,[DiskNumber]
; Вывести значения отдельных полей идентификатора
        ; Общая информация
        MShowBinWord 6,40,<[word ptr Sector512]>
        ; Число логических цилиндров
        MShowDecWord 7,40,<[word ptr Sector512+1*2]>
        ; Число логических головок
        MShowDecWord 8,40,<[word ptr Sector512+3*2]>
        ; Число логических секторов
        MShowDecWord 9,40,<[word ptr Sector512+6*2]>
        ; Серийный номер
        mov     AX,0B800h
        mov     ES,AX
        mov     SI,offset Sector512
        add     SI,10*2
        mov     DI,(10*80+40)*2
        mov     AH,[TextColorAndBackground]
        mov     CX,10
@@NextWord1:
        mov     DX,[SI]
        mov     AL,DH
        stosw
        mov     AL,DL
        stosw
        add     SI,2
        loop    @@NextWord1
        ; Номер модели
        mov     SI,offset Sector512
        add     SI,27*2
        mov     DI,(11*80+40)*2
        mov     AH,[TextColorAndBackground]
        mov     CX,20
@@NextWord2:
        mov     DX,[SI]
        mov     AL,DH
        stosw
        mov     AL,DL
        stosw
        add     SI,2
        loop    @@NextWord2
        ; Макс. кол-во секторов за сеанс
        MShowDecByte 12,40,<[Sector512+47*2]>
        ; Возможности
        MShowBinWord 13,40,<[word ptr Sector512+49*2]>
        ; Значения слов 54-58 достоверны?
        test    [word ptr Sector512+53*2],1
        jz      @@NotValid5458
        ; Текущее число логических цилиндров
        MShowDecWord 14,40,<[word ptr Sector512+54*2]>
        ; Текущее число логических головок
        MShowDecWord 15,40,<[word ptr Sector512+55*2]>
        ; Текущее число логических секторов
        MShowDecWord 16,40,<[word ptr Sector512+56*2]>
        ; Текущая емкость, секторов
        MShowDecDWord 17,40,<[dword ptr Sector512+57*2]>
@@NotValid5458:
        ; Число секторов в режиме LBA
        MShowDecDWord 18,40,<[dword ptr Sector512+60*2]>
        ; Поддерживаемые режимы DMA
        MShowBinByte 19,40,<[Sector512+63*2]>
        ; Значения слов 64-70 достоверны?
        test    [word ptr Sector512+53*2],10b
        jz      @@NotValid6470
        ; Поддерживаемые режимы PIO
        MShowBinByte 20,40,<[Sector512+64*2]>
@@NotValid6470:
        ; Ожидать нажатия любой клавиши
        call    GetChar
        popad
        ret
ENDP ShowHDD_ID
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуры для перевода чисел из двоичного
; кода в десятичный
include "lst03_03.inc"
; Подключить процедуру для подачи ATA-команды
include "lst11_01.inc"
; Подключить процедуры для поиска жесткого диска,
; считывания его параметров и чтения сектора
include "lst11_02.inc"
END
