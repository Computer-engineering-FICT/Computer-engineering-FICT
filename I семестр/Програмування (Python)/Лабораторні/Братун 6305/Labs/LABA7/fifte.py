import os
try:
    os.makedirs('C:/lab6')
    print("Каталог створено")
except FileExistsError:
    print("Каталог уже існує")
