import os.path
# файл, що відкриваємо, C:\LECTURE24\folder1\

s=os.path.abspath(r"folderl\file.txt")
print(s)

 # файл, що відкриваємо,в C:\LECTURE24\folder1\folder2\

m =os.path.abspath(r"folder1\folder2\file.txt")
print(m)
