from tkinter import *
from DM_Labs.lab2 import program

G, N = 61, 3
variant = (N + G % 60) % 30 + 1

window1 = Tk()
window1.geometry("400x180")
window1.title("1 Вікно")
inform = Frame(window1, height=200, width=200)
inform.place(x=0, y=0)
inf_label = Label(inform, text="                 Валько Антон Вікторович\n"
                               "                Група: ІО - {0}\n"
                               "                Номер в групі: {1}\n"
                               "                Варіант: {2}".format(G, N, variant), font=('Arial', 14))
inf_label.pack()
w1=Button(window1, text="2 Вікно", width=10, height=3, command=program.window_2, bg="black", fg="yellow")
w2=Button(window1, text="3 Вікно", width=10, height=3, command=program.window_3, bg="black", fg="yellow")
w3=Button(window1, text="4 Вікно", width=10, height=3, command=program.window_4, bg="black", fg="yellow")
w1.place(x=10, y=100)
w2.place(x=155, y=100)
w3.place(x=300, y=100)
window1.mainloop()
