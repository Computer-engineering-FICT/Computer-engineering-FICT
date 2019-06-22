from tkinter import *
root = Tk()
v = IntVar()
v.set(1)
languages = [("Python",1), ("Perl",2), ("Java",3), ("C++",4), ("C",5)]
lb = Label(root, text="""Choose your favourite programming language:""",
      justify = LEFT,
      padx = 20)
lb.pack()

def ShowChoice():
    print(v.get())
for txt, val in languages:
    rbl=Radiobutton(root, text=txt, padx = 20, variable=v, command=ShowChoice, value=val)
    rbl.pack(anchor=W)
mainloop()
