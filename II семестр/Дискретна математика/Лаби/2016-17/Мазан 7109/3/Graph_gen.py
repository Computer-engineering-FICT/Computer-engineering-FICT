import networkx as nx
import GUI
from tkinter import messagebox
class graph_generation():
    def __init__(self, nodes_num):
        self.nodes_num = nodes_num
    def data_get(self,window):
        #nodes_num = int(GUI.window_1.self.entry.get())
        self.data_array = [[int(window.table_entries[i][j].get()) for i in range(self.nodes_num)] for j in range(self.nodes_num)]
        #print(self.data_array[0][0])
        self.Graph = nx.Graph()
        for i in range(self.nodes_num):
            self.Graph.add_node("n"+str(i))

        for i in range(self.nodes_num):
            for j in range(self.nodes_num):
                if self.data_array[i][j]==0:
                    continue
                if self.data_array[i][j]>=1:
                    for k in range(self.data_array[i][j]):
                        self.Graph.add_edge("n"+str(i), "n"+str(j))
                if self.data_array[i][j]==-1:
                    self.Graph.add_edge("n"+str(j), "n"+str(i))
                else:
                    messagebox.showinfo("Помилка", "Ви ввели неправильні дані для графа")
                    return
