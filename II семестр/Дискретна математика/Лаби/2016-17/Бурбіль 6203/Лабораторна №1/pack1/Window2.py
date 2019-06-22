from tkinter import *
from tkinter import messagebox
import os
import pack1.Pyus as py
class Window2(py.PyUS):
    def __init__(self,win2):
        super().__init__()
        self.menu = win2
        self.questin = [
        ("Вивести множини на екран",1),
        ("Виконання початкового виразу",2)]
        self.v = IntVar()
        for txt, val in self.questin:
            Radiobutton(self.menu, text=txt, variable=self.v, pady=10, value=val, bg="#272822",fg = "#7fe45c", font = ("Rockwell Condensed",9)).pack(anchor=W)
        self.but = Button(self.menu, text="Запуск", command = self.ShowChoice, font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5).pack()

    def ShowChoice(self):
        self.n = self.v.get()
        if  self.n == 1:
            self.widg1()
        else:
            self.widg2()

    def widg1(self):
        self.okno2=Toplevel(self.menu, bg="#272822")
        self.okno2.title("Вивід")
        self.okno2.geometry('600x300+500+200')

        with open(r"gen.txt", "r", encoding="UTF-8")as f:
            try:
                self.a = f.readline()
                self.b = f.readline()
                self.c = f.readline()

                self.ent1 = Text(self.okno2, font=("Rockwell Condensed", 14), wrap=WORD, bg = "#272822", fg = "#7fe45c", )
                self.ent1.pack(fill = BOTH)

                self.ent1.insert(END,"Множина А: "+str(self.a)+"\n")
                self.ent1.insert(END,"Множина B: "+str(self.b)+"\n")
                self.ent1.insert(END,"Множина C: "+str(self.c)+"\n")
            except IndexError:
                self.okno2.destroy()
                messagebox.showerror("Помилка","Множини не задані!")
        self.okno2.mainloop()
    def widg2(self):

        self.okno2=Toplevel(self.menu, bg="#272822")
        self.okno2.title("Множина D")
        self.okno2.geometry('675x300+500+200')

        self.lab = Label(self.okno2, text="A∩B", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab1 = Label(self.okno2, text="A\\B", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab2 = Label(self.okno2, text="(A∩B)∪(A\\B)", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab3 = Label(self.okno2, text="C∪B", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab4 = Label(self.okno2, text="D", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab5 = Label(self.okno2, text="D = ((A∩B)∪(A\\B))∆(C∪B)", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))

        self.entr1 = Entry(self.okno2, width=102, font=("Rockwell Condensed", 12))
        self.entr1.insert(END, self.ab)

        self.entr2 = Entry(self.okno2, width=102, font=("Rockwell Condensed", 12))
        self.entr2.insert(END, self.a_b)

        self.entr3 = Entry(self.okno2, width=92, font=("Rockwell Condensed", 12))
        self.entr3.insert(END, self.aunb)

        self.entr4 = Entry(self.okno2, width=102, font=("Rockwell Condensed", 12))
        self.entr4.insert(END, self.cb)

        self.entr5 = Entry(self.okno2, width=102, font=("Rockwell Condensed", 12))
        self.entr5.insert(END, self.d)

        self.but1 = Button(self.okno2, text="Зберегти", command = self.widg3, font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5)

        self.entr1.place(x=50, y=40)
        self.entr2.place(x=50, y=80)
        self.entr3.place(x=110, y=120)
        self.entr4.place(x=50, y=160)
        self.entr5.place(x=50, y=200)
        self.lab.place(x=0, y=40)
        self.lab1.place(x=0, y=80)
        self.lab2.place(x=0, y=120)
        self.lab3.place(x=0, y=160)
        self.lab4.place(x=0, y=200)
        self.lab5.place(x=260,y=0)
        self.but1.place(x=260, y= 240)
        self.okno2.mainloop()

    def widg3(self):
        with open(r"result.txt", "w+", encoding="UTF-8") as f:
            f.write(str(self.d))
        os.system(r"result.txt")
