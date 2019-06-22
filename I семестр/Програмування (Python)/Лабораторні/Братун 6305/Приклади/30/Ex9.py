from tkinter import *
root=Tk()
start=1.0
stop=2.0
lb=Label(text= "Тут будуть зчитані дані",font = ("Arial",20))
text1=Text(root,height=3,width=40, font=("Arial",14),wrap=WORD)
def callback():
    lb.config(text = text1.get(start,stop))
b = Button(root, text="Зчитати", width=10, command=callback, font = ("Arial",20))

lb.pack()
text1.pack()
b.pack()

root.mainloop()
