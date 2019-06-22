with open(r"file.txt", "w", encoding="cp1251") as f:
    f.write("String1\nString2")
f = open(r"file.txt", "r", encoding="cp1251")
print("Поточна позиція:",f.tell()) # Покажчик на початку файлу
print(f.readline()) # Перемещуємо покажчик
print("Поточна позиція:",f.tell()) # Повертає 9 (8 + '\r'), а не 8 '•'
f.close()
