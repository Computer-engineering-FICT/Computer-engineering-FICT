from tkinter import *
from random import randint, sample
import networkx as nx
import pylab as plt

class Main:
    A = set()
    B = set()
    R = list()
    S = list()

    def __init__(self):
        menubar = Menu(root)
        filemenu = Menu(menubar, tearoff=0)
        filemenu.add_command(label="2 вікно", command=self.window2)
        filemenu.add_command(label="3 вікно", command=self.window3)
        filemenu.add_command(label="4 вікно", command=self.window4)
        menubar.add_cascade(label="Вікнa", menu=filemenu)

        l1 = Label(root, text="Моя група: ІО -", font=("Arial", 20))
        l1.grid(row=0, sticky=W)
        l2 = Label(root, text="Мій номер у групі:", font=("Arial", 20))
        l2.grid(row=1, sticky=W)
        l3 = Label(root, text="Мій варіант:", font=("Arial", 20))
        l3.grid(row=2, sticky=W)

        self.e1 = Entry(root, width=10, font=("Arial", 20))
        self.e2 = Entry(root, width=10, font=("Arial", 20))
        self.t1 = Text(root, width=5, height=1, wrap=WORD, font=("Arial", 20))
        b1 = Button(root, width=7, height=1, command=self.calc_variant, text="Варіант", font=("Arial", 10))
        self.e1.grid(row=0, column=1)
        self.e2.grid(row=1, column=1)
        b1.grid(row=2, column=1, sticky=E)
        self.t1.grid(row=2, column=1, sticky=W)

        root.config(menu=menubar)

    def window2(self):
        self.win2 = Toplevel(root)
        self.win2.title("2 вікно")

        def set_w():
            if womens_set.get() == "A":
                for i in list_of_women.curselection():
                    self.A.add(self.list_of_women_text[i])
            elif womens_set.get() == "B":
                for i in list_of_women.curselection():
                    self.B.add(self.list_of_women_text[i])

        def set_m():
            if mens_set.get() == "A":
                for i in list_of_men.curselection():
                    self.A.add(self.list_of_men_text[i])

            elif mens_set.get() == "B":
                for i in list_of_men.curselection():
                    self.B.add(self.list_of_men_text[i])

        def save_a():
            with open(r"F:\Dima\дискретна математика\Lab_2\saved_a.txt", "w") as w:
                for i in self.A:
                    w.write(str(i)+"\n")
            print(self.A)

        def save_b():
            with open(r"F:\Dima\дискретна математика\Lab_2\saved_b.txt", "w") as w:
                for i in self.B:
                    w.write(str(i)+"\n")
            print(self.B)

        def read_a():
            with open(r"F:\Dima\дискретна математика\Lab_2\saved_a.txt", "r") as r:
                for line in r:
                    self.A.add(line[:-1])

        def read_b():
            with open(r"F:\Dima\дискретна математика\Lab_2\saved_b.txt", "r") as r:
                for line in r:
                    self.B.add(line[:-1])

        def clear_a():
            self.A.clear()

        def clear_b():
            self.B.clear()

        with open(r"F:\Dima\дискретна математика\Lab_2\saved_a.txt", "w") as w:
            with open(r"F:\Dima\дискретна математика\Lab_2\saved_b.txt", "w") as w:
                pass
        l_w = Label(self.win2, text="Список жіночих імен")
        l_w.grid(row=0, column=0)
        list_of_women = Listbox(self.win2, font=("Arial", 16), selectmode=EXTENDED)
        self.list_of_women_text = ["Aurora", "Anastasia", "Valeria", "Gertrude", "Eva", "Kira", "Lolita", "Olga", "Flora", "Julia"]
        for i in self.list_of_women_text:
            list_of_women.insert(END, str(i))
        list_of_women.grid(row=1, column=0)
        womens_set = StringVar()
        womens_set.set("A")
        womens_a = Radiobutton(self.win2, text='A', variable=womens_set, value="A")
        womens_b = Radiobutton(self.win2, text='B', variable=womens_set, value="B")
        womens_a.grid(row=2, column=0, padx=30)
        womens_b.grid(row=2, column=0, sticky=E, padx=30)
        b_w = Button(self.win2, text="Запис в", command=set_w)
        b_w.grid(row=2, column=0, sticky=W, padx=30)

        l_m = Label(self.win2, text="Список чоловічих імен")
        l_m.grid(row=0, column=1)
        list_of_men = Listbox(self.win2, font=("Arial", 16), selectmode=EXTENDED)
        self.list_of_men_text = ["Adam", "Anatoly", "Vissarion", "Harry", "Dmitri", "Ivan", "Leo", "Mikhail", "Ostap", "Yuri"]
        for i in self.list_of_men_text:
            list_of_men.insert(END, str(i))
        list_of_men.grid(row=1, column=1)
        mens_set = StringVar()
        mens_set.set("A")
        mens_a = Radiobutton(self.win2, text='A', variable=mens_set, value="A")
        mens_b = Radiobutton(self.win2, text='B', variable=mens_set, value="B")
        mens_a.grid(row=2, column=1, padx=30)
        mens_b.grid(row=2, column=1, sticky=E, padx=30)
        b_m = Button(self.win2, text="Запис в", command=set_m)
        b_m.grid(row=2, column=1, sticky=W, padx=30)

        save_a_b = Button(self.win2, text="Запис A в файл", command=save_a)
        save_a_b.grid(row=3, column=0)
        save_b_b = Button(self.win2, text="Запис B в файл", command=save_b)
        save_b_b.grid(row=3, column=1)

        read_a_b = Button(self.win2, text="Зчитати A з файлу", command=read_a)
        read_a_b.grid(row=4, column=0)
        read_b_b = Button(self.win2, text="Зчитати B з файлу", command=read_b)
        read_b_b.grid(row=4, column=1)

        clear_a_b = Button(self.win2, text="Видалити A", command=clear_a)
        clear_a_b.grid(row=5, column=0)
        clear_b_b = Button(self.win2, text="Видалити A", command=clear_b)
        clear_b_b.grid(row=5, column=1)

    def window3(self):
        self.win3 = Toplevel(root)
        self.win3.title("3 вікно")

        def update_a_func():
            list_a.delete(0, END)
            for i in list(self.A):
                list_a.insert(END, str(i))

        def update_b_func():
            list_b.delete(0, END)
            for i in list(self.B):
                list_b.insert(END, str(i))

        l_a = Label(self.win3, text="Множина А")
        l_a.grid(row=0, column=0)
        list_a = Listbox(self.win3, font=("Arial", 16), selectmode=EXTENDED)
        update_a_func()
        list_a.grid(row=1, column=0)
        update_a = Button(self.win3, text="Оновити", command=update_a_func)
        update_a.grid(row=2, column=0)

        l_b = Label(self.win3, text="Множина B")
        l_b.grid(row=0, column=2)
        list_b = Listbox(self.win3, font=("Arial", 16), selectmode=EXTENDED)
        update_b_func()
        list_b.grid(row=1, column=2)
        update_b = Button(self.win3, text="Оновити", command=update_b_func)
        update_b.grid(row=2, column=2)

        rel_s_b = Button(self.win3, text="Відношення S", command=self.relations_S)
        rel_s_b.grid(row=3, column=0)

        rel_r_b = Button(self.win3, text="Відношення R", command=self.relations_R)
        rel_r_b.grid(row=3, column=2)

    def window4(self):
        def union():
            g = nx.DiGraph()
            g.add_nodes_from(list(self.A | self.B))
            g.add_edges_from(self.S, color='b')
            g.add_edges_from(self.R, color='r')
            edges = g.edges()
            colors = [g[u][v]['color'] for u, v in edges]
            nx.draw_networkx(g, pos=nx.spring_layout(g), arrows=True, with_labels=True, edges=g.edges(), edge_color=colors)
            plt.show()

        def crossing():
            c = list()
            for i in self.S:
                for j in self.R:
                    if i == j:
                        c.append(i)
            g = nx.DiGraph()
            g.add_nodes_from(list(self.A | self.B))
            g.add_edges_from(c)
            nx.draw_networkx(g, pos=nx.spring_layout(g), arrows=True, with_labels=True, edges=g.edges())
            plt.show()

        def difference():
            c = list(self.R)
            for i in self.S:
                for j in self.R:
                    if i == j:
                        c.remove(j)
            g = nx.DiGraph()
            g.add_nodes_from(list(self.A | self.B))
            g.add_edges_from(c)
            nx.draw_networkx(g, pos=nx.spring_layout(g), arrows=True, with_labels=True, edges=g.edges())
            plt.show()

        def no_R():
            c = list()
            for i in self.A:
                for j in self.B:
                    if [i, j] not in self.R:
                        c.append([i,j])
            g = nx.DiGraph()
            g.add_nodes_from(list(self.A | self.B))
            g.add_edges_from(c)
            nx.draw_networkx(g, pos=nx.spring_layout(g), arrows=True, with_labels=True, edges=g.edges())
            plt.show()

        def inversion_S():
            c = list(self.S)
            for i in range(len(c)):
                c[i][0], c[i][1] = c[i][1], c[i][0]

            g = nx.DiGraph()
            g.add_nodes_from(list(self.A | self.B))
            g.add_edges_from(c)
            nx.draw_networkx(g, pos=nx.spring_layout(g), arrows=True, with_labels=True, edges=g.edges())
            plt.show()

        self.win4 = Toplevel(root)
        self.win4.title("4 вікно")
        union_b = Button(self.win4, text="Відношення R∪S", command=union)
        union_b.grid(row=0, column=0)
        crossing_b = Button(self.win4, text="Відношення R∩S", command=crossing)
        crossing_b.grid(row=1, column=0)
        difference_b = Button(self.win4, text="Відношення R\S", command=difference)
        difference_b.grid(row=2, column=0)
        no_R_b = Button(self.win4, text="Відношення U\R", command=no_R)
        no_R_b.grid(row=3, column=0)
        inversion_S_b = Button(self.win4, text="Відношення S-1", command=inversion_S)
        inversion_S_b.grid(row=4, column=0)

        self.text_S = Text(self.win4, width=100, height=5, font=("Arial", 10))
        self.text_S.grid(row=0, column=1)
        update_S_b = Button(self.win4, text="Оновити S", command=self.update_S)
        update_S_b.grid(row=1, column=1)
        self.update_S()
        self.text_R = Text(self.win4, width=100, height=5, font=("Arial", 10))
        self.text_R.grid(row=2, column=1)
        update_R_b = Button(self.win4, text="Оновити S", command=self.update_R)
        update_R_b.grid(row=3, column=1)
        self.update_R()

    def calc_variant(self):
        N = int(self.e1.get())
        G = int(self.e2.get())
        Z = int((N+G % 60) % 30+1)
        self.t1.delete(1.0, END)
        self.t1.insert(INSERT, Z)

    def relations_S(self):
            edges_list_S = list([])
            for a in sample(self.A, randint(len(self.A)//2, len(self.A))):
                for b in sample(self.B, randint(len(self.A)//2, len(self.B))):
                    if a in self.list_of_women_text and b in self.list_of_men_text:
                        s = True
                        for i in edges_list_S:
                            if a in i or b in i:
                                s = False
                        if s:
                            edges_list_S.append([a, b])
            self.S = edges_list_S
            self.g1 = nx.DiGraph()
            self.g1.add_nodes_from(list(self.A | self.B))
            self.g1.add_edges_from(edges_list_S)
            nx.draw_networkx(self.g1, pos=nx.spring_layout(self.g1), arrows=True, with_labels=True, edges=self.g1.edges(), edge_color="b")
            plt.show()

    def relations_R(self):
        edges_list_S = self.S
        edges_list_R = list()
        for a in sample(self.A, randint(len(self.A)//4, len(self.A)//2)):
            for b in sample(self.B, randint(len(self.A)//5, len(self.B)//2)):
                if a in self.list_of_women_text:
                    for i in edges_list_S:
                        if b in i and [a, b] not in edges_list_S:
                            edges_list_R.append([a, i[1]])
                            edges_list_R.append([a, i[0]])
        self.R = edges_list_R
        self.g2 = nx.DiGraph()
        self.g2.add_nodes_from(list(self.A | self.B))
        self.g2.add_edges_from(edges_list_R)
        nx.draw_networkx(self.g2, pos=nx.spring_layout(self.g2), arrows=True, with_labels=True, edges=self.g2.edges(), edge_color="r")
        plt.show()

    def update_S(self):
        self.text_S.delete(1.0, END)
        self.text_S.insert(INSERT, str(self.S))

    def update_R(self):
        self.text_R.delete(1.0, END)
        self.text_R.insert(INSERT, str(self.R))


root = Tk()
root.title("Головне меню")
variant = Main()
root.mainloop()
