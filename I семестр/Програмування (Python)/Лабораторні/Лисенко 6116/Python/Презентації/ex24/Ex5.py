import os.path
# файл, що відкриваємо, в C:\ PYTHON \folder1\

s = os.path.abspath(r"\ PYTHON \folder1\file.txt")
print(s)

#файл, що відкриваємо,в  C:\ PYTHON \folder1\folder2\
m = os.path.abspath(r"\PYTHON\folder1\folder2\file.txt")
print(m)
