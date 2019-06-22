import re
print("Введіть слово 'stop' для отримання результату")
suma = 0
p = re.compile(r"^[-]?[0-9]+$", re.S)
while True:
    x = input("Введіть число: ")
    if x == "stop":
        break  # Виход з циклу
    if not p.search(x):
        print("Heo6xідно ввести число, а не рядок!")
        continue # Переходимо на наступну ітерацію циклу
    x = int(x) # Перетворюємо рядок на число
    suma += x
print("Cyмa чисел дорівнює:", suma)
