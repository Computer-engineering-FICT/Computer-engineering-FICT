import os
try:
    os.mkdir("C:\lab7")
    print("Каталог створено")
except FileExistsError:
    print("Каталог уже існує")
