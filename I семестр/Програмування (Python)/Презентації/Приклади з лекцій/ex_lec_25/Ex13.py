f = open (r"file.txt", "w", encoding="cp1251")
f.write("Рядок1\nРядок2")
f.close()
# Зчитуємо з файлу
f = open (r"file.txt", "r+", encoding="cp1251")
print(f.read())
f.truncate(5)
f .close ()

print("Після урізання отримали")
with open(r"file.txt", "r", encoding="cp1251") as f:
   print(f. read ())
