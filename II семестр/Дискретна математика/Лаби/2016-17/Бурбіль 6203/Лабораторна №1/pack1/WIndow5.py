from tkinter import *
from tkinter import messagebox

import pack1.Pyus as py
import pack1.Eaus as ey
import pack1.Myalg as my
import pack1.Pyalg as p
import os
class Window5(py.PyUS,ey.EaUS,my.Myal,p.Pyal):
    def __init__(self,win2):
        py.PyUS.__init__(self)
        ey.EaUS.__init__(self)
        my.Myal.__init__(self)
        p.Pyal.__init__(self)
        self.menu = win2
        self.questin = [
        ("Результат початкового виразу",1),
        ("Результат спрощеного виразу",2),
        ("Результат власного алгоритму",3),
        ("Результат вбудованих функцій",4)]
        self.menu.protocol("WM_DELETE_WINDOW", self.callback2)
        self.v = IntVar()
        for txt, val in self.questin:
            Radiobutton(self.menu, text=txt, variable=self.v, pady=10, value=val, bg="#272822",fg = "#7fe45c", font = ("Rockwell Condensed",9)).pack(anchor=W)
        self.but = Button(self.menu, text="Запуск", command = self.ShowChoice, font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5).pack()

    def ShowChoice(self):
        self.n = self.v.get()
        if self.n == 1:
            self.widg1()
        elif self.n == 2:
            self.widg2()
        elif self.n == 3:
            self.widg3()
        else:
            self.widg4()
    def widg1(self):
        self.okno5=Toplevel(self.menu, bg="#272822")
        self.okno5.title("Вивід результату вбудованих функцій")
        self.okno5.geometry('675x300+500+200')

        with open(r"result.txt", "r", encoding="UTF-8") as f:
            self.res =f.readline()

        self.lab1 = Label(self.okno5, text="Вивід", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.buter = Button(self.okno5, command = self.widg7, text="Порівняти D-множини",  font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5)

        self.entr23 = Text(self.okno5, font=("Rockwell Condensed", 14),wrap=WORD, bg = "#272822", fg = "#7fe45c",height = 8, width = 93)
        self.entr23.insert(END, "Множина D:"+str(self.res))
        self.lab1.place(x=300,y=0)
        self.entr23.place(x=10, y=40)
        self.buter.place(x=255, y=240)
        self.okno5.mainloop()

    def widg2(self):
        self.okno5=Toplevel(self.menu, bg="#272822")
        self.okno5.title("Вивід результату спрощеного виразу")
        self.okno5.geometry('675x300+500+200')

        with open(r"results.txt", "r", encoding="UTF-8") as f:
            self.res =f.readline()

        self.lab1 = Label(self.okno5, text="Вивід", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.buter = Button(self.okno5, command = self.widg7,  text="Порівняти D-множини",  font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5)

        self.entr23 = Text(self.okno5, font=("Rockwell Condensed", 14),wrap=WORD, bg = "#272822", fg = "#7fe45c",height = 8, width = 93)
        self.entr23.insert(END, "Множина D:"+str(self.res))

        self.lab1.place(x=300,y=0)
        self.entr23.place(x=10, y=40)
        self.buter.place(x=255, y=240)
        self.okno5.mainloop()

    def widg3(self):
        self.okno5=Toplevel(self.menu, bg="#272822")
        self.okno5.title("Вивід результату власного алгоритму")
        self.okno5.geometry('675x300+500+200')

        with open(r"MNOGZ.txt", "r", encoding="UTF-8") as f:
            self.res =f.readline()

        self.lab1 = Label(self.okno5, text="Вивід", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))

        self.buter = Button(self.okno5, command = self.widg6,  text="Порівняти Z-множини",
                            font = ("Rockwell Condensed",11), bg = "#7fe45c", bd = 5)

        self.entr23 = Text(self.okno5, font=("Rockwell Condensed", 14),wrap=WORD, bg="#272822",
                            fg="#7fe45c", height=8, width=93)
        self.entr23.insert(END, "Множина Z:"+str(self.res))

        self.lab1.place(x=300,y=0)
        self.entr23.place(x=10, y=40)
        self.buter.place(x=255, y=240)
        self.okno5.mainloop()

    def widg4(self):
        self.okno5=Toplevel(self.menu, bg="#272822")
        self.okno5.title("Використання вбудованих функцій")
        self.okno5.geometry('675x300+500+200')

        self.lab1 = Label(self.okno5, text="Z = X∪Y", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))

        self.entr2 = Text(self.okno5, font=("Rockwell Condensed", 14),wrap=WORD, bg = "#272822", fg = "#7fe45c",
                            height = 8, width = 93)
        self.entr2.insert(END, "Множина Z:"+str(self.z))

        self.butr = Button(self.okno5, text="Зберегти", command = self.widg5,  font = ("Rockwell Condensed",11),
                           bg = "#7fe45c", bd = 5)

        self.lab1.place(x=300,y=0)
        self.entr2.place(x=10, y=40)
        self.butr.place(x=300, y=240)
        self.okno5.mainloop()

    def widg5(self):
        with open(r"MNOGPZ.txt", "w+", encoding="UTF-8") as f:
            f.write(str(self.z))
        os.system(r"MNOGPZ.txt")
    #Порівняння Д-множин
    def widg7(self):
        self.okno5.geometry('730x300+500+200')
        self.lab1.place_forget()
        self.entr23.place_forget()
        self.buter.place_forget()
        self.entr23 = Text(self.okno5, font=("Rockwell Condensed", 12),wrap=WORD, bg = "#272822", fg = "#7fe45c",height = 8, width = 58)
        self.entr24 = Text(self.okno5, font=("Rockwell Condensed", 12),wrap=WORD, bg = "#272822", fg = "#7fe45c",height = 8, width = 58)
        with open(r"result.txt", "r", encoding="UTF-8") as f:
            self.res1 =f.readline()
        self.entr23.insert(END, str(self.res))
        with open(r"results.txt", "r", encoding="UTF-8") as f:
            self.res =f.readline()
        self.entr24.insert(END, str(self.res))


        self.lab1 = Label(self.okno5, text="Час виконання спрощеного виразу "+("{:10E}".format(self.kon - self.nach)),
                          bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab2 = Label(self.okno5, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab3 = Label(self.okno5, text="Час виконання початкового виразу "+("{:10E}".format(self.konts - self.nash)),
                          bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))

        if set(self.res) == set(self.res1):
            self.lab2.config(text = "Множини однакові")
        else:
            self.lab2.config(text = "Множини різні")

        self.lab1.place(x=0, y=220)
        self.lab2.place(x=450, y=220)
        self.lab3.place(x=0, y=240)
        self.entr23.place(x=10, y=40)
        self.entr24.place(x=370, y=40)
    #Порівняння Z-множин
    def widg6(self):
        self.okno5.geometry('730x300+500+200')
        self.lab1.place_forget()
        self.entr23.place_forget()
        self.buter.place_forget()

        self.lab1 = Label(self.okno5, text="Час виконання власного алгоритму "+("{:.10E}".format(self.z_metime - self.z_mtime)),
                          bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab2 = Label(self.okno5, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab3 = Label(self.okno5, text="Час виконання вбудованих функцій "+("{:.10E} ".format(self.enow-self.now)),
                          bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.entr23 = Text(self.okno5, font=("Rockwell Condensed", 12),wrap=WORD, bg = "#272822", fg = "#7fe45c",
                           height = 8, width = 58)
        self.entr24 = Text(self.okno5, font=("Rockwell Condensed", 12),wrap=WORD, bg = "#272822", fg = "#7fe45c",
                           height = 8, width = 58)

        with open(r"MNOGZ.txt", "r", encoding="UTF-8") as f:
            self.res1 = f.readline()
        self.entr23.insert(END, str(self.res1))

        with open(r"MNOGPZ.txt", "r", encoding="UTF-8") as f:
            self.res = f.readline()
        self.entr24.insert(END, str(self.res))

        if set(self.res) == set(self.res1):
            self.lab2.config(text="Множини однакові")
        else:
            self.lab2.config(text="Множини різні")

        self.entr23.place(x=10, y=40)
        self.entr24.place(x=370, y=40)
        self.lab1.place(x=0, y=220)
        self.lab2.place(x=450, y=220)
        self.lab3.place(x=0, y=240)
    def callback2(self):
        if messagebox.askokcancel("Вихід", "Ви дійсно бажаєте вийти?"):
            self.menu.destroy()
