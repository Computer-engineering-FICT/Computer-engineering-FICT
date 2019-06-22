import os, sys
# Робимо каталог з файлом, що виконується, поточним
print(os.path.abspath(__file__))
os.chdir(os.path.dirname (os.path.abspath(__file__)))
print("%-25s%s" % ("Файл:", __file__ ) )
print("%-25s%s" % ("Поточний робочий каталог:", os.getcwd()))
print("%-25s%s" % ("Каталог для завантаження:", sys.path[0]))
print("%-25s%s" % ("Шлях до файлу:", os.path.abspath("file.txt")))
