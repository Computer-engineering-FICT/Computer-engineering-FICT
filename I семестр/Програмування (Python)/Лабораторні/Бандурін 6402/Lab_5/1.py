import random,pickle
# participants=['Андрійчук', 'Бандурін', 'Бровченко', 'Василенко',\
#               'Гаврилюк', 'Ганжа', 'Дем`янчук', 'Жинжер', 'Кисіль', \
#               'Кішка', 'Кобилюк', 'Кожевніков', 'Кучеренко', 'Максимчук', \
#               'Мельничук', 'Невмержицька', 'Новосаденко', 'Осадчий', 'Пащевський',\
#               'Поліщук', 'Потапенко О.', 'Потапенко Д.', 'Снітчук', 'Траєр', 'Фащевський',\
#               'Федосов', 'Фельдман', 'Ханін']
f=open("C://Lab_5//for_lab_5.txt","rb")
participants=pickle.load(f)
values=[]
for i in range(len(participants)):
    values.append(random.randint(0,100))
rezult={k:v for (k,v) in zip(participants,values)}

for i in sorted(rezult.keys()):
    print("{0:<20}  {1}".format(i,rezult[i]))
p={k:v for (k,v) in rezult.items() if v in list(reversed(sorted(rezult.values())))[0:3]}
print()
print("Победители: ")

b=list(reversed(sorted(list(p.items()),key=lambda s=p.items: s[1])))
for i in b:
    print("             {0:<20}  {1}".format(i[0],i[1]))
print("Если хотите проверить принимал ли студент участие в тесте, введите фамилию студента.\n "
      "Для выхода введите 0")
while 1:
    people=input()
    if people=="0":
        break
    if people in participants:
        print(people, " принимал участие в тесте")
    else:
        print(people, " не принимал участие в тесте")
