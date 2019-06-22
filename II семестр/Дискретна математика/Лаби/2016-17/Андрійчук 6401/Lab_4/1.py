from tkinter import *
import networkx as nx
import pylab as plt

root = Tk()


class Check:
    def __init__(self, row, column):
        self.check = Entry(root, width=3, font=("Arial", 18))
        self.check.grid(row=row, column=column)
        self.check.bind("<Button-1>", self.limiter)
        self.check.bind("<Button-3>", self.zero)
        self.check.insert(END, "0")

    def limiter(self, event):
        if self.check.get() == "10":
            self.check.delete(0, END)
            self.check.insert(END, "0")
        elif self.check.get():
            if self.check.get().isdigit():
                n = int(self.check.get())
            else:
                n = -1
            self.check.delete(0, END)
            self.check.insert(END, str(n+1))

    def returner(self):
        return self.check.get()

    def zero(self, event):
        self.check.delete(0, END)
        self.check.insert(END, "0")


class Main:
    edges = []

    def __init__(self):


        l = Label(root, text="Список ребер", font=("Arial", 18))
        l.grid(row=0, column=0, columnspan=6)
        x = 1
        for i in range(0, 4, 3):
            l = Label(root, text="a"+str(x), font=("Arial", 18))
            l.grid(row=1, column=i + 1, columnspan=2)
            x += 1
        for i in range(10):
            l = Label(root, text=str(i + 1), font=("Arial", 18))
            l.grid(row=i + 2, column=0, sticky=E)
        for i in range(10):
            l = Label(root, text="    "+str(i + 11), font=("Arial", 18), width=5)
            l.grid(row=i + 2, column=3, sticky=E)
        for i in range(10):
            self.edges.append([])
            for j in range(2):
                self.edges[i].append(Check(i + 2, j + 1))
        for i in range(10):
            self.edges.append([])
            for j in range(2):
                self.edges[i+10].append(Check(i + 2, j + 4))

        self.b_inc = Button(root, text="Сворити граф", command=self.made_matrix_of_incident_and_graph)
        self.b_inc.grid(row=13, column=0, columnspan=13)

    def made_matrix_of_incident_and_graph(self):
        edges_list = []
        for i in range(len(self.edges)):
            edges_list.append([])
            for j in self.edges[i]:
                edges_list[i].append(j.returner())
        for i in range(len(edges_list)-1, -1, -1):
            if "0" in edges_list[i] or edges_list.count(edges_list[i]) > 1:
                del edges_list[i]

        nodes = set()
        for i in edges_list:
            for j in i:
                nodes.add(j)
        nodes = list(nodes)
        nodes.sort()

        for i in range(len(edges_list)-1, -1, -1):
            if edges_list[i][0] != edges_list[i][1]:
                if edges_list[i][::-1] in edges_list:
                    edges_list.remove(edges_list[i])
            if edges_list[i][0] < edges_list[i][1]:
                edges_list[i] = edges_list[i][::-1]
        edges_list.sort()

        G = nx.Graph()
        colors = ["red", "blue", "green", "orange", "yellow", "violet", "gray", "brown"]
        G.add_edges_from(edges_list, color='b')
        val_map = {}
        val_map.update({nodes[0]: "red"})
        for node in nodes:
            i = 0
            for edge in edges_list:
                if node in edge:
                    i += 1
            while node not in val_map:
                for j in range(i):
                    color = 0
                    for edge in edges_list:
                        if node in edge:
                            if node == edge[0]:
                                if edge[1] in val_map:
                                    while val_map.get(edge[1]) == colors[color]:
                                        color += 1
                            else:
                                if edge[0] in val_map:
                                    while val_map.get(edge[0]) == colors[color]:
                                        color += 1
                val_map.update({node: colors[color]})
        values = [val_map.get(node) for node in G.nodes()]
        nx.draw(G,  node_color=values, with_labels=True)
        plt.show()

    def variant(self):
        Variant = Toplevel(root)
        Variant.title("Варіант")
        l = Label(Variant, text="Андрійчук Дмитро", font=("Arial", 18))
        l.grid(row=0, column=0)
        l = Label(Variant, text="Номер розрахункової - 6401", font=("Arial", 18))
        l.grid(row=1, column=0)
        l = Label(Variant, text="Варіант - 6", font=("Arial", 18))
        l.grid(row=2, column=0)

root.title("Головне меню")
variant = Main()
root.mainloop()
