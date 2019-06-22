from tkinter import *
from tkinter import messagebox
import random


#Firstly var
power_A = 5
power_B = 6
power_C = 7
A = set()
B = set()
C = set()


#Power for A
def give_power_A(event):
    top = Toplevel(height=500, width=500, relief = GROOVE)
    top.maxsize(width=300,height=75)
    top.minsize(width=300,height=75)
    top.title("Power A")
    ent = Entry(top,width=50, bd=3)
    ent.pack()

    def callback():
        global power_A
        power_A = int(ent.get())
        msg = messagebox.showinfo('Power A', 'Power A = ' + str(power_A))
    b = Button(top, text="Save", width=10, command=callback, font = ("Arial",20))
    b.pack()


#Power for B
def give_power_B(event):
    top = Toplevel(height=500, width=500, relief = GROOVE)
    top.title("Power B")
    top.maxsize(width=300,height=75)
    top.minsize(width=300,height=75)
    ent = Entry(top,width=50, bd=3)
    ent.pack()

    def callback():
        global power_B
        power_B = int(ent.get())
        msg = messagebox.showinfo('Power B', 'Power B = ' + str(power_B))
    b = Button(top, text="Save", width=10, command=callback, font = ("Arial",20))
    b.pack()


#Power for C
def give_power_C(event):
    top = Toplevel(height=500, width=500, relief = GROOVE)
    top.title("Power C")
    top.maxsize(width=300,height=75)
    top.minsize(width=300,height=75)
    ent = Entry(top,width=50, bd=3)
    ent.pack()

    def callback():
        global power_C
        power_C = int(ent.get())
        msg = messagebox.showinfo('Power C', 'Power C = ' + str(power_C))
    b = Button(top, text="Save", width=10, command=callback, font = ("Arial",20))
    b.pack()


#Random create A
def create_A(event):
    global A
    A = set()

    while len(A) < power_A:
        elem = random.randint(0, 255)
        A.add(elem)
    msg = messagebox.showinfo('Random create A', 'Random set A was created')



#Random create B
def create_B(event):
    global B
    B = set()

    while len(B) < power_B:
        elem = random.randint(0, 255)
        B.add(elem)
    msg = messagebox.showinfo('Random create B', 'Random set B was created')



#Random create C
def create_C(event):
    global C
    C = set()

    while len(C) < power_C:
        elem = random.randint(0, 255)
        C.add(elem)
    msg = messagebox.showinfo('Random create C', 'Random set C was created')


#Create themselves A
def create_themselves_A(event):
    global A
    A = set()

    def callback_to_range(event):
        begin = int((ent1.get()))
        over = int(ent2.get())
        Add = set(range(begin,over))
        A.update(Add)
        msg = messagebox.showinfo('Create themselves A', 'Elements was add in set A')


    #Create toplevel
    top = Toplevel(height=500, width=500, relief = GROOVE)
    top.title("Created set A themselves")
    top.maxsize(width=485,height=250)
    top.minsize(width=485,height=250)

    #Top label
    lab1 = Label(top, text='Add diapasone to set', font='arial 20')


    #Label For => To
    lab2 = Label(top, text='From', font='arial 20')
    lab3 = Label(top, text='To(write +1 more)', font='arial 20')

    #Entry elements
    ent1 = Entry(top,width=15, bd=3)
    ent2 = Entry(top,width=15, bd=3)
    but1 = Button(top, text='Add elements', font='arial 20')
    but1.bind("<ButtonRelease-1>", callback_to_range)



    def callback_to_one_element(event):
        value = int(ent3.get())
        A.add(value)
        msg = messagebox.showinfo('Create themselves A', 'Element was add in set A')


    #Label add one element
    lab4 = Label(top, text='Add one element to set', font='arial 20')


    #Entry one element
    ent3 = Entry(top,width=25, bd=3)
    but2 = Button(top, text='Add one element', font='arial 20')
    but2.bind("<ButtonRelease-1>", callback_to_one_element)


    #Top label
    lab1.grid(row=1,column=1,columnspan=2)


    #Label For => To
    lab2.grid(row=2,column=0)
    lab3.grid(row=2,column=2)


    #Entry elements
    ent1.grid(row=2,column=1)
    ent2.grid(row=2,column=3, sticky='w')
    but1.grid(row=3,column=1,columnspan=2)


    #Label add one element
    lab4.grid(row=4,column=1,columnspan=2)


    #Entry one element
    ent3.grid(row=5,column=1, columnspan=2)
    but2.grid(row=6,column=1,columnspan=2)


#Create themselves B
def create_themselves_B(event):
    global B
    B = set()

    def callback_to_range(event):
        begin = int((ent1.get()))
        over = int(ent2.get())
        Add = set(range(begin,over))
        B.update(Add)
        msg = messagebox.showinfo('Create themselves B', 'Elements was add in set B')


    #Create toplevel
    top = Toplevel(height=500, width=500, relief = GROOVE)
    top.title("Created set B themselves")
    top.maxsize(width=485,height=250)
    top.minsize(width=485,height=250)


    #Top label
    lab1 = Label(top, text='Add diapasone to set', font='arial 20')


    #Label For => To
    lab2 = Label(top, text='From', font='arial 20')
    lab3 = Label(top, text='To(write +1 more)', font='arial 20')


    #Entry elements
    ent1 = Entry(top,width=15, bd=3)
    ent2 = Entry(top,width=15, bd=3)
    but1 = Button(top, text='Add elements', font='arial 20')
    but1.bind("<ButtonRelease-1>", callback_to_range)



    def callback_to_one_element(event):
        value = int(ent3.get())
        B.add(value)
        msg = messagebox.showinfo('Create themselves B', 'Element was add in set B')


    #Label add one element
    lab4 = Label(top, text='Add one element to set', font='arial 20')


    #Entry one element
    ent3 = Entry(top,width=25, bd=3)
    but2 = Button(top, text='Add one element', font='arial 20')
    but2.bind("<ButtonRelease-1>", callback_to_one_element)


    #Top label
    lab1.grid(row=1,column=1,columnspan=2)


    #Label For => To
    lab2.grid(row=2,column=0)
    lab3.grid(row=2,column=2)


    #Entry elements
    ent1.grid(row=2,column=1)
    ent2.grid(row=2,column=3, sticky='w')
    but1.grid(row=3,column=1,columnspan=2)


    #Label add one element
    lab4.grid(row=4,column=1,columnspan=2)


    #Entry one element
    ent3.grid(row=5,column=1, columnspan=2)
    but2.grid(row=6,column=1,columnspan=2)


#Create themselves C
def create_themselves_C(event):
    global C
    C = set()

    def callback_to_range(event):
        begin = int((ent1.get()))
        over = int(ent2.get())
        Add = set(range(begin,over))
        C.update(Add)
        msg = messagebox.showinfo('Create themselves C', 'Elements was add in set C')


    #Create toplevel
    top = Toplevel(height=500, width=500, relief = GROOVE)
    top.title("Created set C themselves")
    top.maxsize(width=485,height=250)
    top.minsize(width=485,height=250)


    #Top label
    lab1 = Label(top, text='Add diapasone to set', font='arial 20')


    #Label For => To
    lab2 = Label(top, text='From', font='arial 20')
    lab3 = Label(top, text='To(write +1 more)', font='arial 20')


    #Entry elements
    ent1 = Entry(top,width=15, bd=3)
    ent2 = Entry(top,width=15, bd=3)
    but1 = Button(top, text='Add elements', font='arial 20')
    but1.bind("<ButtonRelease-1>", callback_to_range)



    def callback_to_one_element(event):
        value = int(ent3.get())
        C.add(value)
        msg = messagebox.showinfo('Create themselves C', 'Element was add in set C')


    #Label add one element
    lab4 = Label(top, text='Add one element to set', font='arial 20')


    #Entry one element
    ent3 = Entry(top,width=25, bd=3)
    but2 = Button(top, text='Add one element', font='arial 20')
    but2.bind("<ButtonRelease-1>", callback_to_one_element)


    #Top label
    lab1.grid(row=1,column=1,columnspan=2)


    #Label For => To
    lab2.grid(row=2,column=0)
    lab3.grid(row=2,column=2)


    #Entry elements
    ent1.grid(row=2,column=1)
    ent2.grid(row=2,column=3, sticky='w')
    but1.grid(row=3,column=1,columnspan=2)


    #Label add one element
    lab4.grid(row=4,column=1,columnspan=2)


    #Entry one element
    ent3.grid(row=5,column=1, columnspan=2)
    but2.grid(row=6,column=1,columnspan=2)


#Create universal set
def create_universal_set(event):
    global U
    U = set()

    def callback_to_range(event):
        begin = int((ent1.get()))
        over = int(ent2.get())
        Add = set(range(begin,over))
        U.update(Add)
        msg = messagebox.showinfo('Universal set', 'Universal set was created')


    #Create toplevel
    top = Toplevel(height=500, width=500, relief = GROOVE)
    top.title("Created universal set")
    top.maxsize(width=485,height=135)
    top.minsize(width=485,height=135)


    #Top label
    lab1 = Label(top, text='Add diapasone to set', font='arial 20')


    #Label For => To
    lab2 = Label(top, text='From', font='arial 20')
    lab3 = Label(top, text='To(write +1 more)', font='arial 20')


    #Entry elements
    ent1 = Entry(top,width=15, bd=3)
    ent2 = Entry(top,width=15, bd=3)
    but1 = Button(top, text='Add elements', font='arial 20')
    but1.bind("<ButtonRelease-1>", callback_to_range)


    #Top label
    lab1.grid(row=1,column=1,columnspan=2)


    #Label For => To
    lab2.grid(row=2,column=0)
    lab3.grid(row=2,column=2)


    #Entry elements
    ent1.grid(row=2,column=1)
    ent2.grid(row=2,column=3, sticky='w')
    but1.grid(row=3,column=1,columnspan=2)
