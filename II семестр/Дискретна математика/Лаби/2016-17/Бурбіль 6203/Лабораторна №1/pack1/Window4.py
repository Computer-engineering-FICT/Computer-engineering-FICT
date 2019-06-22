from tkinter import *
from tkinter import messagebox
import pack1.Myalg as my
import os

class Window4(my.Myal):
    def __init__(self,win2):
        my.Myal.__init__(self)
        self.menu = win2
        self.questin = [
        ("Вивести множини на екран",1),
        ("Виконання виразу через власну функцію",2)]
        self.menu.protocol("WM_DELETE_WINDOW", self.callback2)
        self.v = IntVar()
        for txt, val in self.questin:
            Radiobutton(self.menu, text=txt, variable=self.v, pady=10, value=val, bg="#272822",fg = "#7fe45c", font = ("Rockwell Condensed",9)).pack(anchor=W)
        self.but = Button(self.menu, text="Запуск", command = self.Choice, font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5).pack()

    def Choice(self):
        self.n = self.v.get()
        if  self.n == 1:
            self.widg1()
        else:
            self.widg2()

    def widg1(self):
        self.okno2=Toplevel(self.menu, bg="#272822")
        self.okno2.title("Вивід")
        self.okno2.geometry('675x300+500+200')

        self.ent1 = Text(self.okno2, font=("Rockwell Condensed", 14), wrap=WORD, bg = "#272822", fg = "#7fe45c", )
        self.ent1.pack(fill = BOTH)

        self.ent1.insert(END,"Множина Y: "+str(self.y)+"\n")
        self.ent1.insert(END,"Множина X: "+str(self.x)+"\n")

    def widg2(self):
        self.okno2=Toplevel(self.menu, bg="#272822")
        self.okno2.title("Власний алгоритм")
        self.okno2.geometry('701x300+500+200')

        self.lab1 = Label(self.okno2, text="Z = X∪Y", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))

        self.entr233 = Text(self.okno2, font=("Rockwell Condensed", 14),wrap=WORD, bg = "#272822", fg = "#7fe45c",height = 8, width = 100)
        self.entr233.insert(END, self.val)

        self.but = Button(self.okno2, text="Зберегти", command = self.widg3, font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5)

        self.lab1.place(x=300,y=0)
        self.entr233.place(x=0, y=40)
        self.but.place(x=300, y=240)

    def widg3(self):
        with open(r"MNOGZ.txt", "w+", encoding="UTF-8") as f:
            f.write(str(self.val))
        os.system(r"MNOGZ.txt")
    def callback2(self):
        if messagebox.askokcancel("Вихід", "Ви дійсно бажаєте вийти?"):
            self.menu.destroy()
