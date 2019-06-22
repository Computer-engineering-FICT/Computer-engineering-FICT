import networkx as nx
import pylab as plt
mg = nx.MultiGraph()
mg.add_weighted_edges_from([(1,2,.5), (1,2,.75),(2,3,.5)])
print(mg.degree())
nx.draw_networkx(mg,
pos=nx.spring_layout(mg),
arrows=True, with_labels=True)
plt.show()

