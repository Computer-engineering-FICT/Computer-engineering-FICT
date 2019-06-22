from tkinter import *

import pack2.Window2 as w2
import pack2.Window4 as w4
#pack1.infostudent - с лабы №1
import pack1.infostudent as I
from pack2 import Window3 as w3

root = Tk()
class Lab2:
    def __init__(self,top):
        self.menu = top
        self.menu = top
        self.menu.geometry('500x300+500+200')
        self.menu.config(bg="#272822")
        self.menu.title("Menu")
        self.menubar = Menu(self.menu)
        self.menubar.add_command(label="Window №2", command = self.Window2)
        self.menubar.add_command(label="Window №3", command = self.Window3)
        self.menubar.add_command(label="Window №4", command = self.Window4)
        self.menu.config(menu=self.menubar)
        self.c = I.Student(self.menu)
        self.menu.mainloop()
    def Window2(self):
        top = Toplevel(self.menu, bg ="#272822")
        top.geometry('700x500+500+200')
        top.title("Window №2")
        l = w2.Window2(top)
    def Window3(self):
        top = Toplevel(self.menu, bg ="#272822")
        top.geometry('700x370+500+200')
        top.title("Window №3")
        l = w3.Window3(top)

    def Window4(self):
        top = Toplevel(self.menu, bg ="#272822")
        top.geometry('805x454+500+200')
        top.title("Window №4")
        l = w4.Window4(top)

c = Lab2(root)


