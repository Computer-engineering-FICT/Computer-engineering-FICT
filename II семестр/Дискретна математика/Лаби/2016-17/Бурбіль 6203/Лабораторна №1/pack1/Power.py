from tkinter import *
from tkinter import messagebox

class Capacity():
    def __init__(self,top):
        self.window = top
        self.window.protocol("WM_DELETE_WINDOW", self.callback2)
        self.mnog1 = Label(self.window, text="Потужність множини А ", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 10))
        self.mnog2 = Label(self.window, text="Потужність множини В ", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 10))
        self.mnog3 = Label(self.window, text="Потужність множини С ", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 10))

        self.entr1 = Entry(self.window, font=("Rockwell Condensed", 10))
        self.entr2 = Entry(self.window, font=("Rockwell Condensed", 10))
        self.entr3 = Entry(self.window, font=("Rockwell Condensed", 10))

        self.but1 = Button(self.window, text="Записати", font=("Rockwell Condensed", 10), bg="#7fe45c", bd=5)


        self.but1.bind("<Button-1>", self.zapis)


        self.mnog1.place(x=50, y=25)
        self.entr1.place(x=210, y=25)
        self.mnog2.place(x=50, y=105)
        self.entr2.place(x=210, y=105)
        self.but1.place(x=370, y=101)
        self.mnog3.place(x=50, y=185)
        self.entr3.place(x=210, y=185)


    def zapis(self,event):
        with open(r"power.txt", "w+", encoding="UTF-8") as f:
            f.write(str(self.entr1.get())+"\n"+str(self.entr2.get())+"\n"+str(self.entr3.get())+"\n")



    def callback2(self):
        if messagebox.askokcancel("Вихід", "Ви дійсно бажаєте вийти?"):
            messagebox.showinfo("Інфо", "Потужність збережено ")
            self.window.destroy()
