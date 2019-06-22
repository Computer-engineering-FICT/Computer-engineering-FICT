import os.path
# файл, що відкриваємо, на рівень вище

s = os.path.abspath(r" ..\file.txt")
print(s)
# файл, що відкриваємо, на 2 рівня вище

m=os.path.abspath(r" ....\file.txt")
print(m)
