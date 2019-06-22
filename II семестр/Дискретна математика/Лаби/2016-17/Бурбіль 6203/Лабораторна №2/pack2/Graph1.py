import random as r
import pylab as plt
import networkx as net

class Graph1:
    def __init__(self):
        with open(r"Set_A.txt", "r", encoding="UTF-8") as f:
            set_A = f.read()
        with open(r"Set_B.txt", "r", encoding="UTF-8") as f:
            set_B = f.read()
        set_A = set_A.rstrip(",").split(",")
        set_B = set_B.rstrip(",").split(",")
        with open(r"woman.txt", "r", encoding="UTF-8") as f:
            woman = f.read()
        woman = woman.rstrip(",").split(",")


        plt.figure(1)

        self.g1 = net.DiGraph()
        m, s = [], []
        for i in set_B:
            self.g1.add_node(i)
            for j in set_A:
                self.g1.add_node(j)
                if i in woman:
                    index = r.randint(0, len(set_A) - 1)
                    elem = set_A[index]
                    if i not in s and elem not in m:
                        self.g1.add_edge(i, elem, weight=15)
                        s.append(i)
                        m.append(elem)
                else:
                    index = r.randint(0, len(set_B) - 1)
                    elem1 = set_B[index]
                    if j not in s and elem1 not in m:
                        self.g1.add_edge(j, elem1, weight=15)
                        s.append(j)
                        m.append(elem1)
        edges = self.g1.edges()

        colors =['b' for i in range(0, len(edges))]
        net.draw(self.g1, pos=net.shell_layout(self.g1), arrows=True, with_labels=True, node_size=100, width=1,
                 font_size=13, font_family="Rockwell Condensed", edge_color=colors)

        plt.savefig(r"Graph1.png")

        # Second Graph
        plt.figure(2)
        self.g2 = net.DiGraph()
        m = []
        for i in set_B:
            self.g2.add_node(i)
            for j in set_A:
                self.g2.add_node(j)
                if i not in woman:
                    for elem in r.sample(set_B, r.randint(0, 1)):
                        if (j, elem) not in self.g1.edges() and elem not in m:
                            self.g2.add_edge(j, elem, weight=15)
                            m.append(elem)

                else:
                    for elem in r.sample(set_A, r.randint(0, 1)):
                        if (i, elem) not in self.g1.edges() and elem not in m:
                            self.g2.add_edge(i, elem, weight=15)
                            m.append(elem)

        for k in self.g1.edges():
            for l in self.g2.edges():
                if k[1] == l[1]:
                    if (l[0], k[0]) not in self.g2.edges() or (k[0], l[0]) not in self.g2.edges():
                        self.g2.add_edge(l[0], k[0], weight=15)

        edge = self.g2.edges()
        colors =['g' for i in range(0, len(edge))]
        net.draw(self.g2, pos=net.shell_layout(self.g2), arrows=True, with_labels=True, node_size=100, width=1,
                 font_size=13, font_family="Rockwell Condensed", edge_color=colors)

        plt.savefig(r"Graph2.png")

        #Union R and S
        plt.figure(3)

        self.g3 = net.compose(self.g1, self.g2)
        green_edges = [i for i in self.g2.edges() if i in self.g3.edges()]
        blue_edges = [i for i in self.g1.edges() if i in self.g3.edges()]

        pos = net.shell_layout(self.g3)
        net.draw(self.g3, pos, arrows=True, with_labels=True, node_size=100, width=1,
                 font_size=13, font_family="Rockwell Condensed")
        net.draw_networkx_edges(self.g3, pos, edgelist=green_edges, edge_color='g',
                arrows=True, with_labels=True)
        net.draw_networkx_edges(self.g3,pos, edgelist=blue_edges, edge_color='b',
                arrows=True, with_labels=True)
        plt.savefig(r"Graph3.png")

        #R intersection S
        plt.figure(4)
        self.g4 = net.DiGraph()
        for i in self.g2.edges():
            for j in self.g1.edges():
                if i == j:
                    self.g4.add_edge(i[0], i[1])

        net.draw(self.g4, pos=net.shell_layout(self.g4), arrows=True, with_labels=True, node_size=100, width=1,
                 font_size=13, font_family="Rockwell Condensed")
        plt.savefig(r"Graph4.png")

        #Difference R and S
        plt.figure(5)
        self.g5 = net.DiGraph()
        for i in self.g2.edges():
                if i not in [j for j in self.g1.edges()]:
                    self.g5.add_edge(i[0], i[1])
        net.draw(self.g5, pos=net.shell_layout(self.g5), arrows=True, with_labels=True, node_size=100, width=1,
                 font_size=13, font_family="Rockwell Condensed" , edge_color = "y")
        plt.savefig(r"Graph5.png")

        #Reverse
        plt.figure(6)
        self.g6 = net.reverse(self.g1)
        net.draw(self.g6, pos=net.shell_layout(self.g6), arrows=True, with_labels=True, node_size=100, width=1,
                 font_size=13, font_family="Rockwell Condensed", edge_color = "blue")
        plt.savefig(r"Graph6.png")

        #UNIVERSAL
        plt.figure(7)
        self.u = net.DiGraph()
        for i in set_B:
            for j in range(len(set_A)):
                if i in woman:
                    self.u.add_edge(i, set_A[j])
                else:
                    self.u.add_edge(set_A[j], i)

        #UNIVERSAL-R
        plt.figure(8)
        self.g7 = net.DiGraph()
        for i in self.u.edges():
            if i not in [j for j in self.g2.edges()]:
                self.g7.add_edge(i[0], i[1])

        net.draw(self.g7, pos=net.shell_layout(self.g7), arrows=True, with_labels=True, node_size=100, width=1,
                 font_size=13, font_family="Rockwell Condensed")
        plt.savefig(r"Graph7.png")
