print("Введіть слово 'stop' для одержання результату")
s = 0
while True:
    x = input("Введіть число: ")
    if x == "stop":
        break # Вихід із циклу
    y = int(x) # Перетворимо рядок у число
    s += y
print("Cyмa чисел дорівнює:", s)
