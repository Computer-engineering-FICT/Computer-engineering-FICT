import networkx as nx
from tkinter import messagebox
import pylab as plt
class graph_generation():
    def __init__(self, nodes_num):
        self.nodes_num = nodes_num
    def make_connections(self,window):
        try:
            self.data_array = [[int(window.table_entries[i][j].get()) for i in range(self.nodes_num)] for j in range(self.nodes_num)]
        except:
            messagebox.showinfo("Помилка", "Ви ввели нецілі числа в матрицю")
            return
        self.Graph = nx.Graph()
        for i in range(self.nodes_num):
            self.Graph.add_node(i)

        for i in range(self.nodes_num):
            for j in range(self.nodes_num):
                if self.data_array[i][j]==1:
                    self.Graph.add_edge(i, j)


    def draw(self):
        nx.draw(self.Graph, node_color = "#DC143C",with_labels=True)
        plt.show()


    def algorythm(self):
        def graphColoring():
            global colored
            colored=[[]]
            color=0
            stack=[]
            num2=num1=-1
            def loop(num):
                for t in colored[color]:
                    if self.data_array[t][num]==1:
                        return False
                return True

            for a in self.data_array:
                num1+=1
                if num1 not in stack:
                    if not loop(num1):
                        colored.append([])
                        color+=1
                        stack.append(num1)
                        colored[color].append(num1)
                    num2=num1
                    for b in a[num1:]:
                        if b==0 and num2 not in stack and loop(num2):
                            stack.append(num2)
                            colored[color].append(num2)
                        num2+=1
            return colored
        def make_graf2(nodes):
            list_color = ["#DC143C", "#9932CC", "#FF1493", "#1E90FF", "#4B0082", "#B0C4DE", "#32CD32", "#191970"]
            nx.draw(self.Graph, pos = nx.shell_layout(self.Graph))
            for i in range(len(nodes)):
                nx.draw(self.Graph, pos = nx.shell_layout(self.Graph),node_color = list_color[i],nodelist = nodes[i],with_labels=True)
            plt.show()
        make_graf2(graphColoring())
