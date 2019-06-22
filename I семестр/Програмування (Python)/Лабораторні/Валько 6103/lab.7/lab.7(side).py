import os
import shutil
# import pickle
import shelve
# 1
print("\nСтворення каталогу LAB7")
try:
    os.mkdir("C:\\LAB7")
    print("Каталог стоворено")
except FileExistsError:
    print("Каталог LAB7 існує")

# 2
print("\nСтворення каталогу 'Valko'")
os.chdir("C:\\LAB7")
try:
    os.mkdir("Valko")
    print("Каталог 'Valko' створено")
except FileExistsError:
    print("Каталог 'Valko' існує")

# 3
print("\nПереміщення файлу в каталог")
try:
    shutil.move("D:\\Python.Programs\\Python Labs\\LABS\\lab.7\\v3.txt", "C:\\LAB7\\Valko")
except OSError:
    print("Файл вже переміщенний")

# 4
print("\nСтворення каталогу LAB5 і LAB6")
try:
    os.mkdir("C:\\LAB5")
    os.mkdir("C:\\LAB6")
except OSError:
    print("Каталог LAB5 і LAB6 вже існують\n\n")

# 5
'''
try:
    db = shelve.open("C:\\LAB6\\lab6.txt")
    db["obj1"]=lab6.months
    db.close()
except:
    print("Файл не знайдено")
'''
db = shelve.open("D:\\Python.Programs\\Python Labs\\LABS\\lab.7\\texted.txt")
db["obj1"] = [1, 2]
db["obj2"] = (11, 11)
db["obj5"] = 'hello'
db["obj6"] = 'python'
db.update(obj1=[4, 5, 6])
db.update(obj2=(100, 101, 102, 103))
db.update([("obj5", 5), ("obj6", 6)])
print(db["obj5"], db["obj6"], db["obj1"], db["obj2"])
db.close()
