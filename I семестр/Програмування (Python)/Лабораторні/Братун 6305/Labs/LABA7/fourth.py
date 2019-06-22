import os
try:
    os.mkdir('C:/lab5/')
    print("Каталог створено")
except FileExistsError:
    print("Каталог уже існує")
