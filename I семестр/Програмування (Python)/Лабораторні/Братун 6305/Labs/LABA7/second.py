import os
os.chdir(r"C:\lab7")
try:
    os.mkdir("Bratun")
    print("Каталог створено")
except FileExistsError:
    print("Каталог уже існує")
