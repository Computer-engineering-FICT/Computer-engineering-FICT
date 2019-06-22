from tkinter import *
from tkinter import messagebox
import Graph_gen
import matplotlib.pyplot as plt
import networkx as nx


class window_1(Frame):
    def __init__(self,master = None):
        super().__init__(master)
        self.pack()
        self.def_widgets()
        self.packer()

    def def_widgets(self):
        self.caption = Label(self, text = "Введіть кількість вершин графа")
        self.entry = Entry(self)
        self.gen_button = Button(self, width = 30, height = 2, wraplength = 200,
                                 text = "Перейти до наступного етапу генерування графа", command = self.generate_graph_window)

    def packer(self):
        self.caption.grid(row = 0, column = 0)
        self.entry.grid(row = 1, column = 0)
        self.gen_button.grid(row = 2, column = 0)

    def table(self,nodes_num):
        self.entry.destroy()
        self.gen_button.destroy()
        self.entry_labels_first_row = [Label(self, text = "n" + str(i+1)) for i in range(nodes_num)]
        self.entry_labels_first_column = [Label(self, text = "n" + str(i+1)) for i in range(nodes_num)]
        self.table_entries = [[Entry(self, width = 5) for i in range(nodes_num)] for j in range(nodes_num)]
        for i in range(len(self.entry_labels_first_row)):
            self.entry_labels_first_row[i].grid(row = 0, column = i+1)
            self.entry_labels_first_column[i].grid(row = i+1, column = 0)
        for i in range(len(self.entry_labels_first_row)):
            for j in range(len(self.entry_labels_first_row)):
                self.table_entries[i][j].grid(row = i+1, column = j+1)
                self.table_entries[i][j].insert(END, "0")

        self.caption.config(text = "Матриця суміжності графа", justify = CENTER)
        self.task_data = Label(self, text = "Знайти всі відстані до елемента", wraplength = 100, width = 5*round(nodes_num/2))
        self.task_data_entry = Entry(self, width = 5*round(nodes_num/2))
        self.graph_show = Button(self, width = 20, text = "Згенерувати граф", command = self.graph_gen)
        self.task_calculate = Button(self, width = 20, wraplength = 180,text = "Знайти найкоротші шляхи для всіх елементів")

        self.caption.grid(row = nodes_num+2, column = 1, columnspan = nodes_num)
        self.graph_show.grid(row = nodes_num+3, column = 1, columnspan = nodes_num)
        self.task_calculate.grid(row = nodes_num+4, column = 1, columnspan = nodes_num)
        self.task_data.grid(row = nodes_num+5, column = 1, columnspan = round(nodes_num/2))
        self.task_data_entry.grid(row = nodes_num+5, column = round(nodes_num/2)+1, columnspan = round(nodes_num/2))

    def generate_graph_window(self):
        if self.entry.get().isdigit():
            self.nodes_number = int(self.entry.get())
            self.table(self.nodes_number)
        else:
            messagebox.showinfo("Помилка", "Ви ввели ненатуральну кількість вершин для графа")

    def graph_gen(self):
        Graph_gen.graph_generation(self.nodes_number).data_get(self)

