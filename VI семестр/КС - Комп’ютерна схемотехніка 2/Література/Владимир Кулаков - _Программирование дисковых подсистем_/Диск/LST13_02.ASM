;                     ЛИСТИНГ 13.2
;     Поиск файла AUTOEXEC.BAT в корневом каталоге
;       логического диска "C:" и отображение его
;             начального участка на экране
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst13_02.asm, 11.02.2001.

IDEAL
P386
LOCALS
MODEL MEDIUM

; Подключить файл мнемонических обозначений
; кодов управляющих клавиш и цветовых кодов
include "lst03_01.inc"
; Подключить файл макросов
include "lst03_04.inc"

; Размер корневого каталога в секторах
RootDirSize equ 32

DATASEG
; Текстовые сообщения
Txt00 DB LIGHTCYAN,0,30,"ПОИСК ЖЕСТКОГО ДИСКА",0
      DB YELLOW,24,35,"Ждите ...",0
Txt10 DB YELLOW,0,6,"МЕСТОПОЛОЖЕНИЕ И РАЗМЕР СТРУКТУР "
      DB "ДАННЫХ ОСНОВНОГО РАЗДЕЛА ДИСКА С:",0
Txt11 DB 2,4,"Начальный сектор основного раздела:",0
      DB 3,13,"Тип FAT основного раздела:",0
      DB 4,19,"Секторов в кластере:",0
      DB 5,14,"Число резервных секторов:",0
      DB 6,23,"Число копий FAT:",0
      DB 7,1,"Число секторов, занимаемых копией FAT:",0
      DB 8,18,"Начальный сектор FAT:",0
      DB 9,7,"Начальный сектор области данных:",0
      DB 10,3,"Начальный сектор корневого каталога:",0
Txt20 DB YELLOW,0,11,"СОДЕРЖИМОЕ ПЕРВОГО СЕКТОРА FAT "
      DB "ОСНОВНОГО РАЗДЕЛА ДИСКА С:",0
Txt30 DB YELLOW,0,21
      DB "НАЧАЛЬНЫЙ УЧАСТОК КОРНЕВОГО КАТАЛОГА",0
      DB LIGHTGREEN,2,0,"  Имя файла     Размер    "
      DB "Атрибуты     Дата      Время",0
Txt40 DB YELLOW,0,23
      DB "ПЕРВЫЙ СЕКТОР ФАЙЛА AUTOEXEC.BAT",0
; Тип FAT
FAT16 DB 3,40,"FAT16",0
FAT32 DB 3,40,"FAT32",0
; Указания для оператора
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Сообщения об ошибках
Err1 DB LIGHTRED,12,25
     DB "Диск не поддерживает режим LBA",0
Err2 DB LIGHTRED,12,25
     DB "Основной раздел DOS не найден",0
Err3 DB LIGHTRED,12,16,"Файл AUTOEXEC.BAT в корневом "
     DB "каталоге не найден",0
; Шаблон даты и времени
ZeroDate DB "00.00.0000  00:00:00",0
; Начальный сектор основного раздела DOS
PriDOS_StartSector DD ?
; Линейный адрес загрузочного сектора
BootSector         DD ?
; Число секторов в кластере
SectorsInCluster   DW ?
; Число резервных секторов
RSects             DD ?
; Число таблиц FAT на диске
FATsOnDisk         DW ?
; Размер одной таблицы FAT в секторах
FATSize            DD ?
; Абсолютный номер начального сектора FAT
FATStartSect       DD ?
; Номер первого кластера корневого каталога в FAT32
RootDirClaster     DD ?
; Абсолютный номер начального сектора области данных
DataAreaStartSect  DD ?
; Абсолютный номер начального сектора корневого каталога
RootDirStartSect   DD ?
; Начальный кластер файла
FileStartCluster   DD ?
; Абсолютный номер начального сектора файла
FileStartSect      DD ?
; Длина файла в байтах
FileSize           DD ?
; Счетчик секторов
SectorCounter      DW ?
; Счетчик элементов каталога
ElementCounter     DW ?
; Длинное имя файла (не более 64 символов)
LongFileName DB 65 DUP (?)
ENDS

SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS


CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC SearchAutoexecBat
        mov     AX,DGROUP
        mov     DS,AX
; Установить текстовый режим и очистить экран
        mov     AX,3
        int     10h
; Скрыть курсор - убрать за нижнюю границу экрана
        mov     [ScreenString],25
        mov     [ScreenColumn],0
        call    SetCursorPosition
; Вывести заголовок экрана
        MShowColorText 2,Txt00
; Найти жесткий диск "C:"
        call    FindHDD
; Проверить наличие поддержки режима LBA 
        cmp     [dword ptr Sector512+60*2],0
        je      @@LBANotSupported

; Прочитать загрузочный сектор диска
        mov     [dword ptr SectorAddress],0
        call    ReadHDDSector
; Записать номер начального сектора основного раздела
        mov     SI,offset Sector512
        add     SI,1BEh      ;смещение первой записи
        mov     EAX,[SI+8]
        mov     [PriDOS_StartSector],EAX
; Проверить код основного раздела
        mov     SI,offset Sector512
        add     SI,1BEh    ;смещение первой записи
        mov     AL,[SI+4]  ;извлечь тип раздела
        cmp     AL,04h
        je      @@FAT16
        cmp     AL,06h
        je      @@FAT16
        cmp     AL,0Bh
        je      @@FAT32
        cmp     AL,0Eh
        jne     @@PrimPartNotFound
@@FAT16:; Обработка структур FAT16
        call    FAT16_Structures
@@FAT32:; Обработка структур FAT32
        call    FAT32_Structures

; Обработка ошибок
@@LBANotSupported:
        ; Сообщение "Диск не поддерживает LBA"
        MShowColorText 1,Err1
        jmp short @@AllErr
@@PrimPartNotFound:
        ; Сообщение "Не найден основной раздел"
        MShowColorText 1,Err2
@@AllErr:
        ; Общая часть обработки ошибок
        MShowColorText 1,AnyK
        call    GetChar
; Завершение работы программы
@@End:  ; Переустановить текстовый режим
        mov     ax,3
        int     10h
        ; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP SearchAutoexecBat


;***********************************
;* ОБРАБОТКА СТРУКТУР ДАННЫХ FAT16 *
;***********************************
PROC FAT16_Structures NEAR
; Прочитать BOOT-сектор основного раздела
        mov     EAX,[PriDOS_StartSector]
        mov     [SectorAddress],EAX
        call    ReadHDDSector
; Записать основные параметры для расчетов
        mov     SI, offset Sector512
        ; Число секторов в кластере
        movzx   AX,[byte ptr SI+0Dh]
        mov     [SectorsInCluster],AX
        ; Число резервных секторов
        movzx   EAX,[word ptr SI+0Eh]
        mov     [RSects],EAX
        ; Число копий FAT в разделе
        movzx   AX,[byte ptr SI+10h]
        mov     [FATsOnDisk],AX
        ; Размер одной таблицы FAT в секторах
        xor     EAX,EAX
        mov     AX,[SI+16h]
        mov     [FATSize],EAX
; Вычислить начальный сектор FAT
        mov     EAX,[PriDOS_StartSector]
        add     EAX,[RSects]
        mov     [FATStartSect],EAX
; Вычислить начальный сектор корневого каталога
        mov     EAX,[FATSize]
        movzx   EDX,[FATsOnDisk]
        mul     EDX
        add     EAX,[FATStartSect]
        mov     [RootDirStartSect],EAX
; Вычислить начальный сектор области данных
        add     EAX,RootDirSize
        mov     [DataAreaStartSect],EAX
; Отобразить значения параметров
        call    ShowParameters
        MShowText 1,FAT16
; Выдать указание оператору и ждать нажатия клавиши
        MShowColorText 1,AnyK
        call    GetChar

; ПРОЧИТАТЬ И ПОКАЗАТЬ НАЧАЛЬНЫЙ УЧАСТОК FAT
; Очистить экран и вывести текстовые сообщения
        call    ClearScreen
        MShowColorText 1,Txt20
        MShowColorText 1,AnyK
; Прочитать начальный сектор FAT
        mov     EAX,[FATStartSect]
        mov     [SectorAddress],EAX
        call    ReadHDDSector
; Отобразить начальный участок FAT
        mov     [ScreenString],2
        mov     [ScreenColumn],0
        mov     SI,offset Sector512
        mov     CX,256
@@FAT:  lodsw
        call    ShowHexWord
        inc     [ScreenColumn]
        loop    @@FAT
; Ожидать нажатия любой клавиши
        call    GetChar

; ПРОЧИТАТЬ И ПОКАЗАТЬ ПЕРВЫЙ СЕКТОР КОРНЕВОГО КАТАЛОГА
        call    ShowRootDir

; НАЙТИ ФАЙЛ AUTOEXEC.BAT В КОРНЕВОМ КАТАЛОГЕ
; Очистить экран и вывести текстовые сообщения
        call    ClearScreen
        MShowColorText 1,Txt40
; Обнулить счетчик секторов каталога
        mov     [SectorCounter],0
; Задать номер начального сектора каталога
        mov     EAX,[RootDirStartSect]
        mov     [SectorAddress],EAX
; Прочитать очередной сектор корневого каталога
@@ReadNextCatalogSector:
        call    ReadHDDSector
        mov     SI,offset Sector512
        mov     CX,16 ;число элементов в одном секторе
; Цикл просмотра элементов каталога
@@TestNextElement:
        ; Имя совпадает?
        cmp     [dword ptr SI],'OTUA'
        jne     @@NotAutoexec
        cmp     [dword ptr SI+4],'CEXE'
        jne     @@NotAutoexec
        ; Расширение совпадает?
        cmp     [dword ptr SI+7],'TABC'
        je      @@AutoexecFileFound
@@NotAutoexec:
        add     SI,32 ;прибавить размер элемента
        loop    @@TestNextElement
        ; Файл AUTOEXEC.BAT в секторе не найден
        inc     [dword ptr SectorAddress]
        inc     [SectorCounter]
        cmp     [SectorCounter],RootDirSize
        jb      @@ReadNextCatalogSector
        ; Ошибка - файл AUTOEXEC.BAT не найден
        je      @@AutoexecFileNotFound

; Показать начальный участок файла AUTOEXEC.BAT
@@AutoexecFileFound:
        ; Определить начальный кластер файла
        xor     EAX,EAX
        mov     AX,[SI+1Ah]  ;загрузить младшее слово
        mov     [FileStartCluster],EAX
        ; Определить длину файла в байтах
        mov     EAX,[SI+1Ch]
        mov     [FileSize],EAX
        ; Вычислить абсолютный номер начального сектора
        mov     EAX,[FileStartCluster]
        sub     EAX,2
        movzx   EDX,[SectorsInCluster]
        mul     EDX
        add     EAX,[DataAreaStartSect]
        mov     [FileStartSect],EAX
        ; Прочитать начальный сектор файла
        mov     [SectorAddress],EAX
        call    ReadHDDSector
        ; Показать содержимое сектора
        mov     SI,offset Sector512
        call    ShowSector512
        ; Ожидать нажатия любой клавиши
        MShowColorText 1,AnyK
        call    GetChar
        jmp short @@End

; Сообщение "Не найден файл AUTOEXEC"
@@AutoexecFileNotFound:
        MShowColorText 1,Err3
        MShowColorText 1,AnyK
        call    GetChar

; Завершение работы программы
@@End:  ; Переустановить текстовый режим
        mov     ax,3
        int     10h
        ; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP FAT16_Structures


;***********************************
;* ОБРАБОТКА СТРУКТУР ДАННЫХ FAT32 *
;***********************************
PROC FAT32_Structures NEAR
; Прочитать BOOT-сектор основного раздела
        mov     EAX,[PriDOS_StartSector]
        mov     [SectorAddress],EAX
        call    ReadHDDSector
; Записать основные параметры для расчетов
        mov     SI, offset Sector512
        ; Число секторов в кластере
        movzx   AX,[byte ptr SI+0Dh]
        mov     [SectorsInCluster],AX
        ; Число резервных секторов
        movzx   EAX,[word ptr SI+0Eh]
        mov     [RSects],EAX
        ; Число копий FAT в разделе
        movzx   AX,[byte ptr SI+10h]
        mov     [FATsOnDisk],AX
        ; Размер одной таблицы FAT в секторах
        mov     EAX,[SI+24h]
        mov     [FATSize],EAX
        ; Номер первого кластера корневого каталога
        mov     EAX,[SI+2Ch]
        mov     [RootDirClaster],EAX
; Вычислить начальный сектор FAT
        mov     EAX,[PriDOS_StartSector]
        add     EAX,[RSects]
        mov     [FATStartSect],EAX
; Вычислить начальный сектор области данных
        ; Вычислить начальное смещение
        mov     EAX,[PriDOS_StartSector]
        add     EAX,[RSects]
        mov     [DataAreaStartSect],EAX
        ; Прибавить размер области FAT
        mov     EAX,[FATSize]
        movzx   EDX,[FATsOnDisk]
        mul     EDX
        add     [DataAreaStartSect],EAX
; Вычислить начальный сектор корневого каталога
        mov     EAX,[RootDirClaster]
        sub     EAX,2
        movzx   EDX,[SectorsInCluster]
        mul     EDX
        add     EAX,[DataAreaStartSect]
        mov     [RootDirStartSect],EAX
; Отобразить значения параметров
        call    ShowParameters
        MShowText 1,FAT32
; Выдать указание оператору и ждать нажатия клавиши
        MShowColorText 1,AnyK
        call    GetChar

; ПРОЧИТАТЬ И ПОКАЗАТЬ НАЧАЛЬНЫЙ УЧАСТОК FAT
; Очистить экран и вывести текстовые сообщения
        call    ClearScreen
        MShowColorText 1,Txt20
        MShowColorText 1,AnyK
; Прочитать начальный сектор FAT
        mov     EAX,[FATStartSect]
        mov     [SectorAddress],EAX
        call    ReadHDDSector
; Отобразить начальный участок FAT
        mov     [ScreenString],2
        mov     [ScreenColumn],0
        mov     SI,offset Sector512
        mov     CX,128
@@FAT:  mov     EAX,[SI]
        call    ShowHexDWord
        add     [ScreenColumn],2
        add     SI,4
        loop    @@FAT
; Ожидать нажатия любой клавиши
        call    GetChar

; ПРОЧИТАТЬ И ПОКАЗАТЬ ПЕРВЫЙ СЕКТОР КОРНЕВОГО КАТАЛОГА
        call    ShowRootDir

; НАЙТИ ФАЙЛ AUTOEXEC.BAT В КОРНЕВОМ КАТАЛОГЕ
; Очистить экран и вывести текстовые сообщения
        call    ClearScreen
        MShowColorText 1,Txt40
; Обнулить счетчик секторов каталога
        mov     [SectorCounter],0
; Задать номер начального сектора каталога
        mov     EAX,[RootDirStartSect]
        mov     [SectorAddress],EAX
; Прочитать очередной сектор корневого каталога
@@ReadNextCatalogSector:
        call    ReadHDDSector
        mov     SI,offset Sector512
        mov     CX,16 ;число элементов в одном секторе
; Цикл просмотра элементов каталога
@@TestNextElement:
        ; Имя совпадает?
        cmp     [dword ptr SI],'OTUA'
        jne     @@NotAutoexec
        cmp     [dword ptr SI+4],'CEXE'
        jne     @@NotAutoexec
        ; Расширение совпадает?
        cmp     [dword ptr SI+7],'TABC'
        je      @@AutoexecFileFound
@@NotAutoexec:
        add     SI,32 ;прибавить размер элемента
        loop    @@TestNextElement
        ; Файл AUTOEXEC.BAT в секторе не найден
        inc     [dword ptr SectorAddress]
        inc     [SectorCounter]
        mov     AX,[SectorsInCluster]
        cmp     [SectorCounter],AX
        jb      @@ReadNextCatalogSector
        ; Ошибка - файл AUTOEXEC.BAT не найден
        ; в первом кластере каталога
        je      @@AutoexecFileNotFound

; Показать начальный участок файла AUTOEXEC.BAT
@@AutoexecFileFound:
        ; Определить начальный кластер файла
        mov     AX,[SI+14h]  ;загрузить старшее слово
        shl     EAX,16
        mov     AX,[SI+1Ah]  ;загрузить младшее слово
        mov     [FileStartCluster],EAX
        ; Определить длину файла в байтах
        mov     EAX,[SI+1Ch]
        mov     [FileSize],EAX
        ; Вычислить абсолютный номер начального сектора
        mov     EAX,[FileStartCluster]
        sub     EAX,2
        movzx   EDX,[SectorsInCluster]
        mul     EDX
        add     EAX,[DataAreaStartSect]
        mov     [FileStartSect],EAX
        ; Прочитать начальный сектор файла
        mov     [SectorAddress],EAX
        call    ReadHDDSector
        ; Показать содержимое сектора
        mov     SI,offset Sector512
        call    ShowSector512
; Ожидать нажатия любой клавиши
        MShowColorText 1,AnyK
        call    GetChar
        jmp short @@End

; Сообщение "Не найден файл AUTOEXEC"
@@AutoexecFileNotFound:
        MShowColorText 1,Err3
        MShowColorText 1,AnyK
        call    GetChar

; Завершение работы программы
@@End:  ; Переустановить текстовый режим
        mov     ax,3
        int     10h
        ; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP FAT32_Structures


;*******************************************
;* ВЫВЕСТИ ИНФОРМАЦИЮ О ПАРАМЕТРАХ РАЗДЕЛА *
;*******************************************
PROC ShowParameters NEAR
        pushad
; Вывести заголовок экрана и заголовки полей
        MShowColorText 1,Txt10
        mov     [TextColorAndBackground],LIGHTGREEN
        MShowText 9,Txt11
        mov     [TextColorAndBackground],WHITE
; Вывести номер начального сектора
        MShowDecDWord 2,40,[PriDOS_StartSector]
; Отобразить значения параметров
        MShowDecWord 4,40,[SectorsInCluster]
        MShowDecDWord 5,40,[RSects]
        MShowDecWord 6,40,[FATsOnDisk]
        MShowDecDWord 7,40,[FATSize]
        MShowDecDWord 8,40,[FATStartSect]
        MShowDecDWord 9,40,[DataAreaStartSect]
        MShowDecDWord 10,40,[RootDirStartSect]
        popad
        ret
ENDP ShowParameters


;**************************************************
;* ПРОЧИТАТЬ И ПОКАЗАТЬ НАЧАЛО КОРНЕВОГО КАТАЛОГА *
;**************************************************
PROC ShowRootDir NEAR
        pushad
; Обнулить длинное имя
        mov     [LongFileName],0
        mov     [LongFileName+64],0
; Очистить экран
        call    ClearScreen
; Вывести заголовок
        MShowColorText 2,Txt30
; Использовать при выводе строк серый цвет, черный фон
        mov     [TextColorAndBackground],LIGHTGREY
; Задать начальный сектор корневого каталога
        mov     EAX,[RootDirStartSect]
        mov     [SectorAddress],EAX
; Начать вывод с третьей строки экрана
        mov     [ScreenString],3
; Обнулить счетчик обработанных секторов каталога
        mov     [SectorCounter],0
@@NextSector:
; Прочитать очередной сектор корневого каталога
        call    ReadHDDSector
; Цикл вывода элементов каталога
        mov     SI,offset Sector512
        mov     [ElementCounter],0
@@NextElement:
        ; Проверить номер строки экрана
        cmp     [ScreenString],22
        ja      @@End

; Обычный элемент или компонента длинного имени?
        ; Выделить младшие 4 разряда байта атрибутов
        mov     AL,[SI+0Bh]
        and     AL,0Fh
        cmp     AL,0Fh
        je      @@LongNameComponent

; Проверить признак конца каталога
        cmp     [byte ptr SI],0
        je      @@End

; Проверить наличие данных в элементе каталога
        cmp     [byte ptr SI],0E5h
        je      @@ElementNotUsed

; Заменить 05h на 0E5h
        cmp     [byte ptr SI],05h   ;код спецсимвола?
        jne     @@NormalChar
        mov     [byte ptr SI],0E5h
@@NormalChar:

; Отобразить строку каталога
        ; Имя файла
        mov     [ScreenColumn],0
        mov     BX,0
        mov     CX,8
        call    ShowASCIIField
        ; Расширение имени файла
        mov     [ScreenColumn],9
        mov     BX,8
        mov     CX,3
        call    ShowASCIIField
        ; Размер файла в байтах
        mov     [ScreenColumn],15
        mov     EAX,[SI+1Ch]
        call    ShowDecDWord
        ; Атрибуты файла
        mov     [ScreenColumn],26
        mov     AL,[SI+0Bh]
        call    ShowBinByte
        ; Дата и время создания
        mov     [ScreenColumn],36
        call    TimeAndDate
        jmp     @@IncStringNumber
; Обработка компоненты длинного имени
@@LongNameComponent:
        ; Сдвиг массива имени на 13 байт
        mov     CX,64-13
        mov     BX,63
@@NextChar:
        mov     AL,[BX+LongFileName-13]
        mov     [BX+LongFileName],AL
        dec     BX
        loop    @@NextChar
        
; Копирование компоненты длинного имени в начало массива
        mov     DI,offset LongFileName
        ; Копирование первого участка
        mov     CX,5
        mov     BX,01h
@@NameComponent1:
        mov     AX,[SI+BX]
        call    UnicodeToASCII
        mov     [DI],AL
        add     BX,2
        inc     DI
        loop    @@NameComponent1
        ; Копирование второго участка
        mov     CX,6
        mov     BX,0Eh
@@NameComponent2:
        mov     AX,[SI+BX]
        call    UnicodeToASCII
        mov     [DI],AL
        add     BX,2
        inc     DI
        loop    @@NameComponent2
        ; Копирование третьего участка
        mov     CX,2
        mov     BX,1Ch
@@NameComponent3:
        mov     AX,[SI+BX]
        call    UnicodeToASCII
        mov     [DI],AL
        add     BX,2
        inc     DI
        loop    @@NameComponent3

; Достигнуто начало длинного имени?
        mov     AL,[SI]
        and     AL,0111111b ;выделить номер компоненты
        cmp     AL,01h
        jne     @@ElementNotUsed
; Вывести длинное имя
        mov     [ScreenColumn],0
        push    SI
        mov     SI,offset LongFileName
        mov     CX,64 ;предельная длина строки
@@NextLongNameChar:
        lodsb
        cmp     AL,0
        je      @@EndOfName
        call    ShowChar
        inc     [ScreenColumn]
        loop    @@NextLongNameChar
@@EndOfName:
        pop     SI
        ; Стереть длинное имя
        mov     [LongFileName],0

; Перейти к следующей строке экрана
@@IncStringNumber:
        inc     [ScreenString]
; Перейти к следующему элементу
@@ElementNotUsed:
        add     SI,32
        inc     [ElementCounter]
        cmp     [ElementCounter],16
        jb      @@NextElement
; Перейти к обработке следующего сектора каталога
        inc     [dword ptr SectorAddress]
        inc     [SectorCounter]
        cmp     [SectorCounter],8
        jb      @@NextSector

; Ожидать нажатия любой клавиши
@@End:  MShowColorText 1,AnyK
        call    GetChar
        popad
        ret
ENDP ShowRootDir


;****************************************************
;*        ПОКАЗАТЬ ДАТУ И ВРЕМЯ ЗАПИСИ ФАЙЛА        *
;* Передаваемые параметры:                          *
;* DS:SI - указатель на элемент каталога;           *
;* Цвет задается переменной TextColorAndBackground. *
;* Координаты позиции передаются через глобальные   *
;* переменные ScreenString и ScreenColumn.          *
;****************************************************
PROC TimeAndDate near
        pusha
; Сохранить экранные координаты
        push    [ScreenColumn]

; Вывести заполненный нулями шаблон даты
        push    SI
        mov     SI,offset ZeroDate
        mov     BX,0
        mov     CX,20
        call    ShowASCIIField
        pop     SI
; Вывести дату
        ; Вывести номер дня
        push    [ScreenColumn]
        mov     AX,[SI+18h]
        and     AL,11111b
        cmp     AL,9
        ja      @@Day
        inc     [ScreenColumn]
@@Day:  call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести номер месяца
        push    [ScreenColumn]
        mov     AX,[SI+18h]
        shr     AX,5
        and     AL,1111b
        cmp     AL,9
        ja      @@Mon
        inc     [ScreenColumn]
@@Mon:  call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести номер года
        mov     AX,[SI+18h]
        shr     AX,9
        and     AL,1111111b
        add     AX,1980
        call    ShowDecWord
; Вывести время
        add     [ScreenColumn],6
        ; Вывести час
        push    [ScreenColumn]
        mov     AX,[SI+16h]
        shr     AX,11
        and     AL,11111b
        cmp     AL,9
        ja      @@H
        inc     [ScreenColumn]
@@H:    call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести минуту
        push    [ScreenColumn]
        mov     AX,[SI+16h]
        shr     AX,5
        and     AL,111111b
        cmp     AL,9
        ja      @@M
        inc     [ScreenColumn]
@@M:    call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести секунду
        mov     AX,[SI+16h]
        and     AL,11111b
        shl     AL,1
        cmp     AL,9
        ja      @@S
        inc     [ScreenColumn]
@@S:    call    ShowDecByte
; Восстановить экранные координаты
        pop     [ScreenColumn]
        popa
        ret
ENDP TimeAndDate


;************************************************
;* ПРЕОБРАЗОВАТЬ КОД СИМВОЛА ИЗ UNICODE В ASCII *
;* Передаваемый параметр:                       *
;* AX - символ в формате Unicode.               *
;* Выходной параметр:                           *
;* AL - символ в коде ASCII (AH = 0).           *
;************************************************
PROC UnicodeToASCII near
; Преобразовать символ в код ASCII
        ; Латинские символы?
        cmp     AX,80h
        jb      @@Exit
        ; Буква "Ё"?
        cmp     AX,401h
        je      @@E1
        cmp     AX,451h
        je      @@E2
        ; Русские символы?
        cmp     AX,410h
        jb      @@UndefinedChar
        cmp     AX,44Fh
        ja      @@UndefinedChar
        cmp     AX,43Fh
        ja      @@Group2
; Преобразование русских символов первой группы
        add     AL,70h
        jmp     @@Exit
; Преобразование русских символов второй группы
@@Group2:
        add     AL,0A0h
        jmp     @@Exit
; Преобразование буквы "Ё"
@@E1:   mov     AL,0F0h
        jmp     @@Exit
@@E2:   mov     AL,0F1h
        jmp     @@Exit
; Преобразование неизвестных символов в знак вопроса
@@UndefinedChar:
        mov     AL,'?'
@@Exit: mov     AH,0
        ret
ENDP UnicodeToASCII
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
