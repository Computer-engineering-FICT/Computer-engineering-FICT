from tkinter import *
import networkx as nx
import pylab as plt
from copy import deepcopy

root = Tk()


class element_Matrix_of_adjacent:
    def __init__(self, roo, row, column):
        self.check = Entry(roo, width=3, font=("Arial", 18))
        self.check.grid(row=row, column=column)
        self.check.bind("<Button-1>", self.limiter)
        self.check.bind("<Button-3>", self.limiter)
        self.check.insert(END, "0")

    def limiter(self, event):
        if self.check.get() == "0":
            self.check.delete(0, END)
            self.check.insert(END, "1")
        else:
            self.check.delete(0, END)
            self.check.insert(END, "0")

    def getter(self):
        return self.check.get()


class element_Matrix_of_incendies:
    def __init__(self, roo, row, column):
        self.check = Entry(roo, width=3, font=("Arial", 18))
        self.check.grid(row=row, column=column)
        self.check.bind("<Button-1>", self.limiter)
        self.check.bind("<Button-3>", self.limiter)
        self.check.insert(END, "0")

    def limiter(self, event):
        if self.check.get() == "0":
            self.check.delete(0, END)
            self.check.insert(END, "+1")

        elif self.check.get() == "+1":
            self.check.delete(0, END)
            self.check.insert(END, "-1")

        elif self.check.get() == "-1":
            self.check.delete(0, END)
            self.check.insert(END, "±1")

        else:
            self.check.delete(0, END)
            self.check.insert(END, "0")

    def getter(self):
        return self.check.get()


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
        menubar = Menu(root)
        filemenu = Menu(menubar, tearoff=0)
        filemenu.add_command(label="Матрця інцидентності", command=self.Matrix_of_incendies_builder)
        filemenu.add_command(label="Матрця суміжності", command=self.Matrix_of_adjacent_builder)
        filemenu.add_command(label="Варіант", command=self.variant)
        menubar.add_cascade(label="Вікнa", menu=filemenu)
        root.config(menu=menubar)

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

        self.window_inc = Toplevel(root)
        self.window_inc.title("Матриця інцидентності")
        for i in range(len(edges_list)):
            l = Label(self.window_inc, text="e"+str(i + 1), font=("Arial", 12))
            l.grid(row=0, column=i+1)

        nodes = set()
        for i in edges_list:
            for j in i:
                nodes.add(j)
        nodes = list(nodes)
        nodes.sort()
        for i in range(len(nodes)):
            l = Label(self.window_inc, text=nodes[i], font=("Arial", 12))
            l.grid(row=i+1, column=0, sticky=E)

        for row in range(len(nodes)):
            for column in range(len(edges_list)):
                if edges_list[column][0] == nodes[row] and edges_list[column][1] == nodes[row]:
                    l = Label(self.window_inc, text="±1", font=("Arial", 18))
                    l.grid(row=row+1, column=column+1)
                elif edges_list[column][0] == nodes[row]:
                    l = Label(self.window_inc, text="+1", font=("Arial", 18))
                    l.grid(row=row+1, column=column+1)
                elif edges_list[column][1] == nodes[row]:
                    l = Label(self.window_inc, text="-1", font=("Arial", 18))
                    l.grid(row=row+1, column=column+1)
                else:
                    l = Label(self.window_inc, text="0", font=("Arial", 18))
                    l.grid(row=row+1, column=column+1)

        window_sum = Toplevel(root)
        window_sum.title("Матриця суміжності")
        for i in range(len(nodes)):
            l = Label(window_sum, text=nodes[i], font=("Arial", 12))
            l.grid(row=i+1, column=0, sticky=E)
            l = Label(window_sum, text=nodes[i], font=("Arial", 12))
            l.grid(row=0, column=i+1, sticky=E)
            for row in range(len(nodes)):
                for column in range(len(nodes)):
                    if [nodes[row], nodes[column]] in edges_list:
                        l = Label(window_sum, text="1", font=("Arial", 18))
                        l.grid(row=row+1, column=column+1)
                    else:
                        l = Label(window_sum, text="0", font=("Arial", 18))
                        l.grid(row=row+1, column=column+1)

        G = nx.DiGraph()
        G.add_edges_from(edges_list, color='b')
        val_map = {}
        for i in edges_list:
            if i[0] == i[1]:
                val_map.update({i[0]: "b"})
        values = [val_map.get(node, "r") for node in G.nodes()]
        nx.draw(G,  node_color=values, with_labels=True)
        plt.show()

    def Matrix_of_incendies_builder(self):
        def made_graph():
            edges_list = []
            for i in range(len(edges)):
                edges_list.append([])
                for j in range(len(edges[i])):
                    edges_list[i].append(edges[i][j].getter())
            tmp = []
            for i in range(len(edges_list)-1, -1, -1):
                if edges_list[i].count("0") == 10:
                    edges_list.pop(i)
                elif "±1" in edges_list[i] and ("+1" in edges_list[i] or "-1" in edges_list[i]):
                    edges_list.pop(i)
                elif "+1" in edges_list[i] and "-1" not in edges_list[i] or "-1" in edges_list[i] and "+1" not in edges_list[i]:
                    edges_list.pop(i)
                elif edges_list[i].count("+1") > 1 or edges_list[i].count("-1") > 1 or edges_list[i].count("±1") > 1:
                    edges_list.pop(i)
                else:
                    if "±1" in edges_list[i]:
                        tmp = [edges_list[i].index("±1")+1, edges_list[i].index("±1")+1]
                        edges_list[i] = tmp
                    elif "+1" in edges_list[i] and "-1" in edges_list[i]:
                        tmp = [edges_list[i].index("+1")+1, edges_list[i].index("-1")+1]
                        edges_list[i] = tmp
                    else:
                        edges_list.pop(i)
            edges_list2 = deepcopy(edges_list)
            window_sum2 = Toplevel(root)
            window_sum2.title("Матриця суміжності")
            nodes = set()
            for i in edges_list2:
                for j in i:
                    nodes.add(j)
            nodes = list(nodes)
            nodes.sort()
            for i in range(len(nodes)):
                l = Label(window_sum2, text=nodes[i], font=("Arial", 12))
                l.grid(row=i+1, column=0, sticky=E)
                l = Label(window_sum2, text=nodes[i], font=("Arial", 12))
                l.grid(row=0, column=i+1, sticky=E)
                for row in range(len(nodes)):
                    for column in range(len(nodes)):
                        if [nodes[row], nodes[column]] in edges_list:
                            l = Label(window_sum2, text="1", font=("Arial", 18))
                            l.grid(row=row+1, column=column+1)
                        else:
                            l = Label(window_sum2, text="0", font=("Arial", 18))
                            l.grid(row=row+1, column=column+1)

            G = nx.DiGraph()
            if len(edges_list) != 0:
                G.add_edges_from(edges_list, color='b')
            val_map = {}
            for i in edges_list:
                if i[0] == i[1]:
                    val_map.update({i[0]: "b"})
            values = [val_map.get(node, "r") for node in G.nodes()]
            nx.draw(G,  node_color=values, with_labels=True)
            plt.show()

        Matrix_of_incendies = Toplevel(root)
        Matrix_of_incendies.title("Mатрця інцидентності")
        edges = []
        for i in range(20):
            l = Label(Matrix_of_incendies, text="e"+str(i + 1), font=("Arial", 12))
            l.grid(row=0, column=i+1)
        for i in range(10):
            l = Label(Matrix_of_incendies, text=i+1, font=("Arial", 12))
            l.grid(row=i+1, column=0, sticky=E)
        for column in range(20):
            edges.append([])
            for row in range(10):
                edges[column].append(element_Matrix_of_incendies(Matrix_of_incendies, row+1, column+1))
        self.b_inc = Button(Matrix_of_incendies, text="Сворити граф", command=made_graph)
        self.b_inc.grid(row=13, column=0, columnspan=20)

    def Matrix_of_adjacent_builder(self):
        def made_graph():
            edges_list = []
            for i in range(len(edges)):
                edges_list.append([])
                for j in range(len(edges[i])):
                    edges_list[i].append(edges[i][j].getter())
            tmp = []
            for i in range(len(edges_list)):
                for j in range(len(edges_list[i])):
                    if edges_list[i][j] == "1":
                        tmp.append([str(j+1), str(i+1)])
            edges_list = tmp
            print(edges_list)
            G = nx.DiGraph()
            G.add_edges_from(edges_list, color='b')
            val_map = {}
            for i in edges_list:
                if i[0] == i[1]:
                    val_map.update({i[0]: "b"})
            values = [val_map.get(node, "r") for node in G.nodes()]
            nx.draw(G, node_color=values, with_labels=True)
            plt.show()


        Matrix_of_adjacent = Toplevel(root)
        Matrix_of_adjacent.title("Матрця суміжності")
        edges = []
        for i in range(10):
            l = Label(Matrix_of_adjacent, text=i + 1, font=("Arial", 12))
            l.grid(row=0, column=i+1)
        for i in range(10):
            l = Label(Matrix_of_adjacent, text=i + 1, font=("Arial", 12))
            l.grid(row=i+1, column=0, sticky=E)
        for column in range(10):
            edges.append([])
            for row in range(10):
                edges[column].append(element_Matrix_of_adjacent(Matrix_of_adjacent, row+1, column+1))
        self.b_inc = Button(Matrix_of_adjacent, text="Сворити граф", command=made_graph)
        self.b_inc.grid(row=13, column=0, columnspan=20)

    def variant(self):
        Variant = Toplevel(root)
        Variant.title("Варіант")
        l = Label(Variant, text="Андрійчук Дмитро", font=("Arial", 18))
        l.grid(row=0, column=0)
        l = Label(Variant, text="Номер розрахункової - 6401", font=("Arial", 18))
        l.grid(row=1, column=0)
        l = Label(Variant, text="Варіант - 2", font=("Arial", 18))
        l.grid(row=2, column=0)

root.title("Головне меню")
variant = Main()
root.mainloop()
