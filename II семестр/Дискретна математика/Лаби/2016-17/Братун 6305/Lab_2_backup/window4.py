from tkinter import *
from tkinter import messagebox
import random
import copy
import func_win_4


def create_window_4():

   #Create Toplevel for window 2
   window4 = Toplevel()
   window4.title("Window 4")
   #window2.maxsize(width=475,height=290)
   #window2.minsize(width=475,height=290)


   #########################FUNCTIONS####################################
   but1 = Button(window4, text="R ∪ S ", command=func_win_4.R_plus_S, width=10,  font=("Arial", 20))
   but2 = Button(window4, text="R ∩ S",  command=func_win_4.R_on_S, width=10,  font=("Arial", 20))
   but3 = Button(window4, text="R \ S",  command=func_win_4.R_diff_S, width=10,  font=("Arial", 20))
   but4 = Button(window4, text="U \ R",  command=func_win_4.U_diff_R, width=10,  font=("Arial", 20))
   but5 = Button(window4, text="s^(-1)", command=func_win_4.S_tra, width=10,  font=("Arial", 20))


   but1.grid(row=0, column=0, sticky=W+E+N+S, pady=5, padx=5)
   but2.grid(row=0, column=1, sticky=W+E+N+S, pady=5, padx=5)
   but3.grid(row=1, column=0, sticky=W+E+N+S, pady=5, padx=5)
   but4.grid(row=1, column=1, sticky=W+E+N+S, pady=5, padx=5)
   but5.grid(row=2, column=0,columnspan=2, sticky=W+E+N+S, pady=5, padx=5)
