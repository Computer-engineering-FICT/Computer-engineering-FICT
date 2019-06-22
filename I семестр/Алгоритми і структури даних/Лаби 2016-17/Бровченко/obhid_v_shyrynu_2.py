import random

n, m = int, input()
M = [[random.randint(0, 2) for i in range(m) ] for j in range(n)]
used = [[0 for k in range(m)] for t in range(n)]


def bfs(v): # процедура обхода в ширину
    for x in range(n):
        if used[v][x] == 1: # если вершина является пройденной, то не производим из нее вызов процедуры
            return
    # начинаем обход из вершины v
        used[v][x] = 1 # начинаем обход из вершины v

        for y in range(m):
            while M[y][x] != 0 and used[y][x] != 1: #пока в очереди есть хотя бы одна вершина
                print((y, x), end=' ')
                for i in range(n):
                    for j in range(m):#запускаем обход из всех вершин, смежных с вершиной v
                        if used[x][y]: #если вершина уже была посещена, то пропускаем ее
                            continue
                        q.put(w) #добавляем вершину в очередь обхода
                        used[w] = True #помечаем вершину как пройденную


def run():
    for x in range(n):
        bfs(x)

run()
