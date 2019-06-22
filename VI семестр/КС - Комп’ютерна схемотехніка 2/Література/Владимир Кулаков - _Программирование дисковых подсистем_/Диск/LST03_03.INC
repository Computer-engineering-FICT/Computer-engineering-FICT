;                     ЛИСТИНГ 3.3
;   Набор процедур для вывода чисел в десятичном коде
;
; Автор текста программы Кулаков Владимир Геннадьевич.
; Файл lst03_03.inc, 30.01.2001.

DATASEG
; 32-разрядное целое число
Data_Int32    DD ?
; Число в BCD-формате 
Data_BCD      DT ?
; Знак результата (если не 0 - отрицательное число)
Data_Sign     DB ?
; Строка для хранения числа в коде ASCII
Data_String   DB 32 DUP (?)
; Структура для вывода результата
OutD_String   DB 34 DUP (?)
EVEN

CODESEG
;***************************************************
;* ПРЕОБРАЗОВАТЬ 32-РАЗРЯДНОЕ ЦЕЛОЕ ЧИСЛО В СТРОКУ *
;* Входные параметры:                              *
;* Data_Int32 - 32-разрядное число.                *
;* Выходные параметры:                             *
;* Data_String - строка-результат.                 *
;***************************************************
PROC Int32_to_String near
        pushad  
        push    DS
        push    ES
        mov     AX,DGROUP
        mov     DS,AX
        mov     ES,AX
        cld
; Перевести число из двоичного кода в код BCD
        fninit               ;сброс сопроцессора
        ; Загрузить число в двоичном коде
        fild    [Data_Int32]
        ; Извлечь число в коде BCD
        fbstp   [Data_BCD]
; Результат записывать в строку Data_String
        mov     DI,offset Data_String
        call    BCD_to_ASCII
; Записать признак конца строки (код 0)
        xor     AL,AL
        stosb
        pop     ES
        pop     DS
        popad
        ret
ENDP Int32_to_String 


;*******************************************************
;*       ВЫВОД БАЙТА НА ЭКРАН В ДЕСЯТИЧНОМ КОДЕ        *
;* Подпрограмма выводит содержимое регистра AL в       *
;* шестнадцатеричном коде в указанную позицию экрана.  *
;* Координаты позиции передаются через глобальные      *
;* переменные ScreenString и ScreenColumn. После       *
;* выполнения операции вывода байта происходит         *
;* автоматическое приращение значений этих переменных. *
;*******************************************************
PROC ShowDecByte NEAR
        push    EAX
        and     EAX,0FFh
        call    ShowDecDWord
        pop     EAX
        ret
ENDP ShowDecByte


;*****************************************************
;*         ВЫВОД 16-РАЗРЯДНОГО СЛОВА НА ЭКРАН        *
;*                 В ДЕСЯТИЧНОМ КОДЕ                 *
;* Параметры:                                        *
;* AX - число, которое будет выведено на экран.      *
;* Номер строки передается через глобальную          *
;* переменную ScreenString, номер столбца - через    *
;* переменную ScreenColumn, цвет текста определяется *
;* глобальной переменой TextColorAndBackground.      *
;*****************************************************
PROC ShowDecWord NEAR
        push    EAX
        and     EAX,0FFFFh
        call    ShowDecDWord
        pop     EAX
        ret
ENDP ShowDecWord


;*****************************************************
;*         ВЫВОД 32-РАЗРЯДНОГО СЛОВА НА ЭКРАН        *
;*                 В ДЕСЯТИЧНОМ КОДЕ                 *
;* Параметры:                                        *
;* EAX - число, которое будет выведено на экран.     *
;* Номер строки передается через глобальную          *
;* переменную ScreenString, номер столбца - через    *
;* переменную ScreenColumn, цвет текста определяется *
;* глобальной переменой TextColorAndBackground.      *
;*****************************************************
PROC ShowDecDWord NEAR
        pushad
        push    DS
        push    ES
; Настроить регистр DS на глобальный сегмент данных
        mov     DI,DGROUP
        mov     DS,DI
; Перевести число в десятичный код
        mov     [Data_Int32],EAX
        call    Int32_to_String
; Настроить регистры ES:DI для
; прямого вывода в видеопамять
        ; Загрузить адрес сегмента видеоданных в ES
        mov     AX,0B800h
        mov     ES,AX
        ; Умножить номер строки на длину
        ; строки в байтах
        mov     AX,[ScreenString]
        mov     DX,160
        mul     DX
        ; Прибавить к полученному произведению номер
        ; колонки (дважды)
        add     AX,[ScreenColumn]
        add     AX,[ScreenColumn]
        ; Переписать результат в индексный регистр
        mov     DI,AX
        cld
; Использовать цвет символов, заданный по умолчанию
        mov     AH,[TextColorAndBackground]
; Вывести число на экран
        mov     CX,10
        mov     SI,offset Data_String
@@NextChar:
        lodsb             ;загрузить цифру в AL
        and     AL,AL     ;проверка на 0 (конец строки)
        jz      @@EndOfString
        stosw             ;вывести цифру на экран
        loop    @@NextChar
@@EndOfString:
        pop     ES
        pop     DS
        popad
        ret
ENDP ShowDecDWord


;****************************************************
;*   ПРЕОБРАЗОВАТЬ ЧИСЛО ИЗ КОДА BCD В КОД ASCII    *
;* (вспомогательная функция, регистры не сохраняет) *
;* Входные параметры:                               *
;* Data_BCD - число в BCD-формате.                  *
;* Регистр DI - указатель на строку результата.     *
;****************************************************
PROC BCD_to_ASCII near
; Выделить знак числа и записать его в ASCII-коде
        mov     AL,[offset Data_BCD + 9]
        and     AL,AL
        jz      @@n0
        mov     AL,'-'
        stosb
; Пропустить незначащие (нулевые) разряды слева
@@n0:   mov     BX,8
        mov     CX,9
@@n1:   ;проверяем на 0 очередную пару разрядов
        cmp     [byte ptr BX+offset Data_BCD],0
        jne     @@n2
        dec     BX
        loop    @@n1
; Если значение числа равно нулю, записать символ
; нуля в строку результата и выйти из программы
        mov     AL,'0'
        stosb
        jmp short @@End
; Пропустить незначащий ноль в старшей
; тетраде (если он есть)
@@n2:   ; Загрузить первую значащую пару разрядов
        mov     AL,[BX + offset Data_BCD]
        mov     AH,AL
        ; Выделить, перевести в ASCII и
        ; сохранить старшую тетраду
        shr     AL,4
        cmp     AL,0
        ; Если 0 - пропустить старшую тетраду
        je      @@n3
        add     AL,'0'
        stosb
        ; Выделить, перевести в ASCII и
        ; сохранить младшую тетраду
@@n3:   mov     AL,AH
        and     AL,0Fh
        add     AL,'0'
        stosb
        dec     BX
        dec     CX
        jz      @@End ;выход, если это последний разряд

; Распаковать остальные разряды числа (если они есть)
@@n4:   ; Загрузить очередную пару разрядов
        mov     AL,[BX + offset Data_BCD]
        mov     AH,AL
        ; Выделить, перевести в ASCII и
        ; сохранить старшую тетраду
        shr     AL,4
        add     AL,'0'
        stosb
        ; Выделить, перевести в ASCII и
        ; сохранить младшую тетраду
        mov     AL,AH
        and     AL,0Fh
        add     AL,'0'
        stosb
        dec     BX
        loop    @@n4
@@End:
        ret
ENDP BCD_to_ASCII


;**************************************************
;*     ОТОБРАЗИТЬ ЧИСЛО В КОДЕ ASCII НА ЭКРАН     *
;* Подпрограмма отображает Data_String на экран.  *
;* Координаты позиции передаются через глобальные *
;* переменные ScreenString и ScreenColumn. После  *
;* выполнения операции происходит автоматическое  *
;* приращение значений этих переменных.           *
;**************************************************
PROC ShowDataString near
        pusha
        push    ES
        mov     AX,DGROUP
        mov     ES,AX
        cld
; Занести координаты строки
        mov     DI,offset OutD_String
        mov     AX,[ScreenString]
        stosb
        mov     AX,[ScreenColumn]
        stosb
; Копировать Data_String в OutD_String
        mov     SI,offset Data_String
        mov     CX,31
        rep     movsb
; Поставить символ-ограничитель
        mov     AL,0
        stosb
        mov     SI,offset OutD_String
        call    ShowString
        pop     ES
        popa
        ret
ENDP ShowDataString
ENDS
