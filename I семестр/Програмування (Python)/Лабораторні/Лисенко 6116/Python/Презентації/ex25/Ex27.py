import os # Подключаем модуль
#Створення та видалення файлів
f = open(r"file2.txt", "w")
print(f.write("Рядок1\nРядок2"))
f.close()
f = open(r"file4.txt", "w")
print(f.write("Рядок1\nРядок2"))
f.close()

os.remove(r"file2.txt") #Видалення файла

os.unlink(r"file4.txt")


