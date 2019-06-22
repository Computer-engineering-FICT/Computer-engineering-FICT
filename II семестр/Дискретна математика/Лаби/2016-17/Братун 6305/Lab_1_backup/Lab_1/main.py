from tkinter import *
import func
import window2, window3, window4, window5


root = Tk()
root.title("Main Window")
root.maxsize(width=895,height=590)


#My uniq task
Num = 5
G = 63
number = (Num+G%60)%30+1
task = "Personal task number - " + str(number)


######################MAINLOOOOOOOP################


#Info about student
lab1 = Label(root, text='Create by Andrew Bratun', font='arial 20')
lab2 = Label(root, text='Group number - IO-63', font='arial 20')
lab3 = Label(root, text=task , font='arial 20')

#Info about doings1
lab4 = Label(root, text='Give a power to set:', font='arial 20')
lab5 = Label(root, text='Create random set:', font='arial 20')
lab6 = Label(root, text='Create a set themselves:', font='arial 20')
lab7 = Label(root, text='Create a universal set:', font='arial 20')

#Give a power
but1 = Button(root, text='Give a power to A', font='arial 20')
but1.bind("<Button-1>", func.give_power_A)
but2 = Button(root, text='Give a power to B', font='arial 20')
but2.bind("<Button-1>", func.give_power_B)
but3 = Button(root, text='Give a power to C', font='arial 20')
but3.bind("<Button-1>", func.give_power_C)

#Create random set
but4 = Button(root, text='Create A\nBase power = 5', font='arial 20')
but4.bind("<ButtonRelease-1>", func.create_A)
but5 = Button(root, text='Create B\nBase power = 6', font='arial 20')
but5.bind("<ButtonRelease-1>", func.create_B)
but6 = Button(root, text='Create C\nBase power = 7', font='arial 20')
but6.bind("<ButtonRelease-1>", func.create_C)

#Create a set themselves:
but7 = Button(root, text='Write themselves A', font='arial 20')
but7.bind("<Button-1>",func.create_themselves_A)
but8 = Button(root, text='Write themselves B', font='arial 20')
but8.bind("<Button-1>",func.create_themselves_B)
but9 = Button(root, text='Write themselves C', font='arial 20')
but9.bind("<Button-1>",func.create_themselves_C)

#Universal set
but10 = Button(root, text='Universal set', font='arial 20')
but10.bind("<Button-1>",func.create_universal_set)

#Info about student
lab1.grid(row=1,column=1, sticky=W+E+N+S, pady=5, padx=5)
lab2.grid(row=2,column=1, sticky=W+E+N+S, pady=5, padx=5)
lab3.grid(row=3,column=1, sticky=W+E+N+S, pady=5, padx=5)

#Info about doings1
lab4.grid(row=4,column=0, sticky=W+E+N+S, pady=5, padx=5)
lab5.grid(row=4,column=1, sticky=W+E+N+S, pady=5, padx=5)
lab6.grid(row=4,column=2, sticky=W+E+N+S, pady=5, padx=5)

#Give a power
but1.grid(row=5,column=0, sticky=W+E+N+S, pady=5, padx=5)
but2.grid(row=6,column=0, sticky=W+E+N+S, pady=5, padx=5)
but3.grid(row=7,column=0, sticky=W+E+N+S, pady=5, padx=5)

#Create random set
but4.grid(row=5,column=1, sticky=W+E+N+S, pady=5, padx=5)
but5.grid(row=6,column=1, sticky=W+E+N+S, pady=5, padx=5)
but6.grid(row=7,column=1, sticky=W+E+N+S, pady=5, padx=5)

#Create a set themselves:
but7.grid(row=5,column=2, sticky=W+E+N+S, pady=5, padx=5)
but8.grid(row=6,column=2, sticky=W+E+N+S, pady=5, padx=5)
but9.grid(row=7,column=2, sticky=W+E+N+S, pady=5, padx=5)

#Universal set
lab7.grid(row=8,column=1, sticky=W+E+N+S)
but10.grid(row=9,column=1, sticky=W+E+N+S)

#Menu
m = Menu(root)
root.config(menu=m)
fm = Menu(m)
m.add_cascade(label="Windows",menu=fm)
fm.add_command(label="Window№2", command=window2.create_window_2)
fm.add_command(label="Window№3", command=window3.create_window_3)
fm.add_command(label="Window№4", command=window4.create_window_4)
fm.add_command(label="Window№5", command=window5.create_window_5)

#Xz
root.mainloop()
