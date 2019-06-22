from tkinter import *
root = Tk()
def getV(root):
    a = scale1.get()
    print("Значення", a)
scale1 = Scale(root,orient=HORIZONTAL,length=300,from_=50,to=80,tickinterval=5,resolution=5)
button1 = Button(root,text="Отримати значення")
scale1.pack()
button1.pack()
button1.bind("<Button-1>",getV)
root.mainloop()
