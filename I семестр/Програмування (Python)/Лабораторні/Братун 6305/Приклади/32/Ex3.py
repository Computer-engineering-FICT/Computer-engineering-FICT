from tkinter import *
m1 = PanedWindow(bd=1, bg="black",height=700,width=400)
m1.pack(fill=BOTH, expand=1)
left = Label(m1, text="left pane", font = "Arial 18")
m1.add(left)

m2 = PanedWindow(m1, orient=VERTICAL, bd=1,bg="red",)
m1.add(m2)

top = Label(m2, text="top pane", font = "Arial 18")
m2.add(top)

bottom = Label(m2, text="bottom pane",font = "Arial 18")
m2.add(bottom)

mainloop()
