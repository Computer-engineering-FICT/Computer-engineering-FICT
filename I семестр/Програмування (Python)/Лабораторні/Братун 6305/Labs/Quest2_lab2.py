print("Вітаю в програмі для обчислення квадратів додатних чисел")
while True:
    print("Увага!!! Всі невірно введені символи будуть прирівнюватись 0")
    print("Введіть перше число")
    try:
        a = float(input())
    except (ValueError, TypeError):
        a = float(0)
    print("Введіть друге число")
    try:
        b = float(input())
    except (ValueError, TypeError):
        b = float(0)
    print("Введіть третє число")
    try:
        c = float(input())
    except (ValueError, TypeError):
        c = float(0)
    if a >= 0:
        aq = a*a
        print("Квадрат першого числа: %.2f" % aq)
    else:
        print("Число %2.f" % a , "від'ємне")
    if b >= 0:
        bq = b*b
        print("Квадрат другого числа: %.2f" % bq)
    else:
        print("Число %2.f" % b , "від'ємне")
    if c >= 0:
        cq = c*c
        print("Квадррат третього числа: %.2f" % cq)
    else:
        print("Число %2.f" % c , "від'ємне")
    print("Нумооо, я хочу більше рахувати!!!!!!")
    print("Якщо хочете продовжити рахувати нажмыть Enter , якщо хочете закінчить введіть q")
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
