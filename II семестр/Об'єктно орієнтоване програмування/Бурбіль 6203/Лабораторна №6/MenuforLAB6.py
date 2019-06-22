from OOP.Lab6 import *
while True:
    try:
        c = int(input("1 -> Увімкнути прилад\n"
                      "2 -> Підрахувати потужність\n"
                      "3 -> Сортування за потужністю\n"
                      "4 -> Задати електромагнітний діапазон\n"
                      "5 -> Вивід приладів\n"
                      "0 -> Вихід"))
        if c == 1:
            c = int(input("1 -> Мікрохвильовка\n"
                          "2 -> Пральна машина\n"
                          "3 -> Холодильник\n"
                          "4 -> ПК\n"))
            if c == 1:
                price = int(input("Ціна: "))
                power = int(input("Потужність: "))
                rad = int(input("Випромінювання: "))
                m = Microwave(price, power, rad)
                l .append(m)
            elif c == 2:
                price = int(input("Ціна: "))
                power = int(input("Потужність: "))
                rad = int(input("Випромінювання: "))
                m = Washer(price, power, rad)
                l .append(m)
            elif c == 3:
                price = int(input("Ціна: "))
                power = int(input("Потужність: "))
                rad = int(input("Випромінювання: "))
                m = Fridge(price, power, rad)
                l .append(m)
            elif c == 4:
                price = int(input("Ціна: "))
                power = int(input("Потужність: "))
                rad = int(input("Випромінювання: "))
                m = PC(price, power, rad)
                l .append(m)
            else:
                print("Ви вибрали неправильний номер!")
        elif c == 2:
            print(get_power(l))
        elif c == 3:
            l.sort(key=comparator("power"))
            for i in l:
                print(i)
        elif c == 4:
            start = int(input("Початок діапазону: "))
            end = int(input("Кінець діапазону: "))
            for i in find_by_length(l, start, end):
                print(i)
        elif c == 0:
            break
    except ValueError:
        print("Введіть коректний номер!")
