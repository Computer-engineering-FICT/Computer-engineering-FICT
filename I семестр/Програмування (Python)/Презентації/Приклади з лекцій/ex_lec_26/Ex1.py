import os.path
#Перевірка існування фалу за шляхом
with open(r"file.txt", "w") as f:
    f.write("мої дані") # Записуємо рядок у файл

print("file.txt:",os.path.exists(r"file.txt"))
print("file2.txt:",os.path.exists(r"file2.txt"))
print("C:\LECTURE26:",os.path.exists(r"C:\LECTURE26"))
print("C:\P_NEW:",os.path.exists(r"C:\P_NEW"))
