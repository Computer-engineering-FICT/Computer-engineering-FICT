from Names import names
import networkx as nx
import pylab as plt
from random import sample,randint

class graphs_gen():
    def __init__(self,A,B,relation):
        self.relation = relation
        self.A = A
        self.B = B
        self.graph = nx.DiGraph()

    def define_graph(self):
        self.graph.add_nodes_from(self.A)
        self.graph.add_nodes_from(self.B)
        self.graph.add_edges_from(self.relation)
        self.color_list = []
        self.pos_list = {}
        for i in range(len(self.A)):
            self.color_list.append("crimson")
            self.pos_list[self.A[i]]=(i,15)
        for i in range(len(self.B)):
            self.color_list.append("orange")
            self.pos_list[self.B[i]] = (i,10)
        return self.graph

    def draw(self):
        self.define_graph()
        nx.draw(self.graph,self.pos_list,node_size = 500,node_color = self.color_list,font_size = 10,with_labels = True)
        plt.show()


class algorythms:
    def __init__(self, A:"list", B:"list"):
        self.A = A
        self.B = B
        self.universal = self.decart_multiplication()
        self.male_names = names().male_names
        self.fem_names = names().fem_names
        self.A_males = []
        self.A_females = []
        self.relation_S = []
        self.children = []
        self.godmothers = []
        self.godmother()
        self.compadre()

    #basic operations
    def decart_multiplication(self):
        multiplication = [(i,j)for i in self.A for j in self.B]
        return multiplication

    def union(self,relation_1, relation_2):
        return list(set(relation_1).union(set(relation_2)))

    def intersection(self,relation_1, relation_2):
        return list(set(relation_1).intersection(set(relation_2)))

    def difference(self,relation_1, relation_2):
        return list(set(relation_1).difference(set(relation_2)))

    def complement(self,universal,relation):
        return list(set(universal).difference(set(relation)))

    def inverted_relation(self,relation):
        return [(i[1], i[0]) for i in relation]

    #operations according to my variant
    def godmother(self):
        self.A_males = list(set(self.A).intersection(set(self.male_names)))
        self.A_females = list(set(self.A).intersection(set(self.fem_names)))
        if len(self.A_females)<len(self.B):
            self.godmothers = sample(self.A_females,randint(1,len(self.A_females)-1))
        else:
            self.godmothers = sample(self.A_females,randint(1,len(self.B)-1))
        self.relation_S = list(zip(self.godmothers,self.B))
        self.children = [i[1] for i in self.relation_S]
        return self.relation_S

    def compadre(self):
        self.unmarked_in_B = list(set(self.B).difference(set(self.children)))
        self.B_males = list(set(self.B).intersection(set(self.male_names)))
        self.B_females = list(set(self.B).intersection(set(self.fem_names)))
        self.fathers = list(set(self.B_males).intersection(self.unmarked_in_B))
        self.mothers = list(set(self.B_females).intersection(self.unmarked_in_B))
        self.pairs = list(zip(self.mothers,self.fathers))
        alpha_R = list(zip(self.godmothers,self.pairs))
        self.relation_R = []
        #alpha_R represents relation of godmother to pair,
        #  not relation of godmother to distinct parent
        for i in alpha_R:
            self.relation_R.append((i[0],i[1][0]))
            self.relation_R.append((i[0],i[1][1]))
