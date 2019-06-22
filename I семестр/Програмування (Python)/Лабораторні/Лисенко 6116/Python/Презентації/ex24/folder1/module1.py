import os, sys
def get_cwd():
  print("%-25s%s" % ("Файл:", os.path.abspath(__file__ )))
  print("%-25s%s" % ("Поточний робочий каталог:", os.getcwd()))
  print("%-25s%s" % ("Каталог для импорту:", sys.path[0]))
  print ("%-25s%s" % ("Шлях до файлу:", os.path.abspath("file.txt")))

