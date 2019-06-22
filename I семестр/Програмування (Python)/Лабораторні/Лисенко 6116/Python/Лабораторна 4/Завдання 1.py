from random import randint


def is_int(x):
    if x[0] == "-":
        return x[1:].isdigit()
    else:
        return x.isdigit()

down_num, up_num = input("Введіть мінімальне ціле значення числа у списку: "), input("та максимальне ціле значення: ")
down_len, up_len = input("Введіть мінімальну довжину списку (>1): "), input("та максимальну: ")

if "" not in (down_num, up_num, down_len, up_len):
    if is_int(down_num) and is_int(up_num) and is_int(down_len) and is_int(up_len):
        down_num, up_num, down_len, up_len = int(down_num), int(up_num), int(down_len), int(up_len)
        if up_num >= down_num and up_len >= down_len >= 2:
            a = [randint(down_num, up_num) for i in range(0, randint(down_len, up_len))]
            print("Згенерований список:\n" + str(a))

            average_a = sum(a)/len(a)
            s, n = 0, 0
            for i in range(len(a)):
                if a[i] < average_a:
                    s += a[i]
                    n += 1
            print("{0}: {s:+}{1}: {n:^5}".format("Сума елементів, які менші за середнє значення",
                                                 "\nКількість елементів, які менші за середнє значення", s=s, n=n))

            b = a + [s, n]
            print("Одержаний список:\n" + str(b))

            c = [sum(b)/len(b), average_a]
            print("Третій список, який складається з середніх арифметичних одержаного і початкового списків:\n"+str(c))
        else:
            print("Мінімальне значення не повинне перевищувати максимальне та мінімальна довжина повинна бути більше 1")
    else:
        print("Треба ввести цілі числа")
else:
    print("Ви ввели пустий рядок")
