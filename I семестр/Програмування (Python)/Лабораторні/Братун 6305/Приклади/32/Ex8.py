from tkinter import *
root=Tk()
root.title("Опитування")
F1 = Frame(  )
F2 = Frame()
s = Scrollbar(F1)
L = Listbox(F1,font = "Arial 20", selectmode=MULTIPLE)
L['yscrollcommand'] = s.set
s['command'] = L.yview
#----------------------------
for i in range(30):
    L.insert(END, str(i))

lab =Label(F2,font = "Arial 20")
def poll(  ):
    lab.after(200, poll)
    sel = L.curselection( )
    lab.config(text=str(sel))
#-----------------------------
s.pack(side=RIGHT, fill=Y)
L.pack(side=LEFT, fill=Y)
F1.pack(side=TOP)
lab.pack(  )
F2.pack(side=TOP)
poll()
mainloop()
