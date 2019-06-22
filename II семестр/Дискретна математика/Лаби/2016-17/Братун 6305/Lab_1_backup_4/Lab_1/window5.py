from tkinter import *
import func_win_5


#Create window 5
def create_window_5():

   #Create Toplevel for window 5
   window5 = Toplevel()
   window5.title("Window 5")
   window5.maxsize(width=715,height=580)
   window5.minsize(width=715,height=580)


   #Top Tabel
   lab1 = Label(window5, text='Window №5', font='arial 20')
   lab2 = Label(window5, text='See set D into file', font='arial 20')
   lab3 = Label(window5, text='See set Z into file', font='arial 20')
   lab4 = Label(window5, text='Comparison sets', font='arial 20')


   #Left button
   but1 = Button(window5, text="See set D(don`t simplified) into file", font='arial 14')
   but1.bind("<ButtonRelease-1>", func_win_5.see_dont_simplified_D)
   but2 = Button(window5, text="See set D(simplified) into file", font='arial 14')
   but2.bind("<ButtonRelease-1>", func_win_5.see_simplified_D)


   #Center button
   but3 = Button(window5, text="See set Z(calculated with my functions) into file", font='arial 14')
   but3.bind("<ButtonRelease-1>", func_win_5.see_calc_about_my_func_C)
   but4 = Button(window5, text="See and save set Z(calculated with Python functions) into file", font='arial 14')
   but4.bind("<ButtonRelease-1>", func_win_5.step)


   #Right button
   but5 = Button(window5, text="comparison D(simplified) and D(don`t simplified)", font='arial 14')
   but5.bind("<ButtonRelease-1>", func_win_5.comparison_D_sets)
   but6 = Button(window5, text="comparison Z(calculated with my functions) and Z(calculated with Python functions)", font='arial 14')
   but6.bind("<ButtonRelease-1>", func_win_5.comparison_Z_sets)


   #Top Tabel
   lab1.grid(row=1,column=1,columnspan=1, sticky=W+E+N+S, pady=5, padx=5)
   lab2.grid(row=2,column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab3.grid(row=5,column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab4.grid(row=8,column=1, sticky=W+E+N+S, pady=5, padx=5)


   #Left button
   but1.grid(row=3,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but2.grid(row=4,column=1, sticky=W+E+N+S, pady=5, padx=5)


   #Center button
   but3.grid(row=6,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but4.grid(row=7,column=1, sticky=W+E+N+S, pady=5, padx=5)


   #Right button
   but5.grid(row=9,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but6.grid(row=10,column=1, sticky=W+E+N+S, pady=5, padx=5)


   #Time
   lab5 = Label(window5, text='See Time', font='arial 20')
   lab5.grid(row=11,column=1, sticky=W+E+N+S, pady=5, padx=5)

   but7 = Button(window5, text="comparison work time Python and my function", font='arial 14')
   but7.bind("<ButtonRelease-1>",func_win_5.comparison_time)
   but7.grid(row=12,column=1, sticky=W+E+N+S, pady=5, padx=5)
