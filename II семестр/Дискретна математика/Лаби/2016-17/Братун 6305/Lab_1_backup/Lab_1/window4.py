from tkinter import *
import func_win_4


def create_window_4():

   window4 = Toplevel()


   lab1 = Label(window4, text='Window №4', font='arial 20')
   lab2 = Label(window4, text='See set now', font='arial 20')
   lab3 = Label(window4, text='Doing without set', font='arial 20')



   but1 = Button(window4, text="See set X", font='arial 20')
   but1.bind("<Button-1>", func_win_4.see_set_X)
   but3 = Button(window4, text="See set Y", font='arial 20')
   but3.bind("<Button-1>", func_win_4.see_set_Y)


   but4 = Button(window4, text="X \ Y", font='arial 20')
   but4.bind("<Button-1>", func_win_4.step)
   but6 = Button(window4, text="See set Z", font='arial 20')
   but6.bind("<Button-1>", func_win_4.see_set_Z)
   but7 = Button(window4, text="Save set Z", font='arial 20')
   but7.bind("<ButtonRelease-1>", func_win_4.save_set_Z)


   lab1.grid(row=1,column=1,columnspan=2, sticky=W+E+N+S, pady=5, padx=5)
   lab2.grid(row=2,column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab3.grid(row=2,column=2, sticky=W+E+N+S, pady=5, padx=5)

   but1.grid(row=4,column=1, sticky=W+E+N+S, pady=5, padx=5)

   but3.grid(row=5,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but4.grid(row=4,column=2, sticky=W+E+N+S, pady=5, padx=5)
   but6.grid(row=5,column=2, sticky=W+E+N+S, pady=5, padx=5)
   but7.grid(row=6,column=1, columnspan=2, sticky=W+E+N+S, pady=5, padx=5)
