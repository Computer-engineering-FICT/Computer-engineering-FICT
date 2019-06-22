from tkinter import *
import func_win_4


#Create window 4
def create_window_4():

   #Create Toplevel for window 4
   window4 = Toplevel()
   window4.title("Window 4")
   window4.maxsize(width=475,height=290)
   window4.minsize(width=475,height=290)


   #Top label
   lab1 = Label(window4, text='Window №4', font='arial 20')
   lab2 = Label(window4, text='See set now', font='arial 20')
   lab3 = Label(window4, text='Do something on the set', font='arial 20')


   #Left Button
   but1 = Button(window4, text="See set X", font='arial 20')
   but1.bind("<Button-1>", func_win_4.see_set_X)
   but2 = Button(window4, text="See set Y", font='arial 20')
   but2.bind("<Button-1>", func_win_4.see_set_Y)


   #Right Button
   but3 = Button(window4, text="X \ Y", font='arial 20')
   but3.bind("<Button-1>", func_win_4.step)
   but4 = Button(window4, text="See set Z", font='arial 20')
   but4.bind("<Button-1>", func_win_4.see_set_Z)


   #Bottom Button
   but5 = Button(window4, text="Save set Z", font='arial 20')
   but5.bind("<ButtonRelease-1>", func_win_4.save_set_Z)


   #Top label
   lab1.grid(row=1,column=1,columnspan=2, sticky=W+E+N+S, pady=5, padx=5)
   lab2.grid(row=2,column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab3.grid(row=2,column=2, sticky=W+E+N+S, pady=5, padx=5)


   #Lefr Button
   but1.grid(row=4,column=1, sticky=W+E+N+S, pady=5, padx=5)
   but2.grid(row=5,column=1, sticky=W+E+N+S, pady=5, padx=5)


   #Right Button
   but3.grid(row=4,column=2, sticky=W+E+N+S, pady=5, padx=5)
   but4.grid(row=5,column=2, sticky=W+E+N+S, pady=5, padx=5)


   #Bottom Button
   but5.grid(row=6,column=1, columnspan=2, sticky=W+E+N+S, pady=5, padx=5)
