from tkinter import *
from tkinter import messagebox

root = Tk()
root.title("Main Window")

#root.maxsize(width=320, height=190)
#root.minsize(width=320, height=190)


# My uniq task
NZK = 6305
number = NZK % 26 + 1
task = "Personal task number - " + str(number)


# #####################MAINLOOOOOOOP################

def get_number():
    input_number = ent1.get() + ent2.get() + ent3.get()
    int_number = int(input_number)
    bin_number = bin(int_number)
    global str_result
    global next_number
    str_bin_number = str(bin_number)
    str_result = str_bin_number[2:]
    n = len(str_result)
    m = 20
    #m 1 to n
    next_number = '0' + str_result[:-1]
    zip_list = list(zip(str(next_number),str_result))
    global result
    result = []
    for i in range(len(zip_list)):
        if zip_list[i][0] == zip_list[i][1]:
            result.append(0)
        else:
            result.append(1)



def callback(result,str_result,next_number):
    window1 = Toplevel()
    window1.title("Window 4")
    text1 = result
    text2 = []
    for i in list(str_result):
        text2.append(int(i))
    text3 = []
    for i in list(next_number):
        text3.append(int(i))
    lab1 = Label(window1, text=text2, font='arial 20')
    lab2 = Label(window1, text=text3, font='arial 20')
    lab3 = Label(window1, text=text1, font='arial 20')
    lab4 = Label(window1, text="My first number", font='arial 20')
    lab5 = Label(window1, text="My next number", font='arial 20')
    lab6 = Label(window1, text="Grey code", font='arial 20')

    lab1.grid(row=2, column=1, sticky=W + E + N + S, pady=5, padx=5)
    lab2.grid(row=4, column=1, sticky=W + E + N + S, pady=5, padx=5)
    lab3.grid(row=6, column=1, sticky=W + E + N + S, pady=5, padx=5)
    lab4.grid(row=1, column=1, sticky=W + E + N + S, pady=5, padx=5)
    lab5.grid(row=3, column=1, sticky=W + E + N + S, pady=5, padx=5)
    lab6.grid(row=5, column=1, sticky=W + E + N + S, pady=5, padx=5)

def knopka(event):
    get_number()
    callback(result,str_result,next_number)



# Info about student
lab1 = Label(root, text='Create by Andrew Bratun', font='arial 20')
lab2 = Label(root, text='My number NZK - 6305', font='arial 20')
lab4 = Label(root, text=task, font='arial 20')

lab5 = Label(root, text="Input value", font='arial 20')
lab6 = Label(root, text="Year", font='arial 20')
lab7 = Label(root, text="Mounth", font='arial 20')
lab8 = Label(root, text="Day", font='arial 20')

ent1 = Entry(root,width=15, bd=3)
ent2 = Entry(root,width=15, bd=3)
ent3 = Entry(root,width=15, bd=3)

but1 = Button(root, text='View Grey code', font='arial 20')
but1.bind("<Button-1>", knopka)


# Info about student
lab1.grid(row=1, column=1, columnspan=6, sticky=W+E+N+S, pady=5, padx=5)
lab2.grid(row=2, column=1, columnspan=6, sticky=W+E+N+S, pady=5, padx=5)
lab4.grid(row=3, column=1, columnspan=6,sticky=W+E+N+S, pady=5, padx=5)

lab5.grid(row=4, column=1, columnspan=6,sticky=W+E+N+S, pady=5, padx=5)
lab6.grid(row=5, column=1,sticky=W+E+N+S, pady=5, padx=5)
lab7.grid(row=5, column=3, sticky=W+E+N+S, pady=5, padx=5)
lab8.grid(row=5, column=5, sticky=W+E+N+S, pady=5, padx=5)



ent1.grid(row=5,column=2)
ent2.grid(row=5,column=4)
ent3.grid(row=5,column=6)


but1.grid(row=6, column=1, columnspan=6,sticky=W+E+N+S, pady=5, padx=5)


root.mainloop()



