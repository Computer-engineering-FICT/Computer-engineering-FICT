from tkinter import *
from random import randrange
import sys
sys.path.append((r'F:\Dima\дискретна математика\Lab_1\Func'))
from functions import No_set, Union
class Main:
    A = set()
    B = set()
    C = set()
    U = set(range(1, 256))
    D_long = ""
    D_short = ""
    i = 0
    j = 0
    def __init__(self):
        menubar = Menu(root)
        filemenu = Menu(menubar, tearoff=0)
        filemenu.add_command(label="2 вікно", command=self.window2)
        filemenu.add_command(label="3 вікно", command=self.window3)
        filemenu.add_command(label="4 вікно", command=self.window4)
        filemenu.add_command(label="5 вікно", command=self.window5)
        menubar.add_cascade(label="Вікнa", menu=filemenu)

        l1 = Label(root, text="Моя група: ІО -", font=("Arial", 20))
        l1.grid(row=0, sticky=W)
        l2 = Label(root, text="Мій номер у групі:", font=("Arial", 20))
        l2.grid(row=1, sticky=W)
        l3 = Label(root, text="Мій варіант:", font=("Arial", 20))
        l3.grid(row=2, sticky=W)

        self.e1 = Entry(root, width=10, font=("Arial", 20))
        self.e2 = Entry(root, width=10, font=("Arial", 20))
        self.t1 = Text(root, width=5, height=1, wrap=WORD, font=("Arial", 20))
        b1 = Button(root, width=7, height=1, command=self.calc_variant, text="Варіант", font=("Arial", 10))
        self.e1.grid(row=0, column=1)
        self.e2.grid(row=1, column=1)
        b1.grid(row=2, column=1, sticky=E)
        self.t1.grid(row=2, column=1, sticky=W)

        univ_but = Button(root, width=20, height=3, text="Задати діапазаон\n універсальної множини", font=("Arial", 12), command=self.universal_set)
        univ_but.grid(row=1, column=2, columnspan=1)
        self.e_u_floor = Entry(root, width=4, font=("Arial", 20))
        self.e_u_floor.grid(row=1, column=3, sticky=W)
        self.e_u_roof = Entry(root, width=4, font=("Arial", 20))
        self.e_u_roof.grid(row=1, column=3, sticky=E)

        self.s1 = Scale(root, orient=HORIZONTAL, length=300, from_=0, to=200, tickinterval=25, resolution=1, font=("Arial", 10))
        self.s2 = Scale(root, orient=HORIZONTAL, length=300, from_=0, to=200, tickinterval=25, resolution=1, font=("Arial", 10))
        self.s3 = Scale(root, orient=HORIZONTAL, length=300, from_=0, to=200, tickinterval=25, resolution=1, font=("Arial", 10))
        self.s1.grid(row=3, column=0, sticky=W)
        self.s2.grid(row=4, column=0, sticky=W)
        self.s3.grid(row=5, column=0, sticky=W)

        b_power_A = Button(root, width=15, text="Згенерувати A", font=("Arial", 10), command=self.power_A)
        b_power_A.grid(row=3, column=1)
        b_power_B = Button(root, width=15, text="Згенерувати B", font=("Arial", 10), command=self.power_B)
        b_power_B.grid(row=4, column=1)
        b_power_C = Button(root, width=15, text="Згенерувати C", font=("Arial", 10), command=self.power_C)
        b_power_C.grid(row=5, column=1)

        self.e_A = Entry(root, width=40, font=("Arial", 10))
        self.e_A.grid(row=3, column=2)
        self.e_B = Entry(root, width=40, font=("Arial", 10))
        self.e_B.grid(row=4, column=2)
        self.e_C = Entry(root, width=40, font=("Arial", 10))
        self.e_C.grid(row=5, column=2)

        b_hand_A = Button(root, width=20, text="Задати A", font=("Arial", 10), command=self.hand_A)
        b_hand_A.grid(row=3, column=3)
        b_hand_B = Button(root, width=20, text="Задати B", font=("Arial", 10), command=self.hand_B)
        b_hand_B.grid(row=4, column=3)
        b_hand_C = Button(root, width=20, text="Задати C", font=("Arial", 10), command=self.hand_C)
        b_hand_C.grid(row=5, column=3)
        with open(r'F:\Dima\дискретна математика\Lab_1\D_short.txt', "w", encoding="utf-8") as w:
            with open(r'F:\Dima\дискретна математика\Lab_1\D_long.txt', "w", encoding="utf-8") as w:
                with open(r'F:\Dima\дискретна математика\Lab_1\Z.txt', "w", encoding="utf-8") as w:
                    pass

        root.config(menu=menubar)

    def window2(self):
        self.win2 = Toplevel(root)
        self.win2.title("2 вікно")
        l_A = Label(self.win2, text="A = ", font=("Arial", 20))
        l_B = Label(self.win2, text="B = ", font=("Arial", 20))
        l_C = Label(self.win2, text="C = ", font=("Arial", 20))
        l_D = Label(self.win2, text="D = ", font=("Arial", 20))
        l_func = Label(self.win2, text="D = ((A∩B)∪(A/B))Δ(A∪B)", font=("Arial", 20))
        l_step = Label(self.win2, text="Операція", font=("Arial", 20))
        l_A.grid(row=0)
        l_B.grid(row=1)
        l_C.grid(row=2)
        l_func.grid(row=3, columnspan=2)
        l_D.grid(row=5)
        l_step.grid(row=6)

        self.tA = Text(self.win2, width=100, height=5, font=("Arial", 10))
        self.tB = Text(self.win2, width=100, height=5, font=("Arial", 10))
        self.tC = Text(self.win2, width=100, height=5, font=("Arial", 10))
        self.tD = Text(self.win2, width=100, height=5, font=("Arial", 10))
        self.t_step = Text(self.win2, width=100, height=5, font=("Arial", 10))
        self.tA.grid(row=0, column=1)
        self.tB.grid(row=1, column=1)
        self.tC.grid(row=2, column=1)
        self.tD.grid(row=5, column=1)
        self.t_step.grid(row=6, column=1)

        self.tA.insert(INSERT, list(self.A))
        self.tB.insert(INSERT, list(self.B))
        self.tC.insert(INSERT, list(self.C))
        b_step = Button(self.win2, width=15, text="Крок", font=("Arial", 10), command=self.func_long)
        b_step.grid(row=4, columnspan=2)
        b_save = Button(self.win2, width=15, text="Зберегти", font=("Arial", 10), command=self.save_long)
        b_save.grid(row=7, columnspan=2)

    def window3(self):
        self.win3 = Toplevel(root)
        self.win3.title("3 вікно")
        l_A = Label(self.win3, text="A = ", font=("Arial", 20))
        l_B = Label(self.win3, text="B = ", font=("Arial", 20))
        l_C = Label(self.win3, text="C = ", font=("Arial", 20))
        l_D = Label(self.win3, text="D = ", font=("Arial", 20))
        l_func = Label(self.win3, text="D = AΔ(C∪B)", font=("Arial", 20))
        l_step = Label(self.win3, text="Операція", font=("Arial", 20))
        l_A.grid(row=0)
        l_B.grid(row=1)
        l_C.grid(row=2)
        l_func.grid(row=3, columnspan=2)
        l_D.grid(row=5)
        l_step.grid(row=6)

        self.t3A = Text(self.win3, width=100, height=5, font=("Arial", 10))
        self.t3B = Text(self.win3, width=100, height=5, font=("Arial", 10))
        self.t3C = Text(self.win3, width=100, height=5, font=("Arial", 10))
        self.t3D = Text(self.win3, width=100, height=5, font=("Arial", 10))
        self.t3_step = Text(self.win3, width=100, height=5, font=("Arial", 10))
        self.t3A.grid(row=0, column=1)
        self.t3B.grid(row=1, column=1)
        self.t3C.grid(row=2, column=1)
        self.t3D.grid(row=5, column=1)
        self.t3_step.grid(row=6, column=1)

        self.t3A.insert(INSERT, list(self.A))
        self.t3B.insert(INSERT, list(self.B))
        self.t3C.insert(INSERT, list(self.C))
        b_step = Button(self.win3, width=15, text="Крок", font=("Arial", 10), command=self.func_short)
        b_step.grid(row=4, columnspan=2)
        b_save = Button(self.win3, width=15, text="Зберегти", font=("Arial", 10), command=self.save_short)
        b_save.grid(row=7, columnspan=2)

    def window4(self):
        self.win4 = Toplevel(root)
        self.win4.title("4 вікно")
        l_A = Label(self.win4, text="X = ¬C =", font=("Arial", 20))
        l_B = Label(self.win4, text="Y = A =", font=("Arial", 20))
        l_C = Label(self.win4, text="Z = X∪Y =", font=("Arial", 20))
        l_A.grid(row=0)
        l_B.grid(row=1)
        l_C.grid(row=3)

        self.t4X = Text(self.win4, width=100, height=5, font=("Arial", 10))
        self.t4Y = Text(self.win4, width=100, height=5, font=("Arial", 10))
        self.t4Z = Text(self.win4, width=100, height=5, font=("Arial", 10))
        self.t4X.grid(row=0, column=1)
        self.t4Y.grid(row=1, column=1)
        self.t4Z.grid(row=3, column=1)

        b_step = Button(self.win4, width=15, text="Z", font=("Arial", 10), command=self.insert_z)
        b_step.grid(row=2, columnspan=2)

        self.t4X.insert(INSERT, No_set(list(self.C), list(self.U)))
        self.t4Y.insert(INSERT, list(self.A))
        b_save = Button(self.win4, width=15, text="Зберегти", font=("Arial", 10), command=self.save_my)
        b_save.grid(row=7, columnspan=2)

    def window5(self):
        self.win5 = Toplevel(root)
        self.win5.title("5 вікно")
        def readD1():
            with open(r'F:\Dima\дискретна математика\Lab_1\D_long.txt', "r", encoding="utf-8") as r:
                tD1.delete(1.0, END)
                tD1.insert(INSERT, r.readline())

        def readD2():
            with open(r'F:\Dima\дискретна математика\Lab_1\D_short.txt', "r", encoding="utf-8") as r:
                tD2.delete(1.0, END)
                tD2.insert(INSERT, r.readline())

        def readZ1():
            with open(r'F:\Dima\дискретна математика\Lab_1\Z.txt', "r", encoding="utf-8") as r:
                tZ1.delete(1.0, END)
                tZ1.insert(INSERT, r.readline())

        def readZ2():
            tZ2.delete(1.0, END)
            tZ2.insert(INSERT, list((set(self.U) - set(self.C)) | set(self.A)))

        def differenceD():
            d1 = str(tD1.get(1.0, END)).split()
            d2 = str(tD2.get(1.0, END)).split()
            l_DifD.delete(1.0, END)
            if set(d1) == set(d2):
                l_DifD.insert(INSERT, "Рівні")
            else:
                l_DifD.insert(INSERT, "Не рівні")

        def differenceZ():
            z1 = str(tZ1.get(1.0, END)).split()
            z2 = str(tZ2.get(1.0, END)).split()
            l_DifZ.delete(1.0, END)
            if set(z1) == set(z2):
                l_DifZ.insert(INSERT, "Рівні")
            else:
                l_DifZ.insert(INSERT, "Не рівні")

        l_D1 = Label(self.win5, text="D1 = ", font=("Arial", 20))
        l_D1.grid(row=0)
        l_D2 = Label(self.win5, text="D2 = ", font=("Arial", 20))
        l_D2.grid(row=1)
        l_Z1 = Label(self.win5, text="Z1 = ", font=("Arial", 20))
        l_Z1.grid(row=2)
        l_Z2 = Label(self.win5, text="Z2 = ", font=("Arial", 20))
        l_Z2.grid(row=3)

        tD1 = Text(self.win5, width=100, height=5, font=("Arial", 10))
        tD1.grid(row=0, column=1)
        tD2 = Text(self.win5, width=100, height=5, font=("Arial", 10))
        tD2.grid(row=1, column=1)
        tZ1 = Text(self.win5, width=100, height=5, font=("Arial", 10))
        tZ1.grid(row=2, column=1)
        tZ2 = Text(self.win5, width=100, height=5, font=("Arial", 10))
        tZ2.grid(row=3, column=1)

        b_readD1 = Button(self.win5, width=15, text="Прочитати", font=("Arial", 10), command=readD1)
        b_readD1.grid(row=0, column=2)
        b_readD2 = Button(self.win5, width=15, text="Прочитати", font=("Arial", 10), command=readD2)
        b_readD2.grid(row=1, column=2)
        b_readZ1 = Button(self.win5, width=15, text="Прочитати", font=("Arial", 10), command=readZ1)
        b_readZ1.grid(row=2, column=2)
        b_readZ2 = Button(self.win5, width=15, text="Прочитати", font=("Arial", 10), command=readZ2)
        b_readZ2.grid(row=3, column=2)

        DifD = Button(self.win5, text="Різниця D", font=("Arial", 20), command=differenceD)
        DifD.grid(row=4)
        DifZ = Button(self.win5, text="Різниця Z", font=("Arial", 20), command=differenceZ)
        DifZ.grid(row=5)

        l_DifD = Text(self.win5, width=10, height=1, font=("Arial", 50))
        l_DifD.grid(row=4, column=1)
        l_DifZ = Text(self.win5, width=10, height=1, font=("Arial", 50))
        l_DifZ.grid(row=5, column=1)

    def calc_variant(self):
        N = int(self.e1.get())
        G = int(self.e2.get())
        Z = int((N+G % 60) % 30+1)
        self.t1.delete(1.0, END)
        self.t1.insert(INSERT, Z)

    def power_A(self):
        A = set()
        while len(A) != self.s1.get():
            A.add(randrange(256))
        self.e_A.delete(0, END)
        self.e_A.insert(INSERT, list(A))

    def power_B(self):
        B = set()
        while len(B) != self.s2.get():
            B.add(randrange(256))
        self.e_B.delete(0, END)
        self.e_B.insert(INSERT, list(B))

    def power_C(self):
        C = set()
        while len(C) != self.s3.get():
            C.add(randrange(256))
        self.e_C.delete(0, END)
        self.e_C.insert(INSERT, list(C))

    def hand_A(self):
        self.A = str(self.e_A.get()).split()
        for i in range(len(self.A)):
            self.A[i] = int(self.A[i])
        try:
            if self.win2.state() == "normal" or self.win2.state() == "iconic" \
                        or self.win2.state() == "icon" or self.win2.state() == "withdrawn":
                self.tA.delete(1.0, END)
                self.tA.insert(INSERT, list(self.A))
        except AttributeError:
            pass
        except TclError:
            pass

        try:
            if self.win3.state() == "normal" or self.win3.state() == "iconic" \
                        or self.win3.state() == "icon" or self.win3.state() == "withdrawn":
                self.t3A.delete(1.0, END)
                self.t3A.insert(INSERT, list(self.A))
        except AttributeError:
            pass
        except TclError:
            pass
        try:
            if self.win4.state() == "normal" or self.win4.state() == "iconic" \
                    or self.win4.state() == "icon" or self.win4.state() == "withdrawn":
                self.t4Y.delete(1.0, END)
                self.t4Y.insert(INSERT, list(self.A))
        except AttributeError:
            pass
        except TclError:
            pass
        self.i = 0
        self.A = set(self.A)

    def hand_B(self):
        self.B = str(self.e_B.get()).split()
        for i in range(len(self.B)):
            self.B[i] = int(self.B[i])
        try:
            if self.win2.state() == "normal" or self.win2.state() == "iconic" \
                            or self.win2.state() == "icon" or self.win2.state() == "withdrawn":
                self.tB.delete(1.0, END)
                self.tB.insert(INSERT, list(self.B))
        except AttributeError:
            pass
        except TclError:
            pass
        try:
            if self.win3.state() == "normal" or self.win3.state() == "iconic" \
                            or self.win3.state() == "icon" or self.win3.state() == "withdrawn":
                self.t3B.delete(1.0, END)
                self.t3B.insert(INSERT, list(self.B))
        except AttributeError:
            pass
        except TclError:
            pass
        self.i = 0
        self.B = set(self.B)

    def hand_C(self):
        self.C = str(self.e_C.get()).split()
        for i in range(len(self.C)):
            self.C[i] = int(self.C[i])
        try:
            if self.win2.state() == "normal" or self.win2.state() == "iconic" \
                    or self.win2.state() == "icon" or self.win2.state() == "withdrawn":
                self.tC.delete(1.0, END)
                self.tC.insert(INSERT, list(self.C))
        except AttributeError:
            pass
        except TclError:
            pass
        try:
            if self.win3.state() == "normal" or self.win3.state() == "iconic" \
                    or self.win3.state() == "icon" or self.win3.state() == "withdrawn":
                self.t3C.delete(1.0, END)
                self.t3C.insert(INSERT, list(self.C))
        except AttributeError:
            pass
        except TclError:
            pass
        try:
            if self.win4.state() == "normal" or self.win4.state() == "iconic" \
                        or self.win4.state() == "icon" or self.win4.state() == "withdrawn":
                self.t4X.delete(1.0, END)
                self.t4X.insert(INSERT, No_set(list(self.C), list(self.U)))
        except AttributeError:
            pass
        except TclError:
            pass
        self.i = 0
        self.C = set(self.C)

    def universal_set(self):
        self.U.clear()
        if int(self.e_u_floor.get()) < int(self.e_u_roof.get()):
            for i in range(int(self.e_u_floor.get()), int(self.e_u_roof.get())+1):
                self.U.add(i)
            try:
                if self.win4.state() == "normal" or self.win4.state() == "iconic" \
                        or self.win4.state() == "icon" or self.win4.state() == "withdrawn":
                    self.t4X.delete(1.0, END)
                    self.t4X.insert(INSERT, No_set(list(self.C), list(self.U)))
            except AttributeError:
                pass
            except TclError:
                pass
        elif int(self.e_u_floor.get()) > int(self.e_u_roof.get()):
            for i in range(int(self.e_u_roof.get()), int(self.e_u_floor.get())+1):
                self.U.add(i)
            try:
                if self.win4.state() == "normal" or self.win4.state() == "iconic" \
                        or self.win4.state() == "icon" or self.win4.state() == "withdrawn":
                    self.t4X.delete(1.0, END)
                    self.t4X.insert(INSERT, No_set(list(self.C), list(self.U)))
            except AttributeError:
                pass
            except TclError:
                pass

    def func_long(self):
        if self.i == 0:
            self.D_long = "({0}∪({1}\\{2})" \
                           "Δ({3}∪{4})\n".format((self.A & self.B), self.A, self.B, self.C, self.B)
            self.tD.delete(1.0, END)
            self.tD.insert(INSERT, self.D_long)
            self.t_step.delete(1.0, END)
            self.t_step.insert(INSERT, "(A∩B) = ({0} ∩ {1}) =\n= {2}".format(self.A, self.B, (self.A & self.B)))
            self.i += 1

        elif self.i == 1:
            self.D_long = "({0}∪{1})" \
                           "Δ({2}∪{3})\n".format((self.A & self.B), (self.A - self.B), self.C, self.B)
            self.tD.delete(1.0, END)
            self.tD.insert(INSERT, self.D_long)
            self.t_step.delete(1.0, END)
            self.t_step.insert(INSERT, "(A\\B) = ({0} \\ {1}) =\n= {2}".format(self.A, self.B, (self.A - self.B)))
            self.i += 1

        elif self.i == 2:
            self.D_long = "{0}Δ({1}∪{2})".format((self.A & self.B) | (self.A - self.B), self.C, self.B)
            self.tD.delete(1.0, END)
            self.tD.insert(INSERT, self.D_long)
            self.t_step.delete(1.0, END)
            self.t_step.insert(INSERT, "((A∩B)∪(A\\B))= ({0} ∪ {1})" \
                                       " =\n= {2}".format((self.A & self.B), (self.A - self.B), ((self.A & self.B) | (self.A - self.B))))
            self.i += 1

        elif self.i == 3:
            self.D_long = "{0}Δ{1}".format((self.A & self.B) | (self.A - self.B), (self.C | self.B))
            self.tD.delete(1.0, END)
            self.tD.insert(INSERT, self.D_long)
            self.t_step.delete(1.0, END)
            self.t_step.insert(INSERT, "(C∪B) = ({0} ∪ {1}) " \
                                       "=\n= {2}".format(self.C, self.B, (self.C | self.B)))
            self.i += 1

        elif self.i == 4:
            self.D_long = ""
            for i in (list(((self.A & self.B) | (self.A - self.B)) ^ (self.C | self.B))):
                self.D_long = self.D_long +str(i) +" "
            self.tD.delete(1.0, END)
            self.tD.insert(INSERT,self.D_long)
            self.t_step.delete(1.0, END)
            self.t_step.insert(INSERT, "((A∩B)∪(A\\B))Δ(C∪B)= ({0}Δ{1}) " \
            "=\n= {2}".format(((self.A & self.B) | (self.A - self.B)), (self.C | self.B), ((self.A & self.B) | (self.A - self.B)) ^ (self.C | self.B)))
            self.i += 1
        else:
            self.tD.delete(1.0, END)
            self.t_step.delete(1.0, END)
            self.i = 0

    def func_short(self):
        if self.j == 0:
            self.D_short = "{0}Δ{1}\n".format(self.A , (self.C | self.B))
            self.t3D.delete(1.0, END)
            self.t3D.insert(INSERT, self.D_short)
            self.t3_step.delete(1.0, END)
            self.t3_step.insert(INSERT, "(C∪B) = ({0} ∪ {1}) " \
                                       "=\n= {2}".format(self.C, self.B, (self.C | self.B)))
            self.j += 1

        elif self.j == 1:
            self.D_short = ""
            for i in list(self.A ^ (self.C | self.B)):
                self.D_short =self.D_short + str(i) + " "
            self.t3D.delete(1.0, END)
            self.t3D.insert(INSERT,self.D_short)
            self.t3_step.delete(1.0, END)
            self.t3_step.insert(INSERT, "AΔ(C∪B)= ({0}Δ{1}) " \
            "=\n= {2}".format(self.A, (self.C | self.B), self.A ^ (self.C | self.B)))
            self.j += 1
        else:
            self.t3D.delete(1.0, END)
            self.t3_step.delete(1.0, END)
            self.j = 0

    def insert_z(self):
        self.t4Z.insert(INSERT, list(Union(No_set(list(self.C), list(self.U)), self.A)))

    def save_short(self):
        if "{" not in self.D_short and "(" not in self.D_short:
            with open(r'F:\Dima\дискретна математика\Lab_1\D_short.txt', "a", encoding="utf-8") as w:
                w.write(str(self.D_short)+"\n")

    def save_long(self):
        if "{" not in self.D_long and "(" not in self.D_long:
            with open(r'F:\Dima\дискретна математика\Lab_1\D_long.txt', "a", encoding="utf-8") as w:
                w.write(str(self.D_long)+"\n")

    def save_my(self):
        if "{" not in self.t4Z.get(1.0, END) and "(" not in self.t4Z.get(1.0, END):
            with open(r'F:\Dima\дискретна математика\Lab_1\Z.txt', "a", encoding="utf-8") as w:
                w.write(self.t4Z.get(1.0, END)+"\n")

root = Tk()
root.title("Головне меню")
variant = Main()
root.mainloop()
