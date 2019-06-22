import os.path
#Визначення розміру файлу в байтах
print(os.path.getsize(r"file.txt")) #Файл існує
try:
    os. path. getsize( r"file3.txt")
except FileNotFoundError:
    print("Не вдається знайти зазначений файл: file3.txt")
