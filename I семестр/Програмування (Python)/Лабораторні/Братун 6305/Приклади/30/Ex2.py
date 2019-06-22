from tkinter import *
class But_print:
    def __init__(self):
        self.but = Button(root)
        self.but["text"] = "Друк"
        self.but.bind("<Button-1>",self.printer)
        self.but.pack()
    def printer(self,event):
        print ("Як завжди, черговий 'Hello World!'")

root = Tk()
obj = But_print()
root.mainloop()
