           In     A, P1
           Mov    R2, A
           In     A, P1
           Mov    R3, A

           In     A, P1
           Mov    R4, A
           In     A, P1
           Mov    R5, A
; Пiдготовлюємо лічильник (R7)
           Mov    R7, #16
; Підготовлюємо R0.R1
           Mov    R0, #0
           Mov    R1, #0
           Clr    F0
; Переводимо R2.R3 з ДК у ПК
           Mov    A, R2
           Jb7    Dk1
; Число, що міститься у R2.R3 додатнє, перетворення не потрібне
           Jmp    Ndk1
Dk1:
           Cpl    F0         ; Запам'ятовуємо знак числа R2.R3
           Cpl    A
           Mov    R2, A
           Mov    A, R3
           Cpl    A
           Clr    C
           Add    A, #1
           Mov    R3, A
           Mov    A, R2
           Addc   A, #0
           Mov    R2, A
Ndk1:
; Переводимо R4.R5 з ДК у ПК
           Mov    A, R4
           Jb7    Dk2
; Число, що міститься у R2.R3 додатнє, перетворення не потрібне
           Jmp    Main
Dk2:
           Cpl    F0         ; Запам'ятовуємо знак числа R2.R3
           Cpl    A
           Mov    R4, A
           Mov    A, R5
           Cpl    A
           Clr    C
           Add    A, #1
           Mov    R5, A
           Mov    A, R4
           Addc   A, #0
           Mov    R4, A
; Основний цикл множення
Main:
; Перевіряємо молодший розряд R3 (R2.R3)
           Mov    A, R3
           Jb0    Ad
           Jmp    Shift      ; Якщо R3[0] = 0 то додавання не виконуємо
Ad:
; Виконуємо додавання
           Clr    C
           Mov    A, R5
           Add    A, R1
           Mov    R1, A
           Mov    A, R4
           Addc   A, R0
           Mov    R0, A
; Виконуємо зсув
Shift:
           Clr    C

           Mov    A, R0
           Rrc    A
           Mov    R0, A

           Mov    A, R1
           Rrc    A
           Mov    R1, A

           Mov    A, R2
           Rrc    A
           Mov    R2, A

           Mov    A, R3
           Rrc    A
           Mov    R3, A
; Декрементуємо і перевіряємо лічильник
           Djnz   R7, Main
           Jf0    Sign
           Jmp    Endp
Sign:
           Clr    C

           Mov    A, R3
           Cpl    A
           Add    A, #1
           Mov    R3, A

           Mov    A, R2
           Cpl    A
           Addc   A, #0
           Mov    R2, A

           Mov    A, R1
           Cpl    A
           Addc   A, #0
           Mov    R1, A

           Mov    A, R0
           Cpl    A
           Addc   A, #0
           Mov    R0, A
Endp:
; Кінець програми
           Nop