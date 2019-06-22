from tkinter import *
import random as r
from tkinter import messagebox

root = Tk()
class Lab5:
    def __init__(self, menu):
        self.menu = menu
        self.menu.geometry('500x300+500+200')
        self.menu.config(bg="#272822")
        self.menu.title("Menu")

        self.lab = Label(self.menu, text="Початкова послідовність", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab1 = Label(self.menu, text="Потужність множини", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.lab2 = Label(self.menu, text="Число для пошуку", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.ent = Label(self.menu, text = "(00,01,11,10)", width=10, font=("Rockwell Condensed", 12))
        self.ent1 = Entry(self.menu, width=5, font=("Rockwell Condensed", 10))
        self.ent2 = Entry(self.menu, width=25, font=("Rockwell Condensed", 12))
        self.but = Button(self.menu, text="Побудувати код Грея", command = self.gray_code, font=("Rockwell Condensed", 10), bg="#7fe45c", bd=5)

        self.lab.place(x=55, y=30)
        self.lab1.place(x=55, y=80)
        self.lab2.place(x=55, y=130)
        self.but.place(x=227, y=180)
        self.ent.place(x=290, y=30)
        self.ent1.place(x=290, y=80)
        self.ent2.place(x=290, y=130)
        self.menu.mainloop()

    def gray_code(self):
        c = int(self.ent1.get())
        b = self.ent2.get()
        if len(b) == c:
            self.lab.place_forget()
            self.lab1.place_forget()
            self.lab2.place_forget()
            self.ent.place_forget()
            self.ent1.place_forget()
            self.ent2.place_forget()
            self.but.place_forget()
            self.entr = Text(self.menu, font=("Rockwell Condensed", 14),wrap=WORD, bg = "#272822", fg = "#7fe45c",height = 8, width = 71)
            self.entr.place(x=0, y=10)

            with open(r"city.txt", "r", encoding="UTF-8") as f:
                self.a = str(f.readline())
                self.a = self.a.split(", ")
            l = r.sample(self.a, c)

            h = ["00", "01", "11", "10"]
            k = h[::-1]
            j = 0
            while j < c-2:
                for i in range(len(h)):
                    h[i] = "0" + h[i]
                for i in range(len(k)):
                    k[i] = "1" + k[i]
                h += k
                k = h[::-1]
                j += 1
            result = []
            for i in range(len(b)):
                if b[i] == "1":
                    result.append(l[i])

            self.entr.insert(END, "Послідовність в коді Грея:\n")
            self.entr.insert(END, h)
            self.entr.insert(END, "\n"+"Підмножина:\n")
            self.entr.insert(END, result)
            self.entr.insert(END, "\nМножина:\n")
            self.entr.insert(END, l)

        else:
            messagebox.showerror("Помилка", "Число повинно бути в двійковій системі %i розрядним"%(c))


c = Lab5(root)
