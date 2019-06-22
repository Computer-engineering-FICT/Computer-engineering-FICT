from tkinter import *
from tkinter import messagebox

class Student():
    def __init__(self, top):
        self.menu = top

        self.lab1 = Label(self.menu, text="Your number in group", font=("Rockwell Condensed", 14), bg="#272822",
                          fg="#7fe45c")
        self.lab2 = Label(self.menu, text="Student", font=("Rockwell Condensed", 14), bg="#272822", fg="#7fe45c")
        self.lab3 = Label(self.menu, text="Number of group", font=("Rockwell Condensed", 14), bg="#272822", fg="#7fe45c")

        self.ent = Entry(self.menu, width=28, font=("Rockwell Condensed", 14))
        self.ent1 = Entry(self.menu, width=40, font=("Rockwell Condensed", 14))
        self.ent2 = Entry(self.menu, width=40, font=("Rockwell Condensed", 14))

        self.but = Button(self.menu, text="Your variant", font=("Rockwell Condensed", 14), command=self.suma, bg="#7fe45c",
                          bd=5)

        self.lab1.place(x=50, y=105)
        self.lab2.place(x=50, y=25)
        self.lab3.place(x=50, y=65)
        self.ent.place(x=252, y=105)
        self.ent1.place(x=167, y=25)
        self.ent2.place(x=168, y=65)
        self.but.place(x=180, y=150)

    def suma(self):
        try:
            num = int(self.ent.get())
            group = int(self.ent2.get())
            var = (num + group % 60) % 30 + 1
            messagebox.showinfo("Lab work №2", "Student: "+str(self.ent1.get())+"\nGroup: ІО-"+str(group)+
            "\nYour number in group: "+str(num)+"\nVariant: "+str(var))
        except ValueError:
            messagebox.showinfo("Error","Incorrect input!")

