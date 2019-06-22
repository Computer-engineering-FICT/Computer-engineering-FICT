import networkx as nx
import pylab as plt
g = nx.Graph()
g.add_edge(1,2,weight=0.1)
g.add_edge(2,3,weight=1.5)
g.add_edge(1,3,weight=1.0)
g.add_edge(3,4,weight=2.2)
nx.draw_networkx(g, pos=nx.spring_layout(g),arrows=False, with_labels=True)
print(nx.shortest_path(g,2,4))
plt.show()
