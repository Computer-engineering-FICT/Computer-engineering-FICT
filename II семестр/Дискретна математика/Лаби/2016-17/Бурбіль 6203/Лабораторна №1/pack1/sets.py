from tkinter import *
from tkinter import messagebox


class Write():
    def __init__(self, top):
        self.main = top
        self.main.protocol("WM_DELETE_WINDOW", self.callback2)

        self.lab = Label(self.main, text="Множина А", font=("Rockwell Condensed", 12), bg="#272822",
                          fg="#7fe45c").place(x=75, y=29)
        self.lab1 = Label(self.main, text="Множина B", font=("Rockwell Condensed", 12), bg="#272822",
                         fg="#7fe45c").place(x=75, y=89)
        self.lab2 = Label(self.main, text="Множина C", font=("Rockwell Condensed", 12), bg="#272822",
                         fg="#7fe45c").place(x=75, y=149)

        self.entr = Entry(self.main, width=46, font=("Rockwell Condensed", 12))
        self.ent1 = Entry(self.main, width=46, font=("Rockwell Condensed", 12))
        self.ent2 = Entry(self.main, width=46, font=("Rockwell Condensed", 12))

        self.but = Button(self.main, text="Зберегти", font=("Rockwell Condensed", 12), command=self.writel,
                          bg="#7fe45c", bd=5).place(x=225, y=219)

        self.entr.place(x=195, y=29)
        self.ent1.place(x=195, y=89)
        self.ent2.place(x=195, y=149)

    def writel(self):
        with open(r"gen.txt", "w+", encoding="UTF-8") as m:

            self.c,self.b,self.d=[],[],[]

            self.a = self.entr.get()
            self.l = self.a.split(",")

            for i in range(len(self.l)):
                self.c.append(int(self.l[i]))
            self.set1 = set(self.c)
            m.write(str(self.set1)+"\n")

            self.a = self.ent1.get()
            self.l = self.a.split(",")

            for i in range(len(self.l)):
                self.b.append(int(self.l[i]))
            self.set1 = set(self.b)
            m.write(str(self.set1)+"\n")

            self.a = self.ent2.get()
            self.l = self.a.split(",")

            for i in range(len(self.l)):
                self.d.append(int(self.l[i]))
            self.set1 = set(self.d)
            m.write(str(self.set1)+"\n")

            messagebox.showinfo("Інфо", "Множини успішно створені")

    def callback2(self):
        if messagebox.askokcancel("Вихід", "Ви дійсно бажаєте вийти?"):
            messagebox.showinfo("Інфо", "Множини збережено")
            self.main.destroy()
