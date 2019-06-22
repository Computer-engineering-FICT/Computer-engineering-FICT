from tkinter import *
root = Tk()
root.title("Приклад лейблів")
root.geometry("500x500")

lab1 = Label(root, text="Це мітка! \n з двох рядків.", font="Arial 18")
lab1.place(x=150,y=100)

lab2 = Label(root, text="Це мітка з околом 10 пікс",
bd=10, fg = "Yellow", bg = "Green", font="Arial 18", cursor = "dot")
lab2.place(x=100,y=200)


photo=PhotoImage(file="python.gif")
lab3 = Label(root, image = photo, width="150",height="100")
lab3.place(x=160,y=300)

root.mainloop()

