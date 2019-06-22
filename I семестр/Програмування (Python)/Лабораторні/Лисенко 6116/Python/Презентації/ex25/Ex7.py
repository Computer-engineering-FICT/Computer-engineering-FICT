# Текстовий режим
f = open(r"file.txt", "r", encoding="cp1251")
print(f.readline(),f.readline())
print(f.readline())
print(f.readline())
f.close()

# Бінарний режим
f = open(r"file.txt", "rb")
print(f.readline(),f.readline())
print(f.readline())
print(f. readline ()) # Досягнутий кінець файлу
f.close()
