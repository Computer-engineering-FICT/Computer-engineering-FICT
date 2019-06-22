from tkinter import *
import func_win_5


def create_window_5():

   window5 = Toplevel()


   lab1 = Label(window5, text='Window №5', font='arial 20')
   lab2 = Label(window5, text='See set D into file', font='arial 20')
   lab3 = Label(window5, text='See set Z into file', font='arial 20')
   lab4 = Label(window5, text='Comparison sets', font='arial 20')



   but1 = Button(window5, text="See set D(don`t simplified) into file", font='arial 14')
   but1.bind("<Button-1>", func_win_5.see_dont_simplified_D)
   but2 = Button(window5, text="See set D(simplified) into file", font='arial 14')
   but2.bind("<Button-1>", func_win_5.see_simplified_D)


   but3 = Button(window5, text="See set Z(calc about my func) into file", font='arial 14')
   but3.bind("<Button-1>", func_win_5.see_calc_about_my_func_C)
   but4 = Button(window5, text="See and save set Z(cacl about Python func) into file", font='arial 14')
   but4.bind("<Button-1>", func_win_5.step)


   but5 = Button(window5, text="comparison D(simplified) and D(don`t simplified)", font='arial 14')
   but5.bind("<Button-1>", func_win_5.comparison_D_sets)
   but6 = Button(window5, text="comparison Z(calc about my func) and Z(cacl about Python func)", font='arial 14')
   but6.bind("<Button-1>", func_win_5.comparison_Z_sets)



   lab1.grid(row=1,column=1,columnspan=3, sticky=W+E+N+S, pady=5, padx=5)
   lab2.grid(row=2,column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab3.grid(row=2,column=2, sticky=W+E+N+S, pady=5, padx=5)
   lab4.grid(row=2,column=3, sticky=W+E+N+S, pady=5, padx=5)

   but1.grid(row=4,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but2.grid(row=5,column=1, sticky=W+E+N+S, pady=5, padx=5)

   but3.grid(row=4,column=2, sticky=W+E+N+S, pady=5, padx=5)
   but4.grid(row=5,column=2, sticky=W+E+N+S, pady=5, padx=5)

   but5.grid(row=4,column=3, sticky=W+E+N+S, pady=5, padx=5)
   but6.grid(row=5,column=3, sticky=W+E+N+S, pady=5, padx=5)
