import shelve,random

names=['Андрійчук', 'Бандурін', 'Бровченко', 'Василенко',\
              'Гаврилюк', 'Ганжа', 'Дем`янчук', 'Жинжер', 'Кисіль', \
              'Кішка', 'Кобилюк', 'Кожевніков', 'Кучеренко', 'Максимчук', \
              'Мельничук', 'Невмержицька', 'Новосаденко', 'Осадчий', 'Пащевський',\
              'Поліщук', 'Потапенко О.', 'Потапенко Д.', 'Снітчук', 'Траєр', 'Фащевський',\
              'Федосов', 'Фельдман', 'Ханін']
val=[random.randint(1,100) for i in range(len(names)-1)]
sex=[random.choice(["M","Ж"]) for i in range(len(names)-1)]
f=shelve.open("C://Lab_6//for_lab_6")
f["names"]=names

print("---------------for_lab_6--------------")
print("{0:^5} : {1}".format("keys","values"))
for i in f.items():
    print("{0} : {1}".format(i[0],i[1]))


f1=shelve.open("C://Lab_6//new_file.txt")
for k,v in f.items():
    f1[k]=v
f1["value"]=val

print()
print("---------------new_file--------------")
print("{0:^5} : {1}".format("keys","values"))
for i in f1.items():
    print("{0:^5} : {1}".format(i[0],i[1]))
print()
print()
print("---------------Добавим данные в файл--------------")
print("---------------------new_file--------------")
f1.update(sex=sex)
print("{0:^5} : {1}".format("keys","values"))

for i in f1.items():
    print("{0:^5} : {1}".format(i[0],i[1]))

print()
print()
print("---------------Удалим данные с файла--------------")
print("---------------------new_file--------------")
f1.popitem()
print("{0:^5} : {1}".format("keys","values"))

for i in f1.items():
    print("{0:^5} : {1}".format(i[0],i[1]))

print("---------------Удалим данные с файла--------------")
print("---------------------new_file--------------")
f1.pop(list(f1.keys())[0])
print("{0:^5} : {1}".format("keys","values"))

for i in f1.items():
    print("{0:^5} : {1}".format(i[0],i[1]))

