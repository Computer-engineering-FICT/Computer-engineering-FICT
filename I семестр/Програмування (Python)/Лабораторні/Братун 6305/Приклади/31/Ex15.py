from tkinter import *
root = Tk( )
l1=Label(root, text="Group",font='arial 20')
l2=Label(root, text="Name",font='arial 20')
l3=Label(root, text="№",font='arial 20')

button1=Button(root,text='ok',width=3,bg='red',fg='black',font='arial 20')
button2=Button(root,text='no',width=3,bg='black',fg='red',font='arial 20')

p = PhotoImage(file="Tux.gif")
iml = Label(root, image=p)

l1.grid(sticky=E,row=0, column=0)
l2.grid(sticky=E,row=1, column=0)
l3.grid(sticky=E,row=2, column=0)

e1 = Entry(root,font='arial 20')
e2 = Entry(root,font='arial 20')
e3 = Entry(root,font='arial 20')
cb = Checkbutton(root,text="Life's good",font='arial 20')

e1.grid(row=0, column=1)
e2.grid(row=1, column=1)
e3.grid(row=2, column=1)

cb.grid(row=3, column=0, columnspan=2, sticky=W)

iml.grid(row=0, column=2, columnspan=2, rowspan=2, sticky=W+E+N+S, padx=5, pady=5)

button1.grid(row=2, column=2)
button2.grid(row=2, column=3)

root.mainloop()

