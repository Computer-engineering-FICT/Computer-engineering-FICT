from tkinter import *
import random
import networkx as nx
import pylab as pl
pl.switch_backend("TkAgg")


class Lab4:

    def create_tabl_random(self, n):
        self.tabl = []
        for i in range(n):
            self.tabl.append([])
            for j in range(n):
                self.tabl[i].append(random.randint(1, 20))
        for i in range(n):
            for j in range(n):
                if i == j:
                    self.tabl[i][j] = 0
                else:
                    self.tabl[i][j] = self.tabl[j][i]
        return self.tabl

    def Dijkstra(self, N, S, w, Last_Node):
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
                    if w[i][j] == "0":
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
            j = Last_Node - 1
            while j is not None:
                path.append(j)
                j = prev[j]
            path = path[::-1]
            result = []
            for i in range(len(path)-1):
                result.append((path[i]+1,path[i+1]+1))

            pl.figure('Найкоротший шлях з вершини {} в вершину {}'.format(S, Last_Node))
            self.graph = nx.Graph()
            for i in range(N):
                self.graph.add_node(i+1)
            for i in range(len(w)):
                for j in range(len(w[i])):
                    if w[i][j] != inf:
                        self.graph.add_edge(i+1, j+1, weight=w[i][j])
            nx.draw_networkx(self.graph, pos=nx.shell_layout(self.graph), with_labels=True, width=1, font_size=13)
            edge_labels = dict([((u, v,), d['weight']) for u, v, d in self.graph.edges(data=True)])
            nx.draw_networkx_edge_labels(self.graph, pos=nx.shell_layout(self.graph),
                                         edge_labels=edge_labels, label_pos=0.3, font_size=9)
            nx.draw_networkx_edges(self.graph, pos=nx.shell_layout(self.graph), edgelist=result, edge_color='lawngreen', with_labels=True)
            pl.axis('off')
            pl.show()
        except:
            print("errorDijkstra")

    def Dijkstra2(self, N, matrix):
        S=0
        valid = [True] * N
        weight = [[0] * N] * N
        valid[S] = False

        for i in range(N):
            for j in range(N):
                if int(matrix[i][j]) > weight[i][j]:
                    weight[i][j] = int(matrix[i][j])
            valid[i] = False

        max_D = weight[0][0]
        for i in range(N):
            for j in range(N):
                if weight[i][j] > max_D:
                    max_D = weight[i][j]

        Label(self.slave2, text='Діаметр графу: {}'.format(max_D), wraplength=350, font='Arial 16 bold', pady=20) \
            .grid(column=1, row=int(self.e.get()) + 10, columnspan=10)

    def Dijkstra3(self, N, matrix, S=0):
        valid = [True] * N
        weight = [0] * N
        weight[S] = 0
        for i in range(N):
            max_weight = 0
            ID_max_weight = S
            for i in range(len(weight)):
                if valid[i] and weight[i] > max_weight:
                    max_weight = weight[i]
                    ID_max_weight = i
            for i in range(N):
                if weight[ID_max_weight] + int(matrix[ID_max_weight][i]) > weight[i] \
                        and matrix[ID_max_weight][i] != "0" and valid[i] == True:
                    weight[i] = weight[ID_max_weight] + int(matrix[ID_max_weight][i])
            valid[ID_max_weight] = False

        print(weight)
        Label(self.slave2, text='Діаметр графу: {}'.format(max(weight)), wraplength=350, font='Arial 16 bold', pady=20) \
            .grid(column=1, row=int(self.e.get()) + 10, columnspan=10)

    def main_window(self):
        self.root = Tk()
        self.root.minsize(500, 350)
        self.root.maxsize(500, 350)
        self.root.title('Завдання (лабораторна №4)')
        Label(self.root, text="Знайти найкоротший шлях між точками 1 та 5 \nпо заданій матриці відстаней між точками.\n"
                              "Граф двонаправлений. Матриця відстаней \nвводиться при здачі лабораторної роботи.",
              font='Arial 16', pady=20, justify=LEFT).\
            grid(column=0, row=0, columnspan=4)

        def but_bind():
            if len(self.e.get()) == 0:
                Label(self.root, text='*задайте спершу кількість вершин графа', fg='red', font='Arial 12',)\
                    .grid(column=1, row=4, columnspan=3)
            else:
                self.window2()

        Label(self.root, text='Кількість вершин графа  ', font='Arial 14', pady=20, justify=RIGHT).grid(column=1, row=3, sticky=E)
        self.e = Entry(self.root, width=5, font='Arial 14')
        self.e.grid(column=2, row=3, sticky=W)
        Button(self.root, text='Задати матрицю відстаней', font='Arial 12', bg='lightblue', command=but_bind). grid(column=3, row=3)

        self.root.mainloop()

    def window2(self):
        self.slave2 = Toplevel(self.root)
        self.slave2.title('Задати матрицю ваг')
        self.slave2.focus_set()
        self.slave2.minsize(400, 400)

        def random_gen():
            tabl = self.create_tabl_random(int(self.e.get()))
            for i in range(int(self.e.get())):
                for j in range(int(self.e.get())):
                    self.list_ent[i][j].insert(END, tabl[i][j])

        for i in range(int(self.e.get())+1):
            for j in range(int(self.e.get())+1):
                if i == 0:
                    Label(self.slave2, text='{}'.format(j), font='Arial 16 bold', width=3).grid(column=j, row=i, sticky=W)
                elif j == 0:
                    Label(self.slave2, text='{}'.format(i), font='Arial 16 bold', width=3).grid(column=j, row=i, sticky=W)
                elif i == 0 and j == 0:
                    Label(self.slave2, text=' ', width=3).grid(column=j, row=i, sticky=W)
        self.list_ent = []
        for i in range(int(self.e.get())):
            self.list_ent. append([])
            for j in range(int(self.e.get())):
                self.list_ent[i].append(Entry(self.slave2, font='Arial 14', width=3))
                self.list_ent[i][j].grid(row=i+1, column=j+1, sticky=W)

        Label(self.slave2, text='   ').grid(column=2, columnspan=5, row=int(self.e.get())+1)
        Button(self.slave2, text='Згенерувати випадково', font='Arial 12', bg='mintcream', command=random_gen)\
            .grid(column=0, columnspan=5, row=int(self.e.get())+2)
        Button(self.slave2, text='Показати граф', font='Arial 12', bg='mintcream', width=15, command=self.show_gr)\
            .grid(column=5, row=int(self.e.get())+2, columnspan=5)

    def show_gr(self):
        self.tabl = []
        for i in range(int(self.e.get())):
            self.tabl.append([])
            for j in range(int(self.e.get())):
                self.tabl[i].append(self.list_ent[i][j].get())
        for i in range(int(self.e.get())):
            for j in range(int(self.e.get())):
                if self.tabl[i][i] != '0':
                    Label(self.slave2, text='*перевірте таблицю суміжності\n'
                                            'існує петля', font='Arial 12', fg='red')\
                        .grid(column=1, row=int(self.e.get())+3, columnspan=5)
                    pass

        for i in range(int(self.e.get())):
            for j in range(int(self.e.get())):
                self.list_ent[i][j]['state'] = DISABLED

        def button_bind():
            self.Dijkstra(N=int(self.e.get()), S=int(st.get()), Last_Node=int(en.get()), w=self.tabl)

        def button_bind1():
            self.Dijkstra2(N=int(self.e.get()), matrix=self.tabl)

        Label(self.slave2, text='Визначити найкоротший шлях між вершинами', wraplength=350, font='Arial 16 bold', pady=20)\
            .grid(column=1, row=int(self.e.get())+4, columnspan=10)
        Label(self.slave2, text='Початок:', font='Arial 14').grid(column=0, row=int(self.e.get())+5, columnspan=3)
        Label(self.slave2, text='Кінець:', font='Arial 14').grid(column=0, row=int(self.e.get())+6, columnspan=3)
        st = Entry(self.slave2, font='Arial 14', width=3)
        st.grid(column=3, row=int(self.e.get())+5, columnspan=2)
        en = Entry(self.slave2, font='Arial 14', width=3)
        en.grid(column=3, row=int(self.e.get())+6, columnspan=2)
        Button(self.slave2, text='Визначити', font='Arial 12 bold', command=button_bind, width=10)\
            .grid(column=5, row=int(self.e.get())+5, columnspan=3, rowspan=2)

        Button(self.slave2, text='Визначити діаметр графу', font='Arial 12 bold', command=button_bind1) \
            .grid(column=1, row=int(self.e.get()) + 8, columnspan=10, rowspan=2)

        pl.figure('Заданий граф')

        self.gr = nx.Graph()
        for i in range(int(self.e.get())):
            self.gr.add_node(i+1, color='lawngreen')
        for i in range(int(self.e.get())):
            for j in range(int(self.e.get())):
                if self.tabl[i][j] != '0':
                    self.gr.add_edge(i+1, j+1, weight=self.tabl[i][j])
        edge_labels = nx.get_edge_attributes(self.gr, 'weight')
        pos = nx.circular_layout(self.gr)
        nx.draw_networkx(self.gr, pos, with_labels=True, label_pos=0.3)
        nx.draw_networkx_edge_labels(self.gr, pos, edge_labels=edge_labels, label_pos=0.3, color="green")
        pl.axis('off')
        pl.show()


a = Lab4()
a.main_window()
