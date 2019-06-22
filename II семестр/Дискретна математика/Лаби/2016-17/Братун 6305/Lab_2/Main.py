from tkinter import *
from tkinter import messagebox
import window2,window3,window4

root = Tk()
root.title("Main Window")

root.maxsize(width=320, height=190)
root.minsize(width=320, height=190)


# My uniq task
Num = 5
G = 63
number = (Num + G % 60) % 30 + 1
task = "Personal task number - " + str(number)


# #####################MAINLOOOOOOOP################


# Info about student
lab1 = Label(root, text='Create by Andrew Bratun', font='arial 20')
lab2 = Label(root, text='Group number - IO - 63', font='arial 20')
lab3 = Label(root, text='My number in group - 5', font='arial 20')
lab4 = Label(root, text=task, font='arial 20')


# Info about student
lab1.grid(row=1, column=1, sticky=W+E+N+S, pady=5, padx=5)
lab2.grid(row=2, column=1, sticky=W+E+N+S, pady=5, padx=5)
lab3.grid(row=3, column=1, sticky=W+E+N+S, pady=5, padx=5)
lab4.grid(row=4, column=1, sticky=W+E+N+S, pady=5, padx=5)


# Menu
m = Menu(root)
root.config(menu=m)
fm = Menu(m)
m.add_cascade(label="Windows", menu=fm)
fm.add_command(label="Window№2", command=window2.create_window_2)
fm.add_command(label="Window№3", command=window3.create_window_3)
fm.add_command(label="Window№4", command=window4.create_window_4)

'''
def exitwindow():
    if messagebox.askokcancel("Quit", "Do you really wish to quit?"):
        root.destroy()
root.protocol("WM_DELETE_WINDOW", exitwindow)
'''

# Xz
root.mainloop()

