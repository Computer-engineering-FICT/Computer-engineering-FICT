import random
while True:
    try:
        m = int(input("Enter rows quantity (m): "))-1
        n = int(input("Enter columns quantity (n): "))
        A = []
        maxValue = 20

        # Get random two-dimensional array
        for i in range(0, m+1):
            A.append([random.randint(-maxValue, maxValue) for i in range(0, n)])


        # Printing not formatted and unsorted array
        print("Unsorted and not formatted matrix")
        print(A)


        def print_matrix(A):
            """Function which can to print matrix with formatting"""
            counter = 0
            for i in A:
                for j in i:
                    if counter == n-1:
                        counter = 0
                        print('{0: <4}'.format(str(j)))
                        print(("-"*4*(n-1))*2)  # just for fun)
                    else:
                        print('{0: <4}'.format(str(j)), end='|  ')
                        counter += 1

        print("Unsorted matrix")
        print_matrix(A)

        for i in A:
            if A.index(i) % 2 == 1:  # even pseudo
                A[A.index(i)] = sorted(A[A.index(i)], reverse=True)
            else:  # odd pseudo
                A[A.index(i)] = sorted(A[A.index(i)], reverse=False)


        print("Sorted matrix ")
        print_matrix(A)
    except ValueError:
        print("Введіть число")
    print("""Якщо бажаєте продовжити то нажімть"Enter"
якщо хочете закінчити геренування матриць нажміть "q" """)
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
