from copy import deepcopy

vertex_count = 6
init_char = str(vertex_count-1)

"""
table = [[0, 3, 8, 2, 0, 0, 0],
         [0, 0, 3, 7, 5, 0, 0],
         [0, 0, 0, 5, 2, 2, 0],
         [0, 0, 0, 0, 6, 0, 5],
         [1, 0, 0, 0, 0, 7, 0],
         [3, 0, 0, 4, 0, 0, 1],
         [0, 0, 1, 0, 3, 0, 0]]
"""

table = [[0, 3, 8, 2, 6, 24],
         [4, 0, 9, 5, 7, 0],
         [2, 6, 0, 3, 9, 7],
         [4, 5, 7, 0, 4, 13],
         [0, 7, 8, 9, 0, 5],
         [3, 0, 0, 4, 0, 0, 1]]
"""

table = [[0, 6, 2, 10],
         [4, 0, 2, 2],
         [0, 1, 0, 7],
         [5, 0, 0, 0]]
"""

rev_table = deepcopy(table)

possible_ways = []
direct_arr = [[], [], [], [], [], [], []]

transition_costs = [0, 0, 0, 0, 0, 0, 0]

def clear_transition_costs():
    for i in range(vertex_count):
        transition_costs[i] = 0


def costs_equal():
    col = len(direct_arr[0]) - 1

    for i in range(vertex_count):
        if i != 0 and (sum(direct_arr[i]) == 0):
            direct_arr[i].append(transition_costs[i])
        elif direct_arr[i][col] > transition_costs[i]:
            direct_arr[i].append(transition_costs[i])
        else:
            direct_arr[i].append(direct_arr[i][col])

    for i in range(vertex_count):
        if direct_arr[i][col] != direct_arr[i][col+1]:
            return False
    return True

def build_direct_arr():
    for i in range(vertex_count):
        direct_arr[i].append(table[0][i])
    are_different_colls = True
    steps = 1
    while are_different_colls:
        steps += 1
        clear_transition_costs()
        get_sum(0, 0, steps)
        if costs_equal():
            are_different_colls = False


def get_next_vertexes(vertex):
    next_vertex_list = []
    for i in range(vertex_count):
        if table[vertex][i] != 0:
            next_vertex_list.append(i)
    return next_vertex_list


def get_sum(vertex, sum, steps):
    next_vertex_list = get_next_vertexes(vertex)

    if steps == 1:
        for i in next_vertex_list:
            if transition_costs[i] == 0 or transition_costs[i] > (sum + table[vertex][i]):
                transition_costs[i] = (sum + table[vertex][i])
    else:
        for i in next_vertex_list:
            get_sum(i, sum + table[vertex][i], steps - 1)


def cut_last_coll():
    col_number = len(direct_arr[0])

    if(col_number > 1):
        col_number -= 1
        for i in range(vertex_count):
            direct_arr[i].pop(col_number)


def reverse_pass(weight, row, sequence):

    if weight == 0:
        possible_ways.append(sequence)
        return

    possible_previous_vertexes = [i for i in range(vertex_count-1) if rev_table[row][i] > 0]
    previous_vertexes = [i for i in possible_previous_vertexes if (weight - rev_table[row][i]) >= 0]

    if len(previous_vertexes) > 0:
        if row == vertex_count-1:
            for i in previous_vertexes:
                seq = init_char + str(i)
                reverse_pass(weight-rev_table[row][i], i, seq)
        else:
            for i in previous_vertexes:
                temp = sequence[:]
                temp += str(i)
                reverse_pass(weight-rev_table[row][i], i, temp)


def reverse_table():
    for i in range(vertex_count-1):
        for j in range(i+1, vertex_count):
            rev_table[i][j], rev_table[j][i] = rev_table[j][i], rev_table[i][j]


def main():
    print('Initial table')
    for i in table:
        print(i)

    build_direct_arr()

    print('Direct pass Matrix')
    for i in direct_arr:
        print(i)

    cut_last_coll()
    reverse_table()
    reverse_pass(direct_arr[vertex_count-1][len(direct_arr[0])-1], vertex_count-1, None)

    if len(possible_ways) >= 1:
        result_ways = [way[::-1] for way in possible_ways if (way != None and (way[0] == str(vertex_count-1)) and (way[len(way) - 1] == '0'))]
        print('Result : ')
        if len(result_ways) > 0:
            for result in result_ways:
                temp = ''
                for c in result:
                    temp += c + ' -> '
                print(temp[:-3])
        else:
            print('No possible ways')

if __name__ == '__main__':
    main()
