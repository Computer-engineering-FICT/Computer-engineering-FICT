from tkinter import *
root=Tk()
lb=Label(text= "Введіть дані",font = ("Arial",20))
text1=Text(root,height=3,width=40, font=("Arial",14),wrap=WORD)
def callback():
    text1.delete(1.0,1.3)
b = Button(root, text="Очистити", width=10, command=callback, font = ("Arial",20))

lb.pack()
text1.pack()
b.pack()

root.mainloop()
