import random
# from tkinter import *
names=['Андрійчук', 'Бандурін', 'Бровченко', 'Василенко',\
              'Гаврилюк', 'Ганжа', 'Дем`янчук', 'Жинжер', 'Кисіль', \
              'Кішка', 'Кобилюк', 'Кожевніков', 'Кучеренко', 'Максимчук', \
              'Мельничук', 'Невмержицька', 'Новосаденко', 'Осадчий', 'Пащевський',\
              'Поліщук', 'Потапенко О.', 'Потапенко Д.', 'Снітчук', 'Траєр', 'Фащевський',\
              'Федосов', 'Фельдман', 'Ханін']
def val(x=None):
    v=[]
    if x==None:
        for i in range(len(names)):
            v.append(random.randint(0,100))
    else:
        v=x
    return v

values=val()
people=[]
partisipants={}

class competition:
    def up(self,name,sex=0,bals=1,doping=2,weight=3):
        k,*v=name,sex,bals,doping,weight
        partisipants[k]=v


    def __init__(self,name,sex=None,bals=1,doping=None,weight=None):
        self.name=name
        people.append(name)
        values.append(bals)

        if sex==None:
            if name=="Кішка"or name=="Бровченко"or name=="Невмержицька":
                sex="Ж"
            else:
                sex="М"

        if bals==1:
            bals=random.randint(1,100)

        if doping==None:
            if random.randint(0,2)==1:
                doping="+"
            else:
                doping="-"

        if weight==None:
            if sex=="М":
                if random.randint(0,2)==0:
                    weight="до 50кг"
                elif random.randint(0,2)==1:
                    weight="50-70кг"
                else:
                    weight="более 70кг"
            else:
                weight="до 50кг"

        self.up(name,sex,bals,doping,weight)


    def data(self):


        print("{0:<20}  {1:<3}  {2:<4}  {3:<6}  {4:<2}".format('Фамилия',"Пол","Балл","Допинг","Весовая категория"))
        for i in sorted(partisipants.keys()):
            print("{0:<20}   {1:^3}  {2:<4}  {3:^6}  {4:<2}".format(i,partisipants[i][0],partisipants[i][1],partisipants[i][2],partisipants[i][3]))
    @p    # return for i in sorted(partisipants.keys()):print("{0:<20}   {1:^3}  {2:<4}  {3:^6}  {4:<2}".format(i,partisipants[i][0],partisipants[i][1],partisipants[i][2],partisipants[i][3]))
    def p(f):
            def r(x):
                print("{0:<20}  {1:<3}  {2:<10}".format('Фамилия',"Балл","Весовая категория"))
                f(x)
            return r

    def pr(x):
            b=list(reversed(sorted(list(x.items()),key=lambda s=x.items: s[1][0])))
            for (k,v) in b:
                print("{0:<20}  {1:<4}  {2}".format(k,v[0],v[1]))
    def rezult(self):
        boy={k:v[1:2]+v[3:] for (k,v)in partisipants.items() if v[2]=="-"if v[0]=="М"}
        girl={k:v[1:2]+v[3:] for (k,v)in partisipants.items() if v[2]=="-"if v[0]=="Ж"}
        b0={k:v for (k,v)in boy.items() if v[1]=="до 50кг"}
        b1={k:v for (k,v)in boy.items() if v[1]=="50-70кг"}
        b2={k:v for (k,v)in boy.items() if v[1]=="более 70кг"}

        g0={k:v for (k,v)in girl.items() if v[1]=="до 50кг"}
        g1={k:v for (k,v)in girl.items() if v[1]=="50-70кг"}
        g2={k:v for (k,v)in girl.items() if v[1]=="более 70кг"}



            # for (k,v) in x.items():
            #     print("{0:<20}  {1}  {2}".format(k,v[0],v[1]))
        print("Победители среди парней")
        pr(b0)
        print()
        pr(b1)
        print()
        pr(b2)
        print()
        print("Победители среди девушек")
        pr(g0)

for i in zip(names):
    # print(i)
    p=competition(name=i[0])
# print("asdf",p.data(),1)
p.data()
print()
p.rezult()

while 1:
    people=input("Введите 1 для вывода таблицы участников"
                 "Введите 2 для вывода таблицы результатов")
    if people=="0":
        break
    if people in participants:
        print(people, " принимал участие в тесте")
    else:
        print(people, " не принимал участие в тесте")

# from tkinter import *
# class tkiner(competition):
#
#
#     root = Tk()
#
#     lab1=Label(root)
#
#     root.title("Competition")
#
#
#     text1=Text(root,width=40)
#     text1.config(cnf=None)
#     text1.insert(END,"asdf")
#     lab1.pack()
#     text1.pack()
#     root.mainloop()
