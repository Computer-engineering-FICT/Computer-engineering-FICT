import math as m
#Спочатку задаємо змінні на ввід
while True:
    print("Вітаю тебе в програмі для обчислення суми n членів деякої послідовності")
    print("Увага!!! Всі невірно введені символи будуть прирівнюватись 0")
    print("Введіть число яке буде показувати в скільки разів наступний член більший за попередній")
    try:
        pokaznik = float(input())
    except (ValueError, TypeError):
        pokaznik = float(0)
    print("Введіть кількість члевнів постідовності")
    try:
        kilkist = int(input())
    except (ValueError, TypeError):
        kilkist = int(0)
    #заповнимо далі комірки з дійсними числами
    resultB = 1
    resultC = 1
    i = int(1)
            #Використовуємо цикл
    if kilkist > 0:
        while i <= kilkist:
            try:
                    resultB = resultB+pokaznik**i
            except (OverflowError):
                print('Занадто велика послідовність, дуже тяжко порахувати')
                break
            CheckPar = m.fmod(i,2)
            if CheckPar != 0:
                try:
                    resultC = resultC-pokaznik**i
                except (OverflowError):
                    print('Занадто велика послідовність, дуже тяжко порахувати')
            else:
                try:
                    resultC = resultC+pokaznik**i
                except (OverflowError):
                    print('Занадто велика послідовність, дуже тяжко порахувати')
            i += 1
    else:
        print('Ви ввели неправильне число N')
    print("B = %.2f" % resultB)
    print("C = %.2f" % resultC)
    print("Я хочу більше послідовнеостей!!!!!")
    print("Якщо хочете продовжити рахувати нажмыть Enter , якщо хочете закінчить введіть q")
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break


