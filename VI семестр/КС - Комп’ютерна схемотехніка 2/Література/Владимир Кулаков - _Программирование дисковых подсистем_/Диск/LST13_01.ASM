;                     ЛИСТИНГ 13.1
;   Просмотр параметров логических дисков физического
;                диска "C:" в режиме LBA
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst13_01.asm, 15.04.2001.

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
Txt00 DB LIGHTCYAN,0,28,"ПОИСК ЖЕСТКОГО ДИСКА C:",0
      DB YELLOW,24,35,"Ждите ...",0
Txt01 DB YELLOW,0,20
      DB "ТАБЛИЦА РАЗДЕЛОВ ЛОГИЧЕСКОГО ДИСКА X",0
Txt02 DB 8,1,"N",0
      DB 8,4,"Тип",0
      DB 8,9,"Призн.",0,9,9,"акт.",0
      DB 8,16,"   Начало раздела",0
      DB 9,17,"Гол.",0,9,24,"Цил.",0,9,31,"Сект.",0
      DB 8,37,"   Конец раздела",0
      DB 9,38,"Гол.",0,9,45,"Цил.",0,9,52,"Сект.",0
      DB 8,58,"Номер нач.",0,9,58,"сектора",0
      DB 8,70,"Размер,",0,9,70,"секторов",0
Txt11 DB YELLOW,0,20
      DB "ЗАГРУЗОЧНАЯ ЗАПИСЬ ЛОГИЧЕСКОГО ДИСКА X",0
Txt12 DB 2,12,"Идентификатор изготовителя:",0
      DB 3,22,"Байтов на сектор:",0
      DB 4,19,"Секторов в кластере:",0
      DB 5,14,"Число резервных секторов:",0
      DB 6,23,"Число копий FAT:",0
      DB 7,6,"Дескрипторов в корневом каталоге:",0
      DB 8,14,"Число секторов в разделе:",0
      DB 9,15,"Тип носителя информации:",0
      DB 10,1,"Число секторов, занимаемых копией FAT:",0
      DB 11,13,"Число секторов на дорожке:",0
      DB 12,1,"Количество рабочих поверхностей диска:",0
      DB 13,16,"Число скрытых секторов:",0
Txt13 DB 14,23,"Номер дисковода:",0
      DB 15,15,"Номер логического диска:",0
      DB 16,27,"Метка диска:",0
      DB 17,9,"Аббревиатура файловой системы:",0
Txt14 DB 14,20,"Номер активной FAT:",0
      DB 15,22,"Номер версии FAT:",0
      DB 16,0
      DB "Номер нач. кластера корневого каталога:",0
      DB 17,8,"Номер сектора структуры FSINFO:",0
      DB 18,4,"Номер сектора резервной копии Boot:",0
      DB 19,23,"Номер дисковода:",0
      DB 20,15,"Номер логического диска:",0
      DB 21,27,"Метка диска:",0
      DB 22,9,"Аббревиатура файловой системы:",0
; Указания для оператора
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Сообщения об ошибках
Err1 DB LIGHTRED,12,25
     DB "Диск не поддерживает режим LBA",0
Err2 DB LIGHTRED,12,25
     DB "Основной раздел DOS не найден",0
; Номер раздела
PartitionNumber DB ?
; Начальный сектор основного раздела DOS
PriDOS_StartSector DD ?
; Начальный сектор расширенного раздела DOS
ExtDOS_StartSector DD ?
; Начальный сектор текущего логического диска
CurrentDrive_StartSector DD ?
; Линейный адрес загрузочного сектора
BootSector DD ?
; Номер логического диска
LogicalDriveNumber DB ?
; Флаг присутствия в системе следующего диска
NextDrivePresent DB ?
ENDS

SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS


CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC SearchLogicalDisks
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

; Обнулить номер логического диска
        mov     [LogicalDriveNumber],0
; Прочитать MBR диска
        mov     [CurrentDrive_StartSector],0
        mov     [dword ptr SectorAddress],0
        call    ReadHDDSector
; Отобразить таблицу разделов
        call    ShowPartitionTable
; Найти и записать номера начальных секторов
; основного и расширенного разделов DOS
        mov     [NextDrivePresent],0
        mov     SI,offset Sector512
        add     SI,1BEh    ;смещение первой записи
        mov     AL,[SI+4]  ;извлечь тип раздела
        ; Проверить код основного раздела
        cmp     AL,01h
        je      @@PrimPartFound
        cmp     AL,04h
        je      @@PrimPartFound
        cmp     AL,06h
        je      @@PrimPartFound
        cmp     AL,0Bh
        je      @@PrimPartFound
        cmp     AL,0Eh
        jne     @@PrimPartNotFound
@@PrimPartFound:
        ; Найден основной раздел, сохранить
        ; адрес его начального сектора
        mov     EAX,[SI+8] ;извлечь адрес сектора
        mov     [PriDOS_StartSector],EAX
        add     SI,10h     ;смещение второй записи
        mov     AL,[SI+4]  ;извлечь тип раздела
        ; Проверить код расширенного раздела
        cmp     AL,05h
        je      @@ExtPartFound
        cmp     AL,0Ch
        je      @@ExtPartFound
        cmp     AL,0Fh
        jne     @@NextDriveNotPresent0
@@ExtPartFound:
        ; Имеется расширенный раздел
        mov     EAX,[SI+8] ;извлечь адрес сектора
        mov     [ExtDOS_StartSector],EAX
        mov     [NextDrivePresent],1
@@NextDriveNotPresent0:

; Прочитать BOOT-сектор основного раздела
        mov     EAX,[PriDOS_StartSector]
        mov     [SectorAddress],EAX
        call    ReadHDDSector
; Отобразить данные BOOT-сектора основного раздела
        call    DecodeBootSector
; Имеется следующий диск?
        cmp     [NextDrivePresent],0 
        je      @@End
        mov     EAX,[ExtDOS_StartSector]
        mov     [CurrentDrive_StartSector],EAX

; ЦИКЛ ОПРОСА ЛОГИЧЕСКИХ ДИСКОВ РАСШИРЕННОГО РАЗДЕЛА
@@ReadSMBR:
        inc     [LogicalDriveNumber]
        ; Прочитать очередной SMBR
        mov     EAX,[CurrentDrive_StartSector]
        mov     [BootSector],EAX
        mov     [SectorAddress],EAX
        call    ReadHDDSector
        ; Отобразить таблицу разделов
        call    ShowPartitionTable

; Найти и записать номера начальных секторов
        mov     [NextDrivePresent],0
        mov     SI,offset Sector512
        add     SI,1BEh    ;смещение первой записи
        mov     EAX,[SI+8]
        add     [BootSector],EAX
        add     SI,10h     ;смещение второй записи
        mov     EAX,[SI+8]
        cmp     EAX,0      ;следующий диск присутствует?
        je      @@NextDriveNotPresent1
        ; Вычислить адрес SMBR следующего диска
        add     EAX,[ExtDOS_StartSector]
        mov     [CurrentDrive_StartSector],EAX
        ; Установить признак наличия следующего диска
        mov     [NextDrivePresent],1
@@NextDriveNotPresent1:

; Прочитать BOOT-сектор логического диска
        mov     EAX,[BootSector]
        mov     [SectorAddress],EAX
        call    ReadHDDSector
        ; Отобразить данные BOOT-сектора
        call    DecodeBootSector
; Имеется следующий диск?
        cmp     [NextDrivePresent],0 
        je      @@End
        jmp     @@ReadSMBR

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
ENDP SearchLogicalDisks 


;***************************************************
;* ОТОБРАЗИТЬ НА ЭКРАН СОДЕРЖИМОЕ ТАБЛИЦЫ РАЗДЕЛОВ *
;***************************************************
PROC ShowPartitionTable near
        pushad
        push    ES
; Очистить экран
        call    ClearScreen
; Вывести текстовые сообщения
        MShowColorText 1,Txt01
        MShowColorText 1,AnyK
; Вывести номер логического диска
        mov     [TextColorAndBackground],YELLOW
        MShowDecByte 0,55,[LogicalDriveNumber]

; ЦИКЛ РИСОВАНИЯ ТАБЛИЦЫ
        mov     AX,0B800h    ;Настроить ES для прямого
        mov     ES,AX        ;вывода на экран
        mov     DI,8*80*2    ;Начать вывод с 8-й строки
        mov     AH,LIGHTBLUE ;Чертить синим цветом
        mov     AL,0B3h      ;Задать символ-разделитель
        mov     DX,7         ;Задать общее число строк
; Отобразить символы-разделители колонок таблицы
@@ac0:  push    DI
        add     DI,3*2
        mov     [ES:DI],AX
        add     DI,5*2
        mov     CX,8
@@ac1:  mov     [ES:DI],AX
        add     DI,7*2
        loop    @@ac1
        add     DI,4*2
        mov     [ES:DI],AX
        pop     DI
        add     DI,80*2
        dec     DX
        jnz     @@ac0

; Установить зеленый цвет и черный фон
        mov     [TextColorAndBackground],LIGHTGREEN
; Отобразить шапку таблицы
        MShowText 16,Txt02
; Установить белый цвет и черный фон
        mov     [TextColorAndBackground],WHITE

; ЦИКЛ ВЫВОДА ДАННЫХ
; Отобразить загрузочный сектор на экран
        mov     [PartitionNumber],1
        mov     SI,offset Sector512
        ; Прибавить смещение первой записи
        ; от начала сектора
        add     SI,1BEh
        ; Задать начальную строку для вывода данных
        mov     [ScreenString],11
@@ShS0: ; Отобразить порядковый номер раздела
        mov     AL,[PartitionNumber]
        mov     [ScreenColumn],0
        call    ShowHexByte
        ; Отобразить код типа раздела
        lodsb
        mov     [ScreenColumn],11
        call    ShowHexByte
        ; Отобразить номер начальной поверхности раздела
        lodsb
        mov     [ScreenColumn],18
        call    ShowHexByte
        ; Отобразить номер начального цилиндра
        ; и номер начального сектора раздела
        lodsw
        mov     BL,AL
        ; Вычислить и отобразить номер цилиндра
        shr     AL,6
        xchg    AL,AH
        mov     [ScreenColumn],24
        call    ShowHexWord
        ; Вычислить и отобразить номер сектора
        mov     AL,BL
        and     AL,0111111b
        mov     [ScreenColumn],32
        call    ShowHexByte
        ; Отобразить код признака активного раздела
        mov     [ScreenColumn],5
        lodsb
        call    ShowHexByte
        ; Отобразить номер конечной поверхности раздела
        mov     [ScreenColumn],39
        lodsb
        call    ShowHexByte
        ; Отобразить номер конечного цилиндра
        ; и номер конечного сектора раздела
        lodsw
        mov     BL,AL
        ; Вычислить и отобразить номер цилиндра
        shr     AL,6
        xchg    AL,AH
        mov     [ScreenColumn],45
        call    ShowHexWord
        ; Вычислить и отобразить номер сектора
        mov     AL,BL
        and     AL,0111111b
        mov     [ScreenColumn],53
        call    ShowHexByte
        ; Отобразить абсолютный номер начального сектора
        mov     [ScreenColumn],59
        mov     EAX,[SI]
        add     SI,4
        call    ShowHexDWord
        ; Отобразить размер раздела в секторах
        mov     [ScreenColumn],70
        mov     EAX,[SI]
        add     SI,4
        call    ShowHexDWord
; Перейти на следующую строку таблицы
        inc     [ScreenString]
        inc     [PartitionNumber]
        ; Отображены все четыре строки таблицы?
        cmp     [PartitionNumber],5
        jb      @@ShS0
; Ожидать нажатия любой клавиши
        call    GetChar
        pop     ES
        popad
        ret
ENDP ShowPartitionTable


;**********************************************
;* ОТОБРАЗИТЬ ИНФОРМАЦИЮ ЗАГРУЗОЧНОГО СЕКТОРА *
;**********************************************
PROC DecodeBootSector near
        pushad
        push    ES
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана
        MShowColorText 1,Txt11
        MShowColorText 1,AnyK
; Установить желтый цвет и черный фон
        mov     [TextColorAndBackground],YELLOW
; Отобразить порядковый номер логического диска
        MShowDecByte 0,57,[LogicalDriveNumber]
; Установить зеленый цвет и черный фон
        mov     [TextColorAndBackground],LIGHTGREEN
; Отобразить названия общих полей
        MShowText 12,Txt12
; Настроить ES для прямого вывода на экран
        mov     AX,0B800h
        mov     ES,AX
; Установить указатель на область данных
        mov     SI,offset Sector512
; Установить белый цвет и черный фон
        mov     [TextColorAndBackground],WHITE

; ОБЩИЙ УЧАСТОК BOOT-СЕКТОРА
; Отобразить идентификатор OEM с 40-й позиции 2-й строки
        MShowASCIIField 2,40,3,8
; Отобразить число байтов на сектор
        MShowDecWord 3,40,<[SI+0Bh]>
; Отобразить число секторов в кластере
        MShowDecByte 4,40,<[SI+0Dh]>
; Отобразить число резервных секторов
        MShowDecWord 5,40,<[SI+0Eh]>
; Отобразить число копий FAT в разделе
        MShowDecByte 6,40,<[SI+10h]>
; Отобразить число дескрипторов в корневом каталоге
        MShowDecWord 7,40,<[SI+11h]>
; Отобразить число секторов в разделе
        cmp     [word ptr SI+13h],0
        je      @@UseTotSec32 ;использовать BPB_TotSec32
        MShowDecWord 8,40,<[SI+13h]>
@@UseTotSec32:
; Отобразить тип носителя информации
        MShowHexByte 9,40,<[SI+15h]>
; Отобразить число секторов, занимаемых копией FAT
        cmp     [word ptr SI+16h],0
        je      @@UseFATSz32 ;использовать BPB_FATSz32
        MShowDecWord 10,40,<[SI+16h]>
@@UseFATSz32:
; Отобразить число секторов на дорожке
        MShowDecWord 11,40,<[SI+18h]>
; Отобразить количество рабочих поверхностей диска
        MShowDecWord 12,40,<[SI+1Ah]>
; Отобразить число скрытых секторов
        MShowDecDWord 13,40,<[SI+1Ch]>
; Отобразить число секторов в разделе
        cmp     [dword ptr SI+20h],0
        je      @@UseTotSec16 ;использовать BPB_TotSec16
        MShowDecDWord 8,40,<[SI+20h]>
@@UseTotSec16:
; Проверить тип FAT текущего раздела (если размер
; корневого сектора равен нулю - FAT32)
        cmp     [word ptr SI+11h],0
        je      @@FAT32

; УЧАСТОК BOOT-СЕКТОРА, СПЕЦИФИЧЕСКИЙ ДЛЯ FAT12 И FAT16
; Установить зеленый цвет и черный фон
        mov     [TextColorAndBackground],LIGHTGREEN
; Отобразить названия полей, специфических
; для FAT12 и FAT16
        MShowText 4,Txt13
; Установить белый цвет и черный фон
        mov     [TextColorAndBackground],WHITE
; Установить указатель на область данных
        mov     SI,offset Sector512
; Отобразить номер дисковода
        MShowHexByte 14,40,<[SI+24h]>
; Отобразить номер логического диска
        MShowHexDWord 15,40,<[SI+27h]>
; Отобразить метку диска
        MShowASCIIField 16,40,2Bh,11
; Отобразить аббревиатуру файловой системы
        MShowASCIIField 17,40,36h,8
        jmp     @@End

@@FAT32:
; УЧАСТОК BOOT-СЕКТОРА, СПЕЦИФИЧЕСКИЙ ДЛЯ FAT32
; Установить зеленый цвет и черный фон
        mov     [TextColorAndBackground],LIGHTGREEN
; Отобразить названия полей, специфических FAT32
        MShowText 9,Txt14
; Установить белый цвет и черный фон
        mov     [TextColorAndBackground],WHITE
; Установить указатель на область данных
        mov     SI,offset Sector512
; Отобразить число секторов, занимаемых копией FAT32
        MShowDecDWord 10,40,<[SI+24h]>
; Отобразить номер активной FAT
        MShowHexWord 14,40,<[SI+28h]>
; Отобразить код версии FAT
        MShowHexWord 15,40,<[SI+2Ah]>
; Отобразить номер начального кластера корневого
; каталога
        MShowDecDWord 16,40,<[SI+2Ch]>
; Отобразить номер сектора структуры FSINFO
        MShowDecWord 17,40,<[SI+30h]>
; Отобразить номер сектора резервной копии Boot-сектора
        MShowDecWord 18,40,<[SI+32h]>
; Отобразить номер дисковода
        MShowHexByte 19,40,<[SI+40h]>
; Отобразить номер логического диска
        MShowHexDWord 20,40,<[SI+43h]>
; Отобразить метку диска
        MShowASCIIField 21,40,47h,11
; Отобразить аббревиатуру файловой системы
        MShowASCIIField 22,40,52h,8
@@End:  call    GetChar
        pop     ES
        popad
        ret
ENDP DecodeBootSector
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
