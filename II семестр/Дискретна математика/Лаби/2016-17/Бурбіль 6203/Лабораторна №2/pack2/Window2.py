from tkinter import *
from tkinter import messagebox
class Window2:
    def __init__(self,top):
        self.main = top
        self.listbox = Listbox(self.main,height=15,width=20,font=("Rockwell Condensed",14),selectmode=MULTIPLE)
        self.listbox2 = Listbox(self.main,height=15,width=20,font=("Rockwell Condensed",14),selectmode=MULTIPLE)
        self.listbox3 = Listbox(self.main,height=10,width=20,font=("Rockwell Condensed",14),selectmode=EXTENDED)
        self.listbox4 = Listbox(self.main,height=10,width=20,font=("Rockwell Condensed",14),selectmode=EXTENDED)
        self.quest = Label(self.main, text="Write to set\n", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed",16)).pack()
        self.questin = [("Set А",1),
                    ("Set В",2)]
        self.v = IntVar()
        for txt, val in self.questin:
            Radiobutton(self.main, text=txt, variable=self.v, pady=10, value=val, bg="#272822",fg = "#7fe45c", font = ("Rockwell Condensed",14)).pack()
        self.lab = Label(self.main, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed",16))
        self.lab.pack()
        self.lab1 = Label(self.main, text = "Set А", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed",16))
        self.lab2 = Label(self.main, text = "Set В", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed",16))

        self.but = Button(self.main, text="Save", width = 10, command=self.Write_3, font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)
        self.but2 = Button(self.main, text="Save", width = 10, command=self.Write_4, font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)

        self.menu_bar = Menu(self.main)
        self.main.configure(menu=self.menu_bar)
        self.first_item = Menu(self.menu_bar, tearoff=0)
        self.menu_bar.add_cascade(label="Set А: ", font=("Rockwell Condensed", 20), menu=self.first_item)
        self.first_item.add_command(label="Write to file", command=self.Set_A, font=("Rockwell Condensed", 12))
        self.first_item.add_command(label="Clear", command=self.Clear_A, font=("Rockwell Condensed", 12))
        self.second_item = Menu(self.menu_bar, tearoff=0)
        self.menu_bar.add_cascade(label="Set B: ", font=("Rockwell Condensed", 20), menu=self.second_item)
        self.second_item.add_command(label="Write to file", command=self.Set_B, font=("Rockwell Condensed", 12))
        self.second_item.add_command(label="Clear", command=self.Clear_B, font=("Rockwell Condensed", 12))

        with open(r"mans.txt", "r+", encoding="UTF-8") as f:
            self.manname = f.read().split(",")
        with open(r"woman.txt", "r+", encoding="UTF-8") as f:
            self.womanname = f.read().split(",")

        for i in self.manname:
            self.listbox.insert(END, i)
        for i in self.womanname:
            self.listbox2.insert(END, i)

        self.listbox.place(x=16, y=10)
        self.listbox2.place(x=538, y=10)
        self.listbox3.place(x=176, y=250)
        self.listbox4.place(x=376, y=250)
        self.lab1.place(x=177, y=210)
        self.lab2.place(x=377, y=210)
        self.but.place(x=48, y=420)
        self.but2.place(x=566, y=420)

        self.main.grab_set()
        self.main.mainloop()

    def Write_3(self):
        if self.v.get() == 1:
            values = [self.listbox.get(idx) for idx in self.listbox.curselection()]
            for i in values:
                self.listbox3.insert(END, i)
        elif self.v.get() == 2:
            values = [self.listbox.get(idx) for idx in self.listbox.curselection()]
            for i in values:
                self.listbox4.insert(END, i)
        else:
            messagebox.showerror("Error","You must choose a set")

    def Write_4(self):
        values = [self.listbox2.get(idx) for idx in self.listbox2.curselection()]
        if self.v.get() == 1:
            for i in values:
                self.listbox3.insert(END, i)
        elif self.v.get() == 2:
            for i in values:
                self.listbox4.insert(END, i)
        else:
            messagebox.showerror("Error","You must choose a set")

    def Set_A(self):
        values = [self.listbox3.get(idx) for idx in self.listbox3.curselection()]
        with open(r"Set_A.txt", "w+", encoding="UTF-8") as f:
            for i in values:
                f.write(i+",")
            self.lab["text"] = "Name save"

    def Set_B(self):
        values = [self.listbox4.get(idx) for idx in self.listbox4.curselection()]
        with open(r"Set_B.txt", "w+", encoding="UTF-8") as f:
            for i in values:
                f.write(i+",")
            self.lab["text"] = "Name save"

    def Clear_A(self):
        self.listbox3.delete(0,END)

    def Clear_B(self):
        self.listbox4.delete(0,END)
