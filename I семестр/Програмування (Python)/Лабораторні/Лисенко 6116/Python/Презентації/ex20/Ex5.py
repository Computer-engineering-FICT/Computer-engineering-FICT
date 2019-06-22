import networkx as nx
import pylab as plt
er=nx.erdos_renyi_graph(10,0.95)
nx.draw(er)
plt.show()
