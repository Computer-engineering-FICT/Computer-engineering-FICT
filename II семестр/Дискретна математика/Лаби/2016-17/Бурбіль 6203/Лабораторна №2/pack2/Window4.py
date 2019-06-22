from tkinter import *
from PIL import Image, ImageTk

class Window4:
    def __init__(self,main):
        self.menu = main

        self.frame1=Frame(self.menu, width=185, bd=5, bg="#272822")
        self.frame1.pack(side=LEFT, fill=Y)
        self.frame2=Frame(self.menu, bg="#272822", bd=5)
        self.frame2.pack(side=RIGHT, fill=BOTH)
        self.canvas = Canvas(self.frame2,width=614,height=450)
        self.canvas.pack()

        self.pilImage = Image.open("Graph3.png")
        self.image = ImageTk.PhotoImage(self.pilImage)
        self.pilImage1 = Image.open("Graph4.png")
        self.image1 = ImageTk.PhotoImage(self.pilImage1)
        self.pilImage2 = Image.open("Graph5.png")
        self.image2 = ImageTk.PhotoImage(self.pilImage2)
        self.pilImage3 = Image.open("Graph6.png")
        self.image3 = ImageTk.PhotoImage(self.pilImage3)
        self.pilImage4 = Image.open("Graph7.png")
        self.image4 = ImageTk.PhotoImage(self.pilImage4)

        self.but1 = Button(self.menu, width = 15, cursor = "hand2", text="R∪S", command=self.union,
                           font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)
        self.but2 = Button(self.menu, width = 15, cursor = "hand2", text="R∩S", command = self.intersection,
                           font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)
        self.but3 = Button(self.menu, width = 15, cursor = "hand2", text="R\\S", command = self.difference,
                           font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)
        self.but4 = Button(self.menu, width = 15, cursor = "hand2", text="U\\R", command=self.differenceU,
                           font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)
        self.but5 = Button(self.menu, width = 15, cursor = "hand2", text="S^-1", command=self.reverse,
                           font=("Rockwell Condensed",11), bg="#7fe45c", bd=5)

        self.but1.place(x=40, y=80)
        self.but2.place(x=40, y=130)
        self.but3.place(x=40, y=180)
        self.but4.place(x=40, y=230)
        self.but5.place(x=40, y=280)

        self.menu.mainloop()

    def union(self):
        imagesprite = self.canvas.create_image(300,220,image=self.image)
    def intersection(self):
        imagesprite = self.canvas.create_image(300,220,image=self.image1)
    def difference(self):
        imagesprite = self.canvas.create_image(300,220,image=self.image2)
    def differenceU(self):
        imagesprite = self.canvas.create_image(300,220,image=self.image4)
    def reverse(self):
        imagesprite = self.canvas.create_image(300,220,image=self.image3)
