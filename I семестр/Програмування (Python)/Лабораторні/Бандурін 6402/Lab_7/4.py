import pickle,shutil,random
participants=['Андрійчук', 'Бандурін', 'Бровченко', 'Василенко',\
              'Гаврилюк', 'Ганжа', 'Дем`янчук', 'Жинжер', 'Кисіль', \
              'Кішка', 'Кобилюк', 'Кожевніков', 'Кучеренко', 'Максимчук', \
              'Мельничук', 'Невмержицька', 'Новосаденко', 'Осадчий', 'Пащевський',\
              'Поліщук', 'Потапенко О.', 'Потапенко Д.', 'Снітчук', 'Траєр', 'Фащевський',\
              'Федосов', 'Фельдман', 'Ханін']

# def open(file):

v=[random.randint(1,100) for i in range(len(participants)-1)]
f=open("for_lab_5.txt","wb")
pickle.dump(participants,f)
f.close()
f=open("for_lab_5.txt","rb")
print("---------------for_lab_6--------------")

print(pickle.load(f))
f.close()
shutil.move("for_lab_5.txt","C://Lab_5//for_lab_5.txt")

shutil.copy("C://Lab_5//for_lab_5.txt","C://Lab_5//file1.txt")
with open("C://Lab_5//file1.txt","rb+") as w:
    p=pickle.load(w)
    p.pop(random.randint(1,len(p)-1))
    # print(p)

w = open("C://Lab_5//file1.txt", "wb")
pickle.dump(p, w)
pickle.dump(v, w)
w.close()


w=open("C://Lab_5//file1.txt","rb")
a=pickle.load(w)
b=pickle.load(w)



print()
print("---------------file1--------------")
print(a)
print(b)
