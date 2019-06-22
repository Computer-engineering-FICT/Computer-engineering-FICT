import random
from tkinter import *

preset_W = ['Анна', 'Софія', 'Анастасія', 'Вікторія', 'Вероніка', 'Марія', 'Яна', 'Злата', 'Соломія', 'Єва',
            'Ангеліна', 'Марта', 'Тетяна', 'Дарина', 'Діана', 'Катерина']
preset_M = ['Матвій', 'Максим', 'Артем', 'Іван', 'Владислав', 'Данило', 'Олександр', 'Маркіян', 'Богдан', 'Денис',
            'Василь', 'Марко', "Давид", 'Андрій', 'Дмитро', 'Антон']


def window_2():
    global A, B
    A, B = [], []

    def load():
        for i in preset_W:
            list_w.insert(END, i)
        for i in preset_M:
            list_m.insert(END, i)

    def selected1():
        for i in range(len(list_m.curselection())):
            list_mA.insert(END, list_m.get(list_m.curselection()[i]))
            A.append(preset_M[list_m.curselection()[i]])

    def selected2():
        for i in range(len(list_m.curselection())):
            list_wB.insert(END, list_m.get(list_m.curselection()[i]))
            B.append(preset_M[list_m.curselection()[i]])

    def selected3():
        for j in range(len(list_w.curselection())):
            list_mA.insert(END, list_w.get(list_w.curselection()[j]))
            A.append(preset_W[list_w.curselection()[j]])

    def selected4():
        for j in range(len(list_w.curselection())):
            list_wB.insert(END, list_w.get(list_w.curselection()[j]))
            B.append(preset_W[list_w.curselection()[j]])

    def clearlistbox():
        for i in range(len(A)):
            list_mA.delete(0)
        for j in range(len(B)):
            list_wB.delete(0)

    def saveA():
        with open('setA.txt', 'w+', encoding='cp1251') as tmp:
            tmp.writelines(A)

    def saveB():
        with open('setB.txt', 'w+', encoding='cp1251') as tmp:
            tmp.writelines(B)

    def openA():
        with open('setA.txt', 'r+', encoding='cp1251') as tmp:
            A = list(set(tmp.readlines()))

    def openB():
        with open('setA.txt', 'r+', encoding='cp1251') as tmp:
            B = list(set(tmp.readlines()))

    window2 = Tk()
    window2.geometry("710x370")
    window2.title("2 Вікно")
    list_m = Listbox(window2, height=10, width=15, selectmode=EXTENDED)
    list_mA = Listbox(window2, height=10, width=15, selectmode=EXTENDED)
    list_w = Listbox(window2, height=10, width=15, selectmode=EXTENDED)
    list_wB = Listbox(window2, height=10, width=15, selectmode=EXTENDED)
    scroll1 = Scrollbar(window2, command=list_m.yview)
    scroll2 = Scrollbar(window2, command=list_w.yview)
    scroll3 = Scrollbar(window2, command=list_mA.yview)
    scroll4 = Scrollbar(window2, command=list_wB.yview)
    list_m['yscrollcommand'] = scroll1.set
    list_w['yscrollcommand'] = scroll2.set
    list_mA['yscrollcommand'] = scroll3.set
    list_wB['yscrollcommand'] = scroll4.set
    scroll1.place(x=110, y=10, height=170)
    scroll2.place(x=490, y=10, height=170)
    scroll3.place(x=300, y=10, height=170)
    scroll4.place(x=680, y=10, height=170)
    list_m.place(x=10, y=10)
    list_w.place(x=390, y=10)
    list_mA.place(x=200, y=10)
    list_wB.place(x=580, y=10)
    b1 = Button(window2, text='Завантажити набір імен', command=load, bg="black", fg="yellow", font=('Arial', 15))
    l2 = Label(window2, text=' Скопіювати в: ', font=('Arial', 12))
    l3 = Label(window2, text=' Скопіювати в: ', font=('Arial', 12))
    b1.place(x=10, y=200)
    l2.place(x=10, y=250)
    l3.place(x=380, y=250)
    v1 = IntVar()
    v1.set(1)
    v2 = IntVar()
    v2.set(1)
    r1 = Radiobutton(window2, text='A', variable=v1, value=1, command=selected1)
    r1.place(x=10, y=270)
    r2 = Radiobutton(window2, text='B', variable=v1, value=2, command=selected2)
    r2.place(x=90, y=270)
    r3 = Radiobutton(window2, text='A', variable=v2, value=1,  command=selected3)
    r3.place(x=380, y=270)
    r4 = Radiobutton(window2, text='B', variable=v2, value=2, command=selected4)
    r4.place(x=460, y=270)
    b2 = Button(window2, text="Очистити", bg="black", fg="yellow", command=clearlistbox, font=('Arial', 10))
    b2.place(x=630, y=330)
    b3 = Button(window2, text="Зберегти у файл A", bg="black", fg="yellow", command=saveA)
    b4 = Button(window2, text="Зберегти у файл B", bg="black", fg="yellow", command=saveB)
    b5 = Button(window2, text="Зчитати з  файлу A", bg="black", fg="yellow", command=openA)
    b6 = Button(window2, text="Зчитати з файлу В", bg="black", fg="yellow", command=openB)
    b3.place(x=10, y=300)
    b4.place(x=380, y=300)
    b5.place(x=10, y=330)
    b6.place(x=380, y=330)
    window2.mainloop()


def window_3():
    global A, B, S_relation, R_relation
    S_relation = []
    R_relation = []
    A = list(set(A))
    B = list(set(B))
    S_matrix = [[0 for y in range(len(A))] for x in range(len(B))]
    R_matrix = [[0 for y in range(len(A))] for x in range(len(B))]

    def relation1():
        tmp = []
        B_ = B[:]
        for i in A:
            if i in preset_W and i not in B_:
                a = random.randint(1, 2)
                for j in range(a):
                    tmp.append(i)
                    for k in B:
                        if k in B_:
                            tmp.append((k))
                            S_relation.append(tuple(tmp))
                            B_.remove(k)
                            tmp.clear()
                            break
                        else:
                            continue
                    tmp.clear()

    def relation2():
        B_ = B[:]
        A_ = A[:]

        for i in range(len(A)):
            if A[i] in preset_W and A[i] in A_:
                for j in range(len(B)):
                    if B[j] in preset_M and B[j] in B_:
                        if (A[i], B[j]) not in S_relation and (A[i], B[j]) not in R_relation:
                            R_relation.append((A[i], B[j]))
                            A_.remove(A[i])
                            B_.remove(B[j])
                            break

    def getrelation1():
        S_matrix1 = S_matrix[:]
        for m in range(len(S_matrix1)):
            for n in range(len(S_matrix1[m])):
                for z in S_relation:
                    if (A[n], B[m]) == z:
                        S_matrix1[m][n] = 1
        lvl = Toplevel(window3)
        lvl.geometry('450x200')
        lvl.title("Відношення S")
        for q in range(len(B)):
            lav = Label(lvl, text=B[q])
            lav.grid(row=0, column=1 + q)
        for e in range(len(A)):
            lav1 = Label(lvl, text=A[e])
            lav1.grid(row=1 + e, column=0)
        for i in range(len(S_matrix)):
            for j in range(len(S_matrix1[i])):
                if S_matrix1[i][j] == 1:
                    lbl = Label(lvl, text='1')
                    lbl.grid(row=j + 1, column=i + 1)
                else:
                    lbl = Label(lvl, text='0')
                    lbl.grid(row=j + 1, column=i + 1)
        lvl.mainloop()

    def getrelation2():
        R_matrix1 = R_matrix[:]
        for m in range(len(R_matrix1)):
            for n in range(len(R_matrix1[m])):
                for z in R_relation:
                    if (A[n], B[m]) == z:
                        R_matrix1[m][n] = 1
        lvl = Toplevel(window3)
        lvl.title("Відношення R")
        lvl.geometry('450x200')
        for q in range(len(B)):
            lav = Label(lvl, text=B[q])
            lav.grid(row=0, column=1 + q)
        for e in range(len(A)):
            lav1 = Label(lvl, text=A[e])
            lav1.grid(row=1 + e, column=0)
        for i in range(len(S_matrix)):
            for j in range(len(R_matrix1[i])):
                if R_matrix1[i][j] == 1:
                    lbl = Label(lvl, text='1')
                    lbl.grid(row=j + 1, column=i + 1)
                else:
                    lbl = Label(lvl, text='0')
                    lbl.grid(row=j + 1, column=i + 1)
        lvl.mainloop()

    def loadAB():
        for i in A:
            list_A.insert(END, i)
        for i in B:
            list_B.insert(END, i)

    window3 = Tk()
    window3.geometry("470x420")
    window3.title("3 Вікно")
    list_A = Listbox(window3, height=10, width=15, selectmode=EXTENDED)
    list_B = Listbox(window3, height=10, width=15, selectmode=EXTENDED)
    scroll1 = Scrollbar(window3, command=list_A.yview)
    scroll2 = Scrollbar(window3, command=list_B.yview)
    list_A['yscrollcommand'] = scroll1.set
    list_B['yscrollcommand'] = scroll2.set
    scroll1.place(x=150, y=35, height=170)
    scroll2.place(x=400, y=35, height=170)
    list_A.place(x=10, y=35)
    list_B.place(x=250, y=35)
    b1 = Button(window3, text='Завантажити A ,B', command=loadAB, bg='black', fg='yellow', font=('Arial', 15))
    b1.place(x=10, y=230)
    b = Button(window3, text='Створити відношення S', command=relation1, bg='black', fg='yellow')
    b.place(x=10, y=310)
    b1 = Button(window3, text='Відобразити відношення S', command=getrelation1, bg='black', fg='yellow')
    b1.place(x=250, y=310)
    b2 = Button(window3, text='Створити відношення R', command=relation2, bg='black', fg='yellow')
    b2.place(x=10, y=380)
    b3 = Button(window3, text='Відобразити відношення R', command=getrelation2, bg='black', fg='yellow')
    b3.place(x=250, y=380)
    window3.mainloop()


def window_4():
    global S_matrix, R_matrix, S_relation, R_relation

    def relationunion():
        tmp_matrix = [[0 for i in range(len(A))] for j in range(len(B))]
        S_u = list(set(S_relation).union(set(R_relation)))
        for m in range(len(tmp_matrix)):
            for n in range(len(tmp_matrix[m])):
                for z in S_u:
                    if (A[n], B[m]) == z:
                        tmp_matrix[m][n] = 1
        lvl = Toplevel(window4)
        lvl.geometry('500x200')
        lvl.title("R∪S")
        for q in range(len(B)):
            lav = Label(lvl, text=B[q])
            lav.grid(row=0, column=1 + q)
        for e in range(len(A)):
            lav1 = Label(lvl, text=A[e])
            lav1.grid(row=1 + e, column=0)
        for i in range(len(tmp_matrix)):
            for j in range(len(tmp_matrix[i])):
                if tmp_matrix[i][j] == 1:
                    lbl = Label(lvl, text='1')
                    lbl.grid(row=j + 1, column=i + 1)
                else:
                    lbl = Label(lvl, text='0')
                    lbl.grid(row=j + 1, column=i + 1)
        lvl.mainloop()

    def relationinter():
        tmp_matrix = [[0 for i in range(len(A))] for j in range(len(B))]
        S_i = list(set(S_relation).intersection(set(R_relation)))
        for m in range(len(tmp_matrix)):
            for n in range(len(tmp_matrix[m])):
                for z in S_i:
                    if (A[n], B[m]) == z:
                        tmp_matrix[m][n] = 1
        lvl = Toplevel(window4)
        lvl.geometry('500x200')
        lvl.title("R∩S")
        for q in range(len(B)):
            lav = Label(lvl, text=B[q])
            lav.grid(row=0, column=1 + q)
        for e in range(len(A)):
            lav1 = Label(lvl, text=A[e])
            lav1.grid(row=1 + e, column=0)
        for i in range(len(tmp_matrix)):
            for j in range(len(tmp_matrix[i])):
                if tmp_matrix[i][j] == 1:
                    lbl = Label(lvl, text='1')
                    lbl.grid(row=j + 1, column=i + 1)
                else:
                    lbl = Label(lvl, text='0')
                    lbl.grid(row=j + 1, column=i + 1)
        lvl.mainloop()

    def relationdiference():
        tmp_matrix = [[0 for i in range(len(A))] for j in range(len(B))]
        S_d = list(set(R_relation).difference(set(S_relation)))
        for m in range(len(tmp_matrix)):
            for n in range(len(tmp_matrix[m])):
                for z in S_d:
                    if (A[n], B[m]) == z:
                        tmp_matrix[m][n] = 1
        lvl = Toplevel(window4)
        lvl.geometry('500x200')
        lvl.title("R\S")
        for q in range(len(B)):
            lav = Label(lvl, text=B[q])
            lav.grid(row=0, column=1 + q)
        for e in range(len(A)):
            lav1 = Label(lvl, text=A[e])
            lav1.grid(row=1 + e, column=0)
        for i in range(len(tmp_matrix)):
            for j in range(len(tmp_matrix[i])):
                if tmp_matrix[i][j] == 1:
                    lbl = Label(lvl, text='1')
                    lbl.grid(row=j + 1, column=i + 1)
                else:
                    lbl = Label(lvl, text='0')
                    lbl.grid(row=j + 1, column=i + 1)
        lvl.mainloop()

    def relationnegation():
        tmp_matrix = [[0 for i in range(len(A))] for j in range(len(B))]
        U = []
        for i in A:
            for j in B:
                U.append((i, j))
        S_U = list(set(U).difference(set(S_relation)))
        for m in range(len(tmp_matrix)):
            for n in range(len(tmp_matrix[m])):
                for z in S_U:
                    if (A[n], B[m]) == z:
                        tmp_matrix[m][n] = 1
        lvl = Toplevel(window4)
        lvl.geometry('500x200')
        lvl.title("U\R")
        for q in range(len(B)):
            lav = Label(lvl, text=B[q])
            lav.grid(row=0, column=1 + q)
        for e in range(len(A)):
            lav1 = Label(lvl, text=A[e])
            lav1.grid(row=1 + e, column=0)
        for i in range(len(tmp_matrix)):
            for j in range(len(tmp_matrix[i])):
                if tmp_matrix[i][j] == 1:
                    lbl = Label(lvl, text='1')
                    lbl.grid(row=j + 1, column=i + 1)
                else:
                    lbl = Label(lvl, text='0')
                    lbl.grid(row=j + 1, column=i + 1)
        lvl.mainloop()

    def relationtrans():
        tmp_matrix = [[0 for i in range(len(B))] for j in range(len(A))]
        S_t = []
        for i in S_relation:
            S_t.append((i[1], i[0]))
        for m in range(len(tmp_matrix)):
            for n in range(len(tmp_matrix[m])):
                for z in S_t:
                    if (B[n], A[m]) == z:
                        tmp_matrix[m][n] = 1
        lvl = Toplevel(window4)
        lvl.geometry('500x200')
        lvl.title("S^-1")
        for q in range(len(A)):
            lav = Label(lvl, text=A[q])
            lav.grid(row=0, column=1 + q)
        for e in range(len(B)):
            lav1 = Label(lvl, text=B[e])
            lav1.grid(row=1 + e, column=0)
        for i in range(len(tmp_matrix)):
            for j in range(len(tmp_matrix[i])):
                if tmp_matrix[i][j] == 1:
                    lbl = Label(lvl, text='1')
                    lbl.grid(row=j + 1, column=i + 1)
                else:
                    lbl = Label(lvl, text='0')
                    lbl.grid(row=j + 1, column=i + 1)
        lvl.mainloop()

    window4 = Tk()
    window4.geometry("200x205")
    window4.title('4 Вікно')
    b1 = Button(window4, text='            Відобразити R∪S             ', command=relationunion, bg='black', fg='yellow')
    b1.place(x=10, y=10)
    b2 = Button(window4, text='            Відобразити R∩S             ', command=relationinter, bg='black', fg='yellow')
    b2.place(x=10, y=50)
    b3 = Button(window4, text='            Відобразити R\S             ', command=relationdiference, bg='black', fg='yellow')
    b3.place(x=10, y=90)
    b4 = Button(window4, text='            Відобразити U\R             ', command=relationnegation, bg='black', fg='yellow')
    b4.place(x=10, y=130)
    b5 = Button(window4, text='            Відобразити S^-1            ', command=relationtrans, bg='black', fg='yellow')
    b5.place(x=10, y=170)
    window4.mainloop()
