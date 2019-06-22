;                     ЛИСТИНГ 11.7
;  Считывание загрузочного сектора жесткого диска "C:"
;           в режиме LBA с использованием DMA
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst11_07.asm, 07.02.2001.

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
Text0 DB LIGHTCYAN,0,10,"СЧИТЫВАНИЕ НУЛЕВОГО "
      DB "СЕКТОРА ЖЕСТКОГО ДИСКА C: В РЕЖИМЕ DMA",0
Text1 DB YELLOW,5,8,"Содержимое нулевого сектора:",0
AnyK  DB YELLOW,24,29,"Нажмите любую клавишу",0
NoHDD DB LIGHTRED,12,22
      DB "Диск подключен не к первому каналу",0
NoLBA DB LIGHTRED,12,24
      DB "Диск не поддерживает режим LBA.",0
NoSec DB LIGHTRED,12,32,"Сектор не найден",0
ENDS

; Буфер для таблицы PRD
SEGMENT PRD_Table para public 'DATA'  
        DB 16 DUP(?)
ENDS

; Буфер для приема сектора данных в режиме DMA
SEGMENT DMA_Sector512 para public 'DATA'  
        DB 512 DUP(?)
ENDS

SEGMENT sseg para stack 'STACK'
DB 400h DUP(?)
ENDS


CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC IDE_DMA_Test
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
        MShowColorText 1,Text0
; Найти жесткий диск "C:"
        call    FindHDD
; Проверить номер канала (программа рассчитана на
; использование только первого канала)
        cmp     [ChannelNumber],1
        je      @@TestLBASupport
        mov     SI,offset NoHDD
        call    FatalError
@@TestLBASupport:
; Проверить наличие поддержки режима LBA
        cmp     [dword ptr Sector512+60*2],0
        jne     @@LBASupported
        mov     SI,offset NoLBA
        call    FatalError
@@LBASupported:
; Найти контроллер PCI IDE
        call    SearchBusMasterIDEContr
; Создать таблицу PRD, состоящую из одной записи
        mov     AX,PRD_Table
        mov     ES,AX
        ; Вычислить и записать адрес области данных
        xor     EAX,EAX
        mov     AX,DMA_Sector512
        shl     EAX,4
        mov     [ES:0],EAX
        ; Записать количество передаваемых байтов данных
        mov     [word ptr ES:4],512
        ; Установить признак последней строки таблицы
        mov     [word ptr ES:6],8000h
; Загрузить физический адрес таблицы PRD в
; соответствующий регистр контроллера PCI IDE
        ; Вычислить абсолютный адрес PRDT (умножить
        ; номер сегмента PRD_Table на 16)
        xor     EAX,EAX
        mov     AX,PRD_Table
        shl     EAX,4
        ; Вычислить адрес регистра контроллера
        mov     DX,[IDEContrRegsBaseAddr]
        add     DX,04h
        ; Записать адрес PRD в регистр
        out     DX,EAX
; Прочитать нулевой сектор диска в режиме DMA
        call    ReadBootSector
; Показать содержимое прочитанного сектора
        MShowColorText 1,Text1
        push    DS
        mov     AX,DMA_Sector512
        mov     DS,AX
        xor     SI,SI
        call    ShowSector512
        pop     DS
; Ожидать нажатия любой клавиши
        MShowColorText 1,AnyK
        call    GetChar
; Переустановить текстовый режим и очистить экран
        mov     AX,3
        int     10h
; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP IDE_DMA_Test 


;*********************************************
;* ПРОЧИТАТЬ ЗАГРУЗОЧНЫЙ СЕКТОР В РЕЖИМЕ DMA *
;*********************************************
PROC ReadBootSector near
        pushad
; Сбросить разряды ошибки и прерывания в регистре
; состояния канала 1
;        mov     DX,[IDEContrRegsBaseAddr]
;        add     DX,02h
;        mov     AL,110b
;        out     DX,AL
; Настроить контроллер DMA на запись данных в память
; по каналу 1
        ; Загрузить адрес управляющего регистра канала 1
        mov     DX,[IDEContrRegsBaseAddr]
        ; Сбросить управляющий регистр
        mov     AL,0
        out     DX,AL
        ; Установить бит направления передачи данных
        mov     AL,1000b
        out     DX,AL

; Послать команду чтения сектора 0 (загрузочного)
        ; Подготовить параметры команды
        mov     [ATAAddressMode],1 ;режим LBA
        mov     [dword ptr SectorAddress],0    ;сектор 0
        mov     [dword ptr ATASectorNumber],0
        mov     [ATAFeatures],0
        mov     [ATASectorCount],1 ;прочесть один сектор
        mov     EAX,[SectorAddress]
        ; Послать команду диску
        mov     [ATACommand],0C8h  ;чтение в режиме DMA
        call    SendCommandToHDD
        ; Проверить код ошибки
        cmp     [DevErrorCode],0   ;имелась ошибка?
        jne     @@Err

; Сбросить разряды ошибки и прерывания в регистре
; состояния канала 1
        mov     DX,[IDEContrRegsBaseAddr]
        add     DX,02h
        mov     AL,110b
        out     DX,AL
; Активировать канал 1 контроллера DMA
        mov     DX,[IDEContrRegsBaseAddr]
        mov     AL,1001b
        out     DX,AL
; Ожидать готовность данных HDD
        mov     AX,0
        mov     ES,AX
        mov     DX,[ATABasePortAddr]
        add     DX,7     ;адрес регистра состояния
@@WaitCompleet:
        ; Проверить время выполнения команды
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,MaxHDDWaitTime
        ja      @@Err   ;ошибка тайм-аута
        ; Проверить готовность
        in      AL,DX
        test    AL,88h   ;состояние сигналов BSY и DRQ
        jnz     @@WaitCompleet
; Ожидать конца цикла DMA
        mov     DX,[IDEContrRegsBaseAddr]
        add     DX,02h
@@WaitDMAOperationEnd:
        in      AL,DX
        test    AL,100b
        jz      @@WaitDMAOperationEnd

; Сбросить управляющий регистр канала 1 контроллера DMA
        mov     DX,[IDEContrRegsBaseAddr]
        mov     AL,0
        out     DX,AL
        popad
        ret

; Обработка ошибок
@@Err:  mov     SI,offset NoSec
        call    FatalError
ENDP ReadBootSector
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуру поиска контроллера PCI IDE
include "lst04_01.inc"
; Подключить процедуру для подачи ATA-команды
include "lst11_01.inc"
; Подключить процедуры для поиска жесткого диска
; и считывания его параметров
include "lst11_02.inc"
END
