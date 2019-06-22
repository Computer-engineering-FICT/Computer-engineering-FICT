import os
# rmdir видаляє пусті існуючі каталоги
try:
    os.rmdir("newfolder\\subfolder") # Видалення каталогу
    print("Спочатку видалили пустий каталог newfolder\\subfolder")
    os.rmdir("newfolder") # Видалення каталогу
    print("Тепер видалили пустий каталог newfolder")
except OSError:
    print("Каталог не існує або він не пустий ")
