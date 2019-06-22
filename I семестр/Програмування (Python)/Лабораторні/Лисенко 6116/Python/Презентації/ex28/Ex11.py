print("Введіть слово 'stop' для отримання результату")
suma = 0
while True:
    x = input("Введіть число: ")
    if x == "stop":
        break # Вихід з циклу
    try:
        x = int(x)# Перетворюємо рядок на число
    except ValueError:
        print("Необхідно ввести ціле число!")
    else:
        suma += x
print("Cyмa чисел дорівнює:", suma)
