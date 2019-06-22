import os
# chdir() робить зазначений каталог поточним
print("Змінили робочий каталог")
os.chdir("C:\\LECTURE27\\folder1\\")
print(os.getcwd()) # Поточний робочий каталог
print("Повернули робочий каталог")
os.chdir("C:\\LECTURE27\\")
print(os.getcwd()) # Поточний робочий каталог
