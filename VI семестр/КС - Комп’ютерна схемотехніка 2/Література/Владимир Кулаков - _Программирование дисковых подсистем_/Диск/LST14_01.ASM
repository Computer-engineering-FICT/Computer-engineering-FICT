;                     ЛИСТИНГ 14.1
;         Последовательный просмотр информации,
;  содержащейся в различных структурах данных CD-диска,
;            записанного в формате ISO-9660
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst14_01.asm, 15.02.2001.

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
Txt1 DB LIGHTCYAN,0,32,"ПОИСК ДИСКОВОДА",0
; Запрос на установку носителя
Txt2 DB YELLOW,12,9,"Установите в CD-дисковод "
     DB "диск данных и нажмите любую клавишу",0
; Описатели полей структур данных
Txt3 DB LIGHTCYAN,0,26,"ОСНОВНОЙ ДЕСКРИПТОР ТОМА",0
Txt4 DB 2,18,"Тип дескриптора тома:",0
     DB 3,15,"Идентификатор стандарта:",0
     DB 4,15,"Версия дескриптора тома:",0
     DB 5,17,"Идентификатор системы:",0
     DB 6,20,"Идентификатор тома:",0
     DB 7,19,"Размер тома, блоков:",0
     DB 8,19,"Размер набора томов:",0
     DB 9,28,"Номер тома:",0
     DB 10,20,"Размер блока, байт:",0
     DB 11,12,"Размер таблицы путей, байт:",0
     DB 12,14,"Местоположение L-таблицы:",0
     DB 13,9,"Местоположение доп. L-таблицы:",0
     DB 14,14,"Местоположение M-таблицы:",0
     DB 15,9,"Местоположение доп. M-таблицы:",0
     DB 16,19
     DB "Время создания тома: XX/XX/XXXX XX:XX:XX",0
     DB 17,11,"Время последней модификации: "
     DB "XX/XX/XXXX XX:XX:XX",0
Txt5 DB LIGHTCYAN,0,26,"ЗАПИСЬ О КОРНЕВОМ КАТАЛОГЕ",0
Txt6 DB 2,17,"Длина записи каталога:",0
     DB 3,4,"Длина расширенной записи атрибутов:",0
     DB 4,10,"Номер первого блока экстента:",0
     DB 5,16,"Размер файловой секции:",0
     DB 6,13,"Дата и время записи файла:",0
     DB 7,27,"Флаги файла:",0
     DB 8,13,"Размер файлового элемента:",0
     DB 9,9,"Размер промежутка чередования:",0
     DB 10,17,"Порядковый номер тома:",0
     DB 11,12,"Длина идентификатора файла:",0
     DB 12,19,"Идентификатор файла:",0
; Шапка каталога
Txt7 DB LIGHTCYAN,0,23,"НАЧАЛЬНЫЙ УЧАСТОК КАТАЛОГА ФАЙЛОВ",0
     DB YELLOW,2,0,"Номер    Размер,     Дата и время"
     DB "        Флаги     Идентификатор",0
     DB YELLOW,3,0,"блока     байт       записи файла"
     DB "                      файла    ",0
Txt8 DB LIGHTGREEN,0,8,"Имя файла:",0
     DB LIGHTGREEN,1,8,"Размер файла:",0
     DB LIGHTGREEN,2,8,"Адрес файла:",0
     DB YELLOW,3,8,"Начальный участок файла:",0
; Указания для оператора
TxtW DB YELLOW,24,35,"Ждите ...",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Сообщения об ошибках
FErr DB LIGHTRED,12,25
     DB "В корневом каталоге нет файлов",0
; Адрес начального блока таблицы путей
PathTableAddr DD (?)
; Размер таблицы путей
PathTableSize DD (?)
; Адрес начального блока корневого каталога
RootDirAddr   DD (?)
; Порядковый номер записи каталога
DRecordNumber DW (?)
; Смещение очередной записи каталога от начала блока
DRecordOffset DW (?)
; Шаблон даты и времени
ZeroDate DB "00/00/0000 00:00:00",0
; Смещение записи о первом файле от начала корневого
; каталога
FirstFileRecordOffs DW 0
; Логический адрес начального блока первого файла
; корневого каталога
FirstFileAddress DD 0
ENDS


SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS


CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC Show_ISO_9660_Structures
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

; Извлечь носитель
        call    UnloadMedium
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


; ОТОБРАЗИТЬ ОСНОВНОЙ ДЕСКРИПТОР ТОМА
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана и заголовки полей
        MShowColorText 1,Txt3
        MShowColorText 1,AnyK
        mov     [TextColorAndBackground],LIGHTGREEN
        MShowText 16,Txt4
; Выполнить чтение 16-го сектора
        mov     [dword ptr CDSectorAddress],16
        call    Read10WRetr
; Установить адрес структуры данных для ShowASCIIField
        mov     SI,offset CDDataBuf
; Отобразить значение основных полей
        mov     [TextColorAndBackground],WHITE
        ; Тип дескриптора тома
        MShowDecByte 2,40,[CDDataBuf]
        ; Идентификатор стандарта
        MShowASCIIField 3,40,1,5
        ; Версия дескриптора тома
        MShowDecByte 4,40,<[CDDataBuf+6]>
        ; Идентификатор системы
        MShowASCIIField 5,40,8,32
        ; Идентификатор тома
        MShowASCIIField 6,40,40,32
        ; Размер тома, секторов
        MShowDecDWord 7,40,<[dword ptr CDDataBuf+80]>
        ; Размер набора томов
        MShowDecWord 8,40,<[word ptr CDDataBuf+120]>
        ; Номер тома
        MShowDecWord 9,40,<[word ptr CDDataBuf+124]>
        ; Размер блока
        MShowDecWord 10,40,<[word ptr CDDataBuf+128]>
        ; Размер таблицы путей
        MShowDecDWord 11,40,<[dword ptr CDDataBuf+132]>
        ; Запомнить размер таблицы путей
        mov     EAX,[dword ptr CDDataBuf+132]
        mov     [PathTableSize],EAX
        ; Местоположение L-таблицы
        MShowDecDWord 12,40,<[dword ptr CDDataBuf+140]>
        ; Запомнить адрес таблицы путей
        mov     EAX,[dword ptr CDDataBuf+140]
        mov     [PathTableAddr],EAX
        ; Местоположение доп. L-таблицы
        MShowDecDWord 13,40,<[dword ptr CDDataBuf+144]>
        ; Местоположение M-таблицы
        mov     [ScreenString],14
        mov     [ScreenColumn],40
        mov     EAX,[dword ptr CDDataBuf+148]
        ; Изменить порядок расположения байтов (перейти
        ; от формата "старший байт - первый" к формату
        ; "младший байт - первый"
        xchg    AL,AH
        ror     EAX,16
        xchg    AL,AH
        call    ShowDecDWord
        ; Местоположение доп. M-таблицы
        mov     [ScreenString],15
        mov     [ScreenColumn],40
        mov     EAX,[dword ptr CDDataBuf+152]
        ; Изменить порядок расположения байтов
        xchg    AL,AH
        ror     EAX,16
        xchg    AL,AH
        call    ShowDecDWord
        ; Время создания тома
        MShowASCIIField 16,40,<813+6>,2  ;день
        MShowASCIIField 16,43,<813+4>,2  ;месяц
        MShowASCIIField 16,46,813,4      ;год
        MShowASCIIField 16,51,<813+8>,2  ;час
        MShowASCIIField 16,54,<813+10>,2 ;минута
        MShowASCIIField 16,57,<813+12>,2 ;секунда
        ; Время последней модификации
        MShowASCIIField 17,40,<830+6>,2  ;день
        MShowASCIIField 17,43,<830+4>,2  ;месяц
        MShowASCIIField 17,46,830,4      ;год
        MShowASCIIField 17,51,<830+8>,2  ;час
        MShowASCIIField 17,54,<830+10>,2 ;минута
        MShowASCIIField 17,57,<830+12>,2 ;секунда
        call    GetChar


; ПОКАЗАТЬ СОДЕРЖИМОЕ ЗАПИСИ О КОРНЕВОМ КАТАЛОГЕ
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана и заголовки полей
        MShowColorText 1,Txt5
        MShowColorText 1,AnyK
        mov     [TextColorAndBackground],LIGHTGREEN
        MShowText 11,Txt6
; Отобразить значение полей
        mov     [TextColorAndBackground],WHITE
        mov     SI,offset CDDataBuf
        ; Длина записи каталога (LEN_DR)
        MShowDecByte 2,40,<[CDDataBuf+156]>
        ; Длина расширенной записи атрибутов
        MShowDecByte 3,40,<[CDDataBuf+157]>
        ; Местоположение экстента
        MShowDecDWord 4,40,<[dword ptr CDDataBuf+158]>
        ; Запомнить адрес корневого каталога
        mov     EAX,[dword ptr CDDataBuf+158]
        mov     [RootDirAddr],EAX
        ; Длина области данных
        MShowDecDWord 5,40,<[dword ptr CDDataBuf+166]>
        ; Дата и время записи файла
        mov     [ScreenString],6
        mov     [ScreenColumn],40
        mov     BX,156+18
        call    ShowCDTime
        ; Флаги файла
        MShowBinByte 7,40,<[CDDataBuf+181]>
        ; Размер файлового элемента
        MShowDecByte 8,40,<[CDDataBuf+182]>
        ; Размер промежутка чередования
        MShowDecByte 9,40,<[CDDataBuf+183]>
        ; Порядковый номер тома
        MShowDecWord 10,40,<[word ptr CDDataBuf+184]>
        ; Длина идентификатора файла (LEN_FI)
        MShowDecByte 11,40,<[CDDataBuf+188]>
        ; Идентификатор файла
        xor     AX,AX
        mov     AL,[SI+188]
        MShowASCIIField 12,40,189,AX
        call    GetChar


; ПОКАЗАТЬ НАЧАЛЬНЫЙ УЧАСТОК КОРНЕВОГО КАТАЛОГА
; Очистить экран
        call    ClearScreen
; Вывести текстовые сообщения
        MShowColorText 3,Txt7
        MShowColorText 1,AnyK
; Выполнить чтение первого блока корневого каталога
        mov     EAX,[RootDirAddr]
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Установить начальную строку таблицы
        mov     [ScreenString],4
; Обнулить порядковый номер записи каталога
        mov     [DRecordNumber],0
; Обнулить смещение записи каталога от начала блока
        mov     [DRecordOffset],0
; ЦИКЛ ВЫВОДА СТРОК КАТАЛОГА ФАЙЛОВ
@@NextRecord:
; Вычислить смещение очереденой записи от начала
; сегмента данных
        mov     SI,offset CDDataBuf
        add     SI,[DRecordOffset]
; Произвести проверку на конец каталога
        cmp     [byte ptr SI],0
        je      @@EndOfDirectory
; Отобразить строку таблицы
@@ShowTableString:
        ; Местоположение экстента
        mov     [ScreenColumn],0
        mov     EAX,[SI+2]
        call    ShowDecDWord
        ; Длина области данных
        mov     [ScreenColumn],8
        mov     EAX,[SI+10]
        call    ShowDecDWord
        ; Дата и время записи файла
        mov     [ScreenColumn],18
        mov     BX,18
        call    ShowCDTime
        ; Флаги файла
        mov     [ScreenColumn],40
        mov     AL,[SI+25]
        call    ShowBinByte
        ; Идентификатор файла
        mov     [ScreenColumn],51
        xor     CX,CX
        mov     CL,[SI+32] ; длина поля в байтах
        cmp     CX,0
        je      @@NoFName  ; пропустить операцию
        mov     BX,33      ; смещение поля
        call    ShowASCIIField
@@NoFName:
; Вычислить смещение следующей записи каталога от
; начала сектора
        xor     AX,AX
        mov     AL,[SI]
        add     [DRecordOffset],AX
        inc     [ScreenString]
        inc     [DRecordNumber]
        cmp     [DRecordNumber],20
        jb      @@NextRecord
; Конец цикла вывода таблицы
@@EndOfDirectory:
        call    GetChar


; ОТОБРАЗИТЬ НАЧАЛЬНЫЙ УЧАСТОК ПЕРВОГО ФАЙЛА КАТАЛОГА
; Очистить экран
        call    ClearScreen
; Найти первый файл в корневом каталоге
        call    FindFirstFile
; Вывести текстовые сообщения
        MShowColorText 4,Txt8
        MShowColorText 1,AnyK
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Вывести информацию о файле
        mov     SI,offset CDDataBuf
        add     SI,[DRecordOffset]
        ; Идентификатор файла
        mov     [ScreenString],0
        mov     [ScreenColumn],25
        xor     CX,CX
        mov     CL,[SI+32]
        mov     BX,33
        call    ShowASCIIField
        ; Размер файла
        MShowDecDWord 1,25,[SI+10]
        ; Адрес
        MShowDecDWord 2,25,[FirstFileAddress]
; Прочитать первый сектор файла
        mov     EAX,[FirstFileAddress]
        mov     [CDSectorAddress],EAX
        call    Read10WRetr
; Показать первые 1024 байта файла
        mov     SI,offset CDDataBuf
        call    ShowSector1024
        call    GetChar

@@Exit: ; Переустановить текстовый режим
	mov     ax,3
	int     10h
        ; Выход в DOS
	mov     AH,4Ch
	int     21h
ENDP Show_ISO_9660_Structures


;****************************************************
;*        ПОКАЗАТЬ ДАТУ И ВРЕМЯ СОЗДАНИЯ ФАЙЛА      *
;* Передаваемые параметры:                          *
;* DS:SI - указатель на структуру данных;           *
;* BX - смещение поля даты от начала структуры;     *
;* Цвет задается переменной TextColorAndBackground. *
;* Координаты позиции передаются через глобальные   *
;* переменные ScreenString и ScreenColumn.          *
;****************************************************
PROC ShowCDTime near
        pusha
; Сохранить экранные координаты
        push    [ScreenColumn]
; Вычислить адрес поля даты
        add     SI,BX
; Вывести заполненный нулями шаблон даты
        push    SI
        mov     SI,offset ZeroDate
        mov     BX,0
        mov     CX,19
        call    ShowASCIIField
        pop     SI
; Вывести дату
        ; Вывести номер дня
        push    [ScreenColumn]
        mov     AL,[SI+2]
        cmp     AL,9
        ja      @@Day
        inc     [ScreenColumn]
@@Day:  call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести номер месяца
        push    [ScreenColumn]
        mov     AL,[SI+1]
        cmp     AL,9
        ja      @@Mon
        inc     [ScreenColumn]
@@Mon:  call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести номер года
        xor     AX,AX
        mov     AL,[SI]
        add     AX,1900
        call    ShowDecWord
        add     [ScreenColumn],5
; Вывести время
        ; Вывести час
        push    [ScreenColumn]
        mov     AL,[SI+3]
        cmp     AL,9
        ja      @@H
        inc     [ScreenColumn]
@@H:    call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести минуту
        push    [ScreenColumn]
        mov     AL,[SI+4]
        cmp     AL,9
        ja      @@M
        inc     [ScreenColumn]
@@M:    call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести секунду
        mov     AL,[SI+5]
        cmp     AL,9
        ja      @@S
        inc     [ScreenColumn]
@@S:    call    ShowDecByte
; Восстановить экранные координаты
        pop     [ScreenColumn]
        popa
        ret
ENDP ShowCDTime


;**************************************************
;*      НАЙТИ ПЕРВЫЙ ФАЙЛ В КОРНЕВОМ КАТАЛОГЕ     *
;* Передаваемые параметры:                        *
;* RootDirAddr - адрес первого сектора каталога.  *
;* Выходные параметры:                            *
;* FirstFileAddress - адрес файла;                *
;* FirstFileRecordOffs - смещение записи о файле. *
;* В случае успешного завершения операции массив  *
;* CDDataBuf содержит первый сектор каталога.     *
;**************************************************
PROC FindFirstFile near
        pushad
; Обнулить адрес и смещение
        mov     [FirstFileRecordOffs],0
        mov     [FirstFileAddress],0
; Выполнить чтение первого сектора корневого каталога
        mov     EAX,[RootDirAddr]
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Обнулить порядковый номер записи каталога
        mov     [DRecordNumber],0
; Обнулить смещение записи каталога от начала блока
        mov     [DRecordOffset],0
@@NextRecord:
; Произвести проверку на конец сектора
        cmp     [DRecordOffset],2048-64
        jae     @@Err
; Вычислить смещение очереденой записи от начала
; сегмента данных
        mov     SI,offset CDDataBuf
        add     SI,[DRecordOffset]
; Произвести проверку на конец каталога
        cmp     [byte ptr SI],0
        je      @@Err
; Проверить тип элемента каталога по байту атрибутов
        cmp     [byte ptr SI+25],0
        jne     @@CalcNextRecOffs
; Запомнить смещение записи о файле и адрес файла
        mov     [FirstFileRecordOffs],SI
        mov     EAX,[SI+2]
        mov     [FirstFileAddress],EAX
        jmp short @@End
; Вычислить смещение следующей записи каталога от
; начала сектора
@@CalcNextRecOffs:
        xor     AX,AX
        mov     AL,[SI]
        add     [DRecordOffset],AX
        inc     [ScreenString]
        inc     [DRecordNumber]
        cmp     [DRecordNumber],20
        jb      @@NextRecord
@@End:  popad
        ret
; Прервать работу
@@Err:  mov     SI,offset FErr
        call    FatalError
ENDP FindFirstFile
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
