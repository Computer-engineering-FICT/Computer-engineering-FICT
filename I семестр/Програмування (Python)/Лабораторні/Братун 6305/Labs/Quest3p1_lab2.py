while True:
    print("Вітаю тебе в програмі для обчислення суми n членів геометричної прогресії перший член якої = 1")
    print("Увага!!! Всі невірно введені символи будуть прирівнюватись 0")
    print("Введіть знаменник геометричної прогресії")
    try:
        znam = float(input())
    except (ValueError, TypeError):
        znam = float(0)
    print("Введіть кількість члевнів прогресії")
    try:
        kilkist = int(input())
    except (ValueError, TypeError):
        kilkist = int(0)
    if kilkist < 0:
        print("Кількість членів може бути від*ємною?, я такого не знав")
    elif kilkist == 0:
        print("При знаменику рівному нулю відповідь буде рівна першому члену тобто 1")
    else:
        try:
            doo1 = ((1-znam**kilkist)/(1-znam))*znam+1
        except (OverflowError):
            print("Занадто велика послідовність, дуже тяжко порахувати")
            break
        print("Відповідь: %.2f" % doo1)
        print("Ну може ще одненьку прогресію?")
        print("Якщо хочете продовжити рахувати нажмыть Enter , якщо хочете закінчить введіть q")
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
