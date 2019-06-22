import re # Підключаємо модуль
p = re.compile(r"[0-9]+", re.S)
if p.search("Cтpoкa245"):
    print("Чиcлo в рядку")
else:
    print("Heмає числа в рядку")
