import random
while True:
    try:
        q = int(input('Введіть довжину списку №1: '))
        w = int(input('Введіть довжину списку №2: '))
        maxarg = 18
        x = [random.randint(0, maxarg) for i in range(0, q)]
        y = [random.randint(0, maxarg) for i in range(0, w)]
        print("X: {0}".format(x))
        print("Y: {0}".format(y))

        s = []
        for item in x:
            if item in y:
                s.append(item)

        s.append(len(s))
        print("S: {0}".format(s))
    except ValueError:
        print("Введіть число")
    print("""Якщо бажаєте продовжити то нажімть"Enter"
якщо хочете закінчити геренування матриць нажміть "q" """)
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
