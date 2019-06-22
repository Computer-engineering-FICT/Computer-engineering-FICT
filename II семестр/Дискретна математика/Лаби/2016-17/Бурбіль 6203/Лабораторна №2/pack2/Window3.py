import os
from tkinter import *

from pack2 import Graph1 as g1


class Window3:
    def __init__(self,main):

        self.menu = main
        with open(r"Set_A.txt", "r", encoding="UTF-8") as f:
            self.man = f.read()
        with open(r"Set_B.txt", "r", encoding="UTF-8") as f:
            self.woman = f.read()

        self.manw = self.man.rstrip(",")
        self.manw = self.manw.split(",")
        self.womanw = self.woman.rstrip(",")
        self.womanw = self.womanw.split(",")

        self.listbox = Listbox(self.menu,height=15,width=20,font=("Rockwell Condensed",14),selectmode=MULTIPLE)
        self.listbox2 = Listbox(self.menu,height=15,width=20,font=("Rockwell Condensed",14),selectmode=MULTIPLE)

        for i in self.manw:
            self.listbox.insert(END, i)
        for i in self.womanw:
            self.listbox2.insert(END, i)

        self.but = Button(self.menu, text="Relation aSb, if a is wife of b", command=self.gph1, font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)
        self.but2 = Button(self.menu, text="Relation aRb, if a is godmother of b", command=self.gph2,  font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)
        self.but3 = Button(self.menu, text="Open image", command=self.openf, font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)
        self.listbox.place(x=16, y=10)
        self.listbox2.place(x=538, y=10)
        self.but.place(x=265, y=270)
        self.but2.place(x=250, y=320)
        self.but3.place(x=315, y=220)

        self.menu.mainloop()

    def openf(self):
        os.system(r"Graph1.png")
        os.system(r"Graph2.png")
    def gph1(self):
        self.a = g1.Graph1()
        os.system(r"Graph1.png")
        self.but['state'] = DISABLED

    def gph2(self):
        os.system(r"Graph2.png")
        self.but2['state'] = DISABLED


