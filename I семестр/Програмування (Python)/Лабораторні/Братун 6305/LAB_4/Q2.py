import random
while True:
    try:
        m = int(input("Введіть кількість рядків  "))
        n = int(input("Введіть кількість стовбців  "))
        A = []
        maxarg = 25
        print("Не сортована та форматована матриця")

        for i in range(0, m):
            A.append([random.randint(0, maxarg) for i in range(0, n)])

        print(A)

        print("Форматована матриця")

        schetchik = 0
        for i in A:
            for j in i:
                if schetchik == n-1:
                    schetchik = 0
                    print('{0: <4}'.format(str(j)))
                    print(("-"*4*(n-1))*2)
                else:
                    print('{0: <4}'.format(str(j)), end='|  ')
                    schetchik = schetchik + 1

        print("Форматована та сортована матриця")

        for i in A:
            if A.index(i) % 2 == 0:
                A[A.index(i)] = sorted(A[A.index(i)])
            else:
                A[A.index(i)] = sorted(A[A.index(i)], reverse=True)

        schetchik = 0
        for i in A:
            for j in i:
                if schetchik == n-1:
                    schetchik = 0
                    print('{0: <4}'.format(str(j)))
                    print(("-"*4*(n-1))*2)
                else:
                    print('{0: <4}'.format(str(j)), end='|  ')
                    schetchik = schetchik + 1
    except ValueError:
        print("Введіть число")
    print("""Якщо бажаєте продовжити то нажімть"Enter"
якщо хочете закінчити геренування матриць нажміть "q" """)
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break

