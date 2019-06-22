import networkx as nwx, matplotlib.pyplot as plt
import random


# My variant
     #0  1  2  3  4  5  6  7  8
n = [[0, 1, 0, 0, 1, 0, 0, 0, 0],#0
     [1, 0, 1, 0, 1, 1, 0, 0, 0],#1
     [0, 1, 0, 1, 0, 1, 1, 0, 0],#2
     [0, 0, 1, 0, 0, 0, 1, 0, 0],#3
     [1, 1, 0, 0, 0, 1, 0, 1, 1],#4
     [0, 1, 1, 0, 1, 0, 1, 0, 1],#5
     [0, 0, 1, 1, 0, 1, 0, 0, 0],#6
     [0, 0, 0, 0, 1, 0, 0, 0, 1],#7
     [0, 0, 0, 0, 1, 1, 0, 1, 0]]#8

# 0 1 2 3 4 5 6 7 8
n1 = [[0, 1, 0, 0, 1, 0, 0, 0, 0],  # 0
     [1, 0, 1, 0, 1, 1, 0, 0, 0],  # 1
     [0, 1, 0, 1, 0, 1, 1, 0, 0],  # 2
     [0, 0, 1, 0, 0, 0, 1, 0, 0],  # 3
     [1, 1, 0, 0, 0, 1, 0, 1, 0],  # 4
     [0, 1, 1, 0, 1, 0, 1, 1, 1],  # 5
     [0, 0, 1, 1, 0, 1, 0, 0, 1],  # 6
     [0, 0, 0, 0, 1, 1, 0, 0, 0],  # 7
     [0, 0, 0, 0, 0, 1, 1, 0, 0]]  # 8


n2 = [[0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0],
     [0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0],
     [1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0],
     [1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0],
     [0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
     [0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0],
     [0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]



#раскраска графа
def graphColoring():
    global colored
    colored=[[]]
    color=0
    stack=[]
    num2=num1=-1
    def loop(num):
        for t in colored[color]:
            if n[t][num]==1:
                return False
        return True

    for a in n:
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


def make_graf2(matrix,png,nodes):
    fig = plt.figure()
    graf = nwx.Graph()
    for i in range(len(n)):
        graf.add_node(i)
    for i in range(len(matrix)):
        for j in range(len(matrix[1])):
            if n[i][j] == 1:
                graf.add_edge(i, j)
    nwx.draw(graf, pos = nwx.shell_layout(graf))
    list_color = ['y','r','b','w','y']
    for i in range(len(nodes)):
        nwx.draw(graf, pos = nwx.shell_layout(graf),node_color = list_color[i],nodelist = nodes[i],with_labels=True)
    plt.show()
    fig.savefig(png)

make_graf2(n,'file.png',graphColoring())

