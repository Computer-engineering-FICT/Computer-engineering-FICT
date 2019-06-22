import os
try:
    os.mkdir(r"C:\lab7")
except FileExistsError:
    print("Каталог lab7 уже існує")
