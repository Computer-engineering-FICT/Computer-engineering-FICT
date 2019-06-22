import re # Підключаємо модуль
p = re.compile(r"^[0-9]+", re.S)
if p.search("Рядок245"):
    print("Є число на початку рядка")
else:
    print("Hемає числа на початку рядка")
