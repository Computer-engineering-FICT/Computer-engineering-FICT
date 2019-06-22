# Текстовий режим
f = open(r"file.txt", "w", encoding="cp1251")
f.write("Рядок1\nрядок2") # Записуємо рядок у файл
f.close()


# Текстовий режим
with open(r"file.txt","r", encoding="cp1251") as f:
    p = f.read()
print("Текст:\n",p)
# Бінарний режим
with open(r"file.txt", "rb") as f:
    codes = f.read()
print("Код:\n ",codes)
