from tkinter import *
import networkx as net
import pylab as plt
from tkinter import messagebox

root = Tk()


class Cell(Entry):
    def __init__(self, parent, c):
        self.value = StringVar()
        Entry.__init__(self, parent, textvariable=self.value, width = 7, justify='center' )
        self.lab3 = Label(parent, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 13))
        self.lab3.grid(row=0, column=0)
        for i in range(c):
            self.lab1 = Label(parent, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 13))
            self.lab1['text'] += "X%i " % (i+1)
            self.lab2 = Label(parent, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 13))
            self.lab2['text'] += "X%i" % (i+1)
            self.lab1.grid(row=0, column=i+1)
            self.lab2.grid(row=i+1, column=0)


class Table(Frame):
    def __init__(self, parent, columns):
        Frame.__init__(self, parent)
        self.cells = [[Cell(parent, columns) for i in range(columns)] for j in range(columns)]
        [self.cells[i][j].grid(row=i+1, column=j+1) for i in range(columns) for j in range(columns)]


class Lab4(Table):
    def __init__(self, menu):
        Table.__init__(self, menu,  0)
        self.menu = menu
        self.menu.geometry('500x300+500+200')
        self.menu.config(bg="#272822")
        self.menu.title("Menu")

        self.lab = Label(self.menu, text="Введіть кількість вершин", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12))
        self.ent = Entry(self.menu, width=10, font=("Rockwell Condensed", 12))
        self.but = Button(self.menu, text="Зберегти", command=self.gett, font=("Rockwell Condensed", 10), bg="#7fe45c", bd=5)
        self.but1 = Button(self.menu, text="Побудувати граф", command=self.graph, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 10), bd=5)
        self.but2 = Button(self.menu, text="Готовий граф", command=self.complete_matr, font=("Rockwell Condensed", 10), bg="#7fe45c", bd=5)
        self.but6 = Button(self.menu, text="Розмальованний граф", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 10), bd=5, command=self.show_colored)
        self.but2.place(x=10, y=65)
        self.lab.place(x=150, y=5)
        self.but.place(x=227, y=65)
        self.ent.place(x=230, y=30)

        self.menu.mainloop()
    def gett(self):
        c = int(self.ent.get())
        self.lab.place_forget()
        self.ent.place_forget()
        self.but.place_forget()
        self.but2.place_forget()
        self.but1.place(x=124*c/2+45, y=30*(c+1)+25)
        self.but6.place(x=15*c/2+15, y=30*(c+1)+25)
        try:
            self.tab = Table(self.menu, c)
            self.tab.pack()
        except TclError:
            pass
        self.menu.geometry('{}x{}+{}+{}'.format(124*c + 25, 30*(c+1)+100, 500, 200))

    def graph(self):
        try:
            c = int(self.ent.get())
            self.l = []
            for i in range(c):
                self.l.append([])
                for j in range(c):
                        self.l[i].append(self.tab.cells[i][j].value.get())
            plt.figure(1)
            self.graph = net.Graph()
            for i in range(len(self.l)):
                for j in range(len(self.l[i])):
                    if self.l[i][j] == "1":
                        self.graph.add_node(i+1)
                        self.graph.add_edge((i+1), (j+1))
            net.draw(self.graph, pos=net.shell_layout(self.graph), with_labels=True, node_size=100, width=1, font_size=13, font_family="Rockwell Condensed", node_color="white")

            plt.savefig(r"Graph1.png")
            plt.show()
        except ValueError:
            messagebox.showerror("Помилка", "Заповніть матрицю повністю")
    def show_colored(self):
        plt.figure(4)
        TestingGraph(self.l).greedy()
        plt.show()

    def show_graph(self):
        plt.figure(2)
        TestingGraph(self.massive)
        plt.show(2)

    def show_color_graph(self):
        plt.figure(3)
        TestingGraph(self.massive).greedy()
        plt.show(3)

    def complete_matr(self):
        self.lab.place_forget()
        self.ent.place_forget()
        self.but.place_forget()
        self.but2.place_forget()

        self.menu.geometry('{}x{}+{}+{}'.format(370, 420, 700, 300))

        self.massive = [['0', '1', '0', '0', '1', '0', '0', '0', '0'],
                     ['1', '0', '1', '0', '1', '1', '0', '0', '0'],
                     ['0', '1', '0', '1', '0', '1', '1', '0', '0'],
                     ['0', '0', '1', '0', '0', '0', '1', '0', '0'],
                     ['1', '1', '0', '0', '0', '1', '0', '1', '1'],
                     ['0', '1', '1', '0', '1', '0', '1', '0', '1'],
                     ['0', '0', '1', '1', '0', '1', '0', '0', '0'],
                     ['0', '0', '0', '0', '1', '0', '0', '0', '1'],
                     ['0', '0', '0', '0', '1', '1', '0', '1', '0']]

        self.c = len(self.massive)

        for i in range(self.c):
            for j in range(self.c):
                if i == 0:
                    self.lab1 = Label(self.menu, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12), width=3)
                    self.lab1['text'] += "X%i " % (j + 1)
                    self.lab1.place(x=36 + 35 * j, y=25)

                    self.text1 = Label(self.menu, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12), width=3)
                    self.text1['text'] += "{}".format(self.massive[j][i])
                    self.text1.place(x=36 + 35 * i, y=54 + 30 * j)
                else:
                    self.text1 = Label(self.menu, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12), width=3)
                    self.text1['text'] += "{}".format(self.massive[j][i])
                    self.text1.place(x=36 + 35 * i, y=54 + 30 * j)

            self.lab2 = Label(self.menu, bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12), width=3)
            self.lab2['text'] += "X%i" % (i + 1)
            self.lab2.place(x=5, y=54 + 30 * i)

        self.but3 = Button(self.menu, text="Граф", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12), command=self.show_graph, bd=5)
        self.but4 = Button(self.menu, text="Розмальованний граф", bg="#272822", fg="#7fe45c", font=("Rockwell Condensed", 12), command=self.show_color_graph, bd=5)
        self.but3.place(x=40, y=340)
        self.but4.place(x=110, y=340)


class TestingGraph:
    def __init__(self, matrix):
        self.graph = net.Graph()
        for i in range(len(matrix)):
            for j in range(len(matrix)):
                if matrix[i][j] == '1':
                    self.graph.add_edge(i + 1, j + 1)
        net.draw(self.graph, pos=net.shell_layout(self.graph), with_labels=True, node_size=100, width=1, font_size=13, font_family="Rockwell Condensed", node_color="white")

    def compatibility_test(self, neighbors, massive):
        sens = True
        for i in neighbors:
            if i in massive:
                sens = False
        return sens

    def greedy(self):

        color_mas = ['blue', 'yellow', 'pink', 'grey', 'green', 'black', 'white', 'purple']
        node_color = dict.fromkeys(self.graph.nodes(), None)

        for i in range(len(self.graph.nodes())):
            used = []
            color = color_mas[i]

            for j in self.graph.nodes():
                if j not in used and self.compatibility_test(self.graph.neighbors(j), used):
                    if node_color[j] == None:
                        node_color[j] = color
                        used.append(j)
            if None not in node_color.values():
                break

        list_collor = [node_color[i] for i in self.graph.nodes()]

        net.draw(self.graph, pos=net.shell_layout(self.graph), with_labels=True,
                 node_size=100, width=1, font_size=13, font_family="Rockwell Condensed", node_color=list_collor)


c = Lab4(root)
