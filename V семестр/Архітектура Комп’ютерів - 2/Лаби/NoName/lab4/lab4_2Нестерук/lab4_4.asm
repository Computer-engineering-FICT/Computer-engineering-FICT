; Підготовлюємо R0.R1 в RB0 i RB1
           Mov    R0, #0
           Mov    R1, #0
           Sel    Rb1
           Mov    R0, #0
           Mov    R1, #0
           Sel    Rb0

; Підготовлюємо прапорець F0 (для збереження знаку результату)
           Clr    F0

; Заносимо вхідні дані
           In     A, P1
           Mov    R2, A
           In     A, P1
           Mov    R3, A

           Sel    Rb1
           In     A, P1
           Mov    R4, A
           In     A, P1
           Mov    R5, A

; Перевіряємо знак R4.R5
           Mov    A, R4
           Jb7    S1
; Число, що міститься у R4.R5 додатнє, зміна знаку не потрібна
           Jmp    Ns1
S1:
           Cpl    F0         ; Змінюємо знак добутку
; Змінюємо знак R4.R5
           Anl    A, #7FH
           Mov    R4, A
Ns1:
; Виконуємо зсув вправо R4.R5
; Старші  два байти
           Clr    C
           Mov    A, R4
           Rrc    A
           Mov    R4, A

           Mov    A, R5
           Rrc    A
           Mov    R5, A
           Sel    Rb0
; Молодші два байти
           Mov    A, R4
           Rrc    A
           Mov    R4, A

           Mov    A, R5
           Rrc    A
           Mov    R5, A

; Перевіряємо знак R2.R3
           Mov    A, R2
           Jb7    S2
; Число, що міститься у R2.R3 додатнє, зміна знаку не потрібна
           Jmp    Main
S2:
           Cpl    F0         ; Змінюємо знак добутку
; Змінюємо знак R2.R3
           Anl    A, #7FH
           Mov    R2, A

; Основний цикл множення
Main:
           Sel    Rb0
; Перевіряємо старший розряд R2 (R2.R3)
           Mov    A, R2
           Jb7    Ad
           Jmp    Shift      ; Якщо R2[7] = 0 то додавання не виконуємо

Ad:
; Виконуємо додавання
; Молодші два байти результату
           Clr    C
           Mov    A, R5
           Add    A, R1
           Mov    R1, A

           Mov    A, R4
           Addc   A, R0
           Mov    R0, A
; Старші два байти результату          
           Sel    Rb1
           Mov    A, R5
           Addc   A, R1
           Mov    R1, A

           Mov    A, R4
           Addc   A, R0
           Mov    R0, A
           Sel    Rb0

; Зсуви
Shift:
; Зсуваємо R4.R5 вправо
; Старші  два байти
           Clr    C
           Sel    Rb1
           Mov    A, R4
           Rrc    A
           Mov    R4, A

           Mov    A, R5
           Rrc    A
           Mov    R5, A
           Sel    Rb0
; Молодші два байти
           Mov    A, R4
           Rrc    A
           Mov    R4, A

           Mov    A, R5
           Rrc    A
           Mov    R5, A

; Зсуваємо R2.R3 вліво
           Clr    C
           Mov    A, R3
           Rlc    A
           Mov    R3, A

           Mov    A, R2
           Rlc    A
           Mov    R2, A

; Перевіряємо R2.R3 = 0
           Clr    A
           Orl    A, R2
           Orl    A, R3
           Jnz    Main
           Jf0    Sign       ; Добуток від'ємний
           Jmp    Endp
Sign:
; Виконуємо зміну знаку результату
; Молодші два байти результату
           Clr    C
           Mov    A, R1
           Cpl    A
           Add    A, #1
           Mov    R1, A

           Mov    A, R0
           Cpl    A
           Addc   A, #0
           Mov    R0, A
; Старші два байти результату
           Sel    Rb1
           Mov    A, R1
           Cpl    A
           Addc   A, #0
           Mov    R1, A

           Mov    A, R0
           Cpl    A
           Addc   A, #0
           Mov    R0, A
           Sel    Rb0
Endp:
; Кінець програми
           Nop