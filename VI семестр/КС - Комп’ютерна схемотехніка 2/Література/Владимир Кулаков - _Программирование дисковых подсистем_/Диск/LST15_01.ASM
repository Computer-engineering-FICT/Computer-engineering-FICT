;                     ЛИСТИНГ 15.1
;         Последовательный просмотр информации,
;      содержащейся в различных структурах данных 
;        диска CD-RW, записанного в формате UDF
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst15_01.asm, 18.04.2001.

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
Txt1 DB LIGHTCYAN,0,32,"ПОИСК ДИСКОВОДА",0
; Указания оператору (в нижней строке экрана)
TxtW DB YELLOW,24,35,"Ждите ...",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Основные заголовки 
He0  DB YELLOW,0,35,"ЯКОРЬ ТОМА",0
He1  DB YELLOW,0,27,"ПЕРВИЧНЫЙ ДЕСКРИПТОР ТОМА",0
He2  DB YELLOW,0,26,"ДЕСКРИПТОР ЛОГИЧЕСКОГО ТОМА",0
He3  DB YELLOW,0,31,"ДЕСКРИПТОР РАЗДЕЛА",0
He4  DB YELLOW,0,28,"ДЕСКРИПТОР НАБОРА ФАЙЛОВ",0
He5  DB YELLOW,0,30,"ДЕСКРИПТОР КАТАЛОГА",0
He6  DB YELLOW,0,24,"ДЕСКРИПТОР ИДЕНТИФИКАТОРА ФАЙЛА",0
HeF  DB YELLOW,0,28,"ЭЛЕМЕНТ-ОПИСАТЕЛЬ ФАЙЛА",0
; Имена полей дескриптора тега
Txt4 DB 2,20,"Идентификатор тега:",0
     DB 3,20,"Версия дескриптора:",0
     DB 4,17,"Порядковый номер тега:",0
     DB 5,9,"Размер контролируемой области:",0
     DB 6,19,"Местоположение тега:",0
; Имена полей якоря тома
Txt5 DB 8,10,"ЭКСТЕНТ ОСНОВНОЙ "
     DB "ПОСЛЕДОВАТЕЛЬНОСТИ ДЕСКРИПТОРОВ ТОМА",0
     DB 9,23,"Размер в байтах:",0
     DB 10,22,"Начальный сектор:",0
     DB 12,10,"ЭКСТЕНТ РЕЗЕРВНОЙ ПОСЛЕДОВАТЕЛЬНОСТИ ДЕСКРИПТОРОВ ТОМА",0
     DB 13,23,"Размер в байтах:",0
     DB 14,22,"Начальный сектор:",0
; Имена полей первичного дескриптора тома
Txt6 DB 8,22,"Порядковый номер:",0
     DB 9,10,"Номер первичного дескриптора:",0
     DB 10,20,"Идентификатор тома:",0
     DB 11,8,"Порядковый номер тома в группе:",0
     DB 12,6,"Максимальный номер тома в группе:",0
     DB 13,24,"Уровень обмена:",0
     DB 14,9,"Время записи дескриптора тома:",0
     DB 15,33,"Флаги:",0
; Имена полей дескриптора логического тома
Txt7 DB 8,10,"Порядковый номер дескриптора:",0
     DB 9,20,"Идентификатор тома:",0
     DB 10,7,"Размер логического блока (байт):",0
     DB 11,9,"Размер экстента набора файлов:",0
     DB 12,10,"Адрес экстента набора файлов:",0
     DB 13,17,"Идентификатор раздела:",0
     DB 14,12,"Размер таблицы карт (байт):",0
     DB 15,14,"Количество карт разделов:",0
; Имена полей дескриптора раздела
Txt8 DB 8,10,"Порядковый номер дескриптора:",0
     DB 9,26,"Флаги разела:",0
     DB 10,26,"Номер разела:",0
     DB 11,27,"Тип доступа:",0
     DB 12,14,"Начальный сектор раздела:",0
     DB 13,14,"Размер раздела, секторов:",0
; Имена полей дескриптора набора файлов
Txt9 DB 8,25,"Метка времени:",0
     DB 9,19,"Номер набора файлов:",0
     DB 10,14,"Номер дескриптора набора:",0
     DB 11,19,"Размер экстента ICB:",0
     DB 12,20,"Адрес экстента ICB:",0
     DB 13,13,"Идентификатор раздела ICB:",0
; Имена полей дескриптора файлового элемента
TxtF DB 8,6,"Количество предшествующих ссылок:",0
     DB 9,21,"Код стратегии ICB:",0
     DB 10,8,"Максимальное количество ссылок:",0
     DB 11,29,"Тип файла:",0
     DB 12,12,"Идентификатор пользователя:",0
     DB 13,27,"Ограничения:",0
     DB 14,13,"Количество ссылок на файл:",0
     DB 15,17,"Размер файла в байтах:",0
     DB 16,17,"Размер файла в блоках:",0
     DB 17,26,"Время записи:",0
     DB 18,10,"Числовой идентификатор файла:",0
     DB 19,3,"Длина области расширенных атрибутов:",0
     DB 20,4,"Длина области дескрипторов размещ.:",0
TxtE DB 21,17,"Размер экстента, байт:",0
     DB 22,3,"Смещение экстента от начала раздела:",0
; Шапка корневого каталога
TxtR DB YELLOW,0,32,"КОРНЕВОЙ КАТАЛОГ",0
     DB YELLOW,2,0,"Идентификатор файла:",0
     DB YELLOW,2,40,"Атрибуты:",0
     DB YELLOW,2,55,"Адрес описателя:",0
; Сообщения об ошибках
FErr DB LIGHTRED,12,25
     DB "В корневом каталоге нет файлов",0
; Шаблон даты и времени
ZeroDate DB "00.00.0000  00:00:00",0
; Номер начального сектора первичного дескриптора тома
PrimVolDescSector DD 0
; Начальлный сектор раздела
PartitionStartSec DD 0
; Смещение экстента набора файлов от начала раздела
FileSetExtentAddr DD 0
; Смещение корневого каталога от начала раздела
RootDirStartSec   DD 0
; Смещение очередного идентификатора файла от
; начала списка
FileIdentOffset   DW 0
; Порядковый номер файла в списке
FileNumber        DW 0
; Размер области дескрипторов размещения
DescAreaSize      DD 0
; Размер файла в байтах
FileSize          DD 0
; Смещение файла от начала раздела
FileStartSec      DD 0
ENDS


SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS


CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC ShowUDFStructures 
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

; ПОИСК И СЧИТЫВАНИЕ "ЯКОРЯ" ТОМА
; Очистить экран
        call    ClearScreen
; Вывести указание для оператора
        MShowColorText 1,TxtW
; Прочитать сектор, содержащий "якорь"
        mov     [dword ptr CDSectorAddress],256
        call    Read10WRetr
; Запомнить номер начального сектора первичного
; дескриптора тома
        mov     EAX,[dword ptr CDDataBuf+20]
        mov     [PrimVolDescSector],EAX
; Показать "якорь"
        call    ShowAnchor

; СЧИТЫВАНИЕ ПЕРВИЧНОГО ДЕСКРИПТОРА ТОМА
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана
        MShowColorText 1,TxtW
; Прочитать начальный сектор первичного дескриптора тома
        mov     EAX,[PrimVolDescSector]
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Показать первичный дескриптор тома
        call    ShowPriDescr

; СЧИТЫВАНИЕ ДЕСКРИПТОРА ЛОГИЧЕСКОГО ТОМА
; Очистить экран
        call    ClearScreen
; Вывести указание для оператора
        MShowColorText 1,TxtW
; Прочитать начальный сектор дескриптора
; логического тома
        mov     EAX,[PrimVolDescSector]
        inc     EAX
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Запомнить адрес экстента набора файлов
        mov     EAX,[dword ptr CDDataBuf+252]
        mov     [FileSetExtentAddr],EAX
; Показать дескриптор логического тома
        call    ShowLogVolDescr

; СЧИТЫВАНИЕ ДЕСКРИПТОРА РАЗДЕЛА
; Очистить экран
        call    ClearScreen
; Вывести указание для оператора
        MShowColorText 1,TxtW
; Прочитать начальный сектор дескриптора раздела
        mov     EAX,[PrimVolDescSector]
        add     EAX,2
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Запомнить смещение начального сектора раздела
        mov     EAX,[dword ptr CDDataBuf+188]
        mov     [PartitionStartSec],EAX
; Показать дескриптор раздела
        call    ShowPartitionDescr

; СЧИТЫВАНИЕ ДЕСКРИПТОРА НАБОРА ФАЙЛОВ
; Очистить экран
        call    ClearScreen
; Вывести указание для оператора
        MShowColorText 1,TxtW
; Прочитать начальный сектор дескриптора набора файлов
        mov     EAX,[PartitionStartSec]
        add     EAX,[FileSetExtentAddr]
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Запомнить смещение корневого каталога от начала
; раздела
        mov     EAX,[dword ptr CDDataBuf+404]
        mov     [RootDirStartSec],EAX
; Показать дескриптор набора файлов
        call    ShowFileSetDescr

; СЧИТЫВАНИЕ ДЕСКРИПТОРА КОРНЕВОГО КАТАЛОГА
; Очистить экран
        call    ClearScreen
; Вывести указание для оператора
        MShowColorText 1,TxtW
; Прочитать начальный сектор дескриптора корневого
; каталога
        mov     EAX,[PartitionStartSec]
        add     EAX,[RootDirStartSec]
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Вывести заголовок экрана
        MShowColorText 1,He5
; Показать дескриптор корневого каталога
        call    ShowFileElement
; Отобразить начальный участок каталога
        call    ShowRootDir

; ПОИСК ФАЙЛА В КАТАЛОГЕ 
        call    FindFirstFile

@@Exit: ; Переустановить текстовый режим
        mov     ax,3
        int     10h
        ; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP ShowUDFStructures


;****************************************
;* ПОКАЗАТЬ СОДЕРЖИМОЕ ДЕСКРИПТОРА ТЕГА *
;****************************************
PROC ShowTagDesc near
        pushad
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести имена полей дескриптора логического тома
        MShowText 5,Txt4
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Вывести значения полей на экран
        mov     SI,offset CDDataBuf
        ; Идентификатор тега
        MShowDecWord 2,40,[SI]
        ; Версия дескриптора
        MShowDecWord 3,40,<[SI+2]>
        ; Порядковый номер тега
        MShowDecWord 4,40,<[SI+6]>
        ; Размер контролируемой области
        MShowDecWord 5,40,<[SI+10]>
        ; Местоположение тега
        MShowDecDWord 6,40,<[SI+12]>
        popad
        ret
ENDP ShowTagDesc


;****************************************************
;*    ВЫВОД ИМЕНИ, ХРАНЯЩЕГОСЯ В ФОРМАТЕ UNICODE    *
;* Передаваемые параметры:                          *
;* DS:SI - указатель на структуру данных;           *
;* BX - смещение поля от начала структуры;          *
;* CX - длина поля в байтах.                        *
;* Цвет задается переменной TextColorAndBackground. *
;* Координаты позиции передаются через глобальные   *
;* переменные ScreenString и ScreenColumn.          *
;****************************************************
PROC ShowUnicodeName near
        pusha
        push    ES
        ; Проверить длину поля (не менее 3 байт)
        cmp     CX,3
        jb      @@Err
        mov     AX,0B800h    ;Настроить ES для прямого
        mov     ES,AX        ;вывода на экран
; Установить указатель на начало поля
        add     SI,BX
; Вычислить начальную позицию в видеопамяти
        mov     AX,[ScreenString]
        mov     DI,160
        mul     DI
        add     AX,[ScreenColumn]
        add     AX,[ScreenColumn]
        mov     DI,AX
; Установить указатель на начало текста
        inc     SI
; Вычислить количество символов
        dec     CX
        shr     CX,1

; ЦИКЛ ВЫВОДА СИМВОЛОВ
@@NextChar:
; Прочитать символ в формате Unicode
        lodsw
; Изменить порядок байтов
        xchg    AL,AH
; Преобразовать символ в код ASCII
        ; Латинские символы?
        cmp     AX,80h
        jb      @@OutChar
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
        jmp     @@OutChar
; Преобразование русских символов второй группы
@@Group2:
        add     AL,0A0h
        jmp     @@OutChar
; Преобразование буквы "Ё"
@@E1:   mov     AL,0F0h
        jmp     @@OutChar
@@E2:   mov     AL,0F1h
        jmp     @@OutChar
; Преобразование неизвестных символов в знак вопроса
@@UndefinedChar:
        mov     AL,'?'
; Вывед символа
@@OutChar:
        ; Установить цвет, принятый по умолчанию
        mov     AH,[TextColorAndBackground]
        ; Вывести символ на экран
        stosw
        loop    @@NextChar
@@Err:  pop     ES
        popa
        ret
ENDP ShowUnicodeName


;****************************************************
;*        ПОКАЗАТЬ ДАТУ И ВРЕМЯ СОЗДАНИЯ ФАЙЛА      *
;* Передаваемые параметры:                          *
;* DS:SI - указатель на структуру данных;           *
;* BX - смещение поля даты от начала структуры;     *
;* Цвет задается переменной TextColorAndBackground. *
;* Координаты позиции передаются через глобальные   *
;* переменные ScreenString и ScreenColumn.          *
;****************************************************
PROC ShowUDFTime near
        pusha
; Сохранить экранные координаты
        push    [ScreenColumn]
; Вычислить адрес поля даты
        add     SI,BX
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
        mov     AL,[SI+5]
        cmp     AL,9
        ja      @@Day
        inc     [ScreenColumn]
@@Day:  call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести номер месяца
        push    [ScreenColumn]
        mov     AL,[SI+4]
        cmp     AL,9
        ja      @@Mon
        inc     [ScreenColumn]
@@Mon:  call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести номер года
        mov     AX,[SI+2]
        call    ShowDecWord
        add     [ScreenColumn],6
; Вывести время
        ; Вывести час
        push    [ScreenColumn]
        mov     AL,[SI+6]
        cmp     AL,9
        ja      @@H
        inc     [ScreenColumn]
@@H:    call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести минуту
        push    [ScreenColumn]
        mov     AL,[SI+7]
        cmp     AL,9
        ja      @@M
        inc     [ScreenColumn]
@@M:    call    ShowDecByte
        pop     [ScreenColumn]
        add     [ScreenColumn],3
        ; Вывести секунду
        mov     AL,[SI+8]
        cmp     AL,9
        ja      @@S
        inc     [ScreenColumn]
@@S:    call    ShowDecByte
; Восстановить экранные координаты
        pop     [ScreenColumn]
        popa
        ret
ENDP ShowUDFTime


;***************************************************
;*        ПОКАЗАТЬ СОДЕРЖИМОЕ ПОЛЕЙ "ЯКОРЯ"        *
;* Передаваемые параметры:                         *
;* Сектор, содежащий "якорь", должен быть загружен *
;* в CDDataBuf.                                    *
;***************************************************
PROC ShowAnchor near
        pushad
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана
        MShowColorText 1,He0
; Отобразить содержимое тега дескриптора "якоря"
        call    ShowTagDesc
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести имена полей дескриптора "якоря" экран
        MShowText 6,Txt5
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Отобразить значение полей дескриптора "якоря"
        ; Размер экстента основной последовательности
        MShowDecDWord 9,40,<[dword ptr CDDataBuf+16]>
        ; Адрес экстента основной последовательности
        MShowDecDWord 10,40,<[dword ptr CDDataBuf+20]>
        ; Размер экстента резервной последовательности
        MShowDecDWord 13,40,<[dword ptr CDDataBuf+24]>
        ; Адрес экстента резервной последовательности
        MShowDecDWord 14,40,<[dword ptr CDDataBuf+28]>
; Вывести указание для оператора
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar
        popad
        ret
ENDP ShowAnchor


;***************************************************
;* ПОКАЗАТЬ СОДЕРЖИМОЕ ПЕРВИЧНОГО ДЕСКРИПТОРА ТОМА *
;* Передаваемые параметры:                         *
;* Первичный дескриптор тома должен быть загружен  *
;* в CDDataBuf.                                    *
;***************************************************
PROC ShowPriDescr near
        pushad
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана
        MShowColorText 1,He1
        MShowColorText 1,TxtW
; Прочитать начальный сектор первичного дескриптора тома
        mov     EAX,[PrimVolDescSector]
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Отобразить содержимое дескриптора тега
        call    ShowTagDesc
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести имена полей первичного дескриптора тома
        MShowText 8,Txt6
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Отобразить значение полей первичного дескриптора тома
        mov     SI,offset CDDataBuf
        ; Порядковый номер
        MShowDecDWord 8,40,<[SI+16]>
        ; Номер первичного дескриптора
        MShowDecDWord 9,40,<[SI+20]>
        ; Идентификатор тома
        mov     [ScreenString],10
        mov     [ScreenColumn],40
        mov     BX,24
        mov     CX,32
        call    ShowUnicodeName
        ; Порядковый номер тома в группе
        MShowDecWord 11,40,<[SI+56]>
        ; Максимальный номер тома в группе
        MShowDecWord 12,40,<[SI+58]>
        ; Уровень обмена
        MShowDecWord 13,40,<[SI+62]>
        ; Время записи дескриптора тома
        mov     [ScreenString],14
        mov     [ScreenColumn],40
        mov     BX,376
        call    ShowUDFTime
        ; Флаги
        MShowBinWord 15,40,<[SI+488]>
; Вывести указание для оператора
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar
        popad
        ret
ENDP ShowPriDescr


;****************************************************
;* ПОКАЗАТЬ СОДЕРЖИМОЕ ДЕСКРИПТОРА ЛОГИЧЕСКОГО ТОМА *
;* Передаваемые параметры:                          *
;* Дескриптор логического тома должен быть загружен *
;* в CDDataBuf.                                     *
;****************************************************
PROC ShowLogVolDescr near
        pushad
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана
        MShowColorText 1,He2
; Отобразить содержимое дескриптора тега
        call    ShowTagDesc
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести имена полей дескриптора логического тома
        MShowText 8,Txt7
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Отобразить значение полей дескриптора логического тома
        mov     SI,offset CDDataBuf
        ; Порядковый номер
        MShowDecDWord 8,40,<[SI+16]>
        ; Идентификатор тома
        mov     [ScreenString],9
        mov     [ScreenColumn],40
        mov     BX,84
        mov     CX,64
        call    ShowUnicodeName
        ; Размер логического блока (байт)
        MShowDecDWord 10,40,<[SI+212]>
        ; Размер экстента набора файлов
        MShowDecDWord 11,40,<[SI+248]>
        ; Адрес экстента набора файлов
        MShowDecDWord 12,40,<[SI+252]>
        ; Идентификатор раздела набора файлов
        MShowDecWord 13,40,<[SI+256]>
        ; Размер таблицы карт (байт)
        MShowDecDWord 14,40,<[SI+264]>
        ; Количество карт разделов
        MShowDecDWord 15,40,<[SI+268]>
; Вывести указание для оператора
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar
        popad
        ret
ENDP ShowLogVolDescr



;*******************************************
;* ПОКАЗАТЬ СОДЕРЖИМОЕ ДЕСКРИПТОРА РАЗДЕЛА *
;* Передаваемые параметры:                 *
;* Дескриптор раздела должен быть загружен *
;* в CDDataBuf.                            *
;*******************************************
PROC ShowPartitionDescr near
        pushad
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана
        MShowColorText 1,He3
; Отобразить содержимое дескриптора тега
        call    ShowTagDesc
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести имена полей дескриптора логического тома
        MShowText 6,Txt8
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Отобразить значение полей дескриптора раздела
        mov     SI,offset CDDataBuf
        ; Порядковый номер
        MShowDecDWord 8,40,<[SI+16]>
        ; Флаги раздела
        MShowBinWord 9,40,<[SI+20]>
        ; Номер раздела
        MShowDecWord 10,40,<[SI+22]>
        ; Тип доступа
        MShowDecDWord 11,40,<[SI+184]>
        ; Начальный сектор раздела
        MShowDecDWord 12,40,<[SI+188]>
        ; Размер раздела, секторов
        MShowDecDWord 13,40,<[SI+192]>
; Вывести указание для оператора
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar
        popad
        ret
ENDP ShowPartitionDescr


;***************************************************
;*  ПОКАЗАТЬ СОДЕРЖИМОЕ ДЕСКРИПТОРА НАБОРА ФАЙЛОВ  *
;* Передаваемые параметры:                         *
;* Дескриптора набора файлов должен быть загружен  *
;* в CDDataBuf.                                    *
;***************************************************
PROC ShowFileSetDescr near
        pushad
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана
        MShowColorText 1,He4
; Отобразить содержимое дескриптора тега
        call    ShowTagDesc
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести имена полей дескриптора логического тома
        MShowText 6,Txt9
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Отобразить значение полей дескриптора набора файлов
        mov     SI,offset CDDataBuf
        ; Метка времени
        mov     [ScreenString],8
        mov     [ScreenColumn],40
        mov     BX,16
        call    ShowUDFTime
        ; Номер набора файлов
        MShowDecDWord 9,40,<[SI+40]>
        ; Номер дескриптора набора
        MShowDecDWord 10,40,<[SI+44]>
        ; Размер экстента ICB корневого каталога
        MShowDecDWord 11,40,<[SI+400]>
        ; Адрес экстента ICB корневого каталога
        MShowDecDWord 12,40,<[SI+404]>
        ; Идентификатор раздела ICB корневого каталога
        MShowDecWord 13,40,<[SI+408]>
; Вывести указание для оператора
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar
        popad
        ret
ENDP ShowFileSetDescr


;************************************************
;* ПОКАЗАТЬ СОДЕРЖИМОЕ ЭЛЕМЕНТА-ОПИСАТЕЛЯ ФАЙЛА *
;* Передаваемые параметры:                      *
;* Элемент-описатель файла должен быть загружен *
;* в CDDataBuf.                                 *
;************************************************
PROC ShowFileElement near
        pushad
; Отобразить содержимое дескриптора тега
        call    ShowTagDesc
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести имена полей описателя файла
        MShowText 13,TxtF
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Отобразить значение полей дескриптора файлового
; элемента
        mov     SI,offset CDDataBuf
        ; Количество предшествующих ссылок
        MShowDecDWord 8,40,<[SI+16]>
        ; Код стратегии ICB
        MShowDecWord 9,40,<[SI+16+4]>
        ; Максимальное количество ссылок
        MShowDecWord 10,40,<[SI+16+8]>
        ; Тип файла
        MShowDecByte 11,40,<[SI+16+11]>
        ; Идентификатор пользователя
        MShowHexDWord 12,40,<[SI+40]>
        ; Ограничения
        MShowBinDWord 13,40,<[SI+44]>
        ; Количество ссылок на файл
        MShowDecWord 14,40,<[SI+48]>
        ; Размер файла в байтах
        MShowDecDWord 15,40,<[SI+56]>
        ; Размер файла в блоках
        MShowDecDWord 16,40,<[SI+64]>
        ; Время записи
        mov     [ScreenString],17
        mov     [ScreenColumn],40
        mov     BX,84
        call    ShowUDFTime
        ; Числовой идентификатор файла
        MShowDecDWord 18,40,<[SI+160]>
        ; Длина области расширенных атрибутов
        MShowDecDWord 19,40,<[SI+168]>
        ; Длина области дескрипторов размещения
        MShowDecDWord 20,40,<[SI+172]>
; Определить место размещения файла
        cmp     [dword ptr SI+64],0
        je      @@SmallFile ;файл размещен внутри ICB

; Файл размещен в отдельном экстенте
; Установить зеленый цвет текста
        mov     [TextColorAndBackground],LIGHTGREEN
; Вывести имена полей короткого дескриптора размещения
        MShowText 2,TxtE
; Установить белый цвет текста
        mov     [TextColorAndBackground],WHITE
; Вывести размер и адрес экстента файла
        ; Размер файла
        mov     SI,offset CDDataBuf
        mov     BX,176
        add     BX,[SI+168]
        MShowDecDWord 21,40,<[SI+BX]>
        ; Смещение файла
        MShowDecDWord 22,40,<[SI+BX+4]>

@@SmallFile:

; Вывести указание для оператора
        MShowColorText 1,AnyK
; Ожидать нажатия любой клавиши
        call    GetChar
        popad
        ret
ENDP ShowFileElement


;*************************************************
;*       ПОКАЗАТЬ НАЧАЛО КОРНЕВОГО КАТАЛОГА      *
;* Передаваемые параметры:                       *
;* Первый сектор каталога должен быть загружен в *
;* CDDataBuf.                                    *
;*************************************************
PROC ShowRootDir near
        pushad
; Очистить экран
        call    ClearScreen
; Вывести шапку каталога
        MShowColorText 4,TxtR
; Запомнить размер области дескрипторов размещения
        mov     SI,offset CDDataBuf
        add     SI,172
        add     EAX,[SI]
        mov     [DescAreaSize],EAX
; Обнулить смещение
        mov     [FileIdentOffset],0
; Обнулить счетчик файлов
        mov     [FileNumber],0
; Установить серый цвет текста
        mov     [TextColorAndBackground],LIGHTGREY
; Начать вывод с четвертой строки экрана
        mov     [ScreenString],4

; ЦИКЛ ВЫВОДА СТРОК КАТАЛОГА
@@NextString:
; Вычислить смещение очередного идентификатора
        mov     SI,offset CDDataBuf
        add     SI,176
        add     SI,[FileIdentOffset]
; Проверка на конец списка
        cmp     [byte ptr SI],0
        je      @@End
; Пропускать удаленные файлы
        test    [byte ptr SI+18],00000100b
        jnz     @@FieldSize
; Вывести строку каталога
        ; Идентификатор файла
        cmp     [byte ptr SI+19],0
        jz      @@NoName   ;длина идентификатора = 0
        mov     [ScreenColumn],0
        mov     BX,[SI+36]
        add     BX,38      ;смещение поля
        xor     CX,CX
        mov     CL,[SI+19] ;длина поля в байтах
        call    ShowUnicodeName
@@NoName:
        ; Характеристики
        mov     [ScreenColumn],40
        mov     AL,[SI+18]
        call    ShowBinByte 
        ; Адрес ICB файла
        mov     [ScreenColumn],55
        mov     EAX,[SI+24]
        call    ShowDecDWord
; Увеличить номер строки на 1
        inc     [ScreenString]
; Увеличить номер файла
        inc     [FileNumber]
; Вычислить длину поля
@@FieldSize:
        xor     AX,AX
        mov     AL,[SI+19]
        add     AX,[SI+36]
        add     AX,38
; Выполнить выравнивание на 4
        test    AX,11b
        jz      @@NextDescrOffs
        and     AX,0FFFCh
        add     AX,4
; Вычислить начальное смещение следующего дескриптора
@@NextDescrOffs:
        add     [FileIdentOffset],AX
; Проверка на конец области
        mov     AX,[FileIdentOffset]
        cmp     [word ptr DescAreaSize],AX
        jbe     @@End
; Проверка количества выведенных строк (не более 20)
        cmp     [FileNumber],20
        jb      @@NextString

; Вывести указание для оператора
@@End:  mov     SI,offset AnyK
        call    ShowColorString
; Ожидать нажатия любой клавиши
        call    GetChar
        popad
        ret
ENDP ShowRootDir


;******************************************************
;* НАЙТИ ПЕРВЫЙ ФАЙЛ В КАТАЛОГЕ И ПОКАЗАТЬ ЕГО НАЧАЛО *
;* Передаваемые параметры:                            *
;* Первый сектор каталога должен быть загружен в      *
;* CDDataBuf.                                         *
;******************************************************
PROC FindFirstFile near
        pushad
; НАЙТИ В КАТАЛОГЕ ПЕРВЫЙ ФАЙЛ
; Обнулить смещение
        mov     [FileIdentOffset],0
; Запомнить размер области дескрипторов размещения
        mov     SI,offset CDDataBuf
        add     SI,172
        add     EAX,[SI]
        mov     [DescAreaSize],EAX
@@NextString:
; Вычислить смещение очередного идентификатора
        mov     SI,offset CDDataBuf
        add     SI,176
        add     SI,[FileIdentOffset]
; Проверка на конец списка
        cmp     [byte ptr SI],0
        je      @@Err
; Проверить атрибуты файла
        cmp     [byte ptr SI+18],0
        je      @@ReadFileDesc ;найден файл
; Вычислить длину поля
@@FieldSize:
        xor     AX,AX
        mov     AL,[SI+19]
        add     AX,[SI+36]
        add     AX,38
        ; Выполнить выравнивание на 4
        test    AX,11b
        jz      @@NextDescrOffs
        and     AX,0FFFCh
        add     AX,4
; Вычислить начальное смещение следующего дескриптора
@@NextDescrOffs:
        add     [FileIdentOffset],AX
; Проверка на конец области
        mov     AX,[FileIdentOffset]
        cmp     [word ptr DescAreaSize],AX
        jbe     @@Err
        jmp short @@NextString

; НАЙТИ ДЕСКРИПТОР ФАЙЛОВОГО ЭЛЕМЕНТА
; Прочитать дескриптор файлового элемента
@@ReadFileDesc:
        mov     EAX,[PartitionStartSec]
        add     EAX,[SI+24]
        mov     [dword ptr CDSectorAddress],EAX
        call    Read10WRetr
; Запомнить размер файла и смещение файла
; от начала раздела
        mov     SI,offset CDDataBuf
        mov     BX,176
        add     BX,[SI+168]
        mov     EAX,[SI+BX]    ;размер файла в байтах
        mov     [FileSize],EAX
        mov     EAX,[SI+BX+4]  ;смещение файла
        mov     [FileStartSec],EAX
; Очистить экран
        call    ClearScreen
; Вывести заголовок экрана
        MShowColorText 1,HeF
; Показать дескриптор элемента-описателя файла
        call    ShowFileElement

; ПРОЧИТАТЬ И ПОКАЗАТЬ (В ASCII-КОДЕ) НАЧАЛО ФАЙЛА
; Очистить экран
        call    ClearScreen
        mov     EAX,[PartitionStartSec]
        add     EAX,[FileStartSec]
        mov     [CDSectorAddress],EAX
        call    Read10WRetr
        mov     SI,offset CDDataBuf
        call    ShowSector1024

; Вывести указание для оператора
        mov     SI,offset AnyK
        call    ShowColorString
; Ожидать нажатия любой клавиши
        call    GetChar

        popad
        ret
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
