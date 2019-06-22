import os, sys
print("%-25s%s" % ("Файл:", os.path.abspath(__file__)))
print("%-25s%s" % ("Поточний робочий каталог:", os.getcwd()))
print("%-25s%s" % ("Каталог для завантаження:", sys.path[0]))
print("%-25s%s" % ("Шлях до файлу:", os.path.abspath("file.txt")))
print("-" * 40)
import Презентації.ex24.folder1.module1 as m
m.get_cwd()
