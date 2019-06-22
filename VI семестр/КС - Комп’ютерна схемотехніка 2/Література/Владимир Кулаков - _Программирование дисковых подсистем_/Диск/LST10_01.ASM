;                     ЛИСТИНГ 10.1
;  Непосредственная работа с контроллером гибкого диска
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst10_01.asm, 01.02.2001.

IDEAL
P386
LOCALS
MODEL MEDIUM

; Подключить файл мнемонических обозначений
; кодов управляющих клавиш и цветовых кодов
include "lst03_01.inc"
; Подключить файл макросов
include "lst03_04.inc"

; Коды завершения операции с контроллером (FDC_Status)
FDC_Normal         equ 0 ;нормальное завершение
FDC_TimeOut        equ 1 ;ошибка тайм-аута
FDC_DiskNotFound   equ 2 ;в дисководе нет диска
FDC_TrackNotFound  equ 3 ;дорожка не найдена
FDC_SectorNotFound equ 4 ;сектор не найден

; Максимальные значения координат сектора (заданные
; значения соответствуют параметрам стандартного
; трехдюймового гибкого диска объемом 1,44 Мб)
MAX_Track   equ 79
MAX_Head    equ  1
MAX_Sector  equ 18

DATASEG
; Текстовые сообщения
Txt1 DB LIGHTCYAN,0,17
     DB "ПРОСМОТР СЕКТОРОВ ГИБКОГО ДИСКА В ASCII-КОДЕ",0
     DB LIGHTGREEN,5,8
     DB "Дорожка XX, головка XX, сектор XX",0
     DB LIGHTCYAN,17,8,"Управляющие клавиши:",0
     DB LIGHTGREEN,19,8
     DB "Стрелка вниз - следующий сектор;",0
     DB LIGHTGREEN,20,8
     DB "Стрелка вверх - предыдущий сектор;",0
     DB LIGHTGREEN,21,8,"Esc - выход.",0
     DB YELLOW,24,27,"Нажмите управляющую клавишу",0
Err1 DB LIGHTRED,12,29,"В дисководе нет диска",0
Err2 DB LIGHTRED,12,31,"Сектор не найден",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0

; Счетчик тиков таймера
TickCounter DW ?
; Код завершения операции с контроллером НГМД
FDC_Status  DB ?
; Флаг прерывания от НГМД
FDD_IntFlag DB ?
; Момент начала последней операции с НГМД
FDD_Time    DD ?
; Координаты сектора
FDD_Track   DB ?
FDD_Head    DB ?
FDD_Sector  DB ?
; Область сохранения старого вектора прерывания таймера
OldTimerInterruptOffset  DW ?
OldTimerInterruptSegment DW ?
; Область сохранения старого вектора прерывания FDC
OldFDCInterruptOffset    DW ?
OldFDCInterruptSegment   DW ?
; Блок результата операции
FDC_ST0 DB ?
FDC_ST1 DB ?
FDC_ST2 DB ?
FDC_C   DB ?
FDC_H   DB ?
FDC_R   DB ?
FDC_N   DB ?
; Счетчик повторения операции чтения
ReadRepCounter  DB ?
; Счетчик повторения операции рекалибровки
RecalRepCounter DB ?
; Область памяти для хранения прочитанного сектора
FDD_DataBuffer  DB 512 DUP (?)
ENDS


SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS


CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC FDD_Dump
        mov     AX,DGROUP
        mov     DS,AX
; Установить текстовый режим и очистить экран
        mov     AX,3
        int     10h
; Скрыть курсор - убрать за нижнюю границу экрана
        mov     [ScreenString],25
        mov     [ScreenColumn],0
        call    SetCursorPosition
; Вывести текстовые сообщения на экран
        MShowColorText 7,Txt1
; Установить зеленый цвет и черный фон
        mov     [TextColorAndBackground],LIGHTGREEN
; Установить новый обработчик прерывания НГМД
        call    SetUserInterrupts
; Включить мотор дисковода
        call    FDDMotorON
; Инициализировать переменные
        mov     [FDD_Track],0
        mov     [FDD_Head],0
        mov     [FDD_Sector],1
; Провести рекалибровку и поиск нулевой дорожки
        call    RecalibrateFDD
        call    SeekTrack

; ЦИКЛ ПО СЕКТОРАМ
@@ReadSector:
; Прочитать сектор
        call    ReadSectWithRetr
        cmp     [FDC_Status],0
        jne     @@SectorNotFound
; Вывести номер дорожки, головки и сектора в заголовок
        MShowHexByte 5,16,[FDD_Track]
        MShowHexByte 5,28,[FDD_Head]
        MShowHexByte 5,39,[FDD_Sector]
; Отобразить содержимое сектора
        mov     SI,offset FDD_DataBuffer
        call    ShowSector512

; Ожидать ввода следующей команды с клавиатуры
@@GetCommand:
        call    GetChar
        cmp     AL,0
        jne     @@GetCommand
; Расшифровать код команды и выполнить ее
@@TestCommandByte:
        cmp     AH,B_Esc        ;"Выход"
        je      @@End
@@TestDn:
        cmp     AH,B_DN         ;"Стрелка вниз"
        jne     @@TestUp
; Перейти к следующему сектору
        ; Номер сектора меньше максимально допустимого?
        cmp     [FDD_Sector],MAX_Sector
        jae     @@IncHeadNumber
        ; Увеличить на 1 номер сектора
        inc     [FDD_Sector]
        jmp     @@ReadSector
@@IncHeadNumber:
        ; Номер головки меньше максимально допустимого?
        cmp     [FDD_Head],MAX_Head
        jae     @@IncTrackNumber
        ; Увеличить на 1 номер головки
        inc     [FDD_Head]
        ; Установить первый сектор
        mov     [FDD_Sector],1
        ; Провести поиск дорожки
        call    SeekTrack
        jmp     @@ReadSector
@@IncTrackNumber:
        ; Номер цилиндра меньше максимально допустимого?
        cmp     [FDD_Track],MAX_Track
        jae     @@GetCommand
        ; Увеличить на 1 номер трека
        inc     [FDD_Track]
        ; Установить нулевую головку
        mov     [FDD_Head],0
        ; Установить первый сектор
        mov     [FDD_Sector],1
        ; Провести поиск дорожки
        call    SeekTrack
        jmp     @@ReadSector

@@TestUp:
        cmp     AH,B_UP         ;"Стрелка вверх"
        jne     @@GetCommand
; Перейти к предыдущему сектору
        cmp     [FDD_Sector],1
        jbe     @@DecHeadNumber
        ; Уменьшить на 1 номер сектора
        dec     [FDD_Sector]
        jmp     @@ReadSector
@@DecHeadNumber:
        ; Номер головки больше 0?
        cmp     [FDD_Head],0
        je      @@DecTrackNumber
        ; Уменьшить на 1 номер головки
        mov     [FDD_Head],0
        ; Установить последний сектор
        mov     [FDD_Sector],MAX_Sector
        ; Провести поиск дорожки
        call    SeekTrack
        jmp     @@ReadSector
@@DecTrackNumber:
        ; Номер цилиндра больше 0? 
        cmp     [FDD_Track],0
        je      @@GetCommand
        ; Уменьшить на 1 номер трека
        dec     [FDD_Track]
        ; Установить последнюю головку
        mov     [FDD_Head],MAX_Head
        ; Установить последний сектор
        mov     [FDD_Sector],MAX_Sector
        ; Провести поиск дорожки
        call    SeekTrack
        jmp     @@ReadSector

; Обработка ошибок
@@DiskNotFound:
        ; Выдать сообщение об отсутствии диска
        mov     SI,offset Err1
        call    ShowColorString
        mov     SI,offset AnyK
        call    ShowColorString
        call    GetChar
        jmp short @@End
@@SectorNotFound:
        ; Выдать сообщение "Сектор не найден"
        mov     SI,offset Err2
        call    ShowColorString
        mov     SI,offset AnyK
        call    ShowColorString
        call    GetChar

; Завершение работы программы
@@End:  ; Выключить мотор дисковода
        call    FDDMotorOFF
        ; Восстановить старый обработчик прерывания НГМД
        call    RestoreOldInterrupts
        ; Переустановить текстовый режим (очистить экран)
        mov     ax,3
        int     10h
        ; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP FDD_Dump


;*************************************
;* ИНИЦИАЛИЗАЦИЯ РЕЖИМА ПДП ДЛЯ НГМД *
;*************************************
PROC Init_FDC_DMA near
        pushad
; Вычислить 24-разрядный адрес буфера данных для DMA
; и разместить его в регистре EBX
        xor     EAX,EAX
        xor     EBX,EBX
        mov     AX,DS
        shl     EAX,4
        mov     BX,offset FDD_DataBuffer
        add     EBX,EAX
; Послать команду чтения
        cli            ;запретить прерывания
        mov     AL,46h ;команда чтения данных
        out     12,AL  ;сбросить триггер мл./ст. байта
        out     11,AL  ;установка режима контроллера ПДП
        ; Загрузить адрес страницы
        mov     AL,BL  ;младший байт смещения буфера DMA
        out     4,AL
        mov     AL,BH  ;старший байт смещения буфера DMA
        out     4,AL
        shr     EBX,16
        mov     AL,BL  ;номер страницы буфера DMA
        out     81h,AL
        ; Загрузить число передаваемых байтов в счетчик
        mov     AX,511 ;размер сектора минус 1
        out     5,AL
        mov     AL,AH
        out     5,AL
        ; Разблокировать канал 2 контроллера ПДП
        mov     AL,2
        out     10,AL
        sti            ;разрешить прерывания
        popad
        ret
ENDP Init_FDC_DMA


;***********************************
;* ЗАПИСАТЬ БАЙТ В ПОРТ ДАННЫХ FDC *
;* Параметры:                      *
;* AL - выводимый байт.            *
;***********************************
PROC FDCDataOutput near
        pusha
        mov     AH,AL     ;запомнить байт в AH
; Сбросить переменную состояния контроллера
        mov     [FDC_Status],FDC_Normal
; Проверить готовность контроллера к приему данных
        mov     DX,3F4h   ;(порт состояния FDC)
        xor     CX,CX     ;установить счетчик тайм-аута
@@TestRS:
        in      AL,DX     ;прочитать регистр RS
        and     AL,0C0h   ;выделить разряды 6 и 7
        cmp     AL,80h    ;проверить разряды 6 и 7
        je      @@OutByteToFDC
        loop    @@TestRS
; Ошибка тайм-аута
        mov     [FDC_Status],FDC_TimeOut
        jmp short @@End
; Вывести байт в порт данных
@@OutByteToFDC:
        inc     DX
        mov     AL,AH
        out     DX,AL
@@End:  popa
        ret
ENDP FDCDataOutput


;******************************************
;*   ПРОЧИТАТЬ БАЙТ ИЗ ПОРТА ДАННЫХ FDC   *
;* Процедура не имеет входных параметров. *
;* Выходные данные:                       *
;* AL - считанный байт.                   *
;******************************************
PROC FDCDataInput near
        push    ECX
        push    DX
; Сбросить переменную состояния контроллера
        mov     [FDC_Status],FDC_Normal
; Проверить готовность контроллера к передаче данных
        mov     DX,3F4h   ;(порт состояния FDC)
        xor     CX,CX     ;установить счетчик тайм-аута
@@TestRS:
        in      AL,DX     ;прочитать регистр RS
        and     AL,0C0h   ;выдлить разряды 6 и 7
        cmp     AL,0C0h   ;проверить разряды 6 и 7
        je      @@GetByteFromFDC
        loop    @@TestRS
; Ошибка тайм-аута
        mov     [FDC_Status],FDC_TimeOut
        jmp short @@End
; Ввести байт из порта данных
@@GetByteFromFDC:
        inc     DX
        in      AL,DX
@@End:  pop     DX
        pop     ECX
        ret
ENDP FDCDataInput


;*********************************************
;* ОБРАБОТЧИК ПРЕРЫВАНИЯ ОТ КОНТРОЛЛЕРА НГМД *
;*********************************************
PROC FDCInterrupt far
; Разрешить прерывания
        sti
        push    DS
        push    AX
; Установить флаг прерывания
        mov     AX,DGROUP
        mov     DS,AX
        mov     [FDD_IntFlag],1
; Послать команду EOI контроллеру прерываний
        mov     AL,20h
        out     20h,AL
        pop     AX
        pop     DS
        iret
ENDP FDCInterrupt


;***********************************************
;* ОБРАБОТЧИК ПРЕРЫВАНИЯ ОТ СИСТЕМНОГО ТАЙМЕРА *
;***********************************************
PROC TimerInterrupt far
; Разрешить прерывания
        sti
        push    DS
        push    AX
; Увеличить значение счетчика "тиков"
        mov     AX,DGROUP
        mov     DS,AX
        inc     [TickCounter]
; Послать команду EOI контроллеру прерываний
        mov     AL,20h
        out     20h,AL
        pop     AX
        pop     DS
        iret
ENDP TimerInterrupt


;******************************************
;* УСТАНОВИТЬ НОВЫЙ ОБРАБОТЧИК ПРЕРЫВАНИЙ *
;*             НГМД И ТАЙМЕРА             *
;******************************************
PROC SetUserInterrupts NEAR
        pusha
        push    ES
        mov     AX,0
        mov     ES,AX
; Запомнить вектор прерывания таймера
        mov     AX,[ES:08h*4]
        mov     [OldTimerInterruptOffset],AX
        mov     AX,[ES:08h*4+2]
        mov     [OldTimerInterruptSegment],AX
; Запомнить вектор прерывания FDC
        mov     AX,[ES:0Eh*4]
        mov     [OldFDCInterruptOffset],AX
        mov     AX,[ES:0Eh*4+2]
        mov     [OldFDCInterruptSegment],AX
; Установка векторов новых обработчиков
        cli     ;запретить прерывания
        mov     AX,offset TimerInterrupt
        mov     [ES:08h*4],AX
        mov     AX,CS
        mov     [ES:08h*4+2],AX
        mov     AX,offset FDCInterrupt
        mov     [ES:0Eh*4],AX
        mov     AX,CS
        mov     [ES:0Eh*4+2],AX
        sti     ;разрешить прерывания
        pop     ES
        popa
        ret
ENDP SetUserInterrupts


;********************************************
;* ВОССТАНОВИТЬ ИСХОДНЫЕ ВЕКТОРЫ ПРЕРЫВАНИЙ *
;********************************************
PROC RestoreOldInterrupts NEAR
        pusha
; Настроить регистр ES на таблицу векторов прерываний
        push    ES
        mov     AX,0
        mov     ES,AX
; Восстановить прежние векторы прерываний
        cli
        mov     AX,[OldTimerInterruptOffset]
        mov     [ES:08h*4],AX
        mov     AX,[OldTimerInterruptSegment]
        mov     [ES:08h*4+2],AX
        mov     AX,[OldFDCInterruptOffset]
        mov     [ES:0Eh*4],AX
        mov     AX,[OldFDCInterruptSegment]
        mov     [ES:0Eh*4+2],AX
        sti
        pop     ES
        popa
        ret
ENDP RestoreOldInterrupts


;*******************************************
;* ОЖИДАНИЕ ПРЕРЫВАНИЯ ОТ КОНТРОЛЛЕРА НГМД *
;*******************************************
PROC WaitFDCInterrupt near
        pusha
; Сбросить байт состояния операции
        mov     [FDC_Status],FDC_Normal
; Сбросить флаг прерывания
        mov     [FDD_IntFlag],0
; Обнулить счетчик тиков
        mov     [TickCounter],0
; Ожидать установки флага прерывания НГМД
@@TestRS:
        cmp     [FDD_IntFlag],0
        jnz     @@End           ;прерывание произошло
        cmp     [TickCounter],5 ;ожидать 5 тиков
        jb      @@TestRS
; Ошибка тайм-аута
        mov     [FDC_Status],FDC_TimeOut
@@End:  popa
        ret
ENDP WaitFDCInterrupt


;*********************************
;* ВКЛЮЧИТЬ МОТОР ДИСКОВОДА "A:" *
;*********************************
PROC FDDMotorON near
        pusha
; Произвести сброс контроллера НГМД
        mov     DX,3F2h ;порт управления двигателями
        mov     AL,0
        out     DX,AL
; Разрешить прерывания и включить мотор дисковода "A:"
        mov     AL,1Ch
        out     DX,AL
; Обнулить счетчик тиков
        mov     [TickCounter],0
; Ожидать 0,5 с
@@dT:   cmp     [TickCounter],10
        jb      @@dT
        popa
        ret
ENDP FDDMotorON


;**********************************
;* ВЫКЛЮЧИТЬ МОТОР ДИСКОВОДА "A:" *
;**********************************
PROC FDDMotorOFF near
        push    AX
        push    DX
        mov     DX,3F2h ;порт управления двигателями 
        mov     AL,0Ch  ;выключить мотор дисковода A:
        out     DX,AL
        pop     DX
        pop     AX
        ret
ENDP FDDMotorOFF


;*******************************
;* РЕКАЛИБРОВКА ДИСКОВОДА "A:" *
;*******************************
PROC RecalibrateFDD near
        pusha
; Подать команду "Рекалибровка"
        mov     AL,07h
        call    FDCDataOutput
        mov     AL,00h
        call    FDCDataOutput
; Ожидать завершения операции
        call    WaitFDCInterrupt
        popa
        ret
ENDP RecalibrateFDD


;*****************************************************
;*                    ПОИСК ДОРОЖКИ                  *
;* Параметры передаются через глобальные переменные: *
;* FDD_Track - номер дорожки (0-79);                 *
;* FDD_Head - номер головки (0-1).                   *
;* Результат операции заносится в FDC_Status.        *
;*****************************************************
PROC SeekTrack near
        pusha
; Подать команду "Поиск"
        mov     AL,0Fh
        call    FDCDataOutput
        ; Передать байт номера головки/накопителя
        mov     AL,[FDD_Head]
        shl     AL,2
        call    FDCDataOutput
        ; Передать байт номера дорожки
        mov     AL,[FDD_Track]
        call    FDCDataOutput
; Ожидать завершения операции
        call    WaitFDCInterrupt
        cmp     [FDC_Status],FDC_Normal
        jne     @@Exit
; Сохранить результат поиска
        mov     AL,08h
        call    FDCDataOutput
        call    FDCDataInput
        mov     [FDC_ST0],AL
        call    FDCDataInput
        mov     [FDC_C],AL
; Проверить результат поиска
        ; Поиск завершен?
        test    [FDC_ST0],100000b
        je      @@Err
        ; Заданный трек найден?
        mov     AL,[FDC_C]
        cmp     AL,[FDD_Track]
        jne     @@Err
        ; Номер головки совпадает с заданным?
        mov     AL,[FDC_ST0]
        and     AL,100b
        shr     AL,2
        cmp     AL,[FDD_Head]
        jne     @@Err
        ; Операция завершена успешно
        mov     [FDC_Status],FDC_Normal
        jmp short @@Exit
@@Err:  ; Трек не найден
        mov     [FDC_Status],FDC_TrackNotFound
@@Exit: popa
        ret
ENDP SeekTrack


;*******************************************************
;*               ЧТЕНИЕ СЕКТОРА ДАННЫХ                 *
;* Параметры передаются через глобальные переменные:   *
;* FDD_Track - номер дорожки (0-79);                   *
;* FDD_Head - номер головки (0-1);                     *
;* FDD_Sector - номер сектора (1-18).                  *
;* Результат операции заносится в FDC_Status.          *
;* В случае успешного выполнения операции чтения       *
;* содержимое сектора будет занесено в FDD_DataBuffer. *
;*******************************************************
PROC ReadSector near
        pushad
; Установить скорость передачи 500 Кбайт/с
        mov     AX,0
        mov     DX,03F7h
        out     DX,AL
; Инициализировать канал прямого доступа к памяти
        call    Init_FDC_DMA
; Подать команду "Чтение данных"
        mov     AL,0E6h  ;чтение в мультитрековом режиме
        call    FDCDataOutput
        mov     AL,[FDD_Head]
        shl     AL,2
        call    FDCDataOutput
        mov     AL,[FDD_Track]
        call    FDCDataOutput
        mov     AL,[FDD_Head]
        call    FDCDataOutput
        mov     AL,[FDD_Sector]
        call    FDCDataOutput
        mov     AL,2    ;код размера сектора (512 байт)
        call    FDCDataOutput
        mov     AL,18+1; 3Fh  ;число секторов на дорожке
        call    FDCDataOutput
        mov     AL,1Bh  ;значение GPL
        call    FDCDataOutput
        mov     AL,0FFh ;значение DTL
        call    FDCDataOutput

; Ожидаем прерывание по завершении операции
        call    WaitFDCInterrupt
        cmp     [FDC_Status],FDC_Normal
        jne     @@Exit
; Считываем статус завершения операции
        call    GetStatusInfo
        test    [FDC_ST0],11011000b
        jnz     @@Err
        mov     [FDC_Status],FDC_Normal
        jmp short @@Exit
@@Err:  mov     [FDC_Status],FDC_SectorNotFound
@@Exit: popad
        ret
ENDP ReadSector


;*******************************************************
;*   ЧТЕНИЕ СЕКТОРА (С ПОВТОРЕНИЕМ ОПЕРАЦИИ ПРИ СБОЕ)  *
;* Параметры передаются через глобальные переменные:   *
;* FDD_Track - номер дорожки (0-79);                   *
;* FDD_Head - номер головки (0-1);                     *
;* FDD_Sector - номер сектора (1-18).                  *
;* Результат операции заносится в FDC_Status.          *
;* В случае успешного выполнения операции чтения       *
;* содержимое сектора будет занесено в FDD_DataBuffer. *
;*******************************************************
PROC ReadSectWithRetr near
        pusha
; Обнулить счетчик повторения операции рекалибровки
        mov     [RecalRepCounter],0
@@TryAgain:
; Обнулить счетчик повторения операции чтения
        mov     [ReadRepCounter],0
@@ReadSector:
        call    ReadSector
        cmp     [FDC_Status],0
        je      @@Exit
        ; Троекратное повторение чтения
        inc     [ReadRepCounter]
        cmp     [ReadRepCounter],3
        jb      @@ReadSector
        ; Троекратное повторение рекалибровки
        call    RecalibrateFDD
        call    SeekTrack
        inc     [RecalRepCounter]
        cmp     [RecalRepCounter],3
        jb      @@TryAgain
@@Exit: popa
        ret
ENDP ReadSectWithRetr


;*********************************************
;* ПОЛУЧИТЬ ИНФОРМАЦИЮ О РЕЗУЛЬТАТЕ ОПЕРАЦИИ *
;*********************************************
PROC GetStatusInfo near
        push    AX
        call    FDCDataInput
        mov     [FDC_ST0],AL
        call    FDCDataInput
        mov     [FDC_ST1],AL
        call    FDCDataInput
        mov     [FDC_ST2],AL
        call    FDCDataInput
        mov     [FDC_C],AL
        call    FDCDataInput
        mov     [FDC_H],AL
        call    FDCDataInput
        mov     [FDC_R],AL
        call    FDCDataInput
        mov     [FDC_N],AL
        pop     AX
        ret
ENDP GetStatusInfo
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуры для перевода чисел из двоичного
; кода в десятичный
include "lst03_03.inc"
END
