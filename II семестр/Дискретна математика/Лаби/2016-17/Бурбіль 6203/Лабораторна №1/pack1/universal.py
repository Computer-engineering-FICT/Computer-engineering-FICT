from tkinter import *
from tkinter import messagebox

class Universal():
    def __init__(self,top):
        self.main = top
        self.main.protocol("WM_DELETE_WINDOW", self.callback2)

        self.lab = Label(self.main, text="Діапазон універсальної множини", font=("Rockwell Condensed", 10), bg="#272822",
                         fg="#7fe45c").place(x=125, y=19)
        self.lab1 = Label(self.main, text="Початок", font=("Rockwell Condensed", 12), bg="#272822",
                         fg="#7fe45c").place(x=65, y=69)
        self.lab2 = Label(self.main, text="Кінець", font=("Rockwell Condensed", 12), bg="#272822",
                         fg="#7fe45c").place(x=65, y=109)
        self.lab3 = Label(self.main, text="Крок", font=("Rockwell Condensed", 12), bg="#272822",
                         fg="#7fe45c").place(x=65, y=149)

        self.ent = Entry(self.main, width=38, font=("Rockwell Condensed", 12))
        self.ent1 = Entry(self.main, width=41, font=("Rockwell Condensed", 12))
        self.ent2 = Entry(self.main, width=43, font=("Rockwell Condensed", 12))

        self.but = Button(self.main, text="Згенерувати", font=("Rockwell Condensed", 11), bg="#7fe45c", bd=5,
                          command=self.gen).place(x=195, y=209)

        self.ent.place(x=145, y=69)
        self.ent1.place(x=128, y=109)
        self.ent2.place(x=115, y=149)
    def gen(self):
        with open(r"range.txt", "w+", encoding="UTF-8") as m:
            l =[]
            try:
                for i in range(int(self.ent.get()),int(self.ent1.get()),int(self.ent2.get())):
                    l.append(i)
                set1 = set(l)
                messagebox.showinfo("Інфо", "Діапазон успішно згенерований")
            except ValueError:
                messagebox.showerror("Помилка", "Необхідно заповнити всі поля")
            m.write(str(set1))
    def callback2(self):
        if messagebox.askokcancel("Вихід", "Ви дійсно бажаєте вийти?"):
            messagebox.showinfo("Інфо", "Діапазон збережено")
            self.main.destroy()
