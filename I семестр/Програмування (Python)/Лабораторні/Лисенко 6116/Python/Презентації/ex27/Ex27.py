import shutil
#Два способи видалення каталогу
try:
 s = "C:\\LECTURE27\\folder1\\"
 #Обрбка помилок False за замовчуванням
 shutil.rmtree(s)
except FileNotFoundError:
    print("Каталог ",s,"не знайдено")

#Обрбка помилок True
s = "C:\\LECTURE27\\folder1\\"
shutil.rmtree(s, True)
