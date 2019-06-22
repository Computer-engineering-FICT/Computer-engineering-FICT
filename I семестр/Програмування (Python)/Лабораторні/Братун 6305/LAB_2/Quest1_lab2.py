import math as m
while True:
    print("Вітаю вас в програмі для обрахування виразу")
    print("Увага!!! Всі невірно введені символи будуть прирівнюватись 0")
    print("Введіть будь ласка число x")
    try:
        x = float(input())
    except (ValueError, TypeError):
        x = float(0)
    print("Введіть будь ласка число y")
    try:
        y = float(input())
    except (ValueError, TypeError):
        y = float(0)
    print("Введіть будь ласка число z")
    try:
        z = float(input())
    except (ValueError, TypeError):
        z = float(0)
    doo1 = 7.8*x**2+3.52*y
    odz = x+2*z

    try:

        if odz <= 0:
            print("число логарифма має бути більшим від нуля")
        elif m.log(x+2*z, m.e)+m.e**y == 0:
            print("В школі казали на нуль ділити не можна")
        else:
            a = doo1/(m.log(x+2*z , m.e)+m.e**y)
            print("Відповідь: %.2f" % a)

    except (OverflowError):
        print ("Занадто великі числа")

    print("Давай рахувати ще!!!!!!!")
    print("Якщо хочете продовжити рахувати нажмыть Enter , якщо хочете закінчить введіть q")
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
