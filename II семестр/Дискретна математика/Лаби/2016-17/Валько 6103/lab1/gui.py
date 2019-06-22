from tkinter import *
from random import *
import DM_Labs.lab1.my_alg
import time


class Main():
    def __init__(self):
        self.m1 = Menu(root)
        self.m2 = Menu(self.m1, tearoff=0, bg="black", fg="yellow")
        self.m2.add_command(label="Вікно 2", command=self.win2)
        self.m2.add_command(label="Вікно 3", command=self.win3)
        self.m2.add_command(label="Вікно 4", command=self.win4)
        self.m2.add_command(label="Вікно 5", command=self.win5)
        self.m2.add_separator()
        self.m2.add_command(label="Вийти", command=root.quit)
        self.m1.add_cascade(label="Відкрити вікна", menu=self.m2)
        root.config(menu=self.m1)

        self.lab = Label(root, text=" Валько Антон Вікторович          Група: ІО-61         "
                                    "Номер у списку групи: 3           Варіант: 5",
                         height=3, font=("Impact", 18))
        self.lab.grid(row=0, column=0, columnspan=5)
        self.lab1 = Label(root, text="Задайте потужність множини А :")
        self.lab2 = Label(root, text="Задайте потужність множини В :")
        self.lab3 = Label(root, text="Задайте потужність множини С :")
        self.lab1.grid(row=1, column=0)
        self.lab2.grid(row=1, column=1)
        self.lab3.grid(row=1, column=2)
        self.ent1 = Entry(root)
        self.ent2 = Entry(root)
        self.ent3 = Entry(root)
        self.ent1.grid(row=2, column=0)
        self.ent2.grid(row=2, column=1)
        self.ent3.grid(row=2, column=2)
        self.but1 = Button(root, text="    Отримати значення потужності    ", bg="black", fg="yellow")
        self.but1.bind("<Button-1>", self.getpower)
        self.but1.grid(row=2, column=4)
        self.lab000 = Label(root)
        self.lab000.grid(row=4, columnspan=5)
        self.lab6 = Label(root, text="Задати діазон множини від 0 до 255:")
        self.lab6.grid(row=5, column=0)
        self.entq = Entry(root)
        self.entqq = Button(root, text="Сформувати універсальну множину", bg="black", fg="yellow")
        self.entqq.bind("<Button-1>", self.rng)
        self.entq.grid(row=5, column=1)
        self.entqq.grid(row=5, column=4)
        self.lab100 = Label(root, width=135, height=2)
        self.lab100.grid(row=6, column=0, columnspan=5)
        self.lab11 = Label(root, text="        Множина А :        ",)
        self.lab22 = Label(root, text="        Множина В :        ",)
        self.lab33 = Label(root, text="        Множина С :        ",)
        self.lab11.grid(row=7, column=0)
        self.lab22.grid(row=7, column=1)
        self.lab33.grid(row=7, column=2)
        self.ent11 = Entry(root)
        self.ent22 = Entry(root)
        self.ent33 = Entry(root)
        self.ent11.grid(row=8, column=0)
        self.ent22.grid(row=8, column=1)
        self.ent33.grid(row=8, column=2)
        self.lab001 = Label(root)
        self.lab001.grid(row=9, column=0)
        self.but3 = Button(root, text="Сформувати множини власноруч", bg="black", fg="yellow")
        self.but3.bind("<Button-1>", self.handleset)
        self.but3.grid(row=8, column=4)
        self.but2 = Button(root, text="Сформувати множини випадковим чином", bg="black", fg="yellow")
        self.but2.bind("<Button - 1>", self.ranset)
        self.but2.grid(row=10, column=4)

    def getpower(self, event):
        self.pA = self.ent1.get()
        self.pB = self.ent2.get()
        self.pC = self.ent3.get()

    def rng(self, event):
        self.U = {int(i) for i in range(int(self.entq.get())+1)}

    def win2(self):
        self.took = Tk()
        self.took.title("Друге вікно")
        self.took.geometry("375x275")
        try:
            self.SETA = self.setA
            self.SETB = self.setB
            self.SETC = self.setC
            self.SETU = self.U
        except AttributeError:
            self.SETA = self.ransetA
            self.SETB = self.ransetB
            self.SETC = self.ransetC
            self.SETU = self.U

        self.lab1 = Label(self.took, text="Множина А: \n" + str(self.SETA)[1:-1])
        self.lab2 = Label(self.took, text="Множина В: \n" + str(self.SETB)[1:-1])
        self.lab3 = Label(self.took, text="Множина С: \n" + str(self.SETC)[1:-1])

        self.lab1.grid(row=1, column=0)
        self.lab2.grid(row=1, column=2)
        self.lab3.grid(row=1, column=4)

        self.but00 = Button(self.took, text="Крок 1:", bg="black", fg="yellow", width=8)
        self.but01 = Button(self.took, text="Крок 2:", bg="black", fg="yellow", width=8)
        self.but02 = Button(self.took, text="Крок 3:", bg="black", fg="yellow", width=8)
        self.but03 = Button(self.took, text="Крок 4:", bg="black", fg="yellow", width=8)
        self.but04 = Button(self.took, text="Крок 5:", bg="black", fg="yellow", width=8)

        self.but00.bind("<Button-1>", self.showsteps0)
        self.but01.bind("<Button-1>", self.showsteps1)
        self.but02.bind("<Button-1>", self.showsteps2)
        self.but03.bind("<Button-1>", self.showsteps3)
        self.but04.bind("<Button-1>", self.showsteps4)

        self.but00.grid(row=2, column=0)
        self.but01.grid(row=2, column=1)
        self.but02.grid(row=2, column=2)
        self.but03.grid(row=2, column=3)
        self.but04.grid(row=2, column=4)

        self.lab11 = Label(self.took)
        self.lab22 = Label(self.took)
        self.lab33 = Label(self.took)
        self.lab44 = Label(self.took)
        self.lab55 = Label(self.took)

        self.lab11.grid(row=4, column=0, columnspan=6, sticky="w")
        self.lab22.grid(row=5, column=0, columnspan=6, sticky="w")
        self.lab33.grid(row=6, column=0, columnspan=6, sticky="w")
        self.lab44.grid(row=7, column=0, columnspan=6, sticky="w")
        self.lab55.grid(row=8, column=0, columnspan=6, sticky="w")

        self.labD = Label(self.took, height=3)
        self.labD.grid(row=9, column=0, columnspan=3, sticky="w")

        self.but06 = Button(self.took, text="Зберегти результат у файл", bg="black", fg="yellow")
        self.but06.bind("<Button-1>", self.saveres)

    def win3(self):
        self.root3 = Tk()
        self.root3.grid()
        self.root3.title("Третє вікно")
        self.root3.geometry("250x270")
        self.lab0 = Label(self.root3, width=60)
        self.lab0.grid(row=0, column=0, columnspan=5)
        try:
            self.SETA = self.setA
            self.SETB = self.setB
            self.SETC = self.setC
            self.SETU = self.U
        except AttributeError:
            self.SETA = self.ransetA
            self.SETB = self.ransetB
            self.SETC = self.ransetC
            self.SETU = self.U

        self.lab1 = Label(self.root3, text="Множина А: \n" + str(self.SETA)[1:-1])
        self.lab2 = Label(self.root3, text="Множина В: \n" + str(self.SETB)[1:-1])
        self.lab3 = Label(self.root3, text="Множина С: \n" + str(self.SETC)[1:-1])

        self.lab1.grid(row=1, column=0)
        self.lab2.grid(row=2, column=0)
        self.lab3.grid(row=3, column=0)

        self.but01 = Button(self.root3, text="Крок 1:", bg="black", fg="yellow")
        self.but02 = Button(self.root3, text="Крок 2:", bg="black", fg="yellow")
        self.but01.bind("<Button-1>", self.showsteps00)
        self.but02.bind("<Button-1>", self.showsteps22)

        self.but01.grid(row=1, column=1)
        self.but02.grid(row=3, column=1)

        self.lab11 = Label(self.root3)
        self.lab00 = Label(self.root3)
        self.lab11.grid(row=5, column=0, columnspan=5, sticky="w")
        self.lab00.grid(row=4, column=0, columnspan=5, sticky="w")
        self.lab3 = Label(self.root3, width=30, height=2)

        self.lab3.grid(row=6, column=0, columnspan=3, sticky="w")
        self.but03 = Button(self.root3, text="Зберегти результат у файл", bg="black", fg="yellow")
        self.but03.bind("<Button-1>", self.saveres2)

    def win4(self):
        self.root4 = Tk()
        self.root4.grid()
        self.root4.title("Четверте вікно")
        self.root4.geometry("300x200")
        try:
            self.SETB = self.setB
            self.SETC = self.setC
        except AttributeError:
            self.SETB = self.ransetB
            self.SETC = self.ransetC

        self.lab1 = Label(self.root4, text="Множина B: \n" + str(self.SETB)[1:-1])
        self.lab2 = Label(self.root4, text="Множина C: \n" + str(self.SETC)[1:-1])

        self.labf = Label(self.root4, width=60)
        self.labf.grid(row=0, column=0, columnspan=4)
        self.lab1.grid(row=1, column=0, columnspan=1)
        self.lab2.grid(row=1, column=1, columnspan=1)
        self.but = Button(self.root4, text="Отримати множину Z", bg="black", fg="yellow")
        self.but.grid(row=2, column=0, columnspan=2)
        self.but.bind("<Button-1>", self.setZ)
        self.lab3 = Label(self.root4, height=2, width=30)
        self.lab3.grid(row=3, column=0, columnspan=2)
        self.but1 = Button(self.root4, text="Зберегти результат у файл", bg="black", fg="yellow")

        self.but1.bind("<Button-1>", self.saveres3)

    def win5(self):
        self.root5 = Tk()
        self.root5.grid()
        self.root5.title("П'яте вікно")
        self.root5.geometry("470x450")
        self.lab1 = Label(self.root5, width=120)
        self.lab1.grid(row=0, column=0, columnspan=5)
        self.but1 = Button(self.root5, text="Результат початкового виразу", bg="black", fg="yellow")
        self.but1.bind("<Button-1>", self.getres1)
        self.but1.grid(row=1, column=0, sticky="w")
        self.lab2 = Label(self.root5, height=2)
        self.lab2.grid(row=2, column=0, sticky="w")
        self.but2 = Button(self.root5, text="Результат спрощеного виразу", bg="black", fg="yellow")
        self.but2.bind("<Button-1>", self.getres2)
        self.but2.grid(row=3, column=0, sticky="w")
        self.lab3 = Label(self.root5, height=2)
        self.lab3.grid(row=4, column=0, sticky="w")
        self.lab4 = Label(self.root5, width=120)
        self.lab4.grid(row=5, column=0, columnspan=5)
        self.but3 = Button(self.root5, text="Множину Z за власною функцією", bg="black", fg="yellow")
        self.but3.grid(row=5, column=0,sticky="w")
        self.but3.bind("<Button-1>", self.getres3)
        self.lab5 = Label(self.root5, height=2)
        self.lab5.grid(row=6, column=0, sticky="w")
        self.but6 = Button(self.root5, text="Множину Z за стандартною функцією", bg="black", fg="yellow")
        self.but6.grid(row=7, column=0, sticky="w")
        self.but6.bind("<Button-1>", self.getres4)
        self.lab7 = Label(self.root5, height=2)
        self.lab7.grid(row=8, column=0, sticky="w")
        self.but7 = Button(self.root5, text="Прирівняти отримані значення", bg="black", fg="yellow")
        self.but7.bind("<Button-1>", self.equal1)
        self.lab8 = Label(self.root5, height=2)
        self.lab8.grid(row=11, column=0, columnspan=2)

        self.lab9 = Label(self.root5, width=120)
        self.lab9.grid(row=13, column=0, columnspan=5)
        self.but8 = Button(self.root5, text="Час виконання власної функції та стандартної: ", bg="black", fg="yellow")
        self.but8.bind("<Button-1>", self.gettime1)
        self.lab10 = Label(self.root5)
        self.lab10.grid(row=14, column=0, columnspan=2)


    def handleset(self, event):
        self.lastsetA = self.ent11.get()
        self.lastsetB = self.ent22.get()
        self.lastsetC = self.ent33.get()
        self.q = self.lastsetA.split(" ")
        self.w = self.lastsetB.split(" ")
        self.r = self.lastsetC.split(" ")
        self.setA = {int(i) for i in self.q}
        self.setB = {int(i) for i in self.w}
        self.setC = {int(i) for i in self.r}

    def ranset(self, event):
        self.ransetA = {randint(0,int(self.entq.get())) for i in range(int(self.pA))}
        self.ransetB = {randint(0,int(self.entq.get())) for i in range(int(self.pB))}
        self.ransetC = {randint(0,int(self.entq.get())) for i in range(int(self.pC))}

    # Функції вікна 2
    def showsteps0(self,event):
        self.neA = self.SETU.difference(self.SETA)
        self.op1 = self.neA.intersection(self.SETB)
        self.text1 = "1. ¬A ∩ B = {0}".format(self.op1)
        if self.op1 == set():
            self.lab11["text"] = "1. ¬A ∩ B = {0}".format("{}")
        else:
            self.lab11["text"] = self.text1

    def showsteps1(self, event):
        self.op2 = self.SETA.union(self.op1)
        self.text2 = "2. A ∪ (¬A ∩ B) = {0}".format(self.op2)
        self.lab22["text"] = self.text2

    def showsteps2(self, event):
        self.op3 = self.SETC.intersection(self.SETB)
        self.text3 = "3. C  ∩  B = {0}".format(self.op3)
        if self.op3 == set():
            self.lab33["text"] = "3. C  ∩  B = {0}".format("{}")
        else:
            self.lab33["text"] = self.text3

    def showsteps3(self, event):
        self.op4 = self.SETC.union(self.op3)
        self.text4 = "4. C ∪ (C  ∩  B) = {0}".format(self.op4)
        self.lab44["text"] = self.text4

    def showsteps4(self, event):
        self.op5 = self.op2.symmetric_difference(self.op4)
        if self.op5 == set():
            self.lab55["text"] = "5. (A ∪ (¬A ∩ B)) Δ (C ∪ (C  ∩  B)) = {0}".format("{}")
            self.labD["text"] = "Множина D =  ∅ "
        else:
            self.lab55["text"] = "5. (A ∪ (¬A ∩ B)) Δ (C ∪ (C  ∩  B)) = {0}".format(self.op5)
            self.labD["text"] = "Множина D = {0}".format(self.op5)
        self.labD.config(width=30, bd=3)
        self.but06.grid(row=10, column=0, columnspan=3, sticky="w")

    def saveres(self, event):
        with open(r"D:\\Python.Programs\\DM_Labs\\lab1\\file1.txt", 'w') as f:
            f.write(str(self.op5))
        self.lab1111 = Label(self.took, text="Збережено!")
        self.lab1111.grid(row=11, column=0, columnspan=3)

    # Функції вікна 3
    def showsteps00(self, event):
        self.op1 = self.SETA.union(self.SETB)
        self.textx = "1. A ∪ B  = {0}".format(self.op1)
        self.lab00["text"] = self.textx

    def showsteps22(self,event):
        self.op2 = self.op1.symmetric_difference(self.SETC)
        if self.op2 == set():
            self.text1 = "2. (A ∪ B) Δ C = {0}".format("{}")
            self.lab11["text"] = self.text1
            self.lab3["text"] = "Множина D = ∅ "
        else:
            self.text1 = "2. (A ∪ B) Δ C = {0}".format(self.op2)
            self.lab11["text"] = self.text1
            self.lab3["text"] = "Множина D : {0}".format(self.op2)
        self.but03.grid(row=7, column=0, columnspan=3, sticky="w")

    def saveres2(self, event):
        with open (r"D:\\Python.Programs\\DM_Labs\\lab1\\file2.txt", 'w') as f:
            f.write(str(self.op2))
        self.lab11111 = Label(self.root3, text=" Збережено!", width=20)
        self.lab11111.grid(row=8, column=0, columnspan=2)

    # Функції вікна 4
    def setZ(self, event):
        self.SETZ = DM_Labs.lab1.my_alg.differ(self.SETB, self.SETC)
        self.lab3["text"] = "Множина Z = {0}".format(self.SETZ)
        self.but1.grid(row=4, column=0, columnspan=2)

    def saveres3(self, event):
        with open(r"D:\\Python.Programs\\DM_Labs\\lab1\\file3.txt", 'w') as f:
            f.write(str(self.SETZ))
        self.lab11111 = Label(self.root4, text=" Збережено!", width=20)
        self.lab11111.grid(row=5, column=0, columnspan=2)

    # Функції вікна 5
    def getres1(self, event):
        with open(r"D:\\Python.Programs\\DM_Labs\\lab1\\file1.txt", 'r') as f:
            self.res1 = f.read()
        self.lab2["text"] = "Множина D = {0}".format(self.res1)

    def getres2(self, event):
        with open(r"D:\\Python.Programs\\DM_Labs\\lab1\\file2.txt", 'r') as f:
            self.res2 = f.read()
        self.lab3["text"] = "Множина D = {0}".format(self.res2)

    def getres3(self, event):
        with open(r"D:\\Python.Programs\\DM_Labs\\lab1\\file3.txt", 'r') as f:
            self.res3 = f.read()
        self.lab5["text"] = "Множина Z = {0}".format(self.res3)

    def getres4(self, event):
        self.res4 = self.SETB.difference(self.SETC)
        self.lab7["text"] = "Множина Z = {0}".format(self.SETB.difference(self.SETC))
        self.but7.grid(row=10, column=0, columnspan=2)

    def equal1(self, event):
        if (self.getset(self.res1) == self.getset(self.res2)) & (self.getset(self.res3) == self.res4):
            self.res5 = "Результати еквівалентні, вирази обчислено правильно"
            self.lab8.config(text=self.res5)
        else:
            self.lab8.config(text="Вирази спрощено неправильно", font=("Arial", 12))
        self.but8.grid(row=15, column=0, columnspan=2)

    def getset(self, A):
        B = A[1:len(A)-1]
        B = B.replace(",", "")
        B = B.split(" ")
        B = {int(i) for i in B}
        return B

    def gettime1(self, event):
        self.t1 = time.clock()
        DM_Labs.lab1.my_alg.differ(self.SETA, self.SETB)
        self.t2 = time.clock()
        self.t3 = time.clock()
        self.SETA.difference(self.SETB)
        self.t4 = time.clock()
        self.lab10["text"] = "Моя функція : %f сек\nСтандартна функція : %f сек" % ((self.t2 - self.t1),(self.t4 - self.t3))

root = Tk()
root.title("Перше вікно")
root.geometry("950x350")
ob1 = Main()
root.mainloop()
