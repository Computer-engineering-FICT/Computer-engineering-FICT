from tkinter import *
import func_win_2


def create_window_2():

   window2 = Toplevel()


   lab1 = Label(window2, text='Window №2', font='arial 20')
   lab2 = Label(window2, text='See set now', font='arial 20')
   lab3 = Label(window2, text='Doing without set', font='arial 20')



   but1 = Button(window2, text="See set A", font='arial 20')
   but1.bind("<Button-1>", func_win_2.see_set_A)
   but2 = Button(window2, text="See set B", font='arial 20')
   but2.bind("<Button-1>", func_win_2.see_set_B)
   but3 = Button(window2, text="See set C", font='arial 20')
   but3.bind("<Button-1>", func_win_2.see_set_C)


   but4 = Button(window2, text="Do next step", font='arial 20')
   but4.bind("<Button-1>", func_win_2.open_toplevel_next_step)
   but6 = Button(window2, text="See set D", font='arial 20')
   but6.bind("<Button-1>", func_win_2.see_set_D)
   but7 = Button(window2, text="Save set D", font='arial 20')
   but7.bind("<Button-1>", func_win_2.save_set_D)


   lab1.grid(row=1,column=1,columnspan=2, sticky=W+E+N+S, pady=5, padx=5)
   lab2.grid(row=2,column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab3.grid(row=2,column=2, sticky=W+E+N+S, pady=5, padx=5)

   but1.grid(row=4,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but2.grid(row=5,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but3.grid(row=6,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but4.grid(row=4,column=2, sticky=W+E+N+S, pady=5, padx=5)
   but6.grid(row=5,column=2, sticky=W+E+N+S, pady=5, padx=5)
   but7.grid(row=6,column=2, sticky=W+E+N+S, pady=5, padx=5)

