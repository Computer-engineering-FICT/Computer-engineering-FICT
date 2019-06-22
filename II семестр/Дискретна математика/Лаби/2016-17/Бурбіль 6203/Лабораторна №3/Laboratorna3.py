from tkinter import *
import matplotlib.pyplot as plt
import networkx as net

from tkinter import messagebox

root = Tk()


class Cell(Entry):
    def __init__(self, parent,c):
        self.value = StringVar()
        Entry.__init__(self, parent, textvariable = self.value, width = 7, justify='center' )
        self.lab3 = Label(parent, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 13))
        self.lab3.grid(row=0,column=0)
        for i in range(c):
            self.lab1 = Label(parent, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 13))
            self.lab1['text']+= "X%i "%(i+1)
            self.lab2 = Label(parent, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 13))
            self.lab2['text']+= "X%i"%(i+1)
            self.lab1.grid(row=0, column = i+1)
            self.lab2.grid(row=i+1, column = 0)
class Table(Frame):
    def __init__(self, parent, columns):
        Frame.__init__(self, parent)
        self.cells = [[Cell(parent,columns) for i in range(columns)] for j in range(columns)]
        [self.cells[i][j].grid(row = i+1, column = j+1) for i in range(columns) for j in range(columns)]

class Lab3(Table):
    def __init__(self, menu):
        Table.__init__(self, menu,0)
        self.menu = menu
        self.menu.geometry('500x300+500+200')
        self.menu.config(bg="#272822")
        self.menu.title("Menu")

        self.lab = Label(self.menu, text="Введіть кількість вершин", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.ent = Entry(self.menu, width=10, font=("Rockwell Condensed", 12))
        self.but = Button(self.menu, text="Зберегти", command=self.gett, font=("Rockwell Condensed", 10), bg="#7fe45c", bd=5)
        self.but1 = Button(self.menu, text="Побудувати граф\nта знайти шлях", command=self.matrix, font=("Rockwell Condensed", 10), bg="#7fe45c", bd=5)
        self.lab2 = Label(self.menu, text="Введіть № початкової вершини", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 10))
        self.ent1 = Entry(self.menu, width=5, font=("Rockwell Condensed", 10))
        self.lab3 = Label(self.menu, text="Введіть № кінцевої вершини", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 10))
        self.ent2 = Entry(self.menu, width=5, font=("Rockwell Condensed", 10))

        self.lab.place(x=150, y=5)
        self.but.place(x=227, y=65)
        self.ent.place(x=230, y=30)

        self.menu.mainloop()
    def gett(self):
        c = int(self.ent.get())
        self.lab.place_forget()
        self.ent.place_forget()
        self.but.place_forget()
        self.but1.place(x=124*c/2+45, y=30*(c+1)+25)
        self.lab2.place(x=10,y=30*(c+1)+5)
        self.ent1.place(x=15,y=30*(c+1)+25)
        self.lab3.place(x=10,y=30*(c+1)+45)
        self.ent2.place(x=15,y=30*(c+1)+65)

        try:
            self.tab = Table(self.menu, c)
            self.tab.pack()
        except TclError:
            pass
        self.menu.geometry("%dx%d+%d+%d" % (124*c + 25, 30*(c+1)+100, 500, 200))

    def matrix(self):
        if self.ent1.get() == "" and self.ent2.get() == "":
            messagebox.showerror("Помилка","Ви не ввели вершини для пошуку")
        else:
            c = int(self.ent.get())
            self.l = []
            for i in range(c):
                self.l.append([])
                for j in range(c):
                    self.l[i].append(self.tab.cells[i][j].value.get())
            self.Dejkstra(c,int(self.ent1.get()),self.l, int(self.ent2.get()))

    # Пошук найкоротшого шляху та побудова графу
    def Dejkstra(self, N,S,w,Last_Node):
        inf = float("inf")
        dist = [inf] * N
        dist[S-1] = 0
        prev = [None] * N
        used = [False] * N
        min_dist = 0
        min_vertex = S-1
        try:
            while min_dist < inf:
                i = min_vertex
                used[i] = True
                for j in range(N):
                    if w[i][j] == "inf":
                        w[i][j] = inf
                        if dist[i] + float(w[i][j]) < dist[j]:
                            dist[j] = dist[i] + float(w[i][j])
                            prev[j] = i
                    else:
                        if dist[i] + float(w[i][j]) < dist[j]:
                            dist[j] = dist[i] + float(w[i][j])
                            prev[j] = i
                min_dist = inf
                for j in range(N):
                    if not used[j] and dist[j] < min_dist:
                        min_dist = dist[j]
                        min_vertex = j
            path = []
            j= Last_Node-1
            while j is not None:
                path.append(j)
                j = prev[j]
            path = path[::-1]
            print(path)
            result =[]
            for i in range(len(path)-1):
                result.append(("X%i"%(path[i]+1),"X%i"%(path[i+1]+1)))

            #Побудова Графу з розміткою
            plt.figure(1)
            self.graph = net.DiGraph()
            for i in range(N):
                self.graph.add_node("X%i"%(i+1))
            for i in range (len(w)):
                for j in range(len(w[i])):
                    if w[i][j] == inf:
                        continue
                    else:
                        self.graph.add_edge("X%i"%(i+1),"X%i"%(j+1), weight = w[i][j])
            net.draw(self.graph, pos=net.shell_layout(self.graph), arrows=True, with_labels=True, node_size=100, width=1,
                     font_size=13, font_family="Rockwell Condensed")
            edge_labels=dict([((u,v,),d['weight'])
                 for u,v,d in self.graph.edges(data=True)])
            net.draw_networkx_edge_labels(self.graph, pos=net.shell_layout(self.graph),
                                          edge_labels=edge_labels, label_pos=0.3, font_size=9)
            net.draw_networkx_edges(self.graph, pos=net.shell_layout(self.graph), edgelist=result, edge_color='g',
                    arrows=True, with_labels=True)
            plt.savefig(r"Graph1.png")
            plt.show()
        except ValueError:
            messagebox.showerror("Помилка","Заповніть матрицю повністю")
c = Lab3(root)
