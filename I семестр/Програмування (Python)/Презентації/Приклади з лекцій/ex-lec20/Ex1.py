import networkx as nx
import pylab as plt
import math
g=nx.Graph()
h = nx.path_graph(10)
g.add_nodes_from(h)
g.add_node(math.cos)
fh=open('tmp.txt','w')
g.add_node(fh)
print(g.nodes())
nx.draw(g)
plt.show()
