from tkinter import *
root=Tk()
root.title("listbox")
en =Entry(root,width=20,bd=3, font = ("Arial",20))
lb1=Label(text= "EXTENDED",font = ("Arial",14))
listbox1=Listbox(root,height=5,width=15, font=("Arial",16),selectmode=EXTENDED)
lb2=Label(text= "SINGLE",font = ("Arial",14))
listbox2=Listbox(root,height=5,width=15, font=("Arial",16),selectmode=SINGLE)
list1=["Київ","Хмельницький","Львів","Одеса"]
list2=["Канберра","Сідней","Мельбурн","Аделаїда"]
for i in list1:
    listbox1.insert(END,i)
for i in list2:
    listbox2.insert(END,i)
def callback():
    listbox1.insert(ACTIVE,en.get())
b = Button(root, text="Insert", width=10, command=callback, font = ("Arial",20))
def callback1():
    listbox1.delete(ACTIVE)
b1 = Button(root, text="Delete", width=10, command=callback1, font = ("Arial",20))
def callback2():
    lb1.config(text=listbox1.get(ACTIVE))
b2 = Button(root, text="get", width=10, command=callback2, font = ("Arial",20))

en.pack()
b.pack()
lb1.pack()
listbox1.pack()
lb2.pack()
listbox2.pack()
b1.pack()
b2.pack()
root.mainloop()
