import os
print("C:\\PYTHON\\file.txt")  # Правильно
print(r"C:\PYTHON\file.txt")  # Правильно
print("C:\PYTHON\file.txt")  # Неправильно! ! !
print(os.path.abspath("C:/LECTURE26/file.txt"))


