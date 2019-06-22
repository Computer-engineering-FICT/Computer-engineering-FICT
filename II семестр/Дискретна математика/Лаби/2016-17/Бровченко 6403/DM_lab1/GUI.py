from tkinter import *
import random, pickle, time
import Brovchenko_projects.second_sem.DM_lab1.sproshchenyy_algorytm as spr_alg
import Brovchenko_projects.second_sem.DM_lab1.zadanyy_algorytm as zad_alg
import Brovchenko_projects.second_sem.DM_lab1.sym_rznytsya as sym_rizn


def variant(g, n):
    return (n+g % 60) % 30+1


def student():
    slave = Toplevel(root)
    slave.grab_set()
    slave.focus_set()
    slave.minsize(200, 80)
    slave.maxsize(200, 80)
    Label(slave, text='Бровченко Анастасія\n'
                      'група ІО-64\n'
                      'варіант {}'.format(variant(64, 3)),
          justify=LEFT, font="Arial 14").pack(fill='both')


def from_string_to_set(x):
    x = x.replace(',', ' ')
    x = x.replace(';', ' ')
    x = x.replace(':', ' ')
    x = x.replace('.', ' ')
    x = list(x.split(' '))
    for i in range(x.count('')):
        x.remove('')
    x = {int(i) for i in x}
    return x


def gener_vyp_set(l):
    if entU_do.get()=='': do=0
    else: do = int(entU_do.get())

    if entU_vid.get()=='': vid=0
    else: vid = int(entU_vid.get())

    s = set()
    for i in range(l):
        s.add(random.randint(vid, do))

    while len(s) < l:
        s.add(random.randint(vid, do))
    return s


def generABC():
    global A, B, C, U

    v = var.get()
    if v == 0:
        if entA.get()=='': A = set()
        else: A = from_string_to_set(entA.get())

        if entB.get()=='': B = set()
        else: B = from_string_to_set(entB.get())

        if entC.get()=='': C = set()
        else: C = from_string_to_set(entC.get())
    if v == 1:
        if lenA.get()=='': A = set()
        else: A = gener_vyp_set(int(lenA.get()))

        if lenB.get()=='': B = set()
        else: B = gener_vyp_set(int(lenB.get()))

        if lenC.get()=='': C = set()
        else: C = gener_vyp_set(int(lenC.get()))

    if entU_do.get()=='': do=0
    else: do = int(entU_do.get())+1

    if entU_vid.get()=='': vid=0
    else: vid = int(entU_vid.get())

    U = set(range(vid, do))
    label_vyvid.configure(text='A = {}\n'
                          'B = {}\n'
                          'C = {}\n'
                          'U = {}'.format(A, B, C, U))


def vruchnu():
    global A, B, C
    entA['state']=NORMAL
    entB['state']=NORMAL
    entC['state']=NORMAL
    lenA['state']=DISABLED
    lenB['state']=DISABLED
    lenC['state']=DISABLED


def vypadkovo():
    global A, B, C
    entA['state']=DISABLED
    entB['state']=DISABLED
    entC['state']=DISABLED
    lenA['state']=NORMAL
    lenB['state']=NORMAL
    lenC['state']=NORMAL


def save_to_file(x):
    f = open('Результат.txt', 'ab')
    pickle.dump(x, f)
    f.close()


def window2():
    slave = Toplevel(root)
    slave.title('Обчислення заданого виразу')
    slave.grab_set()
    slave.focus_set()

    def show():
        lf = LabelFrame(slave, text="Розв'язок", font='Arial 12')
        lf.grid(column=0, row=5, columnspan=4)
        Label(lf, text='\nnotA = {nA}\n'
                       'notB = {nB}\n\n'
                       '1) (A & notB) = {f1}\n'
                       '2) (B & notA) = {f2}\n'
                       '3) (C | B) = {f3}\n'
                       '4) (A & notB) | (B & notA)  = {f4}\n'
                       '5) (A & notB) | (B & notA) & (C | B) = {f5}\n'
                       '6) (A & notB) | (B & notA) & (C | B) & C = {rez}\n\n'
                       'Відповідь: {rez}'
              .format(nA=zad_alg.notX(A,U), nB=zad_alg.notX(B,U), f1=A&zad_alg.notX(B,U),
                      f2=B&zad_alg.notX(A,U),f3=C|B ,f4=(A&zad_alg.notX(B,U))|(B&zad_alg.notX(A,U)),
                      f5=(A&zad_alg.notX(B,U))|(B&zad_alg.notX(A,U))&(C | B), rez=zad_alg.vyraz(A,B,C,U)),
              font='Arial 14', justify=LEFT).grid(column=0, row=5, sticky=W, columnspan=4)

    def but_disable(event):
        but['text'] = 'Збережено'
        but['state'] = DISABLED

    Label(slave, text='A = {}\n'
                      'B = {}\n'
                      'C = {}\n'.format(A, B, C),
          font="Arial 14", justify=LEFT).grid(column=0, row=1, sticky=W, columnspan=3)
    Label(slave, text='Заданий вираз:\n'
                      'D = (A & notB) | (B & notA) & (C | B) & C = {}\n'.format(zad_alg.vyraz(A,B,C,U)),
          font='Arial 14 bold')\
        .grid(column=0, row=0, sticky=W, columnspan=2)
    Button(slave, text="Показати розв'язок", font="Arial 12",
           command=show).grid(column=0, row=3)

    s = save_to_file(zad_alg.vyraz(A,B,C,U))
    but = Button(slave, text='Зберегти в файл', font='Arial 12', command=s)
    but.grid(column=1, row=3)
    but.bind("<Button-1>", but_disable)


def window3():
    slave = Toplevel(root)
    slave.title('Обчислення спрощеного вразу')
    slave.grab_set()
    slave.focus_set()

    def show():
        lf = LabelFrame(slave, text="Розв'язок", font='Arial 12')
        lf.grid(column=0, row=5, sticky=W, columnspan=4)
        Label(lf, text='1) A^B = {f1}\n'
                       '2) (A^B)&C = {rez}\n\n'
                       'Відповідь: {rez}'.format(f1=A^B, rez=spr_alg.spr_vyraz(A,B,C)),
              font='Arial 14', justify=LEFT).grid(column=0, row=5, sticky=W, columnspan=4)

    def but_disable(event):
        but['text'] = 'Збережено'
        but['state'] = DISABLED

    Label(slave, text='A = {}\n'
                      'B = {}\n'
                      'C = {}'.format(A, B, C),
          font="Arial 14", justify=LEFT).grid(column=0, row=1, sticky=W, columnspan=3)
    Label(slave, text='Спрощений вираз:\n'
                      'D = (A^B)&C = {}'.format(spr_alg.spr_vyraz(A,B,C)), font='Arial 14 bold')\
        .grid(column=0, row=0, sticky=W, columnspan=4)
    Button(slave, text="Показати розв'язок", font="Arial 12",
           command=show).grid(column=0, row=3)

    s = save_to_file(spr_alg.spr_vyraz(A,B,C))
    but = Button(slave, text='Зберегти в файл', font='Arial 12', command=s)
    but.grid(column=1, row=3)
    but.bind("<Button-1>", but_disable)


def window4():
    global time1, time2, X, Y
    X = C
    Y = A

    slave = Toplevel(root)
    slave.title('Симетрична різниця')
    slave.grab_set()
    slave.focus_set()

    def show():
        lf = LabelFrame(slave, text="Порівняння авторського алгоритму та вбудованого", font='Arial 12')
        lf.grid(column=0, row=4, columnspan=4)
        Label(lf, text='\nX^Y = {rez}\n\n'
                       'Час роботи авторського алгоритму: {t1}*(10^(-25)) секунд\n'
                       'Час роботи вбудованого алгоритму: {t2}*(10^(-25)) секунд\n'
              .format(rez=rez2, t1=time1*(10^25), t2=time2*(10^25)), justify=LEFT, font="Arial 14")\
            .grid(column=0, row=4, sticky=W, columnspan=4)

    def but_disable(event):
        but['text'] = 'Збережено'
        but['state'] = DISABLED

    Label(slave, text='Задана операція:\n'
                      'Z = X^Y', font="Arial 14 bold").grid(column=0, row=0, columnspan=3)
    Label(slave, text='X = {}\n'
                      'Y = {}\n'.format(X, Y),
          font="Arial 14", justify=LEFT).grid(column=0, row=1, sticky=W, columnspan=7)

    time.clock()
    rez1 = sym_rizn.sym_rizn(X,Y)
    time1 = float(time.clock())
    rez2 = X^Y
    time2 = float(time.clock())

    Label(slave, text='Z = X^Y = {}'.format(rez1), font="Arial 14", justify=LEFT).grid(column=0, row=2, sticky=W, columnspan=7)
    Button(slave, text="Порівняти алгоритми", font="Arial 12",
           command=show).grid(column=0, row=3)
    s = save_to_file(sym_rizn.sym_rizn(X,Y))
    but = Button(slave, text='Зберегти в файл', font='Arial 12', command=s)
    but.grid(column=1, row=3)
    but.bind("<Button-1>", but_disable)


def window5():
    slave = Toplevel(root)
    slave.title('Результати')
    slave.grab_set()
    slave.focus_set()

    f = open('Результат.txt', 'rb')
    D1 = pickle.load(f)
    D2 = pickle.load(f)
    Z1 = pickle.load(f)
    Z2 = X^Y

    rez1 = 'Результати сходяться' if D1 == D2 else 'Помилка в обчисленні'
    rez2 = 'Результати сходяться' if Z1 == Z2 else 'Помилка в обчисленні'

    def but():
        Label(slave, text=rez1, font="Arial 12", fg='red').grid(column=0, row=3, sticky=W, columnspan=2)
        Label(slave, text=rez2, font="Arial 12", fg='red').grid(column=0, row=9, sticky=W, columnspan=2)
        Label(slave, text='Час роботи авторського алгоритму: {t1}*(10^(-25)) секунд\n'
                          'Час роботи вбудованого алгоритму: {t2}*(10^(-25)) секунд\n'
                          .format(t1=time1*(10^25), t2=time2*(10^25)), font="Arial 12", fg='blue', justify=LEFT)\
            .grid(column=0, row=10, sticky=W, columnspan=2, rowspan=2)
    lf1 = LabelFrame(slave, text='Множина D', font='Arial 12')
    lf2 = LabelFrame(slave, text='Множина Z', font='Arial 12')
    lf1.grid(column=0, row=1, sticky=W, columnspan=2, rowspan=2)
    lf2.grid(column=0, row=7, sticky=W, columnspan=2, rowspan=2)

    Label(slave, text='Результати обчислень', font='Arial 14 bold').grid(column=0, row=0, columnspan=2)
    Label(lf1, text='D(заданий алгоритм) = (A & notB) | (B & notA) & (C | B) & C =\n\t\t= {}'.format(D1),
          font="Arial 14", justify=LEFT)\
        .grid(column=0, row=1, sticky=W, columnspan=2)
    Label(lf1, text='D(спрощений алгоритм) = (A ^ B) & C = {}'.format(D2), font="Arial 14", justify=LEFT)\
        .grid(column=0, row=2, sticky=W, columnspan=2)
    Label(slave, text='\t').grid(column=0, row=6, sticky=W, columnspan=2)

    Label(lf2, text='Z(авторський алгоритм) = {}'.format(Z1), font="Arial 14", justify=LEFT)\
        .grid(column=0, row=7, sticky=W, columnspan=2)
    Label(lf2, text='Z(алгоритм Python) = {}'.format(Z2), font="Arial 14", justify=LEFT)\
        .grid(column=0, row=8, sticky=W, columnspan=2)
    Label(slave, text='   ').grid(column=2, row=2, rowspan=2)
    Label(slave, text='\t').grid(column=0, row=11)

    Button(slave, text='Порівняти результати', font="Arial 12", command=but).grid(column=0, row=12)


root = Tk()
root.title('Задати множини')
root.minsize(680, 400)

m = Menu(root)
root.config(menu=m)
m.add_cascade(label="Window2", command=window2)
m.add_cascade(label="Window3", command=window3)
m.add_cascade(label="Window4", command=window4)
m.add_cascade(label="Window5", command=window5)


var = IntVar()
var.set(0)
rad0 = Radiobutton(root, text="Вручну", variable=var, value=0, command=vruchnu)
rad1 = Radiobutton(root, text="Випадково", variable=var, value=1, command=vypadkovo)
rad0.grid(column=0, row=0, columnspan=2, sticky=W)
rad1.grid(column=0, row=1, columnspan=2, sticky=W)


Label(root, text='Задати множини вручну', font="Arial 14", width=20, height=2, justify=LEFT)\
    .grid(column=0, row=2, columnspan=3)

Label(root, text='A:').grid(column=0, row=3, sticky=E)
Label(root, text='B:').grid(column=0, row=4, sticky=E)
Label(root, text='C:').grid(column=0, row=5, sticky=E)

entA = Entry(root, width=30, bd=3, state=DISABLED)
entA.grid(column=1, row=3, sticky=W)
entB = Entry(root, width=30, bd=3, state=DISABLED)
entB.grid(column=1, row=4, sticky=W)
entC = Entry(root, width=30, bd=3, state=DISABLED)
entC.grid(column=1, row=5, sticky=W)

Label(root, text='Задати множини випадково', font="Arial 14", width=30, height=2, justify=LEFT)\
    .grid(column=3, row=2, columnspan=3)

Label(root, text='Потужність A:').grid(column=3, row=3, sticky=E)
Label(root, text='Потужність B:').grid(column=3, row=4, sticky=E)
Label(root, text='Потужність C:').grid(column=3, row=5, sticky=E)

lenA = Entry(root, width=10, bd=3, state=DISABLED)
lenA.grid(column=4, row=3, sticky=W)
lenB = Entry(root, width=10, bd=3, state=DISABLED)
lenB.grid(column=4, row=4, sticky=W)
lenC = Entry(root, width=10, bd=3, state=DISABLED)
lenC.grid(column=4, row=5, sticky=W)
Label(root, text='Задати універсальну множину', font="Arial 14", width=30, height=2, justify=LEFT)\
    .grid(column=0, row=6, columnspan=3)

Label(root, text='від').grid(column=0, row=7, sticky=E)
Label(root, text='до').grid(column=0, row=8, sticky=E)

entU_vid = Entry(root, width=10, bd=3)
entU_vid.grid(column=1, row=7, sticky=W)

entU_do = Entry(root, width=10, bd=3)
entU_do.grid(column=1, row=8, sticky=W)

A = set()
B = set()
C = set()
U = set()
but_OK = Button(root, text='Згенерувати множини', font='Arial 12', command=generABC)
but_OK.grid(column=1, row=9, columnspan=4)

open('Результат.txt', 'wb').close()

label_vyvid = Label(root, text='A = {}\n'
                               'B = {}\n'
                               'C = {}\n'
                               'U = {}'.format(A, B, C, U),
                    font="Arial 14", justify=LEFT)
label_vyvid.grid(column=1, row=11, columnspan=100, sticky=W)

but_student = Button(root, text='Студент', font='Arial 12',
                     command=student)
but_student.grid(column=5, row=0, sticky=E, rowspan=2, columnspan=2)

root.mainloop()
