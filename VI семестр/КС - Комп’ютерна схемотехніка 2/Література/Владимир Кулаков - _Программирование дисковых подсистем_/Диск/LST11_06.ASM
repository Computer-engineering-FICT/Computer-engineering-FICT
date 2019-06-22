;                     ЛИСТИНГ 11.6
;        Переключение жесткого диска в режим Standby
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst11_06.asm, 23.02.2001.

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
Txt1 DB LIGHTGREEN,12,30,"ПОИСК ЖЕСТКОГО ДИСКА",0
Txt2 DB YELLOW,12,24,"ДИСК ПЕРЕВЕДЕН В РЕЖИМ STANDBY",0
; Указания для оператора
TxtW DB YELLOW,24,35,"Ждите ...",0
AnyK DB YELLOW,24,29,"Нажмите любую клавишу",0
; Сообщение об ошибке
CErr DB LIGHTRED,12,21
     DB "ОШИБКА ПРИ ВЫПОЛНЕНИИ КОМАНДЫ STANDBY",0
ENDS

SEGMENT sseg para stack 'STACK'
        DB 400h DUP(?)
ENDS

CODESEG
;*****************************
;* Основной модуль программы *
;*****************************
PROC SetStandbyMode
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
        MShowColorText 1,Txt1
        MShowColorText 1,TxtW
; Найти жесткий диск "C:"
        call    FindHDD

; Ожидание готовности HDD к приему команды
        ; Запомнить время начала операции с диском
        mov     AX,0
        mov     ES,AX
        mov     EAX,[ES:046Ch]
        mov     [OpTime],EAX
        ; Выбрать нужный диск
        mov     DX,[ATABasePortAddr]
        add     DX,6    ;адрес регистра головок
        mov     AL,[DiskNumber]
        shl     AL,4
        or      AL,10100000b
        out     DX,AL
        ; Ожидать, пока диск не будет готов
        inc     DX      ;в DX адрес регистра состояния
@@WaitHDReady:
        ; Проверить время выполнения команды
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,BSYWaitTime
        ja      @@Err   ;ошибка тайм-аута
        ; Прочитать регистр состояния
        in      AL,DX
        ; Проверить состояние сигнала BSY
        test    AL,80h
        jnz     @@WaitHDReady
        ; Проверить состояние сигнала DRQ
        test    AL,08h
        jnz     @@WaitHDReady
; Подать команду для перевода диска в режим Standby
        mov     AL,0E0h ;код команды Standby
        out     DX,AL
; Ожидать завершения команды
@@WaitCompleet:
        ; Проверить время выполнения команды
        mov     EAX,[ES:046Ch]
        sub     EAX,[OpTime]
        cmp     EAX,MaxHDDWaitTime
        ja      @@Err    ;ошибка тайм-аута
        ; Проверить готовность
        in      AL,DX
        test    AL,80h   ;состояние сигнала BSY
        jnz     @@WaitCompleet
        test    AL,1     ;состояние сигнала ERR
        jnz     @@Err

; Вывести указания для оператора
        MShowColorText 1,Txt2
        MShowColorText 1,AnyK
; Ожидать нажатия клавиши
        call    GetChar
        jmp short @@Exit
; Выдать сообщение об ошибке
@@Err:  MShowColorText 1,CErr
        MShowColorText 1,AnyK
@@Exit:
; Переустановить текстовый режим
        mov     ax,3
        int     10h
; Выход в DOS
        mov     AH,4Ch
        int     21h
ENDP SetStandbyMode
ENDS

; Подключить процедуры ввода/вывода
include "lst03_02.inc"
; Подключить процедуры для перевода чисел из двоичного
; кода в десятичный
include "lst03_03.inc"
; Подключить процедуру для подачи ATA-команды
include "lst11_01.inc"
; Подключить процедуру для поиска жесткого диска
include "lst11_02.inc"
END
