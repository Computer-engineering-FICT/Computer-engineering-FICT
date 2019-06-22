#Текстовый режим
f = open (r"file.txt", "w", encoding="cp1251")
f.write("Рядок1\nРядок2")
f.close()
f = open (r"file.txt", "r", encoding="cp1251")
print(f.readlines())

# Бинарный режим
with open (r"file.txt", "rb") as f:
    print(f.readlines())
