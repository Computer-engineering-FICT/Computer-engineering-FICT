from tkinter import *
import pickle, random, copy


class Lab2:
    A = set()
    B = set()

    def student(self, n=3, g=64):
        self.slave = Toplevel(self.root)
        self.slave.title('Student')
        self.slave.focus_set()
        self.slave.minsize(300, 100)
        self.slave.maxsize(300, 100)
        self.slave.wm_geometry("+600+250")
        Label(self.slave, text='Бровченко Анастасія\n'
                               'група ІО-64\n'
                               'варіант {}'.format((n+g % 60) % 30+1),
              justify=LEFT, font="Arial 17 bold").pack(fill='both')

    def mainwindow(self):
        self.root = Tk()
        self.root.title('Window1')
        self.root.minsize(500, 200)
        self.root.maxsize(500, 200)
        self.root.wm_geometry("+500+200")

        Label(self.root, text='Лабораторна робота №2\n'
                              '«Бінарні відношення та їх основні властивості,\n'
                              ' операції над відношеннями»\n', font="Arial 16 bold").grid(row=0, column=0, columnspan=4)
        Button(self.root, text='Window2', font="Arial 12", command=self.window2).grid(row=1, column=0)
        Button(self.root, text='Window3', font="Arial 12", command=self.window3).grid(row=2, column=0)
        Button(self.root, text='Window4', font="Arial 12", command=self.window4).grid(row=3, column=0)

        Button(self.root, text='Студент', font='Arial 14', height=2, width=10,
               command=self.student).grid(column=2, row=1, sticky=E, rowspan=2)
        self.root.mainloop()

    def window2(self):
        global A, B
        self.A = set()
        self.B = set()

        self.slave2 = Toplevel(self.root)
        self.slave2.title('Window2')
        self.slave2.focus_set()

        def add_to_list_women(event):
            if var.get() == 0:
                self.A.add(self.women[event.widget.curselection()[0]])
            if var.get() == 1:
                self.B.add(self.women[event.widget.curselection()[0]])
            lb['text'] = 'A = {}\nB = {}\n'.format(self.A, self.B)

        def add_to_list_men(event):
            if var.get() == 0:
                self.A.add(self.men[event.widget.curselection()[0]])
            if var.get() == 1:
                self.B.add(self.men[event.widget.curselection()[0]])
            lb['text'] = 'A = {}\nB = {}\n'.format(self.A, self.B)

        def clean_lists():
            self.A = set()
            self.B = set()
            lb['text'] = 'A = {}\nB = {}\n'.format(self.A, self.B)

        def save_to_file():
            self.f = open('МножиниАВ.txt', 'wb')
            pickle.dump(self.A, self.f)
            pickle.dump(self.B, self.f)
            self.f.close()
            but['text'] = 'Збережено'
            but['state'] = DISABLED

        def show_from_file():
            self.show = Toplevel(self.slave2)
            self.show.title('Window2/Show_sets')
            self.show.focus_set()
            self.show.minsize(300, 100)
            self.f = open('МножиниАВ.txt', 'rb')
            Label(self.show, text='A={}\n'
                                  'B={}'.format(pickle.load(self.f), pickle.load(self.f)), font='Arial 14', justify=LEFT)\
                .pack(fill=BOTH)
            self.f.close()

        Label(self.slave2, text='Задайте множини А та В', font='Arial 16 bold').grid(row=0, column=0, columnspan=4)

        var = IntVar()
        var.set(0)
        rad0 = Radiobutton(self.slave2, text="Множина A", font='Arial 12 bold', variable=var, value=0)
        rad1 = Radiobutton(self.slave2, text="Множина B", font='Arial 12 bold', variable=var, value=1)
        rad0.grid(column=0, row=1, sticky=W)
        rad1.grid(column=0, row=2, sticky=W)

        lf1 = LabelFrame(self.slave2, text="Жіночі імена", font='Arial 12')
        lf1.grid(row=3, column=0, columnspan=2)

        self.women = ['Настя', 'Маша', 'Аня', 'Катя', 'Юля', 'Даша', 'Оля', 'Люда']
        listbox1 = Listbox(lf1, selectmode=EXTENDED, font='Arial 14')
        for i in self.women:
            listbox1.insert(END, i)
        listbox1.bind("<<ListboxSelect>>", add_to_list_women)
        listbox1.grid(row=3, column=0)

        scr1 = Scrollbar(lf1, command=listbox1.yview)
        listbox1.configure(yscrollcommand=scr1.set)
        scr1.grid(row=3, column=1, sticky=W, ipady=90)

        lf2 = LabelFrame(self.slave2, text="Чоловічі імена", font='Arial 12')
        lf2.grid(row=3, column=2, columnspan=2)

        self.men = ['Андрій', 'Антон', 'Денис', 'Богдан', 'Віталій', 'Віктор', 'Костя', 'Сергій', 'Вова']
        listbox2 = Listbox(lf2, selectmode=EXTENDED, font='Arial 14')
        for i in self.men:
            listbox2.insert(END, i)
        listbox2.bind("<<ListboxSelect>>", add_to_list_men)
        listbox2.grid(row=3, column=2)

        scr2 = Scrollbar(lf2, command=listbox2.yview)
        listbox2.configure(yscrollcommand=scr2.set)
        scr2.grid(row=3, column=3, sticky=W, ipady=90)

        Button(self.slave2, text='Очистити множини', font='Arial 12', command=clean_lists)\
            .grid(row=4, column=0, columnspan=2)

        but = Button(self.slave2, text='Зберегти в файл', font='Arial 12', command=save_to_file)
        but.grid(row=4, column=2, columnspan=2)

        Button(self.slave2, text='Показати з файлу', font='Arial 12', command=show_from_file)\
            .grid(row=5, column=2, columnspan=2)

        lf3 = LabelFrame(self.slave2, text='Задані множини', font='Arial 12', )
        lf3.grid(row=6, column=0, columnspan=5, sticky=W)
        lb = Label(lf3, text='A = {}\n'
                             'B = {}\n'.format(self.A, self.B), font='Arial 14', justify=LEFT)
        lb.grid(row=6, column=0, columnspan=5, sticky=W)
        A=self.A ; B=self.B

    def window3(self):
        self.slave3 = Toplevel(self.root)
        self.slave3.title('Window3')
        self.slave3.focus_set()

        def A_cholovik_B():
            a = set()
            for i in self.A:
                if i in self.men:
                    a.add(i)
            b = set()
            for j in self.B:
                if j in self.women:
                    b.add(j)
            S = []
            for i in range(min(len(a), len(b))):
                p = random.choice(list(a))
                q = random.choice(list(b))
                S.append([p, q])
                a.remove(p)
                b.remove(q)
            return S

        def A_onuk_B():
            a = set()
            for i in self.A:
                if i in self.men:
                    a.add(i)
            b = self.B
            R = []
            for i in range(min(len(a), len(b))):
                p = random.choice(list(a))
                q = random.choice(list(b))
                if [p, q] not in self.S:
                    if [p, q] not in R:
                        R.append([p, q])
            return R

        self.S = A_cholovik_B()
        self.R = A_onuk_B()

        lf1 = LabelFrame(self.slave3, text='A', font='Arial 12')
        lf1.grid(row=0, column=0)
        listbox1 = Listbox(lf1, font='Arial 14')
        listbox1.grid(row=0, column=0)
        for i in self.A:
            listbox1.insert(END, i)

        scr1 = Scrollbar(lf1, command=listbox1.yview)
        listbox1.configure(yscrollcommand=scr1.set)
        scr1.grid(row=0, column=1, sticky=W, ipady=90)

        lf2 = LabelFrame(self.slave3, text='B', font='Arial 12')
        lf2.grid(row=0, column=2)
        listbox2 = Listbox(lf2, font='Arial 14')
        listbox2.grid(row=0, column=2)
        for j in self.B:
            listbox2.insert(END, j)

        scr2 = Scrollbar(lf2, command=listbox2.yview)
        listbox2.configure(yscrollcommand=scr2.set)
        scr2.grid(row=0, column=3, sticky=W, ipady=90)

        canvS = Canvas(self.slave3, width=600, height=200)
        dict_SA = {}
        dict_SB = {}
        canvS.create_text(160, 30, text='Множина aSb, якщо a чоловік b', font='Arial 16')
        for i in range(len(self.A)):
            canvS.create_text(30+i*50, 50, text=list(self.A)[i], font='Arial 10')
            canvS.create_oval([20+i*50, 60], [40+i*50, 80], fill="green")
            dict_SA.update({list(self.A)[i]: [30+i*50, 80]})
        for j in range(len(self.B)):
            canvS.create_text(30+j*50, 190, text=list(self.B)[j], font='Arial 10')
            canvS.create_oval([20+j*50, 160], [40+j*50, 180], fill="blue")
            dict_SB.update({list(self.B)[j]: [30+j*50, 160]})
        for k in self.S:
            canvS.create_line(dict_SA[k[0]], dict_SB[k[1]], arrow=LAST)
        canvS.grid(row=2, column=0, columnspan=3)

        canvR = Canvas(self.slave3, width=600, height=200)
        dict_RA = {}
        dict_RB = {}
        canvR.create_text(160, 30, text='Множина aRb, якщо a онук b', font='Arial 16')
        for i in range(len(self.A)):
            canvR.create_text(30+i*50, 50, text=list(self.A)[i], font='Arial 10')
            canvR.create_oval([20+i*50, 60], [40+i*50, 80], fill="green")
            dict_RA.update({list(self.A)[i]: [30+i*50, 80]})
        for j in range(len(self.B)):
            canvR.create_text(30+j*50, 190, text=list(self.B)[j], font='Arial 10')
            canvR.create_oval([20+j*50, 160], [40+j*50, 180], fill="blue")
            dict_RB.update({list(self.B)[j]: [30+j*50, 160]})
        for k in self.R:
            canvR.create_line(dict_RA[k[0]], dict_RB[k[1]], arrow=LAST)
        canvR.grid(row=3, column=0, columnspan=3)

    def window4(self):
        self.slave4 = Toplevel(self.root)
        self.slave4.title('Window4')
        self.slave4.focus_set()
        self.slave4.minsize(700, 300)
        self.slave4.maxsize(700, 300)

        def but1():
            canv.delete("all")
            canv.create_text(150, 20, text='R \u222A S', font='Arial 16')
            dict_b1 = {}
            dict_b2 = {}
            V = self.R+self.S
            for i in range(len(self.A)):
                canv.create_text(30+i*50, 50, text=list(self.A)[i], font='Arial 10')
                canv.create_oval([20+i*50, 60], [40+i*50, 80], fill="green")
                dict_b1.update({list(self.A)[i]: [30+i*50, 80]})
            for j in range(len(self.B)):
                canv.create_text(30+j*50, 190, text=list(self.B)[j], font='Arial 10')
                canv.create_oval([20+j*50, 160], [40+j*50, 180], fill="blue")
                dict_b2.update({list(self.B)[j]: [30+j*50, 160]})
            for k in V:
                canv.create_line(dict_b1[k[0]], dict_b2[k[1]], arrow=LAST)

        def but2():
            canv.delete("all")
            canv.create_text(150, 20, text='R \u2229 S', font='Arial 16')
            dict_b1 = {}
            dict_b2 = {}
            V = []
            for i in self.R:
                if i in self.S:
                    V.append(i)

            for i in range(len(self.A)):
                canv.create_text(30+i*50, 50, text=list(self.A)[i], font='Arial 10')
                canv.create_oval([20+i*50, 60], [40+i*50, 80], fill="green")
                dict_b1.update({list(self.A)[i]: [30+i*50, 80]})
            for j in range(len(self.B)):
                canv.create_text(30+j*50, 190, text=list(self.B)[j], font='Arial 10')
                canv.create_oval([20+j*50, 160], [40+j*50, 180], fill="blue")
                dict_b2.update({list(self.B)[j]: [30+j*50, 160]})

            for k in V:
                if len(V) != 0:
                    canv.create_line(dict_b1[k[0]], dict_b2[k[1]], arrow=LAST)

        def but3():
            canv.delete("all")
            canv.create_text(150, 20, text='R \ S', font='Arial 16')
            dict_b1 = {}
            dict_b2 = {}
            V = copy.deepcopy(self.R)
            for i in V:
                if i in self.S:
                    V.remove(i)

            for i in range(len(self.A)):
                canv.create_text(30+i*50, 50, text=list(self.A)[i], font='Arial 10')
                canv.create_oval([20+i*50, 60], [40+i*50, 80], fill="green")
                dict_b1.update({list(self.A)[i]: [30+i*50, 80]})
            for j in range(len(self.B)):
                canv.create_text(30+j*50, 190, text=list(self.B)[j], font='Arial 10')
                canv.create_oval([20+j*50, 160], [40+j*50, 180], fill="blue")
                dict_b2.update({list(self.B)[j]: [30+j*50, 160]})
            for k in V:
                canv.create_line(dict_b1[k[0]], dict_b2[k[1]], arrow=LAST)

        def but4():
            canv.delete("all")
            canv.create_text(150, 20, text='U \ R', font='Arial 16')
            dict_b1 = {}
            dict_b2 = {}

            V = []
            a = set()
            for i in self.A:
                if i in self.men:
                    a.add(i)
            b = copy.deepcopy(self.B)
            for i in a:
                for j in b:
                    V.append([i,j])

            for i in V:
                if i in self.R:
                    V.remove(i)

            for i in range(len(self.A)):
                canv.create_text(30+i*50, 50, text=list(self.A)[i], font='Arial 10')
                canv.create_oval([20+i*50, 60], [40+i*50, 80], fill="green")
                dict_b1.update({list(self.A)[i]: [30+i*50, 80]})
            for j in range(len(self.B)):
                canv.create_text(30+j*50, 190, text=list(self.B)[j], font='Arial 10')
                canv.create_oval([20+j*50, 160], [40+j*50, 180], fill="blue")
                dict_b2.update({list(self.B)[j]: [30+j*50, 160]})
            for k in V:
                if len(V) != 0:
                    canv.create_line(dict_b1[k[0]], dict_b2[k[1]], arrow=LAST)

        def but5():
            canv.delete("all")
            canv.create_text(150, 20, text='S⁻¹', font='Arial 16')
            dict_b1 = {}
            dict_b2 = {}
            V = copy.deepcopy(self.S)
            for i in V:
                i[0], i[1] = i[1], i[0]
            for i in range(len(self.A)):
                canv.create_text(30+i*50, 50, text=list(self.A)[i], font='Arial 10')
                canv.create_oval([20+i*50, 60], [40+i*50, 80], fill="green")
                dict_b1.update({list(self.A)[i]: [30+i*50, 80]})
            for j in range(len(self.B)):
                canv.create_text(30+j*50, 190, text=list(self.B)[j], font='Arial 10')
                canv.create_oval([20+j*50, 160], [40+j*50, 180], fill="blue")
                dict_b2.update({list(self.B)[j]: [30+j*50, 160]})
            for k in V:
                canv.create_line(dict_b2[k[0]], dict_b1[k[1]], arrow=LAST)

        Label(self.slave4, text='   ').grid(row=0, column=0)
        Label(self.slave4, text='Операції над відношеннями', font='Arial 16').grid(row=0, column=2, columnspan=2)
        Button(self.slave4, text='R \u222A S', font='Arial 12', command=but1)\
            .grid(row=1, column=1, sticky=W)
        Button(self.slave4, text='R \u2229 S', font='Arial 12', command=but2)\
            .grid(row=2, column=1, sticky=W)
        Button(self.slave4, text='R \ S', font='Arial 12', command=but3)\
            .grid(row=3, column=1, sticky=W)
        Button(self.slave4, text='U \ R', font='Arial 12', command=but4)\
            .grid(row=4, column=1, sticky=W)
        Button(self.slave4, text='S⁻¹', font='Arial 12', command=but5)\
            .grid(row=5, column=1, sticky=W)
        Label(self.slave4, text='   ').grid(row=0, column=2)

        canv = Canvas(self.slave4, width=600, height=250)
        canv.grid(row=1, column=3, rowspan=6)

Nastya = Lab2()
Nastya.mainwindow()
