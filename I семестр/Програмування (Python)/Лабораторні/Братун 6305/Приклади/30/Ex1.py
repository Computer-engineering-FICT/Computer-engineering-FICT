from tkinter import *

def printer(event):
    print ("Як завжди, черговий 'Hello World!'")

root = Tk()
root.title("Кнопка")
but = Button(root)

but["text"] = "Друк"

but.bind("<Button-1>",printer)

but.pack()

root.mainloop()
