import os
try:
    os.mkdir("newfolder") # Створення каталогу
    os.mkdir("newfolder\\subfolder")
    print("Каталог створено")
except FileExistsError:
    print("Каталог уже існує")
