f = open(r"file.txt", "rb")
print(f.readline()) # Переміщуємо покажчик
print("Поточна позиція:",f.tell())
f.close()
