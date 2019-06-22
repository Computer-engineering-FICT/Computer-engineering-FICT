from tkinter import *
from tkinter import messagebox
import random

import pack1.infostudent as vid1
import pack1.universal as vid5
import pack1.Power as vid2
import pack1.sets as vid4

import pack1.Window2 as w2
import pack1.Window3 as w3
import pack1.Window4 as w4
import pack1.WIndow5 as w5


class Lab:
    def __init__(self,root):
        self.menu = root
        self.menu.geometry('500x300+500+200')
        self.menu.config(bg="#272822")
        self.menu.title("Меню")
        self.menu.protocol("WM_DELETE_WINDOW", self.callback2)
        self.quest = Label(self.menu, text="Доброго дня:)\nВиберіть задачу: ", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed",9))
        self.quest.pack()
        self.v = IntVar()
        self.menubar = Menu(self.menu)
        self.menubar.add_command(label="Вікно №2", command = self.Window2)
        self.menubar.add_command(label="Вікно №3", command = self.Window3)
        self.menubar.add_command(label="Вікно №4", command = self.Window4)
        self.menubar.add_command(label="Вікно №5", command = self.Window5)
        self.menu.config(menu=self.menubar)
        self.questin = [("Інформація про студента",1),
                    ("Задати потужність множин",2),
                    ("Ручний ввід множин",3),
                    ("Задати універсальну множину",4),
                    ("Згенерувати множини",5)]
        for txt, val in self.questin:
            Radiobutton(self.menu, text=txt, variable=self.v, pady=10, value=val, bg="#272822",fg = "#7fe45c", font = ("Rockwell Condensed",9)).pack(anchor=W)
        self.but = Button(self.menu, text="Запуск", font = ("Rockwell Condensed",11), command=self.ShowChoice, bg = "#7fe45c", bd = 5).pack()

        self.menu.mainloop()
    def callback2(self):
        if messagebox.askokcancel("Вихід", "Ви дійсно бажаєте вийти?"):
            self.menu.destroy()


    def ShowChoice(self):
        self.n=self.v.get()
        if  self.n == 1:
            top1 = Toplevel(self.menu, bg ="#272822")
            top1.geometry('500x200+500+200')
            top1.title("Студент")
            l = vid1.Student(top1)
            top1.mainloop()
        elif self.n == 2:
            top = Toplevel(self.menu, bg ="#272822")
            top.geometry('500x300+500+200')
            top.title("Потужність множин")
            c = vid2.Capacity(top)
            top.mainloop()

        elif self.n == 3:
            top4 = Toplevel(self.menu, bg="#272822")
            top4.geometry('500x300+500+200')
            top4.title("Генератор множин")
            h = vid4.Write(top4)
            top4.mainloop()
        elif self.n == 4:
            top5 = Toplevel(self.menu, bg="#272822")
            top5.geometry('500x300+500+200')
            top5.title("")
            i = vid5.Universal(top5)
            top5.mainloop()
        else:
            self.gen()

    def Window2(self):
        top = Toplevel(self.menu, bg ="#272822")
        top.geometry('500x200+500+200')
        top.title("Вікно №2")
        l = w2.Window2(top)

    def Window3(self):
        top = Toplevel(self.menu, bg ="#272822")
        top.geometry('500x200+500+200')
        top.title("Вікно №3")
        l = w3.Window3(top)
    def Window4(self):
        top = Toplevel(self.menu, bg ="#272822")
        top.geometry('500x200+500+200')
        top.title("Вікно №4")
        l = w4.Window4(top)
    def Window5(self):
        top = Toplevel(self.menu, bg ="#272822")
        top.geometry('500x300+500+200')
        top.title("Вікно №5")
        l = w5.Window5(top)
    def gen(self):
        try:
            with open(r"power.txt", "r") as f:
                with open(r"gen.txt", "w+", encoding="UTF-8") as m:
                    a = f.readlines()
                    c = int(a[0])
                    b = int(a[1])
                    n = int(a[2])
                    l = []
                    for i in range(c):
                        s = random.randint(0, 2000)
                        l.append(s)
                    set1 = set(l)
                    m.write(str(set1) + "\n")
                    l = []
                    for i in range(b):
                        s = random.randint(0, 2000)
                        l.append(s)
                    set1 = set(l)
                    m.write(str(set1) + "\n")
                    l = []
                    for i in range(n):
                        s = random.randint(0, 2000)
                        l.append(s)
                    set1 = set(l)
                    m.write(str(set1) + "\n")
                    messagebox.showinfo("Інфо", "Множини успішно створені")

        except IndexError:
            messagebox.showerror("Помилка", "Не задано потужності множин")




