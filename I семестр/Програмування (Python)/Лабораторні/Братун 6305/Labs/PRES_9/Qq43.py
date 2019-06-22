print("Введіть слово 'stop' для отримання результату")
suma = 0
while True:
    x = input("Введіть число: ")
    if x == "stop":
        break
    if x == "":
        print("Ви не ввели значення!")
        continue
    if x[0] == "-":
        if not x[1:].isdigit():
            print("Необхідно ввести число, а не рядок!")
        continue
    else:
        if not x.isdigit():
            print("Необхідно ввести число, а не рядок!")
        continue
    х = int(x)
    suma += х
print("Cyмa чисел дорівнює:", suma)
