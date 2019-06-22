import os.path
if  os.path.isfile(r"C:\LECTURE27\file.txt"):
    print(r"C:\LECTURE27\file.txt- це файл")
if not os.path.isfile("C:\\LECTURE27\\"):
    print(r"C:\LECTURE27\- це каталог")
