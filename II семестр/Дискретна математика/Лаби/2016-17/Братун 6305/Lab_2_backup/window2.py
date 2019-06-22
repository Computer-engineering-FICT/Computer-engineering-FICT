from tkinter import *
from tkinter import messagebox


# Create window 2
def create_window_2():

   #Create Toplevel for window 2
   window2 = Toplevel()
   window2.title("Window 2")
   #window2.maxsize(width=475,height=290)
   #window2.minsize(width=475,height=290)


   #########################FUNCTIONS####################################

   def save_set_A():
    with open(r"Set A.txt", "w", encoding="UTF-8") as f:
       written = listbox3.get(0,END)
       msg = messagebox.showinfo('Save set A', 'Set A was saved')
       for i in written:
         f.write(i + " ")

   def save_set_B():
    with open(r"Set B.txt", "w", encoding="UTF-8") as f:
       written = listbox4.get(0,END)
       msg = messagebox.showinfo('Save set B', 'Set B was saved')
       for i in written:
         f.write(i + " ")


   #See set A
   def see_set_A():
    try:
        with open(r"Set A.txt", "r", encoding="UTF-8") as f:
            p = f.read()
            top = Toplevel(height=500, width=100, relief = GROOVE)
            top.title("Set A")
            tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
            tex.insert(END,p)
            tex.pack(fill=BOTH,expand=True)
    except:
        msg = messagebox.showinfo('Error', 'File not found')

   def see_set_B():
    try:
        with open(r"Set B.txt", "r", encoding="UTF-8") as f:
            p = f.read()
            top = Toplevel(height=500, width=100, relief = GROOVE)
            top.title("Set B")
            tex = Text(top,width=180, height=20,font="Verdana 12",wrap=WORD)
            tex.insert(END,p)
            tex.pack(fill=BOTH,expand=True)
    except:
        msg = messagebox.showinfo('Error', 'File not found')

   def delete_A():
      listbox3.delete(0,END)

   def delete_B():
      listbox4.delete(0,END)



   #labels
   lab1 = Label(window2, text='Women', font='arial 20')
   lab2 = Label(window2, text='Men', font='arial 20')
   lab3 = Label(window2, text='Set A', font='arial 20')
   lab4 = Label(window2, text='Set B', font='arial 20')


   #Listbox
   listbox1 = Listbox(window2, height=5,width=15, font=("Arial", 16), selectmode=EXTENDED)
   listbox2 = Listbox(window2, height=5,width=15, font=("Arial", 16), selectmode=EXTENDED)
   listbox3 = Listbox(window2, height=5,width=15, font=("Arial", 16), selectmode=EXTENDED)
   listbox4 = Listbox(window2, height=5,width=15, font=("Arial", 16), selectmode=EXTENDED)


   #AddToListBox
   list1=["Вікторія","Світлана","Марія","Анна","Дарина","Катерина","Людмила","Зоя","Аліна","Олена","Юлія","Лариса","Анастасія","Антоніна","Оксана","Галина","Тетяна","Василина","Валентина","Інна"]
   list2=["Андрій","Петро","Ігор","Віктор","Антон","Євген","Дмитро","Вадим","Олександр","Віталій","Богдан","Павел","Сергій","Микола","Володимир","Юрій","Олег","Михайло","Семен","Чіпка"]
   for i in list1:
      listbox1.insert(END, i)
   for i in list2:
      listbox2.insert(END, i)


   #RadioButton
   var1 = IntVar()
   var2 = IntVar()
   var1.set(1)
   var2.set(3)
   rbutton1 = Radiobutton(window2, text='Set A', variable=var1, value=1)
   rbutton2 = Radiobutton(window2, text='Set B', variable=var1, value=2)
   rbutton3 = Radiobutton(window2, text='Women', variable=var2, value=3)
   rbutton4 = Radiobutton(window2, text='Men', variable=var2, value=4)

   def callback():
      if var1.get() == 1:
         if var2.get() == 3:
            value = listbox1.get(ACTIVE)
            listbox1.delete(ACTIVE)
            listbox3.insert(END, value)
         else:
            value = listbox2.get(ACTIVE)
            listbox2.delete(ACTIVE)
            listbox3.insert(END, value)
      else:
         if var2.get() == 3:
            value = listbox1.get(ACTIVE)
            listbox1.delete(ACTIVE)
            listbox4.insert(END, value)
         else:
            value = listbox2.get(ACTIVE)
            listbox2.delete(ACTIVE)
            listbox4.insert(END, value)




   #Button
   but1 = Button(window2, text="Insert in set :", command=callback, width=10,  font=("Arial", 20))


   #Button
   but2 = Button(window2, text="Save A in file", command=save_set_A, width=10,  font=("Arial", 20))
   but3 = Button(window2, text="Read A", command=see_set_A,  width=10,  font=("Arial", 20))
   but4 = Button(window2, text="Clear A", command=delete_A, width=10,  font=("Arial", 20))
   but5 = Button(window2, text="Save B in file", command=save_set_B, width=10,  font=("Arial", 20))
   but6 = Button(window2, text="Read B", command=see_set_B, width=10,  font=("Arial", 20))
   but7 = Button(window2, text="Clear B", command=delete_B, width=10,  font=("Arial", 20))

   #labels
   lab1.grid(row=1, column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab2.grid(row=1, column=2, sticky=W+E+N+S, pady=5, padx=5)
   lab3.grid(row=5, column=1, sticky=W+E+N+S, pady=5, padx=5)
   lab4.grid(row=5, column=2, sticky=W+E+N+S, pady=5, padx=5)


   #Listbox
   listbox1.grid(row=2, column=1, sticky=W+E+N+S, pady=5, padx=5)
   listbox2.grid(row=2, column=2, sticky=W+E+N+S, pady=5, padx=5)
   listbox3.grid(row=6, column=1, sticky=W+E+N+S, pady=5, padx=5)
   listbox4.grid(row=6, column=2, sticky=W+E+N+S, pady=5, padx=5)


   #Button
   but1.grid(row=3, column=1, sticky=W+E+N+S, pady=5, padx=5)


   #RadioButton
   rbutton1.grid(row=3, column=2, sticky=W)
   rbutton2.grid(row=3, column=2, sticky=E)
   rbutton3.grid(row=4, column=2, sticky=W)
   rbutton4.grid(row=4, column=2, sticky=E)


   #Button
   but2.grid(row=7, column=1, sticky=W+E+N+S, pady=5, padx=5)
   but3.grid(row=8, column=1, sticky=W+E+N+S, pady=5, padx=5)
   but4.grid(row=9, column=1, sticky=W+E+N+S, pady=5, padx=5)
   but5.grid(row=7, column=2, sticky=W+E+N+S, pady=5, padx=5)
   but6.grid(row=8, column=2, sticky=W+E+N+S, pady=5, padx=5)
   but7.grid(row=9, column=2, sticky=W+E+N+S, pady=5, padx=5)
