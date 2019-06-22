from tkinter import *
import pack1.Window2 as w2
import pack1.Eaus as ey
import os

class Window3(w2.Window2, ey.EaUS):
    def __init__(self,main):
        ey.EaUS.__init__(self)
        self.menu = main
        self.questin = [
        ("Вивести множини на екран",1),
        ("Виконання спрощеного виразу",2)]
        self.v = IntVar()
        for txt, val in self.questin:
            Radiobutton(self.menu, text=txt, variable=self.v, pady=10, value=val, bg="#272822",fg = "#7fe45c", font = ("Rockwell Condensed",9)).pack(anchor=W)
        self.buttom = Button(self.menu, text="Запуск", command = self.Choice, font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5).pack()

    def Choice(self):
        self.n = self.v.get()
        if  self.n == 1:
            self.widg1()
        else:
            self.widg2()

    def widg2(self):
        self.okno3=Toplevel(self.menu, bg="#272822")
        self.okno3.title("Спрощений вираз")
        self.okno3.geometry('675x240+500+200')

        self.lab = Label(self.okno3, text="C∪B", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab2 = Label(self.okno3, text="D", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab3 = Label(self.okno3, text="D = (A∆(C∪B))", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))

        self.entr4 = Entry(self.okno3, width=102, font=("Rockwell Condensed", 12))
        self.entr4.insert(END, self.cb)

        self.entr5 = Entry(self.okno3, width=102, font=("Rockwell Condensed", 12))
        self.entr5.insert(END, self.d)

        self.but1 = Button(self.okno3, text="Зберегти", command = self.widg3, font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5)

        self.entr4.place(x=50, y=40)
        self.entr5.place(x=50, y=80)
        self.lab.place(x=0, y=40)
        self.lab2.place(x=0, y=80)
        self.lab3.place(x=260,y=0)
        self.but1.place(x=260, y= 200)
        self.okno3.mainloop()

    def widg3(self):
        with open(r"results.txt", "w+", encoding="UTF-8") as f:
            f.write(str(self.d))
        os.system(r"results.txt")



