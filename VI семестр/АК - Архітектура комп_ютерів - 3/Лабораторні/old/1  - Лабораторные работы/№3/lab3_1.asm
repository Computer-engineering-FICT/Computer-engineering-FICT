$MOD51
  mov @21h, #00000110B 
  mov @22h, #01011011B
  mov @23h, #01001111B
  mov @24h, #01100110B
  mov @25h, #01101101B
  mov @26h, #01111101B
  mov @27h, #00000111B
  mov @28h, #01111111B
  mov @29h, #01101111B

  mov R6, #11h
  mov R5, #22h
  mov R0, #33h

;Перевод чисел в двоично десятичный вид
  mov A, R6
  acall trans
  mov R6, A

  mov A, R5
  acall trans
  mov R5, A

  mov A, R0
  acall trans
  mov R0, A

inf: 
  mov A, #11110000b ; разрешаем отображение
  mov DPTR, #0A004h ; настроечный байт экрана (левые 2 цифры) 
  movx @DPTR, A     ; установка разрешения отображения 

  mov A, R0         ; число которое выводим
  mov DPTR, #0A000h ; адрес 2 левых цифр индикатора
  movx @DPTR, A     ; вывод числа

  ;Вывод на динамический индикатор R6
  mov A, R6 
  mov R1, A
  mov R2, #1
  acall dinam
  acall delay       ; задержка

  mov A, R6
  swap A
  mov R2, #0
  acall dinam
  acall delay       ; задержка

  ;Вывод на динамический индикатор R5
  mov A, R5 
  mov R1, A
  mov R2, #3
  acall dinam
  acall delay       ; задержка

  mov A, R5 
  swap A
  mov R2, #2
  acall dinam
  acall delay       ; задержка
ljmp inf

delay: 
  mov R2,#0FFh
  loop1: 
    djnz R2, loop1
ret

trans:
  mov B, #10
  div ab
  clr c
  rlc a
  clr c
  rlc a
  clr c
  rlc a
  clr c
  rlc a
  orl a, b
ret

dinam:     ;отображает младшие 4 разряда R1, как десятичную цифру на позиции R2
  mov A, R2
  mov DPTR, #08002h
  movx @DPTR, A        ;на какую позицию выводим

  ;Получение битовой маски для цифры (какие сегменты зажигаем)
  mov A, #0h
  orl A, R1
  anl A, #00001111B    
  add A, #20h          ;получаем адрес кода цифры
  mov R1, A
  mov A, @R1           ;получаем код цифры
  mov DPTR, #08001h
  movx @DPTR, A        ;установить значение цифры

  mov A, 0             ;гасим цифру
  movx @DPTR,A
ret

end