import os
try:
    os.makedirs(r"C:\lab7\Andriuchuk")
except FileExistsError:
    print("Каталог Andriuchuk уже існує")
