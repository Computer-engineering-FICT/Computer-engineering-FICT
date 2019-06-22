from tkinter import *
import pylab
import networkx
from tkinter import messagebox

root = Tk()


class Main(Entry):

    def __init__(self, parent, c):
        self.value = StringVar()
        Entry.__init__(self, parent, textvariable=self.value, width=3, justify='center')
        self.lab3 = Label(parent, bg="black", fg="yellow", font=13)
        self.lab3.grid(row=0, column=0)
        for i in range(c):
            self.lab1 = Label(parent, bg="grey", fg="black", font=10)
            self.lab1['text'] += "X%i " % (i+1)
            self.lab2 = Label(parent, bg="grey", fg="black", font=10)
            self.lab2['text'] += "X%i" % (i+1)
            self.lab1.grid(row=0, column=i+1)
            self.lab2.grid(row=i+1, column=0)


class Table(Frame):
    def __init__(self, parent, columns):
        Frame.__init__(self, parent)
        self.cells = [[Main(parent, columns) for i in range(columns)] for j in range(columns)]
        [self.cells[i][j].grid(row=i+1, column=j+1) for i in range(columns) for j in range(columns)]


class Lab3(Table):
    def __init__(self, menu):
        Table.__init__(self, menu,0)
        self.menu = menu
        self.menu.geometry('315x100+500+250')
        self.menu.config(bg="grey")
        self.menu.title("Lab3.Valko_Anton")
        self.lab = Label(self.menu, text="Enter the number of nodes", bg="black", fg="yellow", font=12)
        self.ent = Entry(self.menu, width=5, font=12)
        self.but = Button(self.menu, text="Save", command=self.getting, font=10, bg="black", fg="yellow")
        self.but1 = Button(self.menu, text="Build graph\n and find way", command=self.matrix, font=10, bg="black", fg="yellow")
        self.lab2 = Label(self.menu, text="Enter № of the first node", bg="black", fg="yellow", font=10)
        self.ent1 = Entry(self.menu, width=3, font=10)
        self.lab3 = Label(self.menu, text="Enter № of the last node", bg="black", fg="yellow", font=10)
        self.ent2 = Entry(self.menu, width=3, font=10)
        self.lab.place(x=10, y=5)
        self.but.place(x=250, y=50)
        self.ent.place(x=250, y=5)
        self.menu.mainloop()

    def getting(self):
        c = int(self.ent.get())
        self.lab.place_forget()
        self.ent.place_forget()
        self.but.place_forget()
        self.but1.place(x=120*c/2, y=10)
        self.lab2.place(x=10, y=30*(c+1)+5)
        self.ent1.place(x=10, y=30*(c+1)+30)
        self.lab3.place(x=10, y=30*(c+1)+55)
        self.ent2.place(x=10, y=30*(c+1)+80)
        try:
            self.tab = Table(self.menu, c)
            self.tab.pack()
        except TclError:
            pass
        self.menu.geometry("%dx%d+%d+%d" % (100*c+50, 30*(c+1)+100, 500, 200))

    def matrix(self):
        if self.ent1.get() == "" and self.ent2.get() == "":
            messagebox.showerror("Error", "You should enter the nodes")
        else:
            c = int(self.ent.get())
            self.l = []
            for i in range(c):
                self.l.append([])
                for j in range(c):
                    self.l[i].append(self.tab.cells[i][j].value.get())
            self.Dejkstra(c, int(self.ent1.get()), self.l, int(self.ent2.get()))

    def Dejkstra(self, N, S, w, Last_Node):
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
                    if w[i][j] == "i":
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
            j = Last_Node-1
            while j is not None:
                path.append(j)
                j = prev[j]
            path = path[::-1]
            print(path)
            result = []
            for i in range(len(path)-1):
                result.append(("X%i" % (path[i]+1), "X%i" % (path[i+1]+1)))

            # Building Graph
            pylab.figure(1)
            self.graph = networkx.DiGraph()
            for i in range(N):
                self.graph.add_node("X%i" % (i+1))
            for i in range(len(w)):
                for j in range(len(w[i])):
                    if w[i][j] == inf:
                        continue
                    else:
                        self.graph.add_edge("X%i" % (i+1), "X%i" % (j+1), weight=w[i][j])
            networkx.draw_networkx(self.graph, pos=networkx.shell_layout(self.graph), arrows=True, with_labels=True,
                                   node_size=50, width=0.5, font_size=10)
            edge_labels = dict([((u, v,), d['weight'])
                 for u, v, d in self.graph.edges(data=True)])
            networkx.draw_networkx_edge_labels(self.graph, pos=networkx.shell_layout(self.graph),
                                               edge_labels=edge_labels, label_pos=0.3, font_size=9)
            networkx.draw_networkx_edges(self.graph, pos=networkx.shell_layout(self.graph), edgelist=result,
                                         edge_color='yellow', arrows=True, with_labels=True)
            pylab.savefig(r"Lab3_Graph.png")
            pylab.show()
        except ValueError:
            messagebox.showerror("Error", "Fill the matrix")
c = Lab3(root)
