from decimal import Decimal


def is_num(a):
    c = a.split(".")
    if (len(c) == 2 and not (c[0].isdecimal() and c[1].isdecimal())) or (len(c) == 1 and not c[0].isdecimal()):
        return False

print("Введіть слово 'stop' для отримання результату")
s = 0
while True:
    x = input("Введіть число: ")
    if x.lower() == "stop":
        break
    if x == "":
        print("Ви не ввели значення!")
        continue
    if x[0] == "-":
        if is_num(x[1:]):
            print("Необхідно ввести число, а не рядок!")
            continue
    else:
        if is_num(x):
            print("Необхідно ввести число, а не рядок!")
            continue
    х = Decimal(x)
    s += х
print("Сума чисел дорівнює:", s)
